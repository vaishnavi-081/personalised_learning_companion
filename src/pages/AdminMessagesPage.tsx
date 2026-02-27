import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '@/contexts/AuthContext';
import { MainLayout } from '@/components/layouts/MainLayout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { getAllHelpDeskMessages, resolveHelpDeskMessage } from '@/db/api';
import type { HelpDeskMessage } from '@/types';
import { toast } from 'sonner';
import { Badge } from '@/components/ui/badge';
import { ArrowLeft, CheckCircle2 } from 'lucide-react';
import { formatDistanceToNow } from 'date-fns';

export default function AdminMessagesPage() {
  const { profile } = useAuth();
  const navigate = useNavigate();
  const [messages, setMessages] = useState<HelpDeskMessage[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    if (profile && profile.role !== 'admin') {
      navigate('/subjects');
      return;
    }
    loadMessages();
  }, [profile, navigate]);

  const loadMessages = async () => {
    try {
      const data = await getAllHelpDeskMessages();
      setMessages(data);
    } catch (error) {
      console.error('Failed to load messages:', error);
      toast.error('Failed to load messages');
    } finally {
      setLoading(false);
    }
  };

  const handleResolve = async (messageId: string) => {
    try {
      await resolveHelpDeskMessage(messageId);
      setMessages((prev) =>
        prev.map((m) => (m.id === messageId ? { ...m, is_resolved: true } : m))
      );
      toast.success('Message marked as resolved');
    } catch (error) {
      console.error('Failed to resolve message:', error);
      toast.error('Failed to resolve message');
    }
  };

  if (!profile || profile.role !== 'admin') {
    return null;
  }

  if (loading) {
    return (
      <MainLayout>
        <div className="flex items-center justify-center min-h-[60vh]">
          <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary"></div>
        </div>
      </MainLayout>
    );
  }

  const unresolvedCount = messages.filter((m) => !m.is_resolved).length;

  return (
    <MainLayout>
      <div className="space-y-6 animate-fade-in">
        <div className="flex items-center gap-4">
          <Button variant="ghost" size="icon" onClick={() => navigate('/admin')}>
            <ArrowLeft className="h-5 w-5" />
          </Button>
          <div>
            <h1 className="text-4xl font-bold gradient-text">Help Desk Messages</h1>
            <p className="text-muted-foreground mt-2">
              {unresolvedCount > 0
                ? `${unresolvedCount} unresolved messages`
                : 'All messages resolved'}
            </p>
          </div>
        </div>

        {messages.length === 0 ? (
          <Card className="glass-card">
            <CardContent className="py-12 text-center">
              <p className="text-muted-foreground">No messages yet</p>
            </CardContent>
          </Card>
        ) : (
          <div className="space-y-4">
            {messages.map((message) => (
              <Card
                key={message.id}
                className={`glass-card ${!message.is_resolved ? 'border-primary' : ''}`}
              >
                <CardHeader>
                  <div className="flex items-start justify-between">
                    <div className="flex-1">
                      <CardTitle className="text-lg flex items-center gap-2">
                        {message.name}
                        {message.is_resolved ? (
                          <Badge variant="secondary">Resolved</Badge>
                        ) : (
                          <Badge variant="default">Pending</Badge>
                        )}
                      </CardTitle>
                      <CardDescription className="mt-1">
                        {message.email} •{' '}
                        {formatDistanceToNow(new Date(message.created_at), {
                          addSuffix: true,
                        })}
                      </CardDescription>
                    </div>
                  </div>
                </CardHeader>
                <CardContent className="space-y-4">
                  <div className="p-4 bg-muted rounded-lg">
                    <p className="text-sm whitespace-pre-wrap">{message.message}</p>
                  </div>
                  {!message.is_resolved && (
                    <Button onClick={() => handleResolve(message.id)} className="w-full">
                      <CheckCircle2 className="mr-2 h-4 w-4" />
                      Mark as Resolved
                    </Button>
                  )}
                </CardContent>
              </Card>
            ))}
          </div>
        )}
      </div>
    </MainLayout>
  );
}
