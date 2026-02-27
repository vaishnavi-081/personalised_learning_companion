import { AlertCircle, CheckCircle, Info, Lightbulb } from 'lucide-react';
import { ReactNode } from 'react';

interface InfoBoxProps {
  type: 'info' | 'success' | 'warning' | 'tip';
  title?: string;
  children: ReactNode;
}

const boxStyles = {
  info: {
    container: 'bg-blue-500/10 border-blue-500/30 text-blue-700 dark:text-blue-300',
    icon: Info,
    iconColor: 'text-blue-500',
  },
  success: {
    container: 'bg-green-500/10 border-green-500/30 text-green-700 dark:text-green-300',
    icon: CheckCircle,
    iconColor: 'text-green-500',
  },
  warning: {
    container: 'bg-orange-500/10 border-orange-500/30 text-orange-700 dark:text-orange-300',
    icon: AlertCircle,
    iconColor: 'text-orange-500',
  },
  tip: {
    container: 'bg-purple-500/10 border-purple-500/30 text-purple-700 dark:text-purple-300',
    icon: Lightbulb,
    iconColor: 'text-purple-500',
  },
};

export function InfoBox({ type, title, children }: InfoBoxProps) {
  const style = boxStyles[type];
  const Icon = style.icon;

  return (
    <div className={`p-4 rounded-lg border-2 ${style.container}`}>
      <div className="flex gap-3">
        <Icon className={`h-5 w-5 ${style.iconColor} flex-shrink-0 mt-0.5`} />
        <div className="flex-1 space-y-2">
          {title && <p className="font-semibold">{title}</p>}
          <div className="text-sm">{children}</div>
        </div>
      </div>
    </div>
  );
}
