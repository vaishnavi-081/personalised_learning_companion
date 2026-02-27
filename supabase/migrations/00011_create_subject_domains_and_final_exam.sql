-- Create Subject Domains Table
CREATE TABLE IF NOT EXISTS subject_domains (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name TEXT NOT NULL UNIQUE,
  description TEXT NOT NULL,
  icon TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Add domain_id to subjects table
ALTER TABLE subjects ADD COLUMN IF NOT EXISTS domain_id UUID REFERENCES subject_domains(id);

-- Enable RLS for subject_domains
ALTER TABLE subject_domains ENABLE ROW LEVEL SECURITY;

-- RLS Policy for subject_domains (public read)
CREATE POLICY "Anyone can view subject domains" ON subject_domains
  FOR SELECT TO authenticated USING (true);

-- Insert Subject Domains
INSERT INTO subject_domains (name, description, icon) VALUES
('Engineering & Technology', 'Core programming and computer science subjects', '⚙️'),
('Software & IT', 'Web development and software engineering subjects', '💻'),
('Commerce & Business', 'Business and communication skills', '💼')
ON CONFLICT (name) DO NOTHING;

-- Update subjects with domain_id
UPDATE subjects SET domain_id = (SELECT id FROM subject_domains WHERE name = 'Engineering & Technology')
WHERE name IN ('C Programming', 'C++', 'Data Structures');

UPDATE subjects SET domain_id = (SELECT id FROM subject_domains WHERE name = 'Software & IT')
WHERE name IN ('Java', 'Python', 'HTML', 'CSS', 'JavaScript', 'SQL', 'PHP');

UPDATE subjects SET domain_id = (SELECT id FROM subject_domains WHERE name = 'Commerce & Business')
WHERE name IN ('English Communication');