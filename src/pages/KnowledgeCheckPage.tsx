import { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { useAuth } from '@/contexts/AuthContext';
import { MainLayout } from '@/components/layouts/MainLayout';
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
} from '@/components/ui/dialog';
import { Button } from '@/components/ui/button';
import { getSubjectById, getUserSubject } from '@/db/api';
import type { Subject, UserSubject } from '@/types';
import { BookOpen, GraduationCap } from 'lucide-react';

export default function KnowledgeCheckPage() {
  const { subjectId } = useParams<{ subjectId: string }>();
  const { profile } = useAuth();
  const navigate = useNavigate();
  const [subject, setSubject] = useState<Subject | null>(null);
  const [userSubject, setUserSubject] = useState<UserSubject | null>(null);
  const [open, setOpen] = useState(true);

  useEffect(() => {
    loadData();
  }, [subjectId, profile?.id]);

  const loadData = async () => {
    if (!subjectId || !profile?.id) return;

    const [subjectData, userSubjectData] = await Promise.all([
      getSubjectById(subjectId),
      getUserSubject(profile.id, subjectId),
    ]);

    setSubject(subjectData);
    setUserSubject(userSubjectData);

    if (userSubjectData?.skill_level && userSubjectData.skill_level !== 'beginner') {
      navigate(`/subject/${subjectId}/topics`);
    }
  };

  const handleNewLearner = () => {
    navigate(`/subject/${subjectId}/topics`);
  };

  const handleTakeQuiz = () => {
    navigate(`/subject/${subjectId}/assessment`);
  };

  const handleClose = () => {
    setOpen(false);
    navigate('/subjects');
  };

  return (
    <MainLayout>
      <Dialog open={open} onOpenChange={handleClose}>
        <DialogContent className="sm:max-w-md">
          <DialogHeader>
            <DialogTitle className="text-2xl gradient-text">
              {subject?.name} - Knowledge Check
            </DialogTitle>
            <DialogDescription>
              Do you have prior knowledge about this subject?
            </DialogDescription>
          </DialogHeader>
          <div className="space-y-4 py-4">
            <Button
              variant="outline"
              className="w-full h-auto py-6 flex flex-col items-center gap-3"
              onClick={handleNewLearner}
            >
              <BookOpen className="h-8 w-8 text-primary" />
              <div className="text-center">
                <p className="font-semibold text-lg">I'm a New Learner</p>
                <p className="text-sm text-muted-foreground">
                  Start from beginner level
                </p>
              </div>
            </Button>

            <Button
              variant="outline"
              className="w-full h-auto py-6 flex flex-col items-center gap-3"
              onClick={handleTakeQuiz}
            >
              <GraduationCap className="h-8 w-8 text-accent" />
              <div className="text-center">
                <p className="font-semibold text-lg">I Have Knowledge</p>
                <p className="text-sm text-muted-foreground">
                  Take assessment quiz to determine level
                </p>
              </div>
            </Button>
          </div>
        </DialogContent>
      </Dialog>
    </MainLayout>
  );
}
