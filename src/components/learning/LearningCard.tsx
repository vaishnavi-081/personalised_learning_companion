import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { LucideIcon } from 'lucide-react';
import { ReactNode } from 'react';

interface LearningCardProps {
  title: string;
  icon: LucideIcon;
  color: 'blue' | 'purple' | 'green' | 'orange' | 'gradient';
  children: ReactNode;
}

const colorClasses = {
  blue: 'bg-blue-500/10 border-blue-500/20',
  purple: 'bg-purple-500/10 border-purple-500/20',
  green: 'bg-green-500/10 border-green-500/20',
  orange: 'bg-orange-500/10 border-orange-500/20',
  gradient: 'bg-gradient-to-r from-purple-500/10 to-blue-500/10 border-purple-500/20',
};

const iconColorClasses = {
  blue: 'text-blue-500',
  purple: 'text-purple-500',
  green: 'text-green-500',
  orange: 'text-orange-500',
  gradient: 'text-purple-500',
};

export function LearningCard({ title, icon: Icon, color, children }: LearningCardProps) {
  return (
    <Card className={`${colorClasses[color]} border-2 transition-all hover:shadow-lg`}>
      <CardHeader>
        <CardTitle className="flex items-center gap-3">
          <div className={`p-2 rounded-lg bg-background ${iconColorClasses[color]}`}>
            <Icon className="h-5 w-5" />
          </div>
          <span>{title}</span>
        </CardTitle>
      </CardHeader>
      <CardContent className="space-y-4">
        {children}
      </CardContent>
    </Card>
  );
}
