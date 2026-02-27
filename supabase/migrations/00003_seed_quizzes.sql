-- Create assessment quizzes for each subject
DO $$
DECLARE
  java_id UUID;
  python_id UUID;
  java_quiz_id UUID;
  python_quiz_id UUID;
BEGIN
  SELECT id INTO java_id FROM subjects WHERE name = 'Java';
  SELECT id INTO python_id FROM subjects WHERE name = 'Python';

  -- Java Assessment Quiz
  INSERT INTO quizzes (subject_id, quiz_type, level)
  VALUES (java_id, 'assessment', NULL)
  RETURNING id INTO java_quiz_id;

  -- Java Assessment Questions (3 Beginner, 4 Intermediate, 3 Expert)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index) VALUES
  -- Beginner
  (java_quiz_id, 'What is the correct way to declare a variable in Java?', 'mcq', 
   '["int x = 5;", "variable x = 5;", "x = 5;", "declare x = 5;"]', 'int x = 5;', 'beginner', 1),
  (java_quiz_id, 'Which keyword is used to create a class in Java?', 'mcq',
   '["class", "Class", "new", "create"]', 'class', 'beginner', 2),
  (java_quiz_id, 'The main method in Java is declared as _____ static void main(String[] args)', 'fill_blank',
   NULL, 'public', 'beginner', 3),
  
  -- Intermediate
  (java_quiz_id, 'What is inheritance in Java?', 'mcq',
   '["A way to reuse code from another class", "A type of loop", "A data type", "A method"]', 'A way to reuse code from another class', 'intermediate', 4),
  (java_quiz_id, 'Which collection allows duplicate elements?', 'mcq',
   '["ArrayList", "HashSet", "TreeSet", "HashMap"]', 'ArrayList', 'intermediate', 5),
  (java_quiz_id, 'The keyword used to handle exceptions is _____', 'fill_blank',
   NULL, 'try', 'intermediate', 6),
  (java_quiz_id, 'What does OOP stand for?', 'fill_blank',
   NULL, 'Object Oriented Programming', 'intermediate', 7),
  
  -- Expert
  (java_quiz_id, 'What is the purpose of the synchronized keyword?', 'mcq',
   '["Thread safety", "Memory management", "Exception handling", "Inheritance"]', 'Thread safety', 'expert', 8),
  (java_quiz_id, 'Which design pattern is used in Spring Framework?', 'mcq',
   '["Dependency Injection", "Singleton", "Factory", "Observer"]', 'Dependency Injection', 'expert', 9),
  (java_quiz_id, 'JDBC stands for Java _____ Connectivity', 'fill_blank',
   NULL, 'Database', 'expert', 10);

  -- Python Assessment Quiz
  INSERT INTO quizzes (subject_id, quiz_type, level)
  VALUES (python_id, 'assessment', NULL)
  RETURNING id INTO python_quiz_id;

  -- Python Assessment Questions
  INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index) VALUES
  -- Beginner
  (python_quiz_id, 'How do you print "Hello World" in Python?', 'mcq',
   '["print(\"Hello World\")", "echo \"Hello World\"", "console.log(\"Hello World\")", "printf(\"Hello World\")"]', 'print("Hello World")', 'beginner', 1),
  (python_quiz_id, 'Which data type is mutable in Python?', 'mcq',
   '["list", "tuple", "string", "int"]', 'list', 'beginner', 2),
  (python_quiz_id, 'Python uses _____ for code blocks instead of curly braces', 'fill_blank',
   NULL, 'indentation', 'beginner', 3),
  
  -- Intermediate
  (python_quiz_id, 'What is a lambda function?', 'mcq',
   '["Anonymous function", "Built-in function", "Class method", "Module"]', 'Anonymous function', 'intermediate', 4),
  (python_quiz_id, 'Which keyword is used to create a function?', 'mcq',
   '["def", "function", "func", "define"]', 'def', 'intermediate', 5),
  (python_quiz_id, 'List comprehension is used for _____ creation', 'fill_blank',
   NULL, 'list', 'intermediate', 6),
  (python_quiz_id, 'The _____ method is used to add an element to a list', 'fill_blank',
   NULL, 'append', 'intermediate', 7),
  
  -- Expert
  (python_quiz_id, 'What is a decorator in Python?', 'mcq',
   '["Function that modifies another function", "Data type", "Loop structure", "Exception handler"]', 'Function that modifies another function', 'expert', 8),
  (python_quiz_id, 'Which library is used for web development in Python?', 'mcq',
   '["Flask", "NumPy", "Pandas", "Matplotlib"]', 'Flask', 'expert', 9),
  (python_quiz_id, 'GIL stands for Global _____ Lock', 'fill_blank',
   NULL, 'Interpreter', 'expert', 10);

END $$;