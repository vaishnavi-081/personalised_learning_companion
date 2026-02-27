import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { LucideIcon } from 'lucide-react';
import { ReactNode } from 'react';

interface Card3DProps {
  title: string;
  description: string;
  icon: ReactNode;
  gradient: string;
  onClick?: () => void;
  className?: string;
}

export function Card3D({ title, description, icon, gradient, onClick, className = '' }: Card3DProps) {
  return (
    <Card
      className={`
        group relative overflow-hidden border-2 border-transparent
        transition-all duration-300 ease-out
        hover:scale-105 hover:-translate-y-2 hover:shadow-2xl
        cursor-pointer
        ${className}
      `}
      onClick={onClick}
      style={{
        background: `linear-gradient(135deg, var(--card-background), var(--card-background))`,
      }}
    >
      {/* Gradient Overlay */}
      <div
        className={`absolute inset-0 bg-gradient-to-br ${gradient} opacity-10 group-hover:opacity-20 transition-opacity duration-300`}
      />
      
      {/* Glow Effect */}
      <div
        className={`absolute -inset-1 bg-gradient-to-br ${gradient} opacity-0 group-hover:opacity-30 blur-xl transition-opacity duration-300`}
      />

      {/* Content */}
      <div className="relative z-10">
        <CardHeader>
          <div className="flex items-center gap-4">
            <div
              className={`
                p-4 rounded-2xl bg-gradient-to-br ${gradient}
                transform group-hover:scale-110 group-hover:rotate-6
                transition-transform duration-300
                shadow-lg
              `}
            >
              <div className="text-4xl">{icon}</div>
            </div>
            <div className="flex-1">
              <CardTitle className="text-xl font-bold group-hover:text-primary transition-colors">
                {title}
              </CardTitle>
            </div>
          </div>
        </CardHeader>
        <CardContent>
          <CardDescription className="text-base">
            {description}
          </CardDescription>
        </CardContent>
      </div>

      {/* Shine Effect */}
      <div className="absolute inset-0 opacity-0 group-hover:opacity-100 transition-opacity duration-500">
        <div className="absolute inset-0 bg-gradient-to-r from-transparent via-white/10 to-transparent -translate-x-full group-hover:translate-x-full transition-transform duration-1000" />
      </div>
    </Card>
  );
}
