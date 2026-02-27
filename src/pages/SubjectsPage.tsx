import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '@/contexts/AuthContext';
import { MainLayout } from '@/components/layouts/MainLayout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { getAllSubjectDomains, getSubjectsByDomain, getUserSubjects, enrollInSubject } from '@/db/api';
import type { Subject, UserSubject, SubjectDomain } from '@/types';
import { toast } from 'sonner';
import { BookOpen, CheckCircle2, Sparkles } from 'lucide-react';
import { Skeleton } from '@/components/ui/skeleton';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';

export default function SubjectsPage() {
  const { profile } = useAuth();
  const navigate = useNavigate();
  const [domains, setDomains] = useState<SubjectDomain[]>([]);
  const [subjectsByDomain, setSubjectsByDomain] = useState<Record<string, Subject[]>>({});
  const [enrolledSubjects, setEnrolledSubjects] = useState<UserSubject[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadData();
  }, [profile?.id]);

  const loadData = async () => {
    if (!profile?.id) return;

    try {
      const [domainsData, userSubjects] = await Promise.all([
        getAllSubjectDomains(),
        getUserSubjects(profile.id),
      ]);
      
      setDomains(domainsData);
      setEnrolledSubjects(userSubjects);

      // Load subjects for each domain
      const subjectsMap: Record<string, Subject[]> = {};
      for (const domain of domainsData) {
        const subjects = await getSubjectsByDomain(domain.id);
        subjectsMap[domain.id] = subjects;
      }
      setSubjectsByDomain(subjectsMap);
    } catch (error) {
      console.error('Failed to load subjects:', error);
      toast.error('Failed to load subjects');
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
        <div className="space-y-6">
          <div>
            <h1 className="text-4xl font-bold gradient-text">Choose Your Subjects</h1>
            <p className="text-muted-foreground mt-2">
              Select subjects you want to learn and track your progress
            </p>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {[...Array(6)].map((_, i) => (
              <Card key={i} className="glass-card">
                <CardHeader>
                  <Skeleton className="h-8 w-8 rounded-full bg-muted" />
                  <Skeleton className="h-6 w-32 bg-muted" />
                  <Skeleton className="h-4 w-full bg-muted" />
                </CardHeader>
                <CardContent>
                  <Skeleton className="h-10 w-full bg-muted" />
                </CardContent>
              </Card>
            ))}
          </div>
        </div>
      </MainLayout>
    );
  }

  return (
    <MainLayout>
      <div className="space-y-6 animate-fade-in">
        <div className="text-center space-y-4">
          <div className="flex items-center justify-center gap-3">
            <Sparkles className="h-10 w-10 text-primary animate-pulse" />
            <h1 className="text-5xl font-bold gradient-text">Choose Your Subjects</h1>
            <Sparkles className="h-10 w-10 text-primary animate-pulse" />
          </div>
          <p className="text-xl text-muted-foreground">
            Select subjects from different domains and start your learning journey
          </p>
        </div>

        <Tabs defaultValue={domains[0]?.id} className="w-full">
          <TabsList className="grid w-full grid-cols-3 mb-8">
            {domains.map((domain) => (
              <TabsTrigger key={domain.id} value={domain.id} className="text-base">
                <span className="mr-2">{domain.icon}</span>
                {domain.name}
              </TabsTrigger>
            ))}
          </TabsList>

          {domains.map((domain) => (
            <TabsContent key={domain.id} value={domain.id} className="space-y-6">
              <div className="text-center p-4 rounded-lg bg-gradient-to-r from-primary/10 to-purple-500/10 border border-primary/20">
                <p className="text-lg font-medium">{domain.description}</p>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                {subjectsByDomain[domain.id]?.map((subject) => {
                  const enrolled = isEnrolled(subject.id);
                  const userSubject = enrolledSubjects.find((es) => es.subject_id === subject.id);

                  return (
                    <Card
                      key={subject.id}
                      className="glass-card hover:shadow-hover transition-all duration-300 cursor-pointer hover:-translate-y-1"
                      onClick={() => handleSelectSubject(subject.id)}
                    >
                      <CardHeader>
                        <div className="flex items-start justify-between">
                          <div className="text-4xl">{subject.icon || '📚'}</div>
                          {enrolled && (
                            <CheckCircle2 className="h-5 w-5 text-green-500" />
                          )}
                        </div>
                        <CardTitle className="text-2xl">{subject.name}</CardTitle>
                        <CardDescription>{subject.description}</CardDescription>
                      </CardHeader>
                      <CardContent className="space-y-4">
                        {enrolled && userSubject && (
                          <div className="space-y-2">
                            <div className="flex justify-between text-sm">
                              <span className="text-muted-foreground">Progress</span>
                              <span className="font-medium">{userSubject.progress_percentage}%</span>
                            </div>
                            <div className="w-full bg-muted rounded-full h-2">
                              <div
                                className="bg-primary h-2 rounded-full animated-progress"
                                style={{ width: `${userSubject.progress_percentage}%` }}
                              />
                            </div>
                            <p className="text-xs text-muted-foreground capitalize">
                              Level: {userSubject.skill_level}
                            </p>
                          </div>
                        )}
                        <Button className="w-full" variant={enrolled ? 'outline' : 'default'}>
                          <BookOpen className="mr-2 h-4 w-4" />
                          {enrolled ? 'Continue Learning' : 'Start Learning'}
                        </Button>
                      </CardContent>
                    </Card>
                  );
                })}
              </div>

              {(!subjectsByDomain[domain.id] || subjectsByDomain[domain.id].length === 0) && (
                <div className="text-center py-12">
                  <p className="text-muted-foreground">No subjects available in this domain yet.</p>
                </div>
              )}
            </TabsContent>
          ))}
        </Tabs>
      </div>
    </MainLayout>
  );
}
