import { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useAuth } from '@/contexts/AuthContext';
import { MainLayout } from '@/components/layouts/MainLayout';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Separator } from '@/components/ui/separator';
import { getCareerById, setUserCareerGoal, getAllSubjects } from '@/db/api';
import type { Career, Subject } from '@/types';
import { toast } from 'sonner';
import {
  ArrowLeft,
  ArrowRight,
  BookOpen,
  Briefcase,
  Code2,
  DollarSign,
  Lightbulb,
  Play,
  Sparkles,
  Target,
  TrendingUp,
  Youtube,
} from 'lucide-react';
import { getYouTubeEmbedUrl } from '@/lib/youtube';
import { LearningCard } from '@/components/learning/LearningCard';
import { InfoBox } from '@/components/learning/InfoBox';

export default function CareerPathPage() {
  const { careerId } = useParams<{ careerId: string }>();
  const { profile } = useAuth();
  const navigate = useNavigate();
  const [career, setCareer] = useState<Career | null>(null);
  const [subjects, setSubjects] = useState<Subject[]>([]);
  const [loading, setLoading] = useState(true);
  const [settingGoal, setSettingGoal] = useState(false);

  useEffect(() => {
    loadData();
  }, [careerId]);

  const loadData = async () => {
    if (!careerId) return;

    try {
      const [careerData, subjectsData] = await Promise.all([
        getCareerById(careerId),
        getAllSubjects(),
      ]);

      setCareer(careerData);
      setSubjects(subjectsData);
    } catch (error) {
      console.error('Failed to load career:', error);
      toast.error('Failed to load career');
    } finally {
      setLoading(false);
    }
  };

  const handleSetCareerGoal = async () => {
    if (!career || !profile) return;

    setSettingGoal(true);
    try {
      // Map technologies to subject names
      const recommendedSubjects = career.technologies
        .map((tech) => {
          const subject = subjects.find(
            (s) => s.name.toLowerCase() === tech.toLowerCase()
          );
          return subject?.name;
        })
        .filter((name): name is string => name !== undefined);

      await setUserCareerGoal(profile.id, career.id, recommendedSubjects);
      toast.success('Career goal set successfully! Check your dashboard.');
      navigate('/dashboard');
    } catch (error) {
      console.error('Failed to set career goal:', error);
      toast.error('Failed to set career goal');
    } finally {
      setSettingGoal(false);
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

  // Find recommended subjects
  const recommendedSubjects = career.technologies
    .map((tech) => subjects.find((s) => s.name.toLowerCase() === tech.toLowerCase()))
    .filter((s): s is Subject => s !== undefined);

  return (
    <MainLayout>
      <div className="space-y-8 animate-fade-in max-w-6xl mx-auto">
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

        {/* Quick Stats */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <Card className="border-2 border-green-500/30 bg-green-500/5">
            <CardContent className="pt-6">
              <div className="flex items-center gap-3">
                <div className="p-3 rounded-lg bg-green-500/20">
                  <DollarSign className="h-6 w-6 text-green-600 dark:text-green-400" />
                </div>
                <div>
                  <p className="text-sm text-muted-foreground">Average Salary</p>
                  <p className="text-lg font-bold text-green-700 dark:text-green-300">
                    {career.average_salary}
                  </p>
                </div>
              </div>
            </CardContent>
          </Card>

          <Card className="border-2 border-blue-500/30 bg-blue-500/5">
            <CardContent className="pt-6">
              <div className="flex items-center gap-3">
                <div className="p-3 rounded-lg bg-blue-500/20">
                  <TrendingUp className="h-6 w-6 text-blue-600 dark:text-blue-400" />
                </div>
                <div>
                  <p className="text-sm text-muted-foreground">Job Demand</p>
                  <p className="text-lg font-bold text-blue-700 dark:text-blue-300">High Growth</p>
                </div>
              </div>
            </CardContent>
          </Card>

          <Card className="border-2 border-purple-500/30 bg-purple-500/5">
            <CardContent className="pt-6">
              <div className="flex items-center gap-3">
                <div className="p-3 rounded-lg bg-purple-500/20">
                  <Briefcase className="h-6 w-6 text-purple-600 dark:text-purple-400" />
                </div>
                <div>
                  <p className="text-sm text-muted-foreground">Experience Level</p>
                  <p className="text-lg font-bold text-purple-700 dark:text-purple-300">
                    Entry to Senior
                  </p>
                </div>
              </div>
            </CardContent>
          </Card>
        </div>

        {/* About Career */}
        <LearningCard title="About This Career" icon={Briefcase} color="blue">
          <p className="text-base leading-relaxed">{career.about}</p>
        </LearningCard>

        {/* Skills Required */}
        <LearningCard title="Skills Needed" icon={Lightbulb} color="purple">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
            {career.skills_required.map((skill, idx) => (
              <div
                key={idx}
                className="flex items-center gap-3 p-3 rounded-lg bg-purple-500/10 border border-purple-500/20"
              >
                <div className="p-2 rounded-lg bg-purple-500/20">
                  <Sparkles className="h-4 w-4 text-purple-600 dark:text-purple-400" />
                </div>
                <span className="font-medium">{skill}</span>
              </div>
            ))}
          </div>
        </LearningCard>

        {/* Technologies to Learn */}
        <LearningCard title="Technologies to Learn" icon={Code2} color="green">
          <div className="space-y-4">
            <div className="flex flex-wrap gap-3">
              {career.technologies.map((tech, idx) => (
                <Badge key={idx} variant="outline" className="text-base px-4 py-2">
                  {tech}
                </Badge>
              ))}
            </div>
            <InfoBox type="tip" title="Learning Path">
              These technologies are available in our learning modules. Start learning them step by
              step!
            </InfoBox>
          </div>
        </LearningCard>

        {/* Career Roadmap */}
        <LearningCard title="Career Roadmap" icon={Target} color="orange">
          <div className="relative">
            {/* Timeline */}
            <div className="space-y-6">
              {career.roadmap.stages.map((stage, idx) => (
                <div key={idx} className="flex items-start gap-4">
                  {/* Timeline Dot */}
                  <div className="flex flex-col items-center">
                    <div className="w-10 h-10 rounded-full bg-gradient-to-br from-orange-500 to-red-500 flex items-center justify-center text-white font-bold shadow-lg">
                      {idx + 1}
                    </div>
                    {idx < career.roadmap.stages.length - 1 && (
                      <div className="w-1 h-16 bg-gradient-to-b from-orange-500 to-red-500 my-2" />
                    )}
                  </div>

                  {/* Stage Content */}
                  <div className="flex-1 pb-8">
                    <div className="p-4 rounded-lg bg-orange-500/10 border-2 border-orange-500/20">
                      <h3 className="font-bold text-lg text-orange-700 dark:text-orange-300 mb-2">
                        Stage {idx + 1}
                      </h3>
                      <p className="text-base">{stage}</p>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </LearningCard>

        {/* Recommended Subjects */}
        {recommendedSubjects.length > 0 && (
          <LearningCard title="Recommended Learning Path" icon={BookOpen} color="blue">
            <div className="space-y-4">
              <InfoBox type="success" title="Start Your Journey">
                We recommend learning these subjects to build your skills for this career path.
              </InfoBox>
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                {recommendedSubjects.map((subject) => (
                  <Card
                    key={subject.id}
                    className="border-2 border-primary/30 hover:border-primary/50 transition-all cursor-pointer hover:shadow-lg"
                    onClick={() => navigate(`/subject/${subject.id}/topics`)}
                  >
                    <CardHeader>
                      <CardTitle className="text-lg flex items-center gap-2">
                        <span className="text-2xl">{subject.icon}</span>
                        {subject.name}
                      </CardTitle>
                    </CardHeader>
                    <CardContent>
                      <p className="text-sm text-muted-foreground mb-3">{subject.description}</p>
                      <Button size="sm" className="w-full">
                        <Play className="h-4 w-4 mr-2" />
                        Start Learning
                      </Button>
                    </CardContent>
                  </Card>
                ))}
              </div>
            </div>
          </LearningCard>
        )}

        {/* Career Videos */}
        {(career.video_urls?.telugu?.length || career.video_urls?.english?.length) && (
          <LearningCard title="Career Videos" icon={Youtube} color="gradient">
            <div className="space-y-6">
              {career.video_urls?.english && career.video_urls.english.length > 0 && (
                <div className="space-y-4">
                  <h3 className="font-semibold flex items-center gap-2">
                    <Youtube className="h-5 w-5 text-red-500" />
                    Career Guidance Videos
                  </h3>
                  {career.video_urls.english.map((url, idx) => (
                    <div key={idx} className="space-y-2">
                      <p className="text-sm text-muted-foreground">
                        Video {idx + 1}: {idx === 0 ? 'How to Become ' + career.name : 'Day in Life of ' + career.name}
                      </p>
                      <div className="relative w-full" style={{ paddingBottom: '56.25%' }}>
                        <iframe
                          className="absolute top-0 left-0 w-full h-full rounded-lg border-2 border-border"
                          src={getYouTubeEmbedUrl(url)}
                          title={`${career.name} - Video ${idx + 1}`}
                          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                          allowFullScreen
                        />
                      </div>
                    </div>
                  ))}
                </div>
              )}
            </div>
          </LearningCard>
        )}

        <Separator />

        {/* Action Button */}
        <Card className="border-2 border-primary/30 bg-gradient-to-r from-primary/5 to-purple-500/5">
          <CardContent className="pt-6">
            <div className="text-center space-y-4">
              <h2 className="text-2xl font-bold">Ready to Start Your Journey?</h2>
              <p className="text-muted-foreground">
                Set this as your career goal and get personalized learning recommendations!
              </p>
              <Button
                size="lg"
                onClick={handleSetCareerGoal}
                disabled={settingGoal}
                className="text-lg px-8"
              >
                {settingGoal ? (
                  'Setting Goal...'
                ) : (
                  <>
                    <Target className="h-5 w-5 mr-2" />
                    Set as Career Goal & Start Learning
                    <ArrowRight className="h-5 w-5 ml-2" />
                  </>
                )}
              </Button>
            </div>
          </CardContent>
        </Card>
      </div>
    </MainLayout>
  );
}
