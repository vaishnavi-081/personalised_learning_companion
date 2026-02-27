-- Add required_subjects column to careers table
ALTER TABLE careers ADD COLUMN IF NOT EXISTS required_subjects TEXT[];

-- Update careers with required subjects
-- Software & IT Careers
UPDATE careers SET required_subjects = ARRAY['Java', 'Python', 'HTML', 'CSS', 'JavaScript', 'SQL', 'Data Structures']
WHERE name = 'Software Engineer';

UPDATE careers SET required_subjects = ARRAY['HTML', 'CSS', 'JavaScript']
WHERE name = 'Frontend Developer';

UPDATE careers SET required_subjects = ARRAY['Java', 'Python', 'SQL', 'PHP']
WHERE name = 'Backend Developer';

UPDATE careers SET required_subjects = ARRAY['HTML', 'CSS', 'JavaScript', 'Java', 'Python', 'SQL']
WHERE name = 'Full Stack Developer';

UPDATE careers SET required_subjects = ARRAY['Python', 'SQL', 'Data Structures']
WHERE name = 'Data Scientist';

UPDATE careers SET required_subjects = ARRAY['Python', 'Data Structures']
WHERE name = 'AI Engineer';

UPDATE careers SET required_subjects = ARRAY['Python', 'C Programming', 'Data Structures']
WHERE name = 'Cybersecurity Engineer';

-- Engineering Careers
UPDATE careers SET required_subjects = ARRAY['C Programming', 'C++', 'Data Structures']
WHERE name IN ('Mechanical Engineer', 'Civil Engineer', 'Electrical Engineer', 'Electronics Engineer');

-- Other Careers (Communication focused)
UPDATE careers SET required_subjects = ARRAY['English Communication']
WHERE name IN ('Teacher', 'Journalist', 'Content Writer', 'Designer', 'Psychologist', 
               'Manager', 'HR Manager', 'Marketing Manager', 'Business Analyst',
               'Accountant', 'Bank Officer', 'Financial Analyst', 'Chartered Accountant',
               'IAS Officer', 'Police Officer', 'Railway Officer', 'Bank PO', 'SSC Officer',
               'International Student', 'Startup Founder', 'Business Owner');