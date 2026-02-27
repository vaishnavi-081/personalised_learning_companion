import { supabase } from './supabase';
import type {
  Profile,
  Subject,
  UserSubject,
  Topic,
  UserTopicProgress,
  Quiz,
  QuizQuestion,
  UserQuizAttempt,
  Notification,
  HelpDeskMessage,
  Feedback,
  SkillLevel,
  CareerDomain,
  Career,
  UserCareerGoal,
} from '@/types';

// Profile APIs
export async function getProfile(userId: string): Promise<Profile | null> {
  const { data, error } = await supabase
    .from('profiles')
    .select('*')
    .eq('id', userId)
    .maybeSingle();

  if (error) throw error;
  return data;
}

export async function updateProfile(userId: string, updates: Partial<Profile>): Promise<void> {
  const { error } = await supabase
    .from('profiles')
    .update(updates)
    .eq('id', userId);

  if (error) throw error;
}

export async function getAllProfiles(): Promise<Profile[]> {
  const { data, error } = await supabase
    .from('profiles')
    .select('*')
    .order('created_at', { ascending: false });

  if (error) throw error;
  return Array.isArray(data) ? data : [];
}

export async function updateUserRole(userId: string, role: 'user' | 'admin'): Promise<void> {
  const { error } = await supabase
    .from('profiles')
    .update({ role })
    .eq('id', userId);

  if (error) throw error;
}

// Subject APIs
export async function getAllSubjects(): Promise<Subject[]> {
  const { data, error } = await supabase
    .from('subjects')
    .select('*')
    .order('name');

  if (error) throw error;
  return Array.isArray(data) ? data : [];
}

export async function getSubjectById(subjectId: string): Promise<Subject | null> {
  const { data, error } = await supabase
    .from('subjects')
    .select('*')
    .eq('id', subjectId)
    .maybeSingle();

  if (error) throw error;
  return data;
}

// User Subject APIs
export async function getUserSubjects(userId: string): Promise<UserSubject[]> {
  const { data, error } = await supabase
    .from('user_subjects')
    .select('*, subject:subjects(*)')
    .eq('user_id', userId)
    .order('enrolled_at', { ascending: false });

  if (error) throw error;
  return Array.isArray(data) ? data : [];
}

export async function enrollInSubject(userId: string, subjectId: string): Promise<void> {
  const { error } = await supabase
    .from('user_subjects')
    .insert({
      user_id: userId,
      subject_id: subjectId,
      skill_level: 'beginner',
      progress_percentage: 0,
    });

  if (error) throw error;
}

export async function updateUserSubjectLevel(
  userId: string,
  subjectId: string,
  level: SkillLevel
): Promise<void> {
  const { error } = await supabase
    .from('user_subjects')
    .update({ skill_level: level })
    .eq('user_id', userId)
    .eq('subject_id', subjectId);

  if (error) throw error;
}

export async function updateSubjectProgress(
  userId: string,
  subjectId: string,
  progressPercentage: number
): Promise<void> {
  const { error } = await supabase
    .from('user_subjects')
    .update({ progress_percentage: progressPercentage })
    .eq('user_id', userId)
    .eq('subject_id', subjectId);

  if (error) throw error;
}

export async function completeSubject(userId: string, subjectId: string): Promise<void> {
  const { error } = await supabase
    .from('user_subjects')
    .update({
      is_completed: true,
      completed_at: new Date().toISOString(),
      progress_percentage: 100,
    })
    .eq('user_id', userId)
    .eq('subject_id', subjectId);

  if (error) throw error;
}

export async function getUserSubject(
  userId: string,
  subjectId: string
): Promise<UserSubject | null> {
  const { data, error } = await supabase
    .from('user_subjects')
    .select('*, subject:subjects(*)')
    .eq('user_id', userId)
    .eq('subject_id', subjectId)
    .maybeSingle();

  if (error) throw error;
  return data;
}

// Topic APIs
export async function getTopicsBySubjectAndLevel(
  subjectId: string,
  level: SkillLevel
): Promise<Topic[]> {
  const { data, error } = await supabase
    .from('topics')
    .select('*')
    .eq('subject_id', subjectId)
    .eq('level', level)
    .order('order_index');

  if (error) throw error;
  return Array.isArray(data) ? data : [];
}

export async function getTopicById(topicId: string): Promise<Topic | null> {
  const { data, error } = await supabase
    .from('topics')
    .select('*')
    .eq('id', topicId)
    .maybeSingle();

  if (error) throw error;
  return data;
}

// User Topic Progress APIs
export async function getUserTopicProgress(
  userId: string,
  topicId: string
): Promise<UserTopicProgress | null> {
  const { data, error } = await supabase
    .from('user_topic_progress')
    .select('*')
    .eq('user_id', userId)
    .eq('topic_id', topicId)
    .maybeSingle();

  if (error) throw error;
  return data;
}

export async function markTopicComplete(
  userId: string,
  topicId: string,
  quizScore: number
): Promise<void> {
  const { error } = await supabase
    .from('user_topic_progress')
    .upsert({
      user_id: userId,
      topic_id: topicId,
      is_completed: true,
      quiz_score: quizScore,
      completed_at: new Date().toISOString(),
    });

  if (error) throw error;
}

// Alias for consistency
export const markTopicCompleted = markTopicComplete;

export async function getUserTopicProgressBySubject(
  userId: string,
  subjectId: string
): Promise<UserTopicProgress[]> {
  const { data, error } = await supabase
    .from('user_topic_progress')
    .select('*, topic:topics!inner(*)')
    .eq('user_id', userId)
    .eq('topic.subject_id', subjectId);

  if (error) throw error;
  return Array.isArray(data) ? data : [];
}

// Check if a topic is unlocked for the user
export async function isTopicUnlocked(
  userId: string,
  topicId: string,
  subjectId: string,
  level: SkillLevel
): Promise<boolean> {
  // Get the topic to check its order
  const topic = await getTopicById(topicId);
  if (!topic) return false;

  // First topic in any level is always unlocked
  if (topic.order_index === 1) return true;

  // Get all topics in this subject and level
  const allTopics = await getTopicsBySubjectAndLevel(subjectId, level);
  
  // Find the previous topic
  const previousTopic = allTopics.find(t => t.order_index === topic.order_index - 1);
  if (!previousTopic) return true; // No previous topic, so unlocked

  // Check if previous topic is completed
  const progress = await getUserTopicProgress(userId, previousTopic.id);
  return progress?.is_completed || false;
}

// Get topics with their unlock status
export async function getTopicsWithProgress(
  userId: string,
  subjectId: string,
  level: SkillLevel
): Promise<Array<Topic & { isUnlocked: boolean; isCompleted: boolean; quizScore?: number }>> {
  const topics = await getTopicsBySubjectAndLevel(subjectId, level);
  const progressData = await getUserTopicProgressBySubject(userId, subjectId);

  const result: Array<Topic & { isUnlocked: boolean; isCompleted: boolean; quizScore?: number }> = [];
  for (const topic of topics) {
    const progress = progressData.find(p => p.topic_id === topic.id);
    const isCompleted = progress?.is_completed || false;
    
    // First topic is always unlocked, others require previous topic completion
    let isUnlocked = topic.order_index === 1;
    if (!isUnlocked && topic.order_index > 1) {
      const previousTopic = topics.find(t => t.order_index === topic.order_index - 1);
      if (previousTopic) {
        const prevProgress = progressData.find(p => p.topic_id === previousTopic.id);
        isUnlocked = prevProgress?.is_completed || false;
      }
    }

    result.push({
      ...topic,
      isUnlocked,
      isCompleted,
      quizScore: progress?.quiz_score ?? undefined,
    });
  }

  return result;
}

// Quiz APIs
export async function getAssessmentQuiz(subjectId: string): Promise<Quiz | null> {
  const { data, error } = await supabase
    .from('quizzes')
    .select('*')
    .eq('subject_id', subjectId)
    .eq('quiz_type', 'assessment')
    .maybeSingle();

  if (error) throw error;
  return data;
}

export async function getModuleQuiz(topicId: string): Promise<Quiz | null> {
  const { data, error } = await supabase
    .from('quizzes')
    .select('*')
    .eq('topic_id', topicId)
    .eq('quiz_type', 'module')
    .maybeSingle();

  if (error) throw error;
  return data;
}

export async function getQuizQuestions(quizId: string): Promise<QuizQuestion[]> {
  const { data, error } = await supabase
    .from('quiz_questions')
    .select('*')
    .eq('quiz_id', quizId)
    .order('order_index');

  if (error) throw error;
  return Array.isArray(data) ? data : [];
}

export async function submitQuizAttempt(
  userId: string,
  quizId: string,
  score: number,
  totalQuestions: number,
  passed?: boolean,
  answers?: Record<string, string>
): Promise<void> {
  const { error } = await supabase
    .from('user_quiz_attempts')
    .insert({
      user_id: userId,
      quiz_id: quizId,
      score,
      total_questions: totalQuestions,
      passed,
      answers,
    });

  if (error) throw error;
}

export async function getUserQuizAttempts(
  userId: string,
  quizId: string
): Promise<UserQuizAttempt[]> {
  const { data, error } = await supabase
    .from('user_quiz_attempts')
    .select('*')
    .eq('user_id', userId)
    .eq('quiz_id', quizId)
    .order('attempted_at', { ascending: false });

  if (error) throw error;
  return Array.isArray(data) ? data : [];
}

// Notification APIs
export async function getUserNotifications(userId: string): Promise<Notification[]> {
  const { data, error } = await supabase
    .from('notifications')
    .select('*')
    .eq('user_id', userId)
    .order('created_at', { ascending: false })
    .limit(50);

  if (error) throw error;
  return Array.isArray(data) ? data : [];
}

export async function getUnreadNotificationCount(userId: string): Promise<number> {
  const { count, error } = await supabase
    .from('notifications')
    .select('*', { count: 'exact', head: true })
    .eq('user_id', userId)
    .eq('is_read', false);

  if (error) throw error;
  return count || 0;
}

export async function markNotificationAsRead(notificationId: string): Promise<void> {
  const { error } = await supabase
    .from('notifications')
    .update({ is_read: true })
    .eq('id', notificationId);

  if (error) throw error;
}

export async function markAllNotificationsAsRead(userId: string): Promise<void> {
  const { error } = await supabase
    .from('notifications')
    .update({ is_read: true })
    .eq('user_id', userId)
    .eq('is_read', false);

  if (error) throw error;
}

export async function createNotification(
  userId: string,
  type: 'daily' | 'quiz' | 'incomplete',
  title: string,
  message: string
): Promise<void> {
  const { error } = await supabase
    .from('notifications')
    .insert({
      user_id: userId,
      type,
      title,
      message,
    });

  if (error) throw error;
}

// Help Desk APIs
export async function submitHelpDeskMessage(
  userId: string,
  name: string,
  email: string,
  message: string
): Promise<void> {
  const { error } = await supabase
    .from('help_desk_messages')
    .insert({
      user_id: userId,
      name,
      email,
      message,
    });

  if (error) throw error;
}

export async function getAllHelpDeskMessages(): Promise<HelpDeskMessage[]> {
  const { data, error } = await supabase
    .from('help_desk_messages')
    .select('*')
    .order('created_at', { ascending: false });

  if (error) throw error;
  return Array.isArray(data) ? data : [];
}

export async function resolveHelpDeskMessage(messageId: string): Promise<void> {
  const { error } = await supabase
    .from('help_desk_messages')
    .update({ is_resolved: true })
    .eq('id', messageId);

  if (error) throw error;
}

// Feedback APIs
export async function submitFeedback(
  userId: string,
  subjectId: string,
  wasHelpful: boolean,
  suggestions: string | null
): Promise<void> {
  const { error } = await supabase
    .from('feedback')
    .insert({
      user_id: userId,
      subject_id: subjectId,
      was_helpful: wasHelpful,
      suggestions: suggestions || null,
    });

  if (error) throw error;
}

// Study Streak APIs
export async function updateStudyStreak(userId: string): Promise<void> {
  const profile = await getProfile(userId);
  if (!profile) return;

  const today = new Date().toISOString().split('T')[0];
  const lastStudyDate = profile.last_study_date;

  let newStreak = profile.study_streak;

  if (!lastStudyDate) {
    newStreak = 1;
  } else {
    const yesterday = new Date();
    yesterday.setDate(yesterday.getDate() - 1);
    const yesterdayStr = yesterday.toISOString().split('T')[0];

    if (lastStudyDate === yesterdayStr) {
      newStreak = newStreak + 1;
    } else if (lastStudyDate !== today) {
      newStreak = 1;
    }
  }

  await updateProfile(userId, {
    study_streak: newStreak,
    last_study_date: today,
  });
}

// Career System APIs
export async function getAllCareerDomains(): Promise<CareerDomain[]> {
  const { data, error } = await supabase
    .from('career_domains')
    .select('*')
    .order('created_at');

  if (error) throw error;
  return Array.isArray(data) ? data : [];
}

export async function getCareerDomainById(domainId: string): Promise<CareerDomain | null> {
  const { data, error } = await supabase
    .from('career_domains')
    .select('*')
    .eq('id', domainId)
    .maybeSingle();

  if (error) throw error;
  return data;
}

export async function getCareersByDomain(domainId: string): Promise<Career[]> {
  const { data, error } = await supabase
    .from('careers')
    .select('*')
    .eq('domain_id', domainId)
    .order('created_at');

  if (error) throw error;
  return Array.isArray(data) ? data : [];
}

export async function getCareerById(careerId: string): Promise<Career | null> {
  const { data, error } = await supabase
    .from('careers')
    .select('*')
    .eq('id', careerId)
    .maybeSingle();

  if (error) throw error;
  return data;
}

export async function getUserCareerGoal(userId: string): Promise<UserCareerGoal | null> {
  const { data, error } = await supabase
    .from('user_career_goals')
    .select('*, career:careers(*)')
    .eq('user_id', userId)
    .maybeSingle();

  if (error) throw error;
  return data;
}

export async function setUserCareerGoal(
  userId: string,
  careerId: string,
  recommendedSubjects: string[]
): Promise<void> {
  const { error } = await supabase
    .from('user_career_goals')
    .upsert({
      user_id: userId,
      career_id: careerId,
      recommended_subjects: recommendedSubjects,
      progress_percentage: 0,
      updated_at: new Date().toISOString(),
    });

  if (error) throw error;
}

export async function updateCareerGoalProgress(
  userId: string,
  careerId: string,
  progressPercentage: number
): Promise<void> {
  const { error } = await supabase
    .from('user_career_goals')
    .update({
      progress_percentage: progressPercentage,
      updated_at: new Date().toISOString(),
    })
    .eq('user_id', userId)
    .eq('career_id', careerId);

  if (error) throw error;
}
