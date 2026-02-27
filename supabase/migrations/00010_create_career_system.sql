-- Career Domains Table
CREATE TABLE IF NOT EXISTS career_domains (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  icon TEXT NOT NULL,
  color TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Careers Table
CREATE TABLE IF NOT EXISTS careers (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  domain_id UUID REFERENCES career_domains(id) ON DELETE CASCADE,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  icon TEXT NOT NULL,
  average_salary TEXT NOT NULL,
  skills_required TEXT[] NOT NULL,
  technologies TEXT[] NOT NULL,
  roadmap JSONB NOT NULL,
  about TEXT NOT NULL,
  video_urls JSONB,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- User Career Goals Table
CREATE TABLE IF NOT EXISTS user_career_goals (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES profiles(id) ON DELETE CASCADE,
  career_id UUID REFERENCES careers(id) ON DELETE CASCADE,
  progress_percentage INTEGER DEFAULT 0,
  recommended_subjects TEXT[],
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, career_id)
);

-- Enable RLS
ALTER TABLE career_domains ENABLE ROW LEVEL SECURITY;
ALTER TABLE careers ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_career_goals ENABLE ROW LEVEL SECURITY;

-- RLS Policies for career_domains (public read)
CREATE POLICY "Anyone can view career domains" ON career_domains
  FOR SELECT TO authenticated USING (true);

-- RLS Policies for careers (public read)
CREATE POLICY "Anyone can view careers" ON careers
  FOR SELECT TO authenticated USING (true);

-- RLS Policies for user_career_goals
CREATE POLICY "Users can view their own career goals" ON user_career_goals
  FOR SELECT TO authenticated USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own career goals" ON user_career_goals
  FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own career goals" ON user_career_goals
  FOR UPDATE TO authenticated USING (auth.uid() = user_id);

CREATE POLICY "Admins have full access to career goals" ON user_career_goals
  FOR ALL TO authenticated USING (is_admin(auth.uid()));