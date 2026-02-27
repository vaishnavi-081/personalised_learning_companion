-- Insert subjects
INSERT INTO subjects (name, description, icon, roadmap, career_paths, projects) VALUES
('Java', 'Learn Java programming from basics to advanced concepts', '☕', 'Basics → OOP → Collections → Database → Spring → Projects → Job Ready', ARRAY['Java Developer', 'Backend Developer'], ARRAY['Student Management System', 'Banking System']),
('Python', 'Master Python programming and its powerful libraries', '🐍', 'Basics → Functions → OOP → Libraries → Web → Projects → Job Ready', ARRAY['Python Developer', 'Data Analyst'], ARRAY['Todo App']),
('HTML', 'Build the structure of web pages with HTML', '🌐', 'Tags → Lists → Tables → Forms → Semantic → Responsive → Projects', ARRAY['Frontend Developer'], ARRAY['Portfolio Website']),
('CSS', 'Style and design beautiful web pages', '🎨', 'Selectors → Box Model → Flexbox → Grid → Animations → Responsive', ARRAY['Frontend Developer'], ARRAY['Responsive Landing Page']),
('JavaScript', 'Add interactivity and dynamic behavior to websites', '⚡', 'Basics → Functions → DOM → Events → ES6 → APIs → Projects', ARRAY['Frontend Developer', 'Full Stack Developer'], ARRAY['Interactive Web App']),
('C Programming', 'Learn the fundamentals of C programming', '©️', 'Basics → Functions → Arrays → Pointers → Structures', ARRAY['System Programmer', 'Embedded Developer'], ARRAY['Calculator', 'File Manager']),
('C++', 'Object-oriented programming with C++', '➕', 'Basics → OOP → STL → Projects', ARRAY['Software Developer', 'Game Developer'], ARRAY['Library Management System']),
('PHP', 'Server-side scripting for dynamic websites', '🐘', 'Basics → Forms → Database → CRUD', ARRAY['Backend Developer', 'Web Developer'], ARRAY['Blog System']),
('SQL', 'Manage and query databases effectively', '🗄️', 'Queries → Joins → Functions → Optimization', ARRAY['Database Administrator', 'Data Analyst'], ARRAY['Database Design']),
('Data Structures', 'Essential data structures and algorithms', '📊', 'Arrays → Lists → Stack → Queue → Trees → Graphs', ARRAY['Software Engineer', 'Algorithm Developer'], ARRAY['Algorithm Implementations']),
('English Communication', 'Improve your English communication skills', '💬', 'Grammar → Vocabulary → Speaking → Interview Skills', ARRAY['Professional Communicator'], ARRAY['Interview Preparation']);

-- Get subject IDs for reference
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
BEGIN
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

  -- Java Topics (Beginner)
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (java_id, 'beginner', 'Introduction to Java', 'Learn what Java is and why it is popular', 
   'Java is a high-level, class-based, object-oriented programming language designed to have as few implementation dependencies as possible. It was developed by James Gosling at Sun Microsystems and released in 1995. Java applications are typically compiled to bytecode that can run on any Java Virtual Machine (JVM) regardless of the underlying computer architecture.

Key Features of Java:
1. Platform Independent: Write Once, Run Anywhere (WORA)
2. Object-Oriented: Everything is an object in Java
3. Secure: Built-in security features
4. Robust: Strong memory management
5. Multithreaded: Supports concurrent execution
6. High Performance: Just-In-Time compiler improves performance',
   'public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}',
   'public class ClassName {
    public static void main(String[] args) {
        // Your code here
    }
}',
   'Java is case-sensitive. The main method is the entry point of any Java program. Every Java program must have at least one class.',
   '1. Write a program to print your name\n2. Create a program that prints "Welcome to Java"\n3. Write a program to print multiple lines',
   '{"telugu": ["https://www.youtube.com/watch?v=example1"], "english": ["https://www.youtube.com/watch?v=example2"]}',
   1),
  
  (java_id, 'beginner', 'Variables and Data Types', 'Understanding variables and different data types in Java',
   'Variables are containers for storing data values. In Java, each variable must be declared with a data type.

Data Types in Java:
1. Primitive Data Types:
   - byte: 8-bit integer (-128 to 127)
   - short: 16-bit integer (-32,768 to 32,767)
   - int: 32-bit integer (-2^31 to 2^31-1)
   - long: 64-bit integer
   - float: 32-bit floating point
   - double: 64-bit floating point
   - char: 16-bit Unicode character
   - boolean: true or false

2. Non-Primitive Data Types:
   - String, Arrays, Classes, Interfaces',
   'public class Variables {
    public static void main(String[] args) {
        int age = 25;
        double salary = 50000.50;
        char grade = ''A'';
        boolean isStudent = true;
        String name = "John";
        
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.println("Salary: " + salary);
    }
}',
   'dataType variableName = value;',
   'Variable names should start with a letter, $ or _. Use meaningful variable names. Java follows camelCase naming convention.',
   '1. Declare variables of different data types\n2. Create a program to store and display student information\n3. Practice type casting',
   '{"telugu": [], "english": []}',
   2),

  (java_id, 'beginner', 'Operators', 'Learn about different operators in Java',
   'Operators are symbols that perform operations on variables and values.

Types of Operators:
1. Arithmetic Operators: +, -, *, /, %
2. Assignment Operators: =, +=, -=, *=, /=
3. Comparison Operators: ==, !=, >, <, >=, <=
4. Logical Operators: && (AND), || (OR), ! (NOT)
5. Increment/Decrement: ++, --',
   'public class Operators {
    public static void main(String[] args) {
        int a = 10, b = 5;
        System.out.println("Addition: " + (a + b));
        System.out.println("Subtraction: " + (a - b));
        System.out.println("Multiplication: " + (a * b));
        System.out.println("Division: " + (a / b));
        System.out.println("Modulus: " + (a % b));
        
        boolean result = (a > b) && (a != 0);
        System.out.println("Logical result: " + result);
    }
}',
   'result = operand1 operator operand2;',
   'Division by zero throws an exception. Use parentheses to control order of operations.',
   '1. Create a calculator program\n2. Practice all operator types\n3. Solve arithmetic problems',
   '{"telugu": [], "english": []}',
   3),

  (java_id, 'beginner', 'Control Flow - If-Else', 'Decision making with if-else statements',
   'Control flow statements allow you to control the execution flow of your program based on conditions.

If-Else Statement:
- if: executes code if condition is true
- else if: tests another condition if previous is false
- else: executes if all conditions are false',
   'public class IfElse {
    public static void main(String[] args) {
        int marks = 75;
        
        if (marks >= 90) {
            System.out.println("Grade: A");
        } else if (marks >= 75) {
            System.out.println("Grade: B");
        } else if (marks >= 60) {
            System.out.println("Grade: C");
        } else {
            System.out.println("Grade: F");
        }
    }
}',
   'if (condition) {
    // code
} else if (condition) {
    // code
} else {
    // code
}',
   'Conditions must evaluate to boolean. Use curly braces even for single statements for clarity.',
   '1. Check if number is even or odd\n2. Find largest of three numbers\n3. Check voting eligibility',
   '{"telugu": [], "english": []}',
   4),

  (java_id, 'beginner', 'Loops', 'Repeating code with loops',
   'Loops are used to execute a block of code repeatedly.

Types of Loops:
1. for loop: when you know how many times to loop
2. while loop: when condition is checked before execution
3. do-while loop: executes at least once, then checks condition',
   'public class Loops {
    public static void main(String[] args) {
        // For loop
        for (int i = 1; i <= 5; i++) {
            System.out.println("Count: " + i);
        }
        
        // While loop
        int j = 1;
        while (j <= 5) {
            System.out.println("While: " + j);
            j++;
        }
        
        // Do-while loop
        int k = 1;
        do {
            System.out.println("Do-while: " + k);
            k++;
        } while (k <= 5);
    }
}',
   'for (initialization; condition; increment) { }
while (condition) { }
do { } while (condition);',
   'Use break to exit loop early. Use continue to skip current iteration.',
   '1. Print numbers 1 to 100\n2. Calculate factorial\n3. Print multiplication table',
   '{"telugu": [], "english": []}',
   5),

  (java_id, 'beginner', 'Arrays', 'Storing multiple values in arrays',
   'An array is a container object that holds a fixed number of values of a single type.

Array Features:
- Fixed size once created
- Zero-indexed (first element at index 0)
- Can store primitive or object types
- Length property gives array size',
   'public class Arrays {
    public static void main(String[] args) {
        // Declare and initialize
        int[] numbers = {10, 20, 30, 40, 50};
        
        // Access elements
        System.out.println("First: " + numbers[0]);
        
        // Loop through array
        for (int i = 0; i < numbers.length; i++) {
            System.out.println(numbers[i]);
        }
        
        // Enhanced for loop
        for (int num : numbers) {
            System.out.println(num);
        }
    }
}',
   'dataType[] arrayName = new dataType[size];
dataType[] arrayName = {value1, value2, ...};',
   'Array index starts at 0. ArrayIndexOutOfBoundsException occurs if you access invalid index.',
   '1. Find sum of array elements\n2. Find largest element\n3. Reverse an array',
   '{"telugu": [], "english": []}',
   6),

  (java_id, 'beginner', 'Methods', 'Creating reusable code with methods',
   'Methods are blocks of code that perform specific tasks and can be reused.

Method Components:
- Access modifier (public, private)
- Return type (void, int, String, etc.)
- Method name
- Parameters (optional)
- Method body',
   'public class Methods {
    // Method with no parameters
    public static void greet() {
        System.out.println("Hello!");
    }
    
    // Method with parameters
    public static int add(int a, int b) {
        return a + b;
    }
    
    // Method with return value
    public static String getName() {
        return "John";
    }
    
    public static void main(String[] args) {
        greet();
        int sum = add(5, 10);
        System.out.println("Sum: " + sum);
        System.out.println("Name: " + getName());
    }
}',
   'accessModifier returnType methodName(parameters) {
    // method body
    return value; // if not void
}',
   'Method names should be verbs in camelCase. Use void if method does not return a value.',
   '1. Create method to check prime number\n2. Method to calculate area of circle\n3. Method to find factorial',
   '{"telugu": [], "english": []}',
   7);

  -- Python Topics (Beginner)
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (python_id, 'beginner', 'Introduction to Python', 'Getting started with Python programming',
   'Python is a high-level, interpreted programming language known for its simplicity and readability. Created by Guido van Rossum in 1991, Python emphasizes code readability with its use of significant indentation.

Key Features:
1. Easy to learn and read
2. Interpreted language
3. Dynamically typed
4. Extensive standard library
5. Cross-platform
6. Supports multiple programming paradigms',
   'print("Hello, World!")
print("Welcome to Python")

# Variables
name = "Alice"
age = 25
print(f"My name is {name} and I am {age} years old")',
   'print("text")
variable_name = value',
   'Python uses indentation to define code blocks. No semicolons needed at end of statements.',
   '1. Print your name and age\n2. Create a greeting program\n3. Print multiple lines',
   '{"telugu": [], "english": []}',
   1),

  (python_id, 'beginner', 'Variables and Data Types', 'Understanding Python data types',
   'Python has several built-in data types:

1. Numeric Types:
   - int: Integer numbers
   - float: Decimal numbers
   - complex: Complex numbers

2. Sequence Types:
   - str: String (text)
   - list: Ordered, mutable collection
   - tuple: Ordered, immutable collection

3. Boolean Type:
   - bool: True or False

4. None Type:
   - None: Represents absence of value',
   '# Different data types
age = 25                    # int
height = 5.9               # float
name = "John"              # str
is_student = True          # bool
grades = [85, 90, 78]      # list
coordinates = (10, 20)     # tuple

print(type(age))           # <class ''int''>
print(f"Name: {name}, Age: {age}")',
   'variable_name = value
type(variable)  # Check type',
   'Python is dynamically typed - no need to declare type. Use type() to check variable type.',
   '1. Create variables of each type\n2. Practice type conversion\n3. Store personal information',
   '{"telugu": [], "english": []}',
   2),

  (python_id, 'beginner', 'Operators', 'Working with Python operators',
   'Python supports various operators:

1. Arithmetic: +, -, *, /, //, %, **
2. Comparison: ==, !=, >, <, >=, <=
3. Logical: and, or, not
4. Assignment: =, +=, -=, *=, /=
5. Identity: is, is not
6. Membership: in, not in',
   '# Arithmetic
a, b = 10, 3
print(a + b)    # 13
print(a / b)    # 3.333...
print(a // b)   # 3 (floor division)
print(a ** b)   # 1000 (power)

# Comparison
print(a > b)    # True

# Logical
x, y = True, False
print(x and y)  # False
print(x or y)   # True',
   'result = operand1 operator operand2',
   '// is floor division, / is true division. ** is power operator.',
   '1. Create a calculator\n2. Practice all operators\n3. Solve math problems',
   '{"telugu": [], "english": []}',
   3);

  -- HTML Topics (Beginner)
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (html_id, 'beginner', 'Introduction to HTML', 'Learn the basics of HTML',
   'HTML (HyperText Markup Language) is the standard markup language for creating web pages. It describes the structure of web pages using markup.

HTML consists of:
- Elements: Building blocks of HTML
- Tags: Keywords surrounded by angle brackets
- Attributes: Additional information about elements
- Content: Text and media within elements',
   '<!DOCTYPE html>
<html>
<head>
    <title>My First Page</title>
</head>
<body>
    <h1>Welcome to HTML</h1>
    <p>This is my first web page.</p>
</body>
</html>',
   '<!DOCTYPE html>
<html>
<head>
    <title>Page Title</title>
</head>
<body>
    <!-- Content goes here -->
</body>
</html>',
   'HTML is not case-sensitive but lowercase is recommended. Always close tags properly.',
   '1. Create a basic HTML page\n2. Add headings and paragraphs\n3. Create your first webpage',
   '{"telugu": [], "english": []}',
   1),

  (html_id, 'beginner', 'HTML Tags and Elements', 'Common HTML tags',
   'HTML tags define different types of content:

Heading Tags: <h1> to <h6>
Paragraph: <p>
Line Break: <br>
Horizontal Rule: <hr>
Bold: <strong> or <b>
Italic: <em> or <i>
Link: <a href="url">
Image: <img src="path" alt="description">',
   '<h1>Main Heading</h1>
<h2>Subheading</h2>
<p>This is a paragraph with <strong>bold</strong> and <em>italic</em> text.</p>
<a href="https://example.com">Visit Example</a>
<img src="image.jpg" alt="Description">
<br>
<hr>',
   '<tagname>content</tagname>
<tagname attribute="value">content</tagname>',
   'Use semantic tags for better SEO. Alt attribute is important for images.',
   '1. Create a page with all heading levels\n2. Add images and links\n3. Format text with different tags',
   '{"telugu": [], "english": []}',
   2);

END $$;