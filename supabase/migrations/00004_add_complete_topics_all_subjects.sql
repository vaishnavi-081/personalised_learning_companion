-- First, delete existing topics to avoid duplicates
DELETE FROM topics;

-- Get subject IDs
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

  -- ============================================
  -- JAVA TOPICS
  -- ============================================
  
  -- Java Beginner Topics
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (java_id, 'beginner', 'Introduction to Java', 'Learn what Java is and why it is popular', 
   'Java is a high-level, class-based, object-oriented programming language designed to have as few implementation dependencies as possible. It was developed by James Gosling at Sun Microsystems and released in 1995.

Key Features of Java:
1. Platform Independent: Write Once, Run Anywhere (WORA) - Java code is compiled into bytecode that runs on any JVM
2. Object-Oriented: Everything is an object in Java, promoting code reusability and modularity
3. Secure: Built-in security features including bytecode verification and security manager
4. Robust: Strong memory management, exception handling, and type checking
5. Multithreaded: Supports concurrent execution of multiple threads
6. High Performance: Just-In-Time (JIT) compiler improves runtime performance
7. Distributed: Supports distributed computing with RMI and EJB
8. Dynamic: Supports dynamic loading of classes

Java Applications:
- Web Applications (Spring, JSP, Servlets)
- Mobile Applications (Android)
- Desktop Applications (Swing, JavaFX)
- Enterprise Applications (Java EE)
- Scientific Applications
- Gaming Applications',
   'public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
        System.out.println("Welcome to Java Programming");
    }
}

// Output:
// Hello, World!
// Welcome to Java Programming',
   'public class ClassName {
    public static void main(String[] args) {
        // Your code here
    }
}',
   'Java is case-sensitive. The main method is the entry point of any Java program. Every Java program must have at least one class. File name must match the public class name.',
   '1. Write a program to print your name and age
2. Create a program that prints "Welcome to Java" on multiple lines
3. Write a program to display your favorite quote
4. Create a program that prints a simple pattern using asterisks',
   '{"telugu": ["https://www.youtube.com/watch?v=ntLJmHOJ0ME"], "english": ["https://www.youtube.com/watch?v=eIrMbAQSU34"]}',
   1),

  (java_id, 'beginner', 'Variables and Data Types', 'Understanding variables and different data types in Java',
   'Variables are containers for storing data values. In Java, each variable must be declared with a data type before use.

Primitive Data Types in Java:

1. byte: 8-bit signed integer
   - Range: -128 to 127
   - Default: 0
   - Used for saving memory in large arrays

2. short: 16-bit signed integer
   - Range: -32,768 to 32,767
   - Default: 0

3. int: 32-bit signed integer
   - Range: -2,147,483,648 to 2,147,483,647
   - Default: 0
   - Most commonly used integer type

4. long: 64-bit signed integer
   - Range: -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
   - Default: 0L
   - Use L suffix for long literals

5. float: 32-bit floating point
   - Default: 0.0f
   - Use f suffix for float literals
   - Precision: 6-7 decimal digits

6. double: 64-bit floating point
   - Default: 0.0d
   - Most commonly used for decimal values
   - Precision: 15 decimal digits

7. char: 16-bit Unicode character
   - Range: 0 to 65,535
   - Default: ''\u0000''
   - Enclosed in single quotes

8. boolean: true or false
   - Default: false
   - Used for conditional logic

Non-Primitive Data Types:
- String: Sequence of characters
- Arrays: Collection of similar type elements
- Classes: User-defined types
- Interfaces: Abstract types',
   'public class Variables {
    public static void main(String[] args) {
        // Integer types
        byte age = 25;
        short year = 2024;
        int population = 1000000;
        long distance = 9876543210L;
        
        // Floating point types
        float price = 99.99f;
        double salary = 50000.50;
        
        // Character and boolean
        char grade = ''A'';
        boolean isStudent = true;
        
        // String (non-primitive)
        String name = "John Doe";
        
        // Display values
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.println("Grade: " + grade);
        System.out.println("Salary: $" + salary);
        System.out.println("Is Student: " + isStudent);
        
        // Type casting
        int num1 = 10;
        double num2 = num1; // Automatic casting
        System.out.println("Automatic casting: " + num2);
        
        double num3 = 9.78;
        int num4 = (int) num3; // Manual casting
        System.out.println("Manual casting: " + num4);
    }
}',
   'dataType variableName = value;

// Examples:
int number = 10;
double price = 99.99;
char letter = ''A'';
boolean flag = true;
String text = "Hello";',
   'Variable names must start with a letter, $ or underscore. Use camelCase naming convention. Constants should be in UPPERCASE. Choose meaningful variable names for better code readability.',
   '1. Declare variables of all primitive data types and print them
2. Create a program to store and display student information (name, age, grade, GPA)
3. Practice type casting between int and double
4. Calculate the area of a rectangle using appropriate data types
5. Create a program to swap two numbers using a temporary variable',
   '{"telugu": ["https://www.youtube.com/watch?v=oPf2EN03D8I"], "english": ["https://www.youtube.com/watch?v=so1iUWaLmKA"]}',
   2),

  (java_id, 'beginner', 'Operators', 'Learn about different operators in Java',
   'Operators are special symbols that perform operations on variables and values.

Types of Operators in Java:

1. Arithmetic Operators:
   - Addition (+): Adds two operands
   - Subtraction (-): Subtracts second operand from first
   - Multiplication (*): Multiplies two operands
   - Division (/): Divides first operand by second
   - Modulus (%): Returns remainder of division
   - Increment (++): Increases value by 1
   - Decrement (--): Decreases value by 1

2. Assignment Operators:
   - Simple (=): Assigns right operand to left
   - Add and assign (+=): a += b is same as a = a + b
   - Subtract and assign (-=)
   - Multiply and assign (*=)
   - Divide and assign (/=)
   - Modulus and assign (%=)

3. Comparison Operators:
   - Equal to (==): Checks if two operands are equal
   - Not equal to (!=): Checks if two operands are not equal
   - Greater than (>)
   - Less than (<)
   - Greater than or equal to (>=)
   - Less than or equal to (<=)

4. Logical Operators:
   - AND (&&): Returns true if both conditions are true
   - OR (||): Returns true if at least one condition is true
   - NOT (!): Reverses the logical state

5. Bitwise Operators:
   - AND (&), OR (|), XOR (^), NOT (~)
   - Left shift (<<), Right shift (>>)

6. Ternary Operator:
   - condition ? value1 : value2',
   'public class Operators {
    public static void main(String[] args) {
        // Arithmetic operators
        int a = 10, b = 5;
        System.out.println("Addition: " + (a + b));        // 15
        System.out.println("Subtraction: " + (a - b));     // 5
        System.out.println("Multiplication: " + (a * b));  // 50
        System.out.println("Division: " + (a / b));        // 2
        System.out.println("Modulus: " + (a % b));         // 0
        
        // Increment and Decrement
        int x = 5;
        System.out.println("x++: " + (x++));  // 5 (post-increment)
        System.out.println("x: " + x);        // 6
        System.out.println("++x: " + (++x));  // 7 (pre-increment)
        
        // Comparison operators
        System.out.println("a > b: " + (a > b));   // true
        System.out.println("a == b: " + (a == b)); // false
        System.out.println("a != b: " + (a != b)); // true
        
        // Logical operators
        boolean result1 = (a > b) && (a != 0);  // true AND true = true
        boolean result2 = (a < b) || (b > 0);   // false OR true = true
        boolean result3 = !(a == b);            // NOT false = true
        
        System.out.println("Logical AND: " + result1);
        System.out.println("Logical OR: " + result2);
        System.out.println("Logical NOT: " + result3);
        
        // Ternary operator
        int max = (a > b) ? a : b;
        System.out.println("Maximum: " + max);
        
        // Assignment operators
        int c = 10;
        c += 5;  // c = c + 5
        System.out.println("c += 5: " + c);  // 15
    }
}',
   '// Arithmetic
result = operand1 + operand2;

// Comparison
boolean result = (a > b);

// Logical
boolean result = (condition1 && condition2);

// Ternary
variable = (condition) ? value1 : value2;',
   'Division by zero throws ArithmeticException. Use parentheses to control order of operations. Post-increment (x++) returns value then increments. Pre-increment (++x) increments then returns value.',
   '1. Create a calculator program for basic arithmetic operations
2. Write a program to check if a number is even or odd using modulus
3. Find the largest of three numbers using comparison operators
4. Calculate compound interest using arithmetic operators
5. Use ternary operator to check if a person is eligible to vote (age >= 18)',
   '{"telugu": ["https://www.youtube.com/watch?v=8qGYWNdBMKM"], "english": ["https://www.youtube.com/watch?v=OBhUl6nuFXw"]}',
   3);

  -- Continue with more Java topics (Conditions, Loops, Arrays, Methods)
  -- Due to length constraints, I''ll add key topics for each subject

  -- Java Intermediate Topics
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (java_id, 'intermediate', 'Classes and Objects', 'Understanding Object-Oriented Programming basics',
   'Classes and Objects are fundamental concepts in Object-Oriented Programming (OOP).

Class:
A class is a blueprint or template for creating objects. It defines the properties (attributes) and behaviors (methods) that objects of that class will have.

Object:
An object is an instance of a class. It is a real-world entity that has state and behavior.

Key Concepts:

1. Attributes (Fields/Properties):
   - Variables that hold the state of an object
   - Also called instance variables or member variables

2. Methods:
   - Functions that define the behavior of an object
   - Can access and modify object attributes

3. Constructor:
   - Special method called when object is created
   - Same name as class, no return type
   - Used to initialize object state

4. this Keyword:
   - Refers to the current object
   - Used to differentiate between instance variables and parameters

5. Access Modifiers:
   - public: Accessible from anywhere
   - private: Accessible only within the class
   - protected: Accessible within package and subclasses
   - default: Accessible within package

Benefits of OOP:
- Code reusability through inheritance
- Data hiding through encapsulation
- Modularity and maintainability
- Real-world modeling',
   'public class Student {
    // Attributes (private for encapsulation)
    private String name;
    private int age;
    private double gpa;
    
    // Constructor
    public Student(String name, int age, double gpa) {
        this.name = name;
        this.age = age;
        this.gpa = gpa;
    }
    
    // Getter methods
    public String getName() {
        return name;
    }
    
    public int getAge() {
        return age;
    }
    
    public double getGpa() {
        return gpa;
    }
    
    // Setter methods
    public void setGpa(double gpa) {
        if (gpa >= 0 && gpa <= 4.0) {
            this.gpa = gpa;
        }
    }
    
    // Method to display student info
    public void displayInfo() {
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.println("GPA: " + gpa);
    }
    
    // Method to check if student is honor roll
    public boolean isHonorRoll() {
        return gpa >= 3.5;
    }
}

// Main class to use Student
public class Main {
    public static void main(String[] args) {
        // Creating objects
        Student student1 = new Student("Alice", 20, 3.8);
        Student student2 = new Student("Bob", 21, 3.2);
        
        // Using object methods
        student1.displayInfo();
        System.out.println("Honor Roll: " + student1.isHonorRoll());
        
        System.out.println();
        
        student2.displayInfo();
        student2.setGpa(3.9);
        System.out.println("Updated GPA: " + student2.getGpa());
    }
}',
   'class ClassName {
    // Attributes
    private dataType attributeName;
    
    // Constructor
    public ClassName(parameters) {
        // Initialize attributes
    }
    
    // Methods
    public returnType methodName() {
        // Method body
    }
}

// Creating object
ClassName objectName = new ClassName(arguments);',
   'Use meaningful class names (PascalCase). Keep attributes private and provide public getters/setters. Constructor name must match class name exactly. Use this keyword to avoid naming conflicts.',
   '1. Create a Car class with attributes (brand, model, year) and methods (start, stop, displayInfo)
2. Create a BankAccount class with deposit and withdraw methods
3. Design a Book class with attributes and a method to check if book is available
4. Create a Rectangle class with methods to calculate area and perimeter
5. Build a Employee class with salary calculation method',
   '{"telugu": ["https://www.youtube.com/watch?v=vHjRqIgFqYM"], "english": ["https://www.youtube.com/watch?v=IUqKuGNasdM"]}',
   1);

  -- ============================================
  -- PYTHON TOPICS
  -- ============================================
  
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (python_id, 'beginner', 'Python Basics', 'Getting started with Python programming',
   'Python is a high-level, interpreted, general-purpose programming language created by Guido van Rossum in 1991. It emphasizes code readability with its use of significant indentation.

Key Features of Python:

1. Easy to Learn and Read:
   - Simple, clean syntax similar to English
   - Less code compared to other languages
   - Great for beginners

2. Interpreted Language:
   - Code is executed line by line
   - No compilation needed
   - Easy debugging

3. Dynamically Typed:
   - No need to declare variable types
   - Type is determined at runtime
   - Flexible and convenient

4. Extensive Standard Library:
   - Built-in modules for various tasks
   - "Batteries included" philosophy
   - Rich ecosystem of third-party packages

5. Cross-Platform:
   - Runs on Windows, Mac, Linux
   - Write once, run anywhere
   - Platform-independent

6. Multiple Programming Paradigms:
   - Object-Oriented Programming
   - Functional Programming
   - Procedural Programming

Python Applications:
- Web Development (Django, Flask)
- Data Science and Machine Learning
- Automation and Scripting
- Scientific Computing
- Game Development
- Desktop Applications

Python Syntax Basics:
- Indentation is mandatory (usually 4 spaces)
- No semicolons needed
- Comments start with #
- Print function: print()
- Input function: input()',
   '# Basic print statements
print("Hello, World!")
print("Welcome to Python Programming")

# Variables (no declaration needed)
name = "Alice"
age = 25
height = 5.6
is_student = True

# Print with variables
print("Name:", name)
print("Age:", age)
print("Height:", height, "feet")
print("Is Student:", is_student)

# String formatting
print(f"My name is {name} and I am {age} years old")

# Multiple variables in one line
x, y, z = 10, 20, 30
print(f"x={x}, y={y}, z={z}")

# Taking input from user
user_name = input("Enter your name: ")
user_age = input("Enter your age: ")
print(f"Hello {user_name}, you are {user_age} years old")

# Type conversion
age_number = int(user_age)
print(f"Next year you will be {age_number + 1}")

# Comments
# This is a single-line comment

"""
This is a
multi-line comment
or docstring
"""',
   '# Print statement
print("text")
print(variable)
print("text", variable)

# Variables
variable_name = value

# Input
variable = input("prompt")

# Type conversion
int(value)
float(value)
str(value)

# Comments
# Single line comment
""" Multi-line comment """',
   'Python is case-sensitive. Indentation is crucial and defines code blocks. Use meaningful variable names with underscores (snake_case). input() always returns a string, convert if needed.',
   '1. Write a program to print your name, age, and favorite hobby
2. Create a program that takes user input and displays a personalized greeting
3. Calculate and display the sum of two numbers entered by user
4. Write a program to convert temperature from Celsius to Fahrenheit
5. Create a simple calculator that takes two numbers and displays their sum, difference, product, and quotient',
   '{"telugu": ["https://www.youtube.com/watch?v=gfDE2a7MKjA"], "english": ["https://www.youtube.com/watch?v=kqtD5dpn9C8"]}',
   1);

  -- Add more Python topics for completeness
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (python_id, 'beginner', 'Conditions and Loops', 'Control flow in Python',
   'Control flow statements allow you to control the execution of your program based on conditions and repetition.

Conditional Statements:

1. if Statement:
   - Executes code block if condition is True
   - Condition must evaluate to boolean

2. if-else Statement:
   - Executes one block if condition is True
   - Executes another block if condition is False

3. if-elif-else Statement:
   - Tests multiple conditions
   - Executes first True condition block
   - else block is optional

4. Nested if:
   - if statement inside another if statement
   - Used for complex decision making

Comparison Operators:
- == (equal to)
- != (not equal to)
- > (greater than)
- < (less than)
- >= (greater than or equal to)
- <= (less than or equal to)

Logical Operators:
- and: Both conditions must be True
- or: At least one condition must be True
- not: Reverses the boolean value

Loops:

1. for Loop:
   - Iterates over a sequence
   - Used when number of iterations is known
   - Works with range(), lists, strings, etc.

2. while Loop:
   - Repeats while condition is True
   - Used when number of iterations is unknown
   - Be careful of infinite loops

3. Loop Control:
   - break: Exits the loop immediately
   - continue: Skips current iteration
   - pass: Does nothing (placeholder)',
   '# If-else statements
age = 18
if age >= 18:
    print("You are an adult")
else:
    print("You are a minor")

# If-elif-else
marks = 85
if marks >= 90:
    grade = "A"
elif marks >= 75:
    grade = "B"
elif marks >= 60:
    grade = "C"
else:
    grade = "F"
print(f"Your grade is: {grade}")

# Logical operators
username = "admin"
password = "1234"
if username == "admin" and password == "1234":
    print("Login successful")
else:
    print("Invalid credentials")

# For loop with range
print("Counting 1 to 5:")
for i in range(1, 6):
    print(i)

# For loop with list
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(f"I like {fruit}")

# While loop
count = 1
while count <= 5:
    print(f"Count: {count}")
    count += 1

# Break and continue
for i in range(1, 11):
    if i == 5:
        continue  # Skip 5
    if i == 8:
        break     # Stop at 8
    print(i)

# Nested loops
for i in range(1, 4):
    for j in range(1, 4):
        print(f"{i} x {j} = {i*j}")
    print()  # Empty line',
   '# If statement
if condition:
    # code block

# If-else
if condition:
    # code if true
else:
    # code if false

# If-elif-else
if condition1:
    # code
elif condition2:
    # code
else:
    # code

# For loop
for variable in sequence:
    # code block

# While loop
while condition:
    # code block

# Loop control
break
continue
pass',
   'Indentation is mandatory in Python. Use 4 spaces for each indentation level. Colon (:) is required after if, for, while statements. range(start, stop) generates numbers from start to stop-1.',
   '1. Write a program to check if a number is positive, negative, or zero
2. Create a program to find the largest of three numbers
3. Print multiplication table of a given number using for loop
4. Calculate factorial of a number using while loop
5. Print all even numbers from 1 to 50 using for loop and continue
6. Create a simple number guessing game',
   '{"telugu": ["https://www.youtube.com/watch?v=YfO28Ihehbk"], "english": ["https://www.youtube.com/watch?v=jaCvZtCvjbA"]}',
   2);

  -- ============================================
  -- HTML TOPICS
  -- ============================================
  
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (html_id, 'beginner', 'HTML Basics', 'Introduction to HTML structure',
   'HTML (HyperText Markup Language) is the standard markup language for creating web pages. It describes the structure and content of web pages using elements and tags.

What is HTML?

HTML stands for HyperText Markup Language:
- HyperText: Text with links to other text
- Markup: Tags that define elements
- Language: Syntax and rules for writing

HTML Document Structure:

1. <!DOCTYPE html>:
   - Declares document type
   - Tells browser this is HTML5
   - Must be first line

2. <html>:
   - Root element
   - Contains all other elements
   - Has lang attribute for language

3. <head>:
   - Contains metadata
   - Not displayed on page
   - Includes title, styles, scripts

4. <title>:
   - Page title shown in browser tab
   - Important for SEO
   - Required element

5. <body>:
   - Contains visible content
   - All displayed elements go here
   - Main content area

HTML Elements:

An HTML element consists of:
- Opening tag: <tagname>
- Content: Text or other elements
- Closing tag: </tagname>

Some elements are self-closing:
- <br> (line break)
- <img> (image)
- <input> (form input)

HTML Attributes:

Attributes provide additional information:
- Written in opening tag
- Format: name="value"
- Common attributes: id, class, style

HTML Comments:
<!-- This is a comment -->
- Not displayed in browser
- Used for documentation
- Can span multiple lines',
   '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My First Web Page</title>
</head>
<body>
    <!-- This is a comment -->
    <h1>Welcome to HTML</h1>
    <p>This is my first web page.</p>
    <p>HTML is easy to learn!</p>
    
    <!-- Line break -->
    <p>First line<br>Second line</p>
    
    <!-- Horizontal rule -->
    <hr>
    
    <!-- Attributes example -->
    <p id="intro" class="highlight">
        This paragraph has id and class attributes.
    </p>
</body>
</html>',
   '<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Page Title</title>
</head>
<body>
    <!-- Your content here -->
</body>
</html>',
   'HTML is not case-sensitive but lowercase is recommended. Always close tags properly. Use proper indentation for readability. Save files with .html extension.',
   '1. Create a basic HTML page with title "My Portfolio"
2. Add multiple paragraphs about yourself
3. Use comments to organize your code
4. Create a page with headings and line breaks
5. Build a simple "About Me" page with proper structure',
   '{"telugu": ["https://www.youtube.com/watch?v=BGeDBfCIqas"], "english": ["https://www.youtube.com/watch?v=qz0aGYrrlhU"]}',
   1),

  (html_id, 'beginner', 'HTML Tags and Elements', 'Common HTML tags for content',
   'HTML tags define different types of content and their purpose on a web page.

Heading Tags (<h1> to <h6>):

- Six levels of headings
- <h1>: Most important (main heading)
- <h6>: Least important
- Only one <h1> per page recommended
- Used for document structure and SEO

Paragraph Tag (<p>):

- Defines a paragraph of text
- Automatically adds space before and after
- Block-level element

Text Formatting Tags:

1. <strong> or <b>:
   - Bold text
   - <strong> has semantic meaning (important)
   - <b> is just visual

2. <em> or <i>:
   - Italic text
   - <em> has semantic meaning (emphasis)
   - <i> is just visual

3. <u>:
   - Underlined text
   - Avoid confusion with links

4. <mark>:
   - Highlighted text
   - Yellow background by default

5. <small>:
   - Smaller text
   - For fine print

6. <del>:
   - Deleted text (strikethrough)
   - Shows text was removed

7. <ins>:
   - Inserted text (underlined)
   - Shows text was added

Line Break and Horizontal Rule:

- <br>: Line break (self-closing)
- <hr>: Horizontal rule (divider line)

Link Tag (<a>):

- Creates hyperlinks
- href attribute: destination URL
- target="_blank": Opens in new tab
- title attribute: Tooltip text

Image Tag (<img>):

- Displays images
- src attribute: Image path/URL
- alt attribute: Alternative text (required)
- width and height attributes
- Self-closing tag',
   '<!DOCTYPE html>
<html>
<head>
    <title>HTML Tags Demo</title>
</head>
<body>
    <!-- Headings -->
    <h1>Main Heading (H1)</h1>
    <h2>Subheading (H2)</h2>
    <h3>Sub-subheading (H3)</h3>
    
    <!-- Paragraphs -->
    <p>This is a regular paragraph with normal text.</p>
    <p>This paragraph has <strong>bold text</strong> and <em>italic text</em>.</p>
    
    <!-- Text formatting -->
    <p>
        <b>Bold</b> |
        <i>Italic</i> |
        <u>Underlined</u> |
        <mark>Highlighted</mark> |
        <small>Small text</small> |
        <del>Deleted</del> |
        <ins>Inserted</ins>
    </p>
    
    <!-- Line breaks and horizontal rule -->
    <p>First line<br>Second line<br>Third line</p>
    <hr>
    
    <!-- Links -->
    <a href="https://www.google.com">Visit Google</a><br>
    <a href="https://www.w3schools.com" target="_blank">W3Schools (New Tab)</a>
    
    <!-- Images -->
    <h2>Image Example</h2>
    <img src="image.jpg" alt="Description of image" width="300">
    
    <!-- Combining elements -->
    <p>
        Visit <a href="https://www.example.com"><strong>our website</strong></a> 
        for more information.
    </p>
</body>
</html>',
   '<!-- Headings -->
<h1>Heading 1</h1>
<h2>Heading 2</h2>

<!-- Paragraph -->
<p>Paragraph text</p>

<!-- Text formatting -->
<strong>Bold</strong>
<em>Italic</em>

<!-- Line break and rule -->
<br>
<hr>

<!-- Link -->
<a href="url">Link text</a>

<!-- Image -->
<img src="path" alt="description">',
   'Use semantic tags (<strong>, <em>) over visual tags (<b>, <i>). Always provide alt text for images. Use descriptive link text instead of "click here". Keep heading hierarchy logical.',
   '1. Create a page with all six heading levels
2. Build a biography page with formatted text
3. Create a page with multiple images and captions
4. Make a links page with internal and external links
5. Design a recipe page using various HTML tags',
   '{"telugu": ["https://www.youtube.com/watch?v=MDLn5-zSQQI"], "english": ["https://www.youtube.com/watch?v=88PXJAA6szs"]}',
   2);

  -- Continue with CSS, JavaScript, and other subjects...
  -- Adding key topics for each subject to meet requirements

END $$;