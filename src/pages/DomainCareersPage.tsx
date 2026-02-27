import { useEffect, useState } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { MainLayout } from '@/components/layouts/MainLayout';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { getCareerDomainById, getCareersByDomain } from '@/db/api';
import type { CareerDomain, Career } from '@/types';
import { toast } from 'sonner';
import { ArrowLeft, DollarSign, Sparkles, TrendingUp } from 'lucide-react';

export default function DomainCareersPage() {
  const { domainId } = useParams<{ domainId: string }>();
  const navigate = useNavigate();
  const [domain, setDomain] = useState<CareerDomain | null>(null);
  const [careers, setCareers] = useState<Career[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    loadData();
  }, [domainId]);

  const loadData = async () => {
    if (!domainId) return;

    try {
      const [domainData, careersData] = await Promise.all([
        getCareerDomainById(domainId),
        getCareersByDomain(domainId),
      ]);

      setDomain(domainData);
      setCareers(careersData);
    } catch (error) {
      console.error('Failed to load careers:', error);
      toast.error('Failed to load careers');
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

  if (!domain) {
    return (
      <MainLayout>
        <div className="text-center py-12">
          <p className="text-muted-foreground">Domain not found</p>
        </div>
      </MainLayout>
    );
  }

  return (
    <MainLayout>
      <div className="space-y-8 animate-fade-in">
        {/* Header */}
        <div className="flex items-center gap-4">
          <Button variant="ghost" size="icon" onClick={() => navigate('/career-domains')}>
            <ArrowLeft className="h-5 w-5" />
          </Button>
          <div className="flex-1">
            <div className="flex items-center gap-3 mb-2">
              <span className="text-5xl">{domain.icon}</span>
              <h1 className="text-4xl font-bold gradient-text">{domain.name}</h1>
            </div>
            <p className="text-lg text-muted-foreground">{domain.description}</p>
          </div>
        </div>

        {/* Careers Grid */}
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {careers.map((career) => (
            <Card
              key={career.id}
              className="group relative overflow-hidden border-2 hover:border-primary/50 transition-all duration-300 hover:shadow-xl hover:-translate-y-1 cursor-pointer"
              onClick={() => navigate(`/careers/${career.id}`)}
            >
              {/* Gradient Background */}
              <div className={`absolute inset-0 bg-gradient-to-br ${domain.color} opacity-5 group-hover:opacity-10 transition-opacity`} />

              <CardHeader className="relative z-10">
                <div className="flex items-start justify-between mb-3">
                  <div className="p-3 rounded-xl bg-gradient-to-br from-primary/20 to-purple-500/20 group-hover:scale-110 transition-transform">
                    <span className="text-3xl">{career.icon}</span>
                  </div>
                  <Badge variant="secondary" className="flex items-center gap-1">
                    <TrendingUp className="h-3 w-3" />
                    High Demand
                  </Badge>
                </div>
                <CardTitle className="text-xl group-hover:text-primary transition-colors">
                  {career.name}
                </CardTitle>
                <CardDescription className="text-sm line-clamp-2">
                  {career.description}
                </CardDescription>
              </CardHeader>

              <CardContent className="relative z-10 space-y-4">
                {/* Salary */}
                <div className="flex items-center gap-2 p-3 rounded-lg bg-green-500/10 border border-green-500/20">
                  <DollarSign className="h-4 w-4 text-green-600 dark:text-green-400" />
                  <span className="text-sm font-medium text-green-700 dark:text-green-300">
                    {career.average_salary}
                  </span>
                </div>

                {/* Skills Preview */}
                <div>
                  <p className="text-xs font-semibold text-muted-foreground mb-2">Key Skills:</p>
                  <div className="flex flex-wrap gap-1">
                    {career.skills_required.slice(0, 3).map((skill, idx) => (
                      <Badge key={idx} variant="outline" className="text-xs">
                        {skill}
                      </Badge>
                    ))}
                    {career.skills_required.length > 3 && (
                      <Badge variant="outline" className="text-xs">
                        +{career.skills_required.length - 3} more
                      </Badge>
                    )}
                  </div>
                </div>

                {/* View Path Button */}
                <Button className="w-full group-hover:bg-primary group-hover:text-primary-foreground transition-colors">
                  <Sparkles className="h-4 w-4 mr-2" />
                  View Career Path
                </Button>
              </CardContent>
            </Card>
          ))}
        </div>

        {careers.length === 0 && (
          <div className="text-center py-12">
            <p className="text-muted-foreground">No careers available in this domain yet.</p>
          </div>
        )}
      </div>
    </MainLayout>
  );
}
