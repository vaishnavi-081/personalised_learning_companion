import { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { MainLayout } from '@/components/layouts/MainLayout';
import { Card3D } from '@/components/career/Card3D';
import { getAllCareerDomains } from '@/db/api';
import type { CareerDomain } from '@/types';
import { toast } from 'sonner';
import { Sparkles } from 'lucide-react';

export default function CareerDomainsPage() {
  const navigate = useNavigate();
  const [domains, setDomains] = useState<CareerDomain[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadDomains();
  }, []);

  const loadDomains = async () => {
    try {
      const data = await getAllCareerDomains();
      setDomains(data);
    } catch (error) {
      console.error('Failed to load career domains:', error);
      toast.error('Failed to load career domains');
    } finally {
      setLoading(false);
    }
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

  return (
    <MainLayout>
      <div className="space-y-8 animate-fade-in">
        {/* Header */}
        <div className="text-center space-y-4">
          <div className="flex items-center justify-center gap-3">
            <Sparkles className="h-10 w-10 text-primary animate-pulse" />
            <h1 className="text-5xl font-bold gradient-text">
              Choose Your Career Domain
            </h1>
            <Sparkles className="h-10 w-10 text-primary animate-pulse" />
          </div>
          <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
            Explore career domains and find your perfect path. Start your journey towards your dream career today!
          </p>
        </div>

        {/* Career Domains Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mt-12">
          {domains.map((domain) => (
            <Card3D
              key={domain.id}
              title={domain.name}
              description={domain.description}
              icon={<span>{domain.icon}</span>}
              gradient={domain.color}
              onClick={() => navigate(`/career-domains/${domain.id}/careers`)}
            />
          ))}
        </div>

        {/* Call to Action */}
        <div className="mt-16 text-center p-8 rounded-2xl bg-gradient-to-r from-primary/10 to-purple-500/10 border-2 border-primary/20">
          <h2 className="text-2xl font-bold mb-3">Not Sure Where to Start?</h2>
          <p className="text-muted-foreground mb-4">
            Explore different domains to discover careers that match your interests and skills.
          </p>
          <p className="text-sm text-muted-foreground">
            💡 Tip: Each career path includes recommended subjects, learning roadmaps, and video tutorials!
          </p>
        </div>
      </div>
    </MainLayout>
  );
}
