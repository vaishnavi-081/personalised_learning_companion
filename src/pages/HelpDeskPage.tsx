import { useState } from 'react';
import { useAuth } from '@/contexts/AuthContext';
import { MainLayout } from '@/components/layouts/MainLayout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Textarea } from '@/components/ui/textarea';
import { submitHelpDeskMessage } from '@/db/api';
import { toast } from 'sonner';
import { HelpCircle, Send } from 'lucide-react';

export default function HelpDeskPage() {
  const { profile } = useAuth();
  const [name, setName] = useState(profile?.name || '');
  const [email, setEmail] = useState(profile?.email || '');
  const [message, setMessage] = useState('');
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    if (!profile?.id || !name || !email || !message) {
      toast.error('Please fill in all fields');
      return;
    }

    setLoading(true);

    try {
      await submitHelpDeskMessage(profile.id, name, email, message);
      toast.success('Message sent successfully! We will get back to you soon.');
      setMessage('');
    } catch (error) {
      console.error('Failed to submit message:', error);
      toast.error('Failed to send message');
    } finally {
      setLoading(false);
    }
  };

  return (
    <MainLayout>
      <div className="max-w-2xl mx-auto space-y-6 animate-fade-in">
        <div className="text-center">
          <HelpCircle className="h-12 w-12 mx-auto text-primary mb-4" />
          <h1 className="text-4xl font-bold gradient-text">Help Desk</h1>
          <p className="text-muted-foreground mt-2">
            Need help? Send us a message and we'll get back to you soon.
          </p>
        </div>

        <Card className="glass-card">
          <CardHeader>
            <CardTitle>Contact Us</CardTitle>
            <CardDescription>Fill out the form below to send us a message</CardDescription>
          </CardHeader>
          <CardContent>
            <form onSubmit={handleSubmit} className="space-y-4">
              <div className="space-y-2">
                <Label htmlFor="name">Name</Label>
                <Input
                  id="name"
                  type="text"
                  placeholder="Your name"
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                  disabled={loading}
                  required
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="email">Email</Label>
                <Input
                  id="email"
                  type="email"
                  placeholder="Your email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  disabled={loading}
                  required
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="message">Message</Label>
                <Textarea
                  id="message"
                  placeholder="Describe your issue or question..."
                  value={message}
                  onChange={(e) => setMessage(e.target.value)}
                  disabled={loading}
                  required
                  rows={6}
                />
              </div>

              <Button type="submit" className="w-full" disabled={loading}>
                <Send className="mr-2 h-4 w-4" />
                {loading ? 'Sending...' : 'Send Message'}
              </Button>
            </form>
          </CardContent>
        </Card>

        <Card className="glass-card">
          <CardHeader>
            <CardTitle>Frequently Asked Questions</CardTitle>
          </CardHeader>
          <CardContent className="space-y-4">
            <div>
              <h3 className="font-semibold mb-2">How do I track my progress?</h3>
              <p className="text-sm text-muted-foreground">
                Visit your Dashboard to see detailed progress across all subjects.
              </p>
            </div>
            <div>
              <h3 className="font-semibold mb-2">Can I change my skill level?</h3>
              <p className="text-sm text-muted-foreground">
                Your skill level is determined by assessment quizzes. You can retake assessments to update your level.
              </p>
            </div>
            <div>
              <h3 className="font-semibold mb-2">How does the study streak work?</h3>
              <p className="text-sm text-muted-foreground">
                Complete at least one topic each day to maintain your streak. Missing a day will reset it.
              </p>
            </div>
          </CardContent>
        </Card>
      </div>
    </MainLayout>
  );
}
