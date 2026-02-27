import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useAuth } from '@/contexts/AuthContext';
import { MainLayout } from '@/components/layouts/MainLayout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Users, MessageSquare, BarChart } from 'lucide-react';

export default function AdminDashboardPage() {
  const { profile } = useAuth();
  const navigate = useNavigate();

  useEffect(() => {
    if (profile && profile.role !== 'admin') {
      navigate('/subjects');
    }
  }, [profile, navigate]);

  if (!profile || profile.role !== 'admin') {
    return null;
  }

  return (
    <MainLayout>
      <div className="space-y-6 animate-fade-in">
        <div>
          <h1 className="text-4xl font-bold gradient-text">Admin Panel</h1>
          <p className="text-muted-foreground mt-2">Manage users and help desk messages</p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          <Card
            className="glass-card hover:shadow-hover transition-all cursor-pointer"
            onClick={() => navigate('/admin/users')}
          >
            <CardHeader>
              <Users className="h-8 w-8 text-primary mb-2" />
              <CardTitle>User Management</CardTitle>
              <CardDescription>View and manage all users</CardDescription>
            </CardHeader>
            <CardContent>
              <Button variant="outline" className="w-full">
                Manage Users
              </Button>
            </CardContent>
          </Card>

          <Card
            className="glass-card hover:shadow-hover transition-all cursor-pointer"
            onClick={() => navigate('/admin/messages')}
          >
            <CardHeader>
              <MessageSquare className="h-8 w-8 text-accent mb-2" />
              <CardTitle>Help Desk Messages</CardTitle>
              <CardDescription>Review and respond to messages</CardDescription>
            </CardHeader>
            <CardContent>
              <Button variant="outline" className="w-full">
                View Messages
              </Button>
            </CardContent>
          </Card>

          <Card className="glass-card">
            <CardHeader>
              <BarChart className="h-8 w-8 text-secondary mb-2" />
              <CardTitle>Analytics</CardTitle>
              <CardDescription>View platform statistics</CardDescription>
            </CardHeader>
            <CardContent>
              <Button variant="outline" className="w-full" disabled>
                Coming Soon
              </Button>
            </CardContent>
          </Card>
        </div>
      </div>
    </MainLayout>
  );
}
