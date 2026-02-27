-- Delete existing quiz questions and assessment quizzes
DELETE FROM quiz_questions;
DELETE FROM quizzes WHERE quiz_type = 'assessment';

-- Add assessment quizzes for all subjects
DO $$
DECLARE
  java_id UUID;
  python_id UUID;
  html_id UUID;
  css_id UUID;
  js_id UUID;
  c_id UUID;
  cpp_id UUID;
  php_id UUID;
  sql_id UUID;
  ds_id UUID;
  eng_id UUID;
  
  java_quiz_id UUID;
  python_quiz_id UUID;
  html_quiz_id UUID;
  css_quiz_id UUID;
  js_quiz_id UUID;
  c_quiz_id UUID;
  cpp_quiz_id UUID;
  php_quiz_id UUID;
  sql_quiz_id UUID;
  ds_quiz_id UUID;
  eng_quiz_id UUID;
BEGIN
  -- Get subject IDs
  SELECT id INTO java_id FROM subjects WHERE name = 'Java';
  SELECT id INTO python_id FROM subjects WHERE name = 'Python';
  SELECT id INTO html_id FROM subjects WHERE name = 'HTML';
  SELECT id INTO css_id FROM subjects WHERE name = 'CSS';
  SELECT id INTO js_id FROM subjects WHERE name = 'JavaScript';
  SELECT id INTO c_id FROM subjects WHERE name = 'C Programming';
  SELECT id INTO cpp_id FROM subjects WHERE name = 'C++';
  SELECT id INTO php_id FROM subjects WHERE name = 'PHP';
  SELECT id INTO sql_id FROM subjects WHERE name = 'SQL';
  SELECT id INTO ds_id FROM subjects WHERE name = 'Data Structures';
  SELECT id INTO eng_id FROM subjects WHERE name = 'English Communication';

  -- Create assessment quizzes (using correct schema)
  INSERT INTO quizzes (subject_id, topic_id, quiz_type, level)
  VALUES (java_id, NULL, 'assessment', 'beginner')
  RETURNING id INTO java_quiz_id;

  INSERT INTO quizzes (subject_id, topic_id, quiz_type, level)
  VALUES (python_id, NULL, 'assessment', 'beginner')
  RETURNING id INTO python_quiz_id;

  INSERT INTO quizzes (subject_id, topic_id, quiz_type, level)
  VALUES (html_id, NULL, 'assessment', 'beginner')
  RETURNING id INTO html_quiz_id;

  INSERT INTO quizzes (subject_id, topic_id, quiz_type, level)
  VALUES (css_id, NULL, 'assessment', 'beginner')
  RETURNING id INTO css_quiz_id;

  INSERT INTO quizzes (subject_id, topic_id, quiz_type, level)
  VALUES (js_id, NULL, 'assessment', 'beginner')
  RETURNING id INTO js_quiz_id;

  INSERT INTO quizzes (subject_id, topic_id, quiz_type, level)
  VALUES (c_id, NULL, 'assessment', 'beginner')
  RETURNING id INTO c_quiz_id;

  INSERT INTO quizzes (subject_id, topic_id, quiz_type, level)
  VALUES (cpp_id, NULL, 'assessment', 'beginner')
  RETURNING id INTO cpp_quiz_id;

  INSERT INTO quizzes (subject_id, topic_id, quiz_type, level)
  VALUES (php_id, NULL, 'assessment', 'beginner')
  RETURNING id INTO php_quiz_id;

  INSERT INTO quizzes (subject_id, topic_id, quiz_type, level)
  VALUES (sql_id, NULL, 'assessment', 'beginner')
  RETURNING id INTO sql_quiz_id;

  INSERT INTO quizzes (subject_id, topic_id, quiz_type, level)
  VALUES (ds_id, NULL, 'assessment', 'beginner')
  RETURNING id INTO ds_quiz_id;

  INSERT INTO quizzes (subject_id, topic_id, quiz_type, level)
  VALUES (eng_id, NULL, 'assessment', 'beginner')
  RETURNING id INTO eng_quiz_id;

  -- ============================================
  -- JAVA ASSESSMENT QUIZ QUESTIONS
  -- ============================================
  
  -- Beginner (3)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index) VALUES
  (java_quiz_id, 'Which keyword is used for inheritance in Java?', 'mcq', 
   '["extends", "include", "inherit", "super"]', 'extends', 'beginner', 1),
  (java_quiz_id, 'What is the default value of a boolean variable in Java?', 'mcq',
   '["true", "false", "0", "null"]', 'false', 'beginner', 2),
  (java_quiz_id, 'Java is a ______ programming language.', 'fill_blank',
   NULL, 'Object-Oriented', 'beginner', 3);

  -- Intermediate (4)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index) VALUES
  (java_quiz_id, 'Which collection class allows duplicate elements?', 'mcq',
   '["Set", "Map", "List", "Queue"]', 'List', 'intermediate', 4),
  (java_quiz_id, 'What is the purpose of the final keyword?', 'mcq',
   '["Prevent inheritance", "Prevent modification", "Both A and B", "None"]', 'Both A and B', 'intermediate', 5),
  (java_quiz_id, 'The ______ keyword is used to refer to the current object.', 'fill_blank',
   NULL, 'this', 'intermediate', 6),
  (java_quiz_id, 'Exception handling in Java uses ______ and catch blocks.', 'fill_blank',
   NULL, 'try', 'intermediate', 7);

  -- Expert (3)
  INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index) VALUES
  (java_quiz_id, 'Which interface is used for creating threads?', 'mcq',
   '["Thread", "Runnable", "Callable", "Executor"]', 'Runnable', 'expert', 8),
  (java_quiz_id, 'What does JVM stand for?', 'fill_blank',
   NULL, 'Java Virtual Machine', 'expert', 9),
  (java_quiz_id, 'The ______ framework is used for building enterprise Java applications.', 'fill_blank',
   NULL, 'Spring', 'expert', 10);

  -- ============================================
  -- PYTHON ASSESSMENT QUIZ QUESTIONS
  -- ============================================
  
  INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index) VALUES
  (python_quiz_id, 'Which symbol is used for single-line comments in Python?', 'mcq',
   '["//", "#", "/*", "<!--"]', '#', 'beginner', 1),
  (python_quiz_id, 'What is the correct file extension for Python files?', 'mcq',
   '[".py", ".python", ".pt", ".pyt"]', '.py', 'beginner', 2),
  (python_quiz_id, 'Python uses indentation to define ______.', 'fill_blank',
   NULL, 'blocks', 'beginner', 3),
  (python_quiz_id, 'Which keyword is used to define a function in Python?', 'mcq',
   '["function", "def", "func", "define"]', 'def', 'intermediate', 4),
  (python_quiz_id, 'What is the output of: print(type([]))?', 'mcq',
   '["<class list>", "<class array>", "<class tuple>", "<class dict>"]', '<class list>', 'intermediate', 5),
  (python_quiz_id, 'The ______ keyword is used to create a class in Python.', 'fill_blank',
   NULL, 'class', 'intermediate', 6),
  (python_quiz_id, 'Python lists are ______ which means they can be modified.', 'fill_blank',
   NULL, 'mutable', 'intermediate', 7),
  (python_quiz_id, 'Which decorator is used to define a class method?', 'mcq',
   '["@staticmethod", "@classmethod", "@property", "@method"]', '@classmethod', 'expert', 8),
  (python_quiz_id, 'The ______ module is used for regular expressions in Python.', 'fill_blank',
   NULL, 're', 'expert', 9),
  (python_quiz_id, 'List comprehension provides a ______ way to create lists.', 'fill_blank',
   NULL, 'concise', 'expert', 10);

  -- ============================================
  -- HTML ASSESSMENT QUIZ QUESTIONS
  -- ============================================
  
  INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index) VALUES
  (html_quiz_id, 'Which tag is used to create a paragraph?', 'mcq',
   '["<p>", "<div>", "<span>", "<para>"]', '<p>', 'beginner', 1),
  (html_quiz_id, 'What does HTML stand for?', 'mcq',
   '["Hyper Text Markup Language", "High Tech Modern Language", "Home Tool Markup Language", "Hyperlinks and Text Markup Language"]', 'Hyper Text Markup Language', 'beginner', 2),
  (html_quiz_id, 'HTML stands for HyperText ______ Language.', 'fill_blank',
   NULL, 'Markup', 'beginner', 3),
  (html_quiz_id, 'Which attribute is used to provide alternative text for an image?', 'mcq',
   '["alt", "title", "src", "text"]', 'alt', 'intermediate', 4),
  (html_quiz_id, 'Which tag is used to create a hyperlink?', 'mcq',
   '["<a>", "<link>", "<href>", "<url>"]', '<a>', 'intermediate', 5),
  (html_quiz_id, 'The ______ tag is used to define the title of a document.', 'fill_blank',
   NULL, 'title', 'intermediate', 6),
  (html_quiz_id, 'Form elements are contained within the ______ tag.', 'fill_blank',
   NULL, 'form', 'intermediate', 7),
  (html_quiz_id, 'Which HTML5 tag is used for independent content?', 'mcq',
   '["<article>", "<section>", "<div>", "<content>"]', '<article>', 'expert', 8),
  (html_quiz_id, 'The ______ attribute specifies where to open the linked document.', 'fill_blank',
   NULL, 'target', 'expert', 9),
  (html_quiz_id, 'Semantic HTML improves ______ and SEO.', 'fill_blank',
   NULL, 'accessibility', 'expert', 10);

  -- ============================================
  -- CSS ASSESSMENT QUIZ QUESTIONS
  -- ============================================
  
  INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index) VALUES
  (css_quiz_id, 'Which property is used to change text color?', 'mcq',
   '["color", "text-color", "font-color", "text"]', 'color', 'beginner', 1),
  (css_quiz_id, 'What does CSS stand for?', 'mcq',
   '["Cascading Style Sheets", "Creative Style Sheets", "Computer Style Sheets", "Colorful Style Sheets"]', 'Cascading Style Sheets', 'beginner', 2),
  (css_quiz_id, 'CSS stands for Cascading ______ Sheets.', 'fill_blank',
   NULL, 'Style', 'beginner', 3),
  (css_quiz_id, 'Which property is used to create space between elements?', 'mcq',
   '["margin", "padding", "spacing", "gap"]', 'margin', 'intermediate', 4),
  (css_quiz_id, 'What is the correct syntax for a class selector?', 'mcq',
   '[".classname", "#classname", "classname", "*classname"]', '.classname', 'intermediate', 5),
  (css_quiz_id, 'The ______ property is used to change background color.', 'fill_blank',
   NULL, 'background-color', 'intermediate', 6),
  (css_quiz_id, 'Flexbox is used for ______ layouts.', 'fill_blank',
   NULL, 'flexible', 'intermediate', 7),
  (css_quiz_id, 'Which property is used for CSS animations?', 'mcq',
   '["animation", "transition", "transform", "All of the above"]', 'All of the above', 'expert', 8),
  (css_quiz_id, 'The ______ rule is used to define keyframe animations.', 'fill_blank',
   NULL, '@keyframes', 'expert', 9),
  (css_quiz_id, 'CSS Grid is used for ______ dimensional layouts.', 'fill_blank',
   NULL, 'two', 'expert', 10);

  -- ============================================
  -- JAVASCRIPT ASSESSMENT QUIZ QUESTIONS
  -- ============================================
  
  INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index) VALUES
  (js_quiz_id, 'Which keyword is used to declare a variable in modern JavaScript?', 'mcq',
   '["var", "let", "const", "All of the above"]', 'All of the above', 'beginner', 1),
  (js_quiz_id, 'What is the correct way to write a comment in JavaScript?', 'mcq',
   '["// comment", "<!-- comment -->", "# comment", "/* comment"]', '// comment', 'beginner', 2),
  (js_quiz_id, 'JavaScript runs inside the ______.', 'fill_blank',
   NULL, 'browser', 'beginner', 3),
  (js_quiz_id, 'Which method is used to select an element by ID?', 'mcq',
   '["getElementById", "querySelector", "getElement", "selectById"]', 'getElementById', 'intermediate', 4),
  (js_quiz_id, 'What does DOM stand for?', 'mcq',
   '["Document Object Model", "Data Object Model", "Document Oriented Model", "Display Object Model"]', 'Document Object Model', 'intermediate', 5),
  (js_quiz_id, 'The ______ method adds an event listener to an element.', 'fill_blank',
   NULL, 'addEventListener', 'intermediate', 6),
  (js_quiz_id, 'Arrays in JavaScript are ______ indexed.', 'fill_blank',
   NULL, 'zero', 'intermediate', 7),
  (js_quiz_id, 'Which method is used to make HTTP requests in modern JavaScript?', 'mcq',
   '["fetch", "ajax", "http", "request"]', 'fetch', 'expert', 8),
  (js_quiz_id, 'Promises help handle ______ operations in JavaScript.', 'fill_blank',
   NULL, 'asynchronous', 'expert', 9),
  (js_quiz_id, 'Arrow functions were introduced in ______ version of JavaScript.', 'fill_blank',
   NULL, 'ES6', 'expert', 10);

  -- ============================================
  -- C PROGRAMMING ASSESSMENT QUIZ QUESTIONS
  -- ============================================
  
  INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index) VALUES
  (c_quiz_id, 'Which symbol is used to end a statement in C?', 'mcq',
   '[";", ":", ".", ","]', ';', 'beginner', 1),
  (c_quiz_id, 'What is the correct function to print output in C?', 'mcq',
   '["printf", "print", "cout", "echo"]', 'printf', 'beginner', 2),
  (c_quiz_id, 'C is a ______ programming language.', 'fill_blank',
   NULL, 'procedural', 'beginner', 3),
  (c_quiz_id, 'Which operator is used to get the address of a variable?', 'mcq',
   '["&", "*", "@", "#"]', '&', 'intermediate', 4),
  (c_quiz_id, 'What is the size of int data type in C (typically)?', 'mcq',
   '["2 bytes", "4 bytes", "8 bytes", "1 byte"]', '4 bytes', 'intermediate', 5),
  (c_quiz_id, 'The ______ function is used to read input in C.', 'fill_blank',
   NULL, 'scanf', 'intermediate', 6),
  (c_quiz_id, 'Arrays in C are stored in ______ memory locations.', 'fill_blank',
   NULL, 'contiguous', 'intermediate', 7),
  (c_quiz_id, 'Which function is used to allocate memory dynamically?', 'mcq',
   '["malloc", "alloc", "new", "create"]', 'malloc', 'expert', 8),
  (c_quiz_id, 'Pointers store the ______ of variables.', 'fill_blank',
   NULL, 'address', 'expert', 9),
  (c_quiz_id, 'The ______ keyword is used to define structures in C.', 'fill_blank',
   NULL, 'struct', 'expert', 10);

  -- ============================================
  -- C++ ASSESSMENT QUIZ QUESTIONS
  -- ============================================
  
  INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index) VALUES
  (cpp_quiz_id, 'Which concept does C++ support that C does not?', 'mcq',
   '["OOP", "Functions", "Arrays", "Loops"]', 'OOP', 'beginner', 1),
  (cpp_quiz_id, 'What is the correct way to output in C++?', 'mcq',
   '["cout", "printf", "print", "echo"]', 'cout', 'beginner', 2),
  (cpp_quiz_id, 'C++ supports ______ programming paradigm.', 'fill_blank',
   NULL, 'Object-Oriented', 'beginner', 3),
  (cpp_quiz_id, 'Which access specifier makes members private by default in a class?', 'mcq',
   '["private", "public", "protected", "default"]', 'private', 'intermediate', 4),
  (cpp_quiz_id, 'What is the purpose of a constructor?', 'mcq',
   '["Initialize objects", "Destroy objects", "Copy objects", "None"]', 'Initialize objects', 'intermediate', 5),
  (cpp_quiz_id, 'The ______ keyword is used to inherit from a base class.', 'fill_blank',
   NULL, 'extends', 'intermediate', 6),
  (cpp_quiz_id, 'Polymorphism allows methods to have ______ implementations.', 'fill_blank',
   NULL, 'multiple', 'intermediate', 7),
  (cpp_quiz_id, 'Which STL container implements a dynamic array?', 'mcq',
   '["vector", "list", "array", "deque"]', 'vector', 'expert', 8),
  (cpp_quiz_id, 'Templates provide ______ programming in C++.', 'fill_blank',
   NULL, 'generic', 'expert', 9),
  (cpp_quiz_id, 'The ______ library provides standard algorithms in C++.', 'fill_blank',
   NULL, 'algorithm', 'expert', 10);

  -- ============================================
  -- PHP ASSESSMENT QUIZ QUESTIONS
  -- ============================================
  
  INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index) VALUES
  (php_quiz_id, 'Where does PHP code execute?', 'mcq',
   '["Server", "Client", "Browser", "Database"]', 'Server', 'beginner', 1),
  (php_quiz_id, 'Which symbol is used to start a variable in PHP?', 'mcq',
   '["$", "@", "#", "&"]', '$', 'beginner', 2),
  (php_quiz_id, 'PHP stands for ______ Hypertext Preprocessor.', 'fill_blank',
   NULL, 'Personal Home Page', 'beginner', 3),
  (php_quiz_id, 'Which superglobal is used to collect form data sent with POST?', 'mcq',
   '["$_POST", "$_GET", "$_REQUEST", "$_FORM"]', '$_POST', 'intermediate', 4),
  (php_quiz_id, 'What function is used to start a session in PHP?', 'mcq',
   '["session_start()", "start_session()", "begin_session()", "init_session()"]', 'session_start()', 'intermediate', 5),
  (php_quiz_id, 'The ______ function is used to include files in PHP.', 'fill_blank',
   NULL, 'include', 'intermediate', 6),
  (php_quiz_id, 'PHP uses the ______ operator for string concatenation.', 'fill_blank',
   NULL, '.', 'intermediate', 7),
  (php_quiz_id, 'Which function is used to connect to MySQL database?', 'mcq',
   '["mysqli_connect()", "mysql_connect()", "db_connect()", "connect_db()"]', 'mysqli_connect()', 'expert', 8),
  (php_quiz_id, 'PDO stands for PHP Data ______.', 'fill_blank',
   NULL, 'Objects', 'expert', 9),
  (php_quiz_id, 'Prepared statements help prevent ______ injection attacks.', 'fill_blank',
   NULL, 'SQL', 'expert', 10);

  -- ============================================
  -- SQL ASSESSMENT QUIZ QUESTIONS
  -- ============================================
  
  INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index) VALUES
  (sql_quiz_id, 'Which command is used to retrieve data from a database?', 'mcq',
   '["SELECT", "GET", "FETCH", "RETRIEVE"]', 'SELECT', 'beginner', 1),
  (sql_quiz_id, 'What does SQL stand for?', 'mcq',
   '["Structured Query Language", "Simple Query Language", "Standard Query Language", "System Query Language"]', 'Structured Query Language', 'beginner', 2),
  (sql_quiz_id, 'SQL stands for Structured ______ Language.', 'fill_blank',
   NULL, 'Query', 'beginner', 3),
  (sql_quiz_id, 'Which clause is used to filter results in SQL?', 'mcq',
   '["WHERE", "FILTER", "HAVING", "SELECT"]', 'WHERE', 'intermediate', 4),
  (sql_quiz_id, 'Which JOIN returns all rows from both tables?', 'mcq',
   '["FULL JOIN", "INNER JOIN", "LEFT JOIN", "RIGHT JOIN"]', 'FULL JOIN', 'intermediate', 5),
  (sql_quiz_id, 'The ______ clause is used to sort results.', 'fill_blank',
   NULL, 'ORDER BY', 'intermediate', 6),
  (sql_quiz_id, 'The ______ clause groups rows with same values.', 'fill_blank',
   NULL, 'GROUP BY', 'intermediate', 7),
  (sql_quiz_id, 'Which constraint ensures all values in a column are unique?', 'mcq',
   '["UNIQUE", "PRIMARY KEY", "DISTINCT", "CHECK"]', 'UNIQUE', 'expert', 8),
  (sql_quiz_id, 'Indexes improve query ______ in databases.', 'fill_blank',
   NULL, 'performance', 'expert', 9),
  (sql_quiz_id, 'A ______ key links two tables together.', 'fill_blank',
   NULL, 'foreign', 'expert', 10);

  -- ============================================
  -- DATA STRUCTURES ASSESSMENT QUIZ QUESTIONS
  -- ============================================
  
  INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index) VALUES
  (ds_quiz_id, 'Which data structure follows LIFO principle?', 'mcq',
   '["Stack", "Queue", "Array", "List"]', 'Stack', 'beginner', 1),
  (ds_quiz_id, 'What is the time complexity of accessing an array element by index?', 'mcq',
   '["O(1)", "O(n)", "O(log n)", "O(n^2)"]', 'O(1)', 'beginner', 2),
  (ds_quiz_id, 'Queue follows ______ principle.', 'fill_blank',
   NULL, 'FIFO', 'beginner', 3),
  (ds_quiz_id, 'Which data structure is used for BFS traversal?', 'mcq',
   '["Queue", "Stack", "Array", "Tree"]', 'Queue', 'intermediate', 4),
  (ds_quiz_id, 'What is the worst-case time complexity of binary search?', 'mcq',
   '["O(log n)", "O(n)", "O(1)", "O(n log n)"]', 'O(log n)', 'intermediate', 5),
  (ds_quiz_id, 'A linked list consists of ______ that contain data and pointers.', 'fill_blank',
   NULL, 'nodes', 'intermediate', 6),
  (ds_quiz_id, 'Hash tables provide ______ average time complexity for search.', 'fill_blank',
   NULL, 'O(1)', 'intermediate', 7),
  (ds_quiz_id, 'Which tree traversal visits root node first?', 'mcq',
   '["Preorder", "Inorder", "Postorder", "Level order"]', 'Preorder', 'expert', 8),
  (ds_quiz_id, 'A balanced binary search tree has height of ______.', 'fill_blank',
   NULL, 'O(log n)', 'expert', 9),
  (ds_quiz_id, 'Graphs can be represented using adjacency ______ or adjacency list.', 'fill_blank',
   NULL, 'matrix', 'expert', 10);

  -- ============================================
  -- ENGLISH COMMUNICATION ASSESSMENT QUIZ QUESTIONS
  -- ============================================
  
  INSERT INTO quiz_questions (quiz_id, question_text, question_type, options, correct_answer, difficulty, order_index) VALUES
  (eng_quiz_id, 'What is the past tense of "go"?', 'mcq',
   '["went", "goed", "gone", "going"]', 'went', 'beginner', 1),
  (eng_quiz_id, 'Which article is used before a vowel sound?', 'mcq',
   '["an", "a", "the", "no article"]', 'an', 'beginner', 2),
  (eng_quiz_id, 'Communication means sharing ______.', 'fill_blank',
   NULL, 'information', 'beginner', 3),
  (eng_quiz_id, 'Which tense is used for actions happening now?', 'mcq',
   '["Present Continuous", "Simple Present", "Present Perfect", "Past Continuous"]', 'Present Continuous', 'intermediate', 4),
  (eng_quiz_id, 'What is the plural of "child"?', 'mcq',
   '["children", "childs", "childes", "child"]', 'children', 'intermediate', 5),
  (eng_quiz_id, 'A sentence must have a subject and a ______.', 'fill_blank',
   NULL, 'verb', 'intermediate', 6),
  (eng_quiz_id, 'Adjectives describe ______.', 'fill_blank',
   NULL, 'nouns', 'intermediate', 7),
  (eng_quiz_id, 'Which is an example of a complex sentence?', 'mcq',
   '["Although it rained, we went out", "It rained", "We went out", "Rain and sun"]', 'Although it rained, we went out', 'expert', 8),
  (eng_quiz_id, 'The passive voice uses the verb ______.', 'fill_blank',
   NULL, 'be', 'expert', 9),
  (eng_quiz_id, 'Effective communication requires clarity, ______, and empathy.', 'fill_blank',
   NULL, 'confidence', 'expert', 10);

END $$;