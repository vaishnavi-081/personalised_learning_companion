import { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useAuth } from '@/contexts/AuthContext';
import { MainLayout } from '@/components/layouts/MainLayout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { RadioGroup, RadioGroupItem } from '@/components/ui/radio-group';
import {
  getAssessmentQuiz,
  getQuizQuestions,
  submitQuizAttempt,
  updateUserSubjectLevel,
  getSubjectById,
} from '@/db/api';
import type { Quiz, QuizQuestion, Subject, SkillLevel } from '@/types';
import { toast } from 'sonner';
import { ArrowLeft, ArrowRight, CheckCircle2 } from 'lucide-react';
import { Progress } from '@/components/ui/progress';

export default function AssessmentQuizPage() {
  const { subjectId } = useParams<{ subjectId: string }>();
  const { profile } = useAuth();
  const navigate = useNavigate();
  const [subject, setSubject] = useState<Subject | null>(null);
  const [quiz, setQuiz] = useState<Quiz | null>(null);
  const [questions, setQuestions] = useState<QuizQuestion[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [answers, setAnswers] = useState<Record<string, string>>({});
  const [loading, setLoading] = useState(true);
  const [submitting, setSubmitting] = useState(false);
  const [showResults, setShowResults] = useState(false);
  const [score, setScore] = useState(0);
  const [detectedLevel, setDetectedLevel] = useState<SkillLevel>('beginner');

  useEffect(() => {
    loadQuiz();
  }, [subjectId]);

  const loadQuiz = async () => {
    if (!subjectId) return;

    try {
      const [subjectData, quizData] = await Promise.all([
        getSubjectById(subjectId),
        getAssessmentQuiz(subjectId),
      ]);

      setSubject(subjectData);

      if (!quizData) {
        toast.error('Assessment quiz not found');
        navigate(`/subject/${subjectId}/topics`);
        return;
      }

      setQuiz(quizData);
      const questionsData = await getQuizQuestions(quizData.id);
      setQuestions(questionsData);
    } catch (error) {
      console.error('Failed to load quiz:', error);
      toast.error('Failed to load quiz');
    } finally {
      setLoading(false);
    }
  };

  const handleAnswer = (questionId: string, answer: string) => {
    setAnswers((prev) => ({ ...prev, [questionId]: answer }));
  };

  const handleNext = () => {
    if (currentIndex < questions.length - 1) {
      setCurrentIndex(currentIndex + 1);
    }
  };

  const handlePrevious = () => {
    if (currentIndex > 0) {
      setCurrentIndex(currentIndex - 1);
    }
  };

  const calculateScore = () => {
    let correctCount = 0;
    questions.forEach((q) => {
      const userAnswer = answers[q.id]?.trim().toLowerCase();
      const correctAnswer = q.correct_answer.trim().toLowerCase();
      if (userAnswer === correctAnswer) {
        correctCount++;
      }
    });
    return correctCount;
  };

  const determineLevel = (score: number): SkillLevel => {
    if (score >= 8) return 'expert';
    if (score >= 4) return 'intermediate';
    return 'beginner';
  };

  const handleSubmit = async () => {
    if (!profile?.id || !quiz || !subjectId) return;

    const unanswered = questions.filter((q) => !answers[q.id]);
    if (unanswered.length > 0) {
      toast.error(`Please answer all questions (${unanswered.length} remaining)`);
      return;
    }

    setSubmitting(true);

    try {
      const finalScore = calculateScore();
      const level = determineLevel(finalScore);
      const passed = finalScore >= 3;

      await submitQuizAttempt(profile.id, quiz.id, finalScore, questions.length, passed, answers);
      await updateUserSubjectLevel(profile.id, subjectId, level);

      setScore(finalScore);
      setDetectedLevel(level);
      setShowResults(true);
    } catch (error) {
      console.error('Failed to submit quiz:', error);
      toast.error('Failed to submit quiz');
    } finally {
      setSubmitting(false);
    }
  };

  const handleContinue = () => {
    navigate(`/subject/${subjectId}/topics`);
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

  if (showResults) {
    return (
      <MainLayout>
        <div className="max-w-2xl mx-auto animate-fade-in">
          <Card className="glass-card">
            <CardHeader className="text-center">
              <div className="flex justify-center mb-4">
                <CheckCircle2 className="h-16 w-16 text-success" />
              </div>
              <CardTitle className="text-3xl gradient-text">Assessment Complete!</CardTitle>
              <CardDescription>Here are your results</CardDescription>
            </CardHeader>
            <CardContent className="space-y-6">
              <div className="text-center space-y-2">
                <p className="text-5xl font-bold text-primary">
                  {score}/{questions.length}
                </p>
                <p className="text-muted-foreground">Correct Answers</p>
              </div>

              <div className="p-6 bg-muted rounded-lg text-center space-y-2">
                <p className="text-sm text-muted-foreground">Your Skill Level</p>
                <p className="text-2xl font-bold capitalize gradient-text">{detectedLevel}</p>
              </div>

              <div className="space-y-2">
                <p className="text-sm font-medium">Level Breakdown:</p>
                <ul className="text-sm text-muted-foreground space-y-1">
                  <li>• Beginner: 0-3 correct answers</li>
                  <li>• Intermediate: 4-7 correct answers</li>
                  <li>• Expert: 8-10 correct answers</li>
                </ul>
              </div>

              <Button className="w-full" onClick={handleContinue}>
                Continue to Topics
              </Button>
            </CardContent>
          </Card>
        </div>
      </MainLayout>
    );
  }

  const currentQuestion = questions[currentIndex];
  const progress = ((currentIndex + 1) / questions.length) * 100;

  // Safety check: if no current question, show loading or error
  if (!currentQuestion) {
    return (
      <MainLayout>
        <div className="flex items-center justify-center min-h-[60vh]">
          <div className="text-center">
            <p className="text-muted-foreground">Loading questions...</p>
          </div>
        </div>
      </MainLayout>
    );
  }

  return (
    <MainLayout>
      <div className="max-w-3xl mx-auto space-y-6 animate-fade-in">
        <div>
          <h1 className="text-3xl font-bold gradient-text">{subject?.name} Assessment</h1>
          <p className="text-muted-foreground mt-2">
            Answer all questions to determine your skill level
          </p>
        </div>

        <div className="space-y-2">
          <div className="flex justify-between text-sm">
            <span className="text-muted-foreground">
              Question {currentIndex + 1} of {questions.length}
            </span>
            <span className="font-medium">{Math.round(progress)}%</span>
          </div>
          <Progress value={progress} className="h-2" />
        </div>

        <Card className="glass-card">
          <CardHeader>
            <CardTitle className="text-xl">{currentQuestion.question_text}</CardTitle>
            <CardDescription className="capitalize">
              Difficulty: {currentQuestion.difficulty}
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-6">
            {currentQuestion.question_type === 'mcq' && currentQuestion.options ? (
              <RadioGroup
                value={answers[currentQuestion.id] || ''}
                onValueChange={(value) => handleAnswer(currentQuestion.id, value)}
              >
                {currentQuestion.options.map((option, idx) => (
                  <div key={idx} className="flex items-center space-x-2">
                    <RadioGroupItem value={option} id={`option-${idx}`} />
                    <Label htmlFor={`option-${idx}`} className="cursor-pointer flex-1">
                      {option}
                    </Label>
                  </div>
                ))}
              </RadioGroup>
            ) : (
              <div className="space-y-2">
                <Label htmlFor="answer">Your Answer</Label>
                <Input
                  id="answer"
                  type="text"
                  placeholder="Type your answer here"
                  value={answers[currentQuestion.id] || ''}
                  onChange={(e) => handleAnswer(currentQuestion.id, e.target.value)}
                />
              </div>
            )}

            <div className="flex justify-between pt-4">
              <Button
                variant="outline"
                onClick={handlePrevious}
                disabled={currentIndex === 0}
              >
                <ArrowLeft className="mr-2 h-4 w-4" />
                Previous
              </Button>

              {currentIndex === questions.length - 1 ? (
                <Button onClick={handleSubmit} disabled={submitting}>
                  {submitting ? 'Submitting...' : 'Submit Quiz'}
                </Button>
              ) : (
                <Button onClick={handleNext}>
                  Next
                  <ArrowRight className="ml-2 h-4 w-4" />
                </Button>
              )}
            </div>
          </CardContent>
        </Card>

        <div className="flex flex-wrap gap-2">
          {questions.map((q, idx) => (
            <Button
              key={q.id}
              variant={idx === currentIndex ? 'default' : answers[q.id] ? 'secondary' : 'outline'}
              size="sm"
              onClick={() => setCurrentIndex(idx)}
              className="w-10 h-10"
            >
              {idx + 1}
            </Button>
          ))}
        </div>
      </div>
    </MainLayout>
  );
}
