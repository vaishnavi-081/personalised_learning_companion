export type UserRole = 'user' | 'admin';
export type SkillLevel = 'beginner' | 'intermediate' | 'expert';
export type NotificationType = 'daily' | 'quiz' | 'incomplete';
export type QuizType = 'assessment' | 'module';
export type QuestionType = 'mcq' | 'fill_blank';

export interface Profile {
  id: string;
  email: string;
  name: string;
  role: UserRole;
  study_streak: number;
  last_study_date: string | null;
  created_at: string;
  updated_at: string;
}

export interface Subject {
  id: string;
  name: string;
  description: string | null;
  icon: string | null;
  roadmap: string | null;
  career_paths: string[] | null;
  projects: string[] | null;
  created_at: string;
}

export interface UserSubject {
  id: string;
  user_id: string;
  subject_id: string;
  skill_level: SkillLevel;
  progress_percentage: number;
  is_completed: boolean;
  enrolled_at: string;
  completed_at: string | null;
  subject?: Subject;
}

export interface Topic {
  id: string;
  subject_id: string;
  level: SkillLevel;
  title: string;
  description: string | null;
  theory: string;
  code_examples: string | null;
  syntax: string | null;
  notes: string | null;
  exercises: string | null;
  youtube_videos: {
    telugu?: string[];
    english?: string[];
  } | null;
  order_index: number;
  created_at: string;
}

export interface UserTopicProgress {
  id: string;
  user_id: string;
  topic_id: string;
  is_completed: boolean;
  quiz_score: number | null;
  completed_at: string | null;
  topic?: Topic;
}

export interface Quiz {
  id: string;
  subject_id: string | null;
  topic_id: string | null;
  quiz_type: QuizType;
  level: SkillLevel | null;
  created_at: string;
}

export interface QuizQuestion {
  id: string;
  quiz_id: string;
  question_text: string;
  question_type: QuestionType;
  options: string[] | null;
  correct_answer: string;
  difficulty: SkillLevel;
  order_index: number;
  created_at: string;
}

export interface UserQuizAttempt {
  id: string;
  user_id: string;
  quiz_id: string;
  score: number;
  total_questions: number;
  passed: boolean;
  answers: Record<string, string>;
  attempted_at: string;
}

export interface Notification {
  id: string;
  user_id: string;
  type: NotificationType;
  title: string;
  message: string;
  is_read: boolean;
  created_at: string;
}

export interface HelpDeskMessage {
  id: string;
  user_id: string;
  name: string;
  email: string;
  message: string;
  is_resolved: boolean;
  created_at: string;
}

export interface Feedback {
  id: string;
  user_id: string;
  subject_id: string;
  was_helpful: boolean;
  suggestions: string | null;
  created_at: string;
}

export interface DashboardStats {
  total_subjects: number;
  completed_subjects: number;
  total_progress: number;
  study_streak: number;
  weak_areas: string[];
  study_suggestions: string[];
}

// Career System Types
export interface CareerDomain {
  id: string;
  name: string;
  description: string;
  icon: string;
  color: string;
  created_at: string;
}

export interface Career {
  id: string;
  domain_id: string;
  name: string;
  description: string;
  icon: string;
  average_salary: string;
  skills_required: string[];
  technologies: string[];
  roadmap: {
    stages: string[];
  };
  about: string;
  video_urls: {
    telugu?: string[];
    english?: string[];
  } | null;
  created_at: string;
}

export interface UserCareerGoal {
  id: string;
  user_id: string;
  career_id: string;
  progress_percentage: number;
  recommended_subjects: string[];
  created_at: string;
  updated_at: string;
  career?: Career;
}
