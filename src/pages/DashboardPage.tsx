import { useEffect, useState } from 'react';
import { useAuth } from '@/contexts/AuthContext';
import { MainLayout } from '@/components/layouts/MainLayout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { getUserSubjects, getUserCareerGoal } from '@/db/api';
import type { UserSubject, UserCareerGoal } from '@/types';
import { Progress } from '@/components/ui/progress';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { BookOpen, TrendingUp, Flame, AlertCircle, Target, Briefcase } from 'lucide-react';
import { useNavigate } from 'react-router-dom';

export default function DashboardPage() {
  const { profile } = useAuth();
  const navigate = useNavigate();
  const [userSubjects, setUserSubjects] = useState<UserSubject[]>([]);
  const [careerGoal, setCareerGoal] = useState<UserCareerGoal | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadData();
  }, [profile?.id]);

  const loadData = async () => {
    if (!profile?.id) return;

    try {
      const [subjects, goal] = await Promise.all([
        getUserSubjects(profile.id),
        getUserCareerGoal(profile.id),
      ]);
      setUserSubjects(subjects);
      setCareerGoal(goal);
    } catch (error) {
      console.error('Failed to load dashboard data:', error);
    } finally {
      setLoading(false);
    }
  };

  const calculateOverallProgress = () => {
    if (userSubjects.length === 0) return 0;
    const total = userSubjects.reduce((sum, s) => sum + s.progress_percentage, 0);
    return Math.round(total / userSubjects.length);
  };

  const getWeakAreas = () => {
    return userSubjects
      .filter((s) => s.progress_percentage < 50 && s.progress_percentage > 0)
      .map((s) => s.subject?.name || 'Unknown')
      .slice(0, 3);
  };

  const getStudySuggestions = () => {
    const suggestions: string[] = [];
    
    if (userSubjects.length === 0) {
      suggestions.push('Start by selecting your first subject');
    } else {
      const incomplete = userSubjects.filter((s) => !s.is_completed);
      if (incomplete.length > 0) {
        suggestions.push(`Continue learning ${incomplete[0].subject?.name}`);
      }
      
      if (profile?.study_streak === 0) {
        suggestions.push('Start your study streak today!');
      } else if (profile?.study_streak && profile.study_streak < 7) {
        suggestions.push('Keep your streak going!');
      }
      
      const weakAreas = getWeakAreas();
      if (weakAreas.length > 0) {
        suggestions.push(`Focus on improving ${weakAreas[0]}`);
      }
    }
    
    return suggestions;
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

  const overallProgress = calculateOverallProgress();
  const weakAreas = getWeakAreas();
  const suggestions = getStudySuggestions();
  const completedCount = userSubjects.filter((s) => s.is_completed).length;

  return (
    <MainLayout>
      <div className="space-y-6 animate-fade-in">
        <div>
          <h1 className="text-4xl font-bold gradient-text">Welcome back, {profile?.name}!</h1>
          <p className="text-muted-foreground mt-2">Here's your learning progress</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
          <Card className="glass-card">
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Total Subjects</CardTitle>
              <BookOpen className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{userSubjects.length}</div>
              <p className="text-xs text-muted-foreground">
                {completedCount} completed
              </p>
            </CardContent>
          </Card>

          <Card className="glass-card">
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Overall Progress</CardTitle>
              <TrendingUp className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold">{overallProgress}%</div>
              <Progress value={overallProgress} className="mt-2 h-2" />
            </CardContent>
          </Card>

          <Card className="glass-card">
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Study Streak</CardTitle>
              <Flame className="h-4 w-4 text-orange-500" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold flex items-center gap-2">
                🔥 {profile?.study_streak || 0}
              </div>
              <p className="text-xs text-muted-foreground">
                {profile?.study_streak === 0 ? 'Start today!' : 'Keep it up!'}
              </p>
            </CardContent>
          </Card>

          <Card className="glass-card">
            <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
              <CardTitle className="text-sm font-medium">Skill Level</CardTitle>
              <AlertCircle className="h-4 w-4 text-muted-foreground" />
            </CardHeader>
            <CardContent>
              <div className="text-2xl font-bold capitalize">
                {userSubjects[0]?.skill_level || 'Beginner'}
              </div>
              <p className="text-xs text-muted-foreground">Primary level</p>
            </CardContent>
          </Card>
        </div>

        {/* Career Goal Section */}
        {careerGoal && careerGoal.career && (
          <Card className="border-2 border-primary/30 bg-gradient-to-r from-primary/5 to-purple-500/5">
            <CardHeader>
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-3">
                  <div className="p-3 rounded-xl bg-gradient-to-br from-primary/20 to-purple-500/20">
                    <Target className="h-6 w-6 text-primary" />
                  </div>
                  <div>
                    <CardTitle className="text-xl">Career Goal</CardTitle>
                    <CardDescription>Your target career path</CardDescription>
                  </div>
                </div>
                <Button
                  variant="outline"
                  size="sm"
                  onClick={() => navigate(`/careers/${careerGoal.career_id}`)}
                >
                  <Briefcase className="h-4 w-4 mr-2" />
                  View Details
                </Button>
              </div>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="flex items-center gap-3">
                <span className="text-4xl">{careerGoal.career.icon}</span>
                <div className="flex-1">
                  <h3 className="text-2xl font-bold">{careerGoal.career.name}</h3>
                  <p className="text-sm text-muted-foreground">{careerGoal.career.description}</p>
                </div>
              </div>

              <div className="space-y-2">
                <div className="flex justify-between text-sm">
                  <span className="font-medium">Career Progress</span>
                  <span className="text-muted-foreground">{careerGoal.progress_percentage}%</span>
                </div>
                <Progress value={careerGoal.progress_percentage} className="h-3" />
              </div>

              {careerGoal.recommended_subjects && careerGoal.recommended_subjects.length > 0 && (
                <div>
                  <p className="text-sm font-semibold mb-2">Recommended Subjects:</p>
                  <div className="flex flex-wrap gap-2">
                    {careerGoal.recommended_subjects.map((subject, idx) => (
                      <Badge key={idx} variant="secondary">
                        {subject}
                      </Badge>
                    ))}
                  </div>
                </div>
              )}

              <div className="p-4 rounded-lg bg-primary/10 border border-primary/20">
                <p className="text-sm font-medium">
                  💡 Recommended Next Step: Continue learning the recommended subjects to advance your career path!
                </p>
              </div>
            </CardContent>
          </Card>
        )}

        {!careerGoal && (
          <Card className="border-2 border-dashed border-primary/30">
            <CardContent className="pt-6">
              <div className="text-center space-y-4">
                <div className="mx-auto w-16 h-16 rounded-full bg-primary/10 flex items-center justify-center">
                  <Target className="h-8 w-8 text-primary" />
                </div>
                <div>
                  <h3 className="text-xl font-bold mb-2">Set Your Career Goal</h3>
                  <p className="text-muted-foreground mb-4">
                    Choose a career path and get personalized learning recommendations!
                  </p>
                  <Button onClick={() => navigate('/career-domains')}>
                    <Briefcase className="h-4 w-4 mr-2" />
                    Explore Career Domains
                  </Button>
                </div>
              </div>
            </CardContent>
          </Card>
        )}

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          <Card className="glass-card">
            <CardHeader>
              <CardTitle>Study Suggestions</CardTitle>
              <CardDescription>Personalized recommendations for you</CardDescription>
            </CardHeader>
            <CardContent>
              <ul className="space-y-2">
                {suggestions.map((suggestion, idx) => (
                  <li key={idx} className="flex items-start gap-2">
                    <span className="text-primary mt-1">•</span>
                    <span className="text-sm">{suggestion}</span>
                  </li>
                ))}
              </ul>
            </CardContent>
          </Card>

          <Card className="glass-card">
            <CardHeader>
              <CardTitle>Weak Areas</CardTitle>
              <CardDescription>Focus on these subjects</CardDescription>
            </CardHeader>
            <CardContent>
              {weakAreas.length > 0 ? (
                <div className="space-y-2">
                  {weakAreas.map((area, idx) => (
                    <Badge key={idx} variant="outline" className="mr-2">
                      {area}
                    </Badge>
                  ))}
                </div>
              ) : (
                <p className="text-sm text-muted-foreground">
                  No weak areas identified. Keep up the great work!
                </p>
              )}
            </CardContent>
          </Card>
        </div>

        <Card className="glass-card">
          <CardHeader>
            <CardTitle>Your Subjects</CardTitle>
            <CardDescription>Track your progress across all subjects</CardDescription>
          </CardHeader>
          <CardContent>
            {userSubjects.length === 0 ? (
              <div className="text-center py-8">
                <p className="text-muted-foreground mb-4">You haven't enrolled in any subjects yet</p>
                <button
                  onClick={() => navigate('/subjects')}
                  className="text-primary hover:underline"
                >
                  Browse Subjects
                </button>
              </div>
            ) : (
              <div className="space-y-4">
                {userSubjects.map((userSubject) => (
                  <div
                    key={userSubject.id}
                    className="flex items-center justify-between p-4 rounded-lg border border-border hover:bg-muted/50 transition-colors cursor-pointer"
                    onClick={() => navigate(`/subject/${userSubject.subject_id}/topics`)}
                  >
                    <div className="flex items-center gap-4 flex-1">
                      <div className="text-3xl">{userSubject.subject?.icon || '📚'}</div>
                      <div className="flex-1">
                        <h3 className="font-semibold">{userSubject.subject?.name}</h3>
                        <div className="flex items-center gap-4 mt-2">
                          <div className="flex-1">
                            <Progress value={userSubject.progress_percentage} className="h-2" />
                          </div>
                          <span className="text-sm font-medium">
                            {userSubject.progress_percentage}%
                          </span>
                        </div>
                      </div>
                    </div>
                    <Badge variant="secondary" className="capitalize">
                      {userSubject.skill_level}
                    </Badge>
                  </div>
                ))}
              </div>
            )}
          </CardContent>
        </Card>
      </div>
    </MainLayout>
  );
}
