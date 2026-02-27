import { Navigate } from 'react-router-dom';
import LoginPage from './pages/LoginPage';
import SignupPage from './pages/SignupPage';
import SubjectsPage from './pages/SubjectsPage';
import KnowledgeCheckPage from './pages/KnowledgeCheckPage';
import AssessmentQuizPage from './pages/AssessmentQuizPage';
import TopicsPage from './pages/TopicsPage';
import TopicDetailPage from './pages/TopicDetailPage';
import ModuleQuizPage from './pages/ModuleQuizPage';
import DashboardPage from './pages/DashboardPage';
import NotificationsPage from './pages/NotificationsPage';
import HelpDeskPage from './pages/HelpDeskPage';
import AdminDashboardPage from './pages/AdminDashboardPage';
import AdminUsersPage from './pages/AdminUsersPage';
import AdminMessagesPage from './pages/AdminMessagesPage';
import CareerDomainsPage from './pages/CareerDomainsPage';
import DomainCareersPage from './pages/DomainCareersPage';
import CareerPathPage from './pages/CareerPathPage';
import CareerRequiredSubjectsPage from './pages/CareerRequiredSubjectsPage';
import type { ReactNode } from 'react';

interface RouteConfig {
  name: string;
  path: string;
  element: ReactNode;
  visible?: boolean;
}

const routes: RouteConfig[] = [
  {
    name: 'Home',
    path: '/',
    element: <Navigate to="/subjects" replace />,
  },
  {
    name: 'Login',
    path: '/login',
    element: <LoginPage />,
  },
  {
    name: 'Signup',
    path: '/signup',
    element: <SignupPage />,
  },
  {
    name: 'Subjects',
    path: '/subjects',
    element: <SubjectsPage />,
  },
  {
    name: 'Knowledge Check',
    path: '/subject/:subjectId/knowledge-check',
    element: <KnowledgeCheckPage />,
  },
  {
    name: 'Assessment Quiz',
    path: '/subject/:subjectId/assessment',
    element: <AssessmentQuizPage />,
  },
  {
    name: 'Topics',
    path: '/subject/:subjectId/topics',
    element: <TopicsPage />,
  },
  {
    name: 'Topic Detail',
    path: '/subject/:subjectId/topic/:topicId',
    element: <TopicDetailPage />,
  },
  {
    name: 'Module Quiz',
    path: '/subject/:subjectId/topic/:topicId/quiz',
    element: <ModuleQuizPage />,
  },
  {
    name: 'Dashboard',
    path: '/dashboard',
    element: <DashboardPage />,
  },
  {
    name: 'Career Domains',
    path: '/career-domains',
    element: <CareerDomainsPage />,
  },
  {
    name: 'Domain Careers',
    path: '/career-domains/:domainId/careers',
    element: <DomainCareersPage />,
  },
  {
    name: 'Career Path',
    path: '/careers/:careerId',
    element: <CareerPathPage />,
  },
  {
    name: 'Career Required Subjects',
    path: '/careers/:careerId/subjects',
    element: <CareerRequiredSubjectsPage />,
  },
  {
    name: 'Notifications',
    path: '/notifications',
    element: <NotificationsPage />,
  },
  {
    name: 'Help Desk',
    path: '/help-desk',
    element: <HelpDeskPage />,
  },
  {
    name: 'Admin Dashboard',
    path: '/admin',
    element: <AdminDashboardPage />,
  },
  {
    name: 'Admin Users',
    path: '/admin/users',
    element: <AdminUsersPage />,
  },
  {
    name: 'Admin Messages',
    path: '/admin/messages',
    element: <AdminMessagesPage />,
  },
];

export default routes;
