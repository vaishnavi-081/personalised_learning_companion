import { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useAuth } from '@/contexts/AuthContext';
import { MainLayout } from '@/components/layouts/MainLayout';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { getTopicById, getUserTopicProgress, updateStudyStreak } from '@/db/api';
import type { Topic } from '@/types';
import { toast } from 'sonner';
import { ArrowLeft, BookOpen, Code2, Lightbulb, Youtube, FileCode, Sparkles } from 'lucide-react';
import { Separator } from '@/components/ui/separator';
import { getYouTubeEmbedUrl } from '@/lib/youtube';
import { LearningCard } from '@/components/learning/LearningCard';
import { CodeBlock } from '@/components/learning/CodeBlock';
import { InfoBox } from '@/components/learning/InfoBox';
import { ProgressBar } from '@/components/learning/ProgressBar';

export default function TopicDetailPage() {
  const { subjectId, topicId } = useParams<{ subjectId: string; topicId: string }>();
  const { profile } = useAuth();
  const navigate = useNavigate();
  const [topic, setTopic] = useState<Topic | null>(null);
  const [isCompleted, setIsCompleted] = useState(false);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadTopic();
  }, [topicId, profile?.id]);

  const loadTopic = async () => {
    if (!topicId || !profile?.id) return;

    try {
      const [topicData, progressData] = await Promise.all([
        getTopicById(topicId),
        getUserTopicProgress(profile.id, topicId),
      ]);

      setTopic(topicData);
      setIsCompleted(progressData?.is_completed || false);

      // Update study streak
      await updateStudyStreak(profile.id);
    } catch (error) {
      console.error('Failed to load topic:', error);
      toast.error('Failed to load topic');
    } finally {
      setLoading(false);
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

  if (!topic) {
    return (
      <MainLayout>
        <div className="text-center py-12">
          <p className="text-muted-foreground">Topic not found</p>
        </div>
      </MainLayout>
    );
  }

  // Parse content sections - handle both string and potential JSON formats
  const theory = topic.theory;
  
  // Helper function to safely parse content
  const parseContent = (content: string | null): string[] => {
    if (!content) return [];
    
    // Try to parse as JSON first
    try {
      const parsed = JSON.parse(content);
      if (Array.isArray(parsed)) return parsed;
      return [parsed];
    } catch {
      // If not JSON, treat as plain string
      // Split by newlines if it contains multiple items
      if (content.includes('\n\n')) {
        return content.split('\n\n').filter(item => item.trim());
      }
      return [content];
    }
  };

  const examples = parseContent(topic.code_examples);
  const syntax = topic.syntax;
  const notes = parseContent(topic.notes);
  const exercises = parseContent(topic.exercises);

  return (
    <MainLayout>
      <div className="space-y-6 animate-fade-in max-w-5xl mx-auto">
        {/* Header */}
        <div className="flex items-center gap-4">
          <Button variant="ghost" size="icon" onClick={() => navigate(`/subject/${subjectId}/topics`)}>
            <ArrowLeft className="h-5 w-5" />
          </Button>
          <div className="flex-1">
            <h1 className="text-4xl font-bold gradient-text">{topic.title}</h1>
            <p className="text-muted-foreground mt-2">{topic.description}</p>
          </div>
          {isCompleted && (
            <div className="flex items-center gap-2 px-4 py-2 bg-green-500/10 rounded-lg border border-green-500/30">
              <Sparkles className="h-5 w-5 text-green-500" />
              <span className="text-sm font-medium text-green-700 dark:text-green-300">
                Completed
              </span>
            </div>
          )}
        </div>

        {/* Progress Indicator */}
        <Card className="border-2 border-primary/20">
          <CardContent className="pt-6">
            <ProgressBar 
              label="Topic Progress" 
              value={isCompleted ? 100 : 50} 
            />
            <p className="text-sm text-muted-foreground mt-2 text-center">
              {isCompleted 
                ? '🎉 Great job! You completed this topic!' 
                : '📚 Keep going! Complete the quiz to finish this topic'}
            </p>
          </CardContent>
        </Card>

        {/* Theory Section */}
        {theory && (
          <LearningCard title="📘 Theory" icon={BookOpen} color="blue">
            <div className="prose prose-sm dark:prose-invert max-w-none">
              <div className="whitespace-pre-wrap leading-relaxed">
                {theory}
              </div>
            </div>
          </LearningCard>
        )}

        {/* Examples Section */}
        {examples && examples.length > 0 && (
          <LearningCard title="💻 Code Examples" icon={Code2} color="purple">
            <div className="space-y-4">
              {examples.map((example: string, idx: number) => (
                <div key={idx} className="space-y-2">
                  <p className="text-sm font-medium text-purple-700 dark:text-purple-300">
                    Example {idx + 1}
                  </p>
                  <CodeBlock code={example} />
                </div>
              ))}
            </div>
          </LearningCard>
        )}

        {/* Syntax Section */}
        {syntax && (
          <LearningCard title="📝 Syntax" icon={FileCode} color="green">
            <CodeBlock code={syntax} />
            <InfoBox type="tip" title="Pro Tip">
              Copy the syntax above and try modifying it in your own code editor!
            </InfoBox>
          </LearningCard>
        )}

        {/* Notes Section */}
        {notes && notes.length > 0 && (
          <LearningCard title="💡 Important Notes" icon={Lightbulb} color="orange">
            <div className="space-y-3">
              {notes.map((note: string, idx: number) => (
                <InfoBox key={idx} type="warning">
                  {note}
                </InfoBox>
              ))}
            </div>
          </LearningCard>
        )}

        {/* Exercises Section */}
        {exercises && exercises.length > 0 && (
          <LearningCard title="✏️ Practice Exercises" icon={Sparkles} color="orange">
            <div className="space-y-4">
              {exercises.map((exercise: string, idx: number) => (
                <div key={idx} className="p-4 bg-background rounded-lg border-2 border-orange-500/20">
                  <p className="font-medium text-orange-700 dark:text-orange-300 mb-2">
                    Exercise {idx + 1}
                  </p>
                  <p className="text-sm">{exercise}</p>
                </div>
              ))}
              <InfoBox type="success" title="Challenge Yourself">
                Try to solve these exercises before moving to the quiz!
              </InfoBox>
            </div>
          </LearningCard>
        )}

        {/* Video Tutorials Section */}
        {(topic.youtube_videos?.telugu?.length || topic.youtube_videos?.english?.length) && (
          <LearningCard title="🎥 Video Tutorials" icon={Youtube} color="gradient">
            <div className="space-y-6">
              {topic.youtube_videos?.telugu && topic.youtube_videos.telugu.length > 0 && (
                <div className="space-y-4">
                  <h3 className="font-semibold flex items-center gap-2">
                    <Youtube className="h-5 w-5 text-red-500" />
                    Telugu Tutorials
                  </h3>
                  {topic.youtube_videos.telugu.map((url, idx) => (
                    <div key={idx} className="space-y-2">
                      <p className="text-sm text-muted-foreground">Video {idx + 1}</p>
                      <div className="relative w-full" style={{ paddingBottom: '56.25%' }}>
                        <iframe
                          className="absolute top-0 left-0 w-full h-full rounded-lg border-2 border-border"
                          src={getYouTubeEmbedUrl(url)}
                          title={`${topic.title} - Telugu Tutorial ${idx + 1}`}
                          allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                          allowFullScreen
                        />
                      </div>
                    </div>
                  ))}
                </div>
              )}

              {topic.youtube_videos?.english && topic.youtube_videos.english.length > 0 && (
                <div className="space-y-4">
                  <h3 className="font-semibold flex items-center gap-2">
                    <Youtube className="h-5 w-5 text-red-500" />
                    English Tutorials
                  </h3>
                  {topic.youtube_videos.english.map((url, idx) => (
                    <div key={idx} className="space-y-2">
                      <p className="text-sm text-muted-foreground">Video {idx + 1}</p>
                      <div className="relative w-full" style={{ paddingBottom: '56.25%' }}>
                        <iframe
                          className="absolute top-0 left-0 w-full h-full rounded-lg border-2 border-border"
                          src={getYouTubeEmbedUrl(url)}
                          title={`${topic.title} - English Tutorial ${idx + 1}`}
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

        {/* Action Buttons */}
        <Card className="border-2 border-primary/30 bg-gradient-to-r from-primary/5 to-purple-500/5">
          <CardContent className="pt-6">
            <div className="flex flex-col sm:flex-row justify-between items-center gap-4">
              <Button 
                variant="outline" 
                onClick={() => navigate(`/subject/${subjectId}/topics`)}
                className="w-full sm:w-auto"
              >
                <ArrowLeft className="mr-2 h-4 w-4" />
                Back to Topics
              </Button>

              <Button 
                onClick={() => navigate(`/subject/${subjectId}/topic/${topicId}/quiz`)}
                size="lg"
                className="w-full sm:w-auto text-lg"
              >
                {isCompleted ? '🔄 Retake Quiz' : '🎯 Take Module Quiz'}
              </Button>
            </div>
            
            {!isCompleted && (
              <InfoBox type="info" title="Next Step">
                <p className="text-sm">
                  Complete the quiz with a score of <strong>3 or higher</strong> to unlock the next topic and continue your learning journey!
                </p>
              </InfoBox>
            )}
          </CardContent>
        </Card>
      </div>
    </MainLayout>
  );
}
