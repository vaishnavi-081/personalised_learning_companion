import { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useAuth } from '@/contexts/AuthContext';
import { MainLayout } from '@/components/layouts/MainLayout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import {
  getSubjectById,
  getUserSubject,
  getTopicsWithProgress,
} from '@/db/api';
import type { Subject, UserSubject, Topic, SkillLevel } from '@/types';
import { toast } from 'sonner';
import { BookOpen, CheckCircle2, Lock, ArrowLeft, Trophy } from 'lucide-react';
import { Badge } from '@/components/ui/badge';
import { ProgressBar } from '@/components/learning/ProgressBar';


type TopicWithStatus = Topic & { isUnlocked: boolean; isCompleted: boolean; quizScore?: number };

export default function TopicsPage() {
  const { subjectId } = useParams<{ subjectId: string }>();
  const { profile } = useAuth();
  const navigate = useNavigate();
  const [subject, setSubject] = useState<Subject | null>(null);
  const [userSubject, setUserSubject] = useState<UserSubject | null>(null);
  const [topics, setTopics] = useState<TopicWithStatus[]>([]);
  const [loading, setLoading] = useState(true);
  const [activeLevel, setActiveLevel] = useState<SkillLevel>('beginner');

  useEffect(() => {
    loadData();
  }, [subjectId, profile?.id, activeLevel]);

  const loadData = async () => {
    if (!subjectId || !profile?.id) return;

    try {
      const [subjectData, userSubjectData] = await Promise.all([
        getSubjectById(subjectId),
        getUserSubject(profile.id, subjectId),
      ]);

      setSubject(subjectData);
      setUserSubject(userSubjectData);

      if (userSubjectData) {
        setActiveLevel(userSubjectData.skill_level);
        const topicsData = await getTopicsWithProgress(
          profile.id,
          subjectId,
          userSubjectData.skill_level
        );
        setTopics(topicsData);
      }
    } catch (error) {
      console.error('Failed to load topics:', error);
      toast.error('Failed to load topics');
    } finally {
      setLoading(false);
    }
  };

  const handleTopicClick = (topic: TopicWithStatus) => {
    if (!topic.isUnlocked) {
      toast.error('Complete the previous topic quiz to unlock this topic');
      return;
    }
    navigate(`/subject/${subjectId}/topic/${topic.id}`);
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

  return (
    <MainLayout>
      <div className="space-y-6 animate-fade-in">
        <div className="flex items-center gap-4">
          <Button variant="ghost" size="icon" onClick={() => navigate('/subjects')}>
            <ArrowLeft className="h-5 w-5" />
          </Button>
          <div className="flex-1">
            <h1 className="text-4xl font-bold gradient-text">{subject?.name}</h1>
            <p className="text-muted-foreground mt-2">{subject?.description}</p>
          </div>
        </div>

        {subject?.roadmap && (
          <Card className="glass-card">
            <CardHeader>
              <CardTitle>Learning Roadmap</CardTitle>
            </CardHeader>
            <CardContent>
              <p className="text-sm">{subject.roadmap}</p>
            </CardContent>
          </Card>
        )}

        {userSubject && (
          <Card className="glass-card border-2 border-primary/20">
            <CardContent className="pt-6 space-y-4">
              <ProgressBar 
                label="Overall Progress" 
                value={userSubject.progress_percentage} 
              />
              <div className="flex justify-between items-center">
                <Badge variant="secondary" className="capitalize">
                  <Trophy className="h-3 w-3 mr-1" />
                  Level: {userSubject.skill_level}
                </Badge>
                <span className="text-sm text-muted-foreground">
                  {topics.filter(t => t.isCompleted).length} / {topics.length} topics completed
                </span>
              </div>
            </CardContent>
          </Card>
        )}

        <Tabs value={activeLevel} onValueChange={(v) => setActiveLevel(v as SkillLevel)}>
          <TabsList className="grid w-full grid-cols-3">
            <TabsTrigger value="beginner">Beginner</TabsTrigger>
            <TabsTrigger value="intermediate">Intermediate</TabsTrigger>
            <TabsTrigger value="expert">Expert</TabsTrigger>
          </TabsList>

          <TabsContent value={activeLevel} className="space-y-4 mt-6">
            {topics.length === 0 ? (
              <Card className="glass-card">
                <CardContent className="py-12 text-center">
                  <p className="text-muted-foreground">No topics available for this level yet.</p>
                </CardContent>
              </Card>
            ) : (
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                {topics.map((topic, index) => {
                  return (
                    <Card
                      key={topic.id}
                      className={`transition-all duration-300 border-2 ${
                        topic.isCompleted
                          ? 'border-green-500/30 bg-green-500/5'
                          : topic.isUnlocked
                          ? 'border-primary/30 hover:shadow-lg hover:border-primary/50 cursor-pointer'
                          : 'border-muted bg-muted/20 opacity-70'
                      }`}
                      onClick={() => handleTopicClick(topic)}
                    >
                      <CardHeader>
                        <div className="flex items-start justify-between">
                          <div className="flex-1">
                            <CardTitle className="text-lg flex items-center gap-2">
                              {!topic.isUnlocked ? (
                                <Lock className="h-5 w-5 text-muted-foreground" />
                              ) : topic.isCompleted ? (
                                <CheckCircle2 className="h-5 w-5 text-green-500" />
                              ) : (
                                <BookOpen className="h-5 w-5 text-primary" />
                              )}
                              {topic.title}
                            </CardTitle>
                            <CardDescription className="mt-2">
                              {topic.description || 'Learn the fundamentals'}
                            </CardDescription>
                          </div>
                          <Badge variant="outline" className="ml-2">
                            {index + 1}
                          </Badge>
                        </div>
                      </CardHeader>
                      <CardContent>
                        {!topic.isUnlocked ? (
                          <div className="text-center py-4">
                            <Lock className="h-8 w-8 mx-auto mb-2 text-muted-foreground" />
                            <p className="text-sm text-muted-foreground font-medium">
                              🔒 Complete previous quiz to unlock
                            </p>
                          </div>
                        ) : (
                          <div className="space-y-3">
                            {topic.isCompleted && topic.quizScore !== undefined && (
                              <div className="flex items-center justify-between p-2 bg-green-500/10 rounded-lg">
                                <span className="text-sm text-green-700 dark:text-green-300">
                                  ✔ Completed
                                </span>
                                <Badge variant="secondary">
                                  Score: {topic.quizScore}/5
                                </Badge>
                              </div>
                            )}
                            <Button 
                              variant={topic.isCompleted ? 'outline' : 'default'} 
                              className="w-full"
                            >
                              {topic.isCompleted ? '📖 Review Topic' : '🚀 Start Learning'}
                            </Button>
                          </div>
                        )}
                      </CardContent>
                    </Card>
                  );
                })}
              </div>
            )}
          </TabsContent>
        </Tabs>

        {subject?.career_paths && subject.career_paths.length > 0 && (
          <Card className="glass-card border-2 border-purple-500/20 bg-gradient-to-r from-purple-500/5 to-blue-500/5">
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <Trophy className="h-5 w-5 text-purple-500" />
                Career Paths
              </CardTitle>
            </CardHeader>
            <CardContent>
              <div className="flex flex-wrap gap-2">
                {subject.career_paths.map((career, idx) => (
                  <Badge key={idx} variant="secondary" className="text-sm">
                    {career}
                  </Badge>
                ))}
              </div>
            </CardContent>
          </Card>
        )}
      </div>
    </MainLayout>
  );
}
