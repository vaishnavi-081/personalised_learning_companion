import { Progress } from '@/components/ui/progress';

interface ProgressBarProps {
  label: string;
  value: number;
  showPercentage?: boolean;
}

export function ProgressBar({ label, value, showPercentage = true }: ProgressBarProps) {
  return (
    <div className="space-y-2">
      <div className="flex justify-between items-center">
        <span className="text-sm font-medium">{label}</span>
        {showPercentage && (
          <span className="text-sm text-muted-foreground">{Math.round(value)}%</span>
        )}
      </div>
      <Progress value={value} className="h-2" />
    </div>
  );
}
