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
  getModuleQuiz,
  getQuizQuestions,
  submitQuizAttempt,
  markTopicCompleted,
  getTopicById,
} from '@/db/api';
import type { Quiz, QuizQuestion, Topic } from '@/types';
import { toast } from 'sonner';
import { ArrowLeft, ArrowRight, CheckCircle2, XCircle } from 'lucide-react';
import { Progress } from '@/components/ui/progress';

export default function ModuleQuizPage() {
  const { subjectId, topicId } = useParams<{ subjectId: string; topicId: string }>();
  const { profile } = useAuth();
  const navigate = useNavigate();
  const [topic, setTopic] = useState<Topic | null>(null);
  const [quiz, setQuiz] = useState<Quiz | null>(null);
  const [questions, setQuestions] = useState<QuizQuestion[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [answers, setAnswers] = useState<Record<string, string>>({});
  const [loading, setLoading] = useState(true);
  const [submitting, setSubmitting] = useState(false);
  const [showResults, setShowResults] = useState(false);
  const [score, setScore] = useState(0);
  const [passed, setPassed] = useState(false);

  useEffect(() => {
    loadQuiz();
  }, [topicId]);

  const loadQuiz = async () => {
    if (!topicId) return;

    try {
      const [topicData, quizData] = await Promise.all([
        getTopicById(topicId),
        getModuleQuiz(topicId),
      ]);

      setTopic(topicData);

      if (!quizData) {
        toast.error('Module quiz not found');
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

  const handleSubmit = async () => {
    if (!profile?.id || !quiz || !topicId || !subjectId) return;

    const unanswered = questions.filter((q) => !answers[q.id]);
    if (unanswered.length > 0) {
      toast.error(`Please answer all questions (${unanswered.length} remaining)`);
      return;
    }

    setSubmitting(true);

    try {
      const finalScore = calculateScore();
      setScore(finalScore);

      await submitQuizAttempt(profile.id, quiz.id, finalScore, questions.length);

      // Passing score is 3 out of 5
      const hasPassed = finalScore >= 3;
      setPassed(hasPassed);

      if (hasPassed) {
        await markTopicCompleted(profile.id, topicId, finalScore);
        toast.success('Congratulations! You passed the module quiz!');
      } else {
        toast.error('You need to score at least 3 to pass. Please try again.');
      }

      setShowResults(true);
    } catch (error) {
      console.error('Failed to submit quiz:', error);
      toast.error('Failed to submit quiz');
    } finally {
      setSubmitting(false);
    }
  };

  const handleRetry = () => {
    setAnswers({});
    setCurrentIndex(0);
    setShowResults(false);
    setScore(0);
    setPassed(false);
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
    const motivationalMessages = {
      perfect: ['🎉 Perfect Score!', 'You are a star!', 'Outstanding performance!'],
      good: ['🎉 Great Job!', 'Well done!', 'You are improving!'],
      pass: ['✅ You Passed!', 'Keep going!', 'Good effort!'],
      fail: ['📚 Keep Practicing!', 'Review and try again!', 'You can do better!'],
    };

    let messageType: keyof typeof motivationalMessages;
    if (score === questions.length) messageType = 'perfect';
    else if (score >= 4) messageType = 'good';
    else if (passed) messageType = 'pass';
    else messageType = 'fail';

    const message = motivationalMessages[messageType][Math.floor(Math.random() * motivationalMessages[messageType].length)];

    return (
      <MainLayout>
        <div className="max-w-2xl mx-auto space-y-6 animate-fade-in">
          <Card className={`border-4 ${passed ? 'border-green-500/50 bg-green-500/5' : 'border-orange-500/50 bg-orange-500/5'}`}>
            <CardHeader className="text-center space-y-4">
              <div className="mx-auto">
                {passed ? (
                  <div className="relative">
                    <CheckCircle2 className="h-24 w-24 text-green-500 animate-bounce" />
                    <div className="absolute inset-0 h-24 w-24 bg-green-500/20 rounded-full animate-ping" />
                  </div>
                ) : (
                  <XCircle className="h-24 w-24 text-orange-500 animate-pulse" />
                )}
              </div>
              <div>
                <CardTitle className="text-4xl font-bold gradient-text mb-2">
                  {message}
                </CardTitle>
                <CardDescription className="text-2xl font-semibold mt-4">
                  Score: {score} / {questions.length}
                </CardDescription>
              </div>
            </CardHeader>
            <CardContent className="space-y-6">
              {/* Score Visualization */}
              <div className="space-y-2">
                <div className="flex justify-between text-sm font-medium">
                  <span>Your Performance</span>
                  <span>{Math.round((score / questions.length) * 100)}%</span>
                </div>
                <Progress value={(score / questions.length) * 100} className="h-4" />
              </div>

              {/* Result Message */}
              <div className={`p-6 rounded-lg border-2 ${
                passed 
                  ? 'bg-green-500/10 border-green-500/30' 
                  : 'bg-orange-500/10 border-orange-500/30'
              }`}>
                <p className="text-center font-medium">
                  {passed
                    ? '🎊 Congratulations! You have successfully completed this module. The next topic is now unlocked!'
                    : '💪 You need to score at least 3 out of 5 to pass. Please review the topic and try again!'}
                </p>
              </div>

              {/* Action Buttons */}
              <div className="flex flex-col sm:flex-row gap-4">
                {!passed && (
                  <Button 
                    variant="outline" 
                    className="flex-1" 
                    onClick={handleRetry}
                    size="lg"
                  >
                    🔄 Retry Quiz
                  </Button>
                )}
                <Button 
                  className="flex-1" 
                  onClick={handleContinue}
                  size="lg"
                >
                  {passed ? '🚀 Continue Learning' : '📖 Review Topic'}
                </Button>
              </div>

              {/* Motivational Footer */}
              {passed && (
                <div className="text-center p-4 bg-gradient-to-r from-purple-500/10 to-blue-500/10 rounded-lg border border-purple-500/20">
                  <p className="text-sm font-medium">
                    ✨ Next topic unlocked! Keep up the great work!
                  </p>
                </div>
              )}
            </CardContent>
          </Card>
        </div>
      </MainLayout>
    );
  }

  const currentQuestion = questions[currentIndex];
  const progress = ((currentIndex + 1) / questions.length) * 100;

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
          <h1 className="text-3xl font-bold gradient-text">{topic?.title} Quiz</h1>
          <p className="text-muted-foreground mt-2">
            Answer all questions to complete this module (Passing score: 3/5)
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
              Question Type: {currentQuestion.question_type === 'mcq' ? 'Multiple Choice' : 'Fill in the Blank'}
            </CardDescription>
          </CardHeader>
          <CardContent className="space-y-6">
            {currentQuestion.question_type === 'mcq' && currentQuestion.options ? (
              <RadioGroup
                value={answers[currentQuestion.id] || ''}
                onValueChange={(value) => handleAnswer(currentQuestion.id, value)}
              >
                {(() => {
                  try {
                    const optionsStr = currentQuestion.options;
                    if (!optionsStr || typeof optionsStr !== 'string') return null;
                    const parsed = JSON.parse(optionsStr);
                    const options: string[] = Array.isArray(parsed) ? parsed : [];
                    return options.map((option: string, idx: number) => (
                      <div key={idx} className="flex items-center space-x-2 p-3 rounded-lg hover:bg-muted transition-colors">
                        <RadioGroupItem value={option} id={`option-${idx}`} />
                        <Label htmlFor={`option-${idx}`} className="flex-1 cursor-pointer">
                          {option}
                        </Label>
                    </div>
                    ));
                  } catch {
                    return null;
                  }
                })()}
              </RadioGroup>
            ) : (
              <div className="space-y-2">
                <Label htmlFor="answer">Your Answer</Label>
                <Input
                  id="answer"
                  type="text"
                  placeholder="Type your answer here..."
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
                  <CheckCircle2 className="ml-2 h-4 w-4" />
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

        <Card className="glass-card">
          <CardHeader>
            <CardTitle className="text-sm">Progress</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="flex flex-wrap gap-2">
              {questions.map((q, idx) => (
                <button
                  key={q.id}
                  onClick={() => setCurrentIndex(idx)}
                  className={`w-10 h-10 rounded-lg flex items-center justify-center text-sm font-medium transition-colors ${
                    idx === currentIndex
                      ? 'bg-primary text-primary-foreground'
                      : answers[q.id]
                      ? 'bg-green-500/20 text-green-700 dark:text-green-300'
                      : 'bg-muted hover:bg-muted/80'
                  }`}
                >
                  {idx + 1}
                </button>
              ))}
            </div>
          </CardContent>
        </Card>
      </div>
    </MainLayout>
  );
}
