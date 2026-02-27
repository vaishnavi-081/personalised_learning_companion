import { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useAuth } from '@/contexts/AuthContext';
import { MainLayout } from '@/components/layouts/MainLayout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { getCareerById, getAllSubjects, enrollInSubject, getUserSubjects } from '@/db/api';
import type { Career, Subject, UserSubject } from '@/types';
import { toast } from 'sonner';
import { ArrowLeft, BookOpen, CheckCircle2, Sparkles, Target } from 'lucide-react';
import { Badge } from '@/components/ui/badge';

export default function CareerRequiredSubjectsPage() {
  const { careerId } = useParams<{ careerId: string }>();
  const { profile } = useAuth();
  const navigate = useNavigate();
  const [career, setCareer] = useState<Career | null>(null);
  const [requiredSubjects, setRequiredSubjects] = useState<Subject[]>([]);
  const [enrolledSubjects, setEnrolledSubjects] = useState<UserSubject[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadData();
  }, [careerId, profile?.id]);

  const loadData = async () => {
    if (!careerId || !profile?.id) return;

    try {
      const [careerData, allSubjects, userSubjects] = await Promise.all([
        getCareerById(careerId),
        getAllSubjects(),
        getUserSubjects(profile.id),
      ]);

      setCareer(careerData);
      setEnrolledSubjects(userSubjects);

      if (careerData && careerData.required_subjects) {
        // Filter subjects that are required for this career
        const required = allSubjects.filter((subject) =>
          careerData.required_subjects.includes(subject.name)
        );
        setRequiredSubjects(required);
      }
    } catch (error) {
      console.error('Failed to load data:', error);
      toast.error('Failed to load career subjects');
    } finally {
      setLoading(false);
    }
  };

  const isEnrolled = (subjectId: string) => {
    return enrolledSubjects.some((es) => es.subject_id === subjectId);
  };

  const handleSelectSubject = async (subjectId: string) => {
    if (!profile?.id) return;

    if (isEnrolled(subjectId)) {
      navigate(`/subject/${subjectId}/knowledge-check`);
      return;
    }

    try {
      await enrollInSubject(profile.id, subjectId);
      toast.success('Subject enrolled successfully!');
      navigate(`/subject/${subjectId}/knowledge-check`);
    } catch (error) {
      console.error('Failed to enroll:', error);
      toast.error('Failed to enroll in subject');
    }
  };

  if (loading) {
    return (
      <MainLayout>
        <div className="flex items-center justify-center min-h-[60vh]">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary"></div>
        </div>
      </MainLayout>
    );
  }

  if (!career) {
    return (
      <MainLayout>
        <div className="text-center py-12">
          <p className="text-muted-foreground">Career not found</p>
        </div>
      </MainLayout>
    );
  }

  return (
    <MainLayout>
      <div className="space-y-8 animate-fade-in max-w-5xl mx-auto">
        {/* Header */}
        <div className="flex items-center gap-4">
          <Button variant="ghost" size="icon" onClick={() => navigate(-1)}>
            <ArrowLeft className="h-5 w-5" />
          </Button>
          <div className="flex-1">
            <div className="flex items-center gap-3 mb-2">
              <span className="text-5xl">{career.icon}</span>
              <h1 className="text-4xl font-bold gradient-text">{career.name}</h1>
            </div>
            <p className="text-lg text-muted-foreground">{career.description}</p>
          </div>
        </div>

        {/* Career Goal Card */}
        <Card className="border-2 border-primary/30 bg-gradient-to-r from-primary/5 to-purple-500/5">
          <CardContent className="pt-6">
            <div className="flex items-center gap-3 mb-4">
              <div className="p-3 rounded-xl bg-gradient-to-br from-primary/20 to-purple-500/20">
                <Target className="h-6 w-6 text-primary" />
              </div>
              <div>
                <h2 className="text-xl font-bold">Your Career Path</h2>
                <p className="text-sm text-muted-foreground">
                  Complete these subjects to build skills for {career.name}
                </p>
              </div>
            </div>
            <div className="p-4 rounded-lg bg-primary/10 border border-primary/20">
              <p className="text-sm font-medium">
                💡 Choose a subject below to start your learning journey. You can learn them in any
                order!
              </p>
            </div>
          </CardContent>
        </Card>

        {/* Required Subjects Section */}
        <div className="space-y-4">
          <div className="flex items-center gap-3">
            <Sparkles className="h-6 w-6 text-primary" />
            <h2 className="text-3xl font-bold">Choose Subject to Start</h2>
          </div>
          <p className="text-muted-foreground">
            Select any subject below to begin learning. Each subject has comprehensive modules,
            quizzes, and hands-on exercises.
          </p>
        </div>

        {/* Subjects Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {requiredSubjects.map((subject) => {
            const enrolled = isEnrolled(subject.id);
            const userSubject = enrolledSubjects.find((es) => es.subject_id === subject.id);

            return (
              <Card
                key={subject.id}
                className="group relative overflow-hidden border-2 hover:border-primary/50 transition-all duration-300 hover:shadow-xl hover:-translate-y-1 cursor-pointer"
                onClick={() => handleSelectSubject(subject.id)}
              >
                {/* Gradient Background */}
                <div className="absolute inset-0 bg-gradient-to-br from-primary/5 to-purple-500/5 opacity-0 group-hover:opacity-100 transition-opacity" />

                <CardHeader className="relative z-10">
                  <div className="flex items-start justify-between mb-3">
                    <div className="text-4xl">{subject.icon || '📚'}</div>
                    {enrolled && <CheckCircle2 className="h-5 w-5 text-green-500" />}
                  </div>
                  <CardTitle className="text-xl group-hover:text-primary transition-colors">
                    {subject.name}
                  </CardTitle>
                  <CardDescription>{subject.description}</CardDescription>
                </CardHeader>

                <CardContent className="relative z-10 space-y-4">
                  {enrolled && userSubject && (
                    <div className="space-y-2">
                      <div className="flex justify-between text-sm">
                        <span className="text-muted-foreground">Progress</span>
                        <span className="font-medium">{userSubject.progress_percentage}%</span>
                      </div>
                      <div className="w-full bg-muted rounded-full h-2">
                        <div
                          className="bg-primary h-2 rounded-full transition-all duration-300"
                          style={{ width: `${userSubject.progress_percentage}%` }}
                        />
                      </div>
                      <div className="flex items-center gap-2">
                        <Badge variant="secondary" className="text-xs capitalize">
                          {userSubject.skill_level}
                        </Badge>
                        {userSubject.is_completed && (
                          <Badge variant="default" className="text-xs bg-green-500">
                            Completed
                          </Badge>
                        )}
                      </div>
                    </div>
                  )}

                  <Button
                    className="w-full group-hover:bg-primary group-hover:text-primary-foreground transition-colors"
                    variant={enrolled ? 'outline' : 'default'}
                  >
                    <BookOpen className="mr-2 h-4 w-4" />
                    {enrolled ? 'Continue Learning' : 'Start Learning'}
                  </Button>
                </CardContent>
              </Card>
            );
          })}
        </div>

        {requiredSubjects.length === 0 && (
          <Card className="border-2 border-dashed border-muted">
            <CardContent className="pt-6 text-center py-12">
              <p className="text-muted-foreground">
                No required subjects found for this career path.
              </p>
            </CardContent>
          </Card>
        )}

        {/* Info Card */}
        <Card className="border-2 border-blue-500/30 bg-blue-500/5">
          <CardContent className="pt-6">
            <div className="flex items-start gap-3">
              <div className="p-2 rounded-lg bg-blue-500/20">
                <Sparkles className="h-5 w-5 text-blue-600 dark:text-blue-400" />
              </div>
              <div className="flex-1">
                <h3 className="font-semibold mb-2">Learning Path</h3>
                <p className="text-sm text-muted-foreground">
                  After selecting a subject, you'll go through: Knowledge Assessment → Learning
                  Modules → Topic Quizzes → Final Exam → Course Completion
                </p>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </MainLayout>
  );
}
