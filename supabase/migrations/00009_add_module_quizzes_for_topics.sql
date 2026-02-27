-- Add module quizzes for topics
DO $$
DECLARE
  topic_rec RECORD;
  quiz_id UUID;
BEGIN
  -- Loop through all topics and create module quizzes
  FOR topic_rec IN SELECT id, subject_id, level, title FROM topics ORDER BY subject_id, level, order_index
  LOOP
    -- Create a module quiz for this topic
    INSERT INTO quizzes (subject_id, topic_id, quiz_type, level)
    VALUES (topic_rec.subject_id, topic_rec.id, 'module', topic_rec.level)
    RETURNING id INTO quiz_id;

    -- Add 5 questions for each module quiz (3 MCQ + 2 Fill in the blank)
    -- Questions are generic but topic-specific
    
    -- Question 1 (MCQ - Easy)
    INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index)
    VALUES (
      quiz_id,
      'What is the main concept covered in ' || topic_rec.title || '?',
      'mcq',
      '["Core fundamentals", "Advanced techniques", "Unrelated topic", "None of the above"]',
      'Core fundamentals',
      topic_rec.level,
      1
    );

    -- Question 2 (MCQ - Medium)
    INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index)
    VALUES (
      quiz_id,
      'Which of the following is a key feature of ' || topic_rec.title || '?',
      'mcq',
      '["Practical application", "Theoretical only", "Not applicable", "Deprecated"]',
      'Practical application',
      topic_rec.level,
      2
    );

    -- Question 3 (Fill in the blank)
    INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index)
    VALUES (
      quiz_id,
      'The topic ' || topic_rec.title || ' is important for understanding ______ concepts.',
      'fill_blank',
      NULL,
      'programming',
      topic_rec.level,
      3
    );

    -- Question 4 (MCQ - Application)
    INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index)
    VALUES (
      quiz_id,
      'When would you use ' || topic_rec.title || ' in real projects?',
      'mcq',
      '["Frequently in development", "Never", "Only in testing", "Only in documentation"]',
      'Frequently in development',
      topic_rec.level,
      4
    );

    -- Question 5 (Fill in the blank)
    INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index)
    VALUES (
      quiz_id,
      'After completing ' || topic_rec.title || ', you should be able to ______ the concepts.',
      'fill_blank',
      NULL,
      'apply',
      topic_rec.level,
      5
    );

  END LOOP;
END $$;