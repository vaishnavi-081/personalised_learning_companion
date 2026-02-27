DO $$
DECLARE
  css_id UUID;
  js_id UUID;
  c_id UUID;
  cpp_id UUID;
  php_id UUID;
  sql_id UUID;
  ds_id UUID;
  eng_id UUID;
BEGIN
  SELECT id INTO css_id FROM subjects WHERE name = 'CSS';
  SELECT id INTO js_id FROM subjects WHERE name = 'JavaScript';
  SELECT id INTO c_id FROM subjects WHERE name = 'C Programming';
  SELECT id INTO cpp_id FROM subjects WHERE name = 'C++';
  SELECT id INTO php_id FROM subjects WHERE name = 'PHP';
  SELECT id INTO sql_id FROM subjects WHERE name = 'SQL';
  SELECT id INTO ds_id FROM subjects WHERE name = 'Data Structures';
  SELECT id INTO eng_id FROM subjects WHERE name = 'English Communication';

  -- ============================================
  -- CSS TOPICS
  -- ============================================
  
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (css_id, 'beginner', 'CSS Selectors', 'Learn how to select HTML elements',
   'CSS Selectors are patterns used to select and style HTML elements.

Types of Selectors:

1. Universal Selector (*):
   - Selects all elements
   - Used for global styles
   - Example: * { margin: 0; }

2. Element Selector:
   - Selects all elements of a type
   - Uses tag name
   - Example: p { color: blue; }

3. Class Selector (.):
   - Selects elements with specific class
   - Reusable across multiple elements
   - Example: .highlight { background: yellow; }

4. ID Selector (#):
   - Selects element with specific ID
   - Should be unique on page
   - Example: #header { font-size: 24px; }

5. Descendant Selector (space):
   - Selects nested elements
   - Example: div p { color: red; }

6. Child Selector (>):
   - Selects direct children only
   - Example: div > p { margin: 10px; }

7. Attribute Selector:
   - Selects elements with specific attribute
   - Example: input[type="text"] { border: 1px solid; }

8. Pseudo-classes:
   - :hover - Mouse over
   - :active - Being clicked
   - :focus - Has focus
   - :first-child - First child element
   - :last-child - Last child element
   - :nth-child(n) - Nth child element

9. Pseudo-elements:
   - ::before - Insert content before
   - ::after - Insert content after
   - ::first-letter - First letter
   - ::first-line - First line

Selector Specificity:
- Inline styles: Highest priority
- ID selectors: High priority
- Class selectors: Medium priority
- Element selectors: Low priority',
   '/* Universal selector */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Element selector */
p {
    color: #333;
    line-height: 1.6;
}

h1 {
    color: #2563eb;
    font-size: 32px;
}

/* Class selector */
.highlight {
    background-color: yellow;
    padding: 5px;
}

.btn {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
}

/* ID selector */
#header {
    background-color: #f0f0f0;
    padding: 20px;
}

/* Descendant selector */
div p {
    margin-bottom: 10px;
}

/* Child selector */
ul > li {
    list-style-type: square;
}

/* Attribute selector */
input[type="text"] {
    border: 1px solid #ccc;
    padding: 8px;
}

a[target="_blank"] {
    color: red;
}

/* Pseudo-classes */
a:hover {
    color: blue;
    text-decoration: underline;
}

button:active {
    transform: scale(0.95);
}

li:first-child {
    font-weight: bold;
}

li:nth-child(odd) {
    background-color: #f9f9f9;
}

/* Pseudo-elements */
p::first-letter {
    font-size: 2em;
    font-weight: bold;
}

.quote::before {
    content: "❝ ";
}

.quote::after {
    content: " ❞";
}',
   '/* Element selector */
element { property: value; }

/* Class selector */
.classname { property: value; }

/* ID selector */
#idname { property: value; }

/* Descendant selector */
parent child { property: value; }

/* Pseudo-class */
element:hover { property: value; }

/* Pseudo-element */
element::before { property: value; }',
   'Use classes for reusable styles. Use IDs sparingly. Avoid over-specific selectors. Group related selectors together. Use meaningful class names.',
   '1. Style all paragraphs with different colors
2. Create hover effects for links
3. Style odd and even list items differently
4. Use pseudo-elements to add decorative content
5. Create a navigation menu with hover effects',
   '{"telugu": ["https://www.youtube.com/watch?v=Edsxf_NBFrw"], "english": ["https://www.youtube.com/watch?v=1PnVor36_40"]}',
   1),

  (css_id, 'beginner', 'Colors and Fonts', 'Styling text and colors',
   'CSS provides various ways to add colors and style text on web pages.

Color Values:

1. Color Names:
   - 140 predefined names
   - Examples: red, blue, green, white, black

2. Hexadecimal (#RRGGBB):
   - Most common format
   - # followed by 6 hex digits
   - Examples: #FF0000 (red), #00FF00 (green)
   - Short form: #RGB (e.g., #F00 = #FF0000)

3. RGB (Red, Green, Blue):
   - rgb(red, green, blue)
   - Values: 0-255
   - Example: rgb(255, 0, 0) = red

4. RGBA (with Alpha/Opacity):
   - rgba(red, green, blue, alpha)
   - Alpha: 0 (transparent) to 1 (opaque)
   - Example: rgba(255, 0, 0, 0.5)

5. HSL (Hue, Saturation, Lightness):
   - hsl(hue, saturation%, lightness%)
   - Hue: 0-360 (color wheel)
   - Example: hsl(0, 100%, 50%) = red

Font Properties:

1. font-family:
   - Specifies font typeface
   - Use fallback fonts
   - Generic families: serif, sans-serif, monospace

2. font-size:
   - Size of text
   - Units: px, em, rem, %, pt

3. font-weight:
   - Boldness of text
   - Values: normal, bold, 100-900

4. font-style:
   - normal, italic, oblique

5. line-height:
   - Space between lines
   - Improves readability

6. text-align:
   - left, right, center, justify

7. text-decoration:
   - underline, overline, line-through, none

8. text-transform:
   - uppercase, lowercase, capitalize

9. letter-spacing:
   - Space between characters

10. word-spacing:
    - Space between words',
   '/* Color examples */
.color-name {
    color: red;
    background-color: lightblue;
}

.color-hex {
    color: #2563eb;
    background-color: #f0f0f0;
}

.color-rgb {
    color: rgb(37, 99, 235);
    background-color: rgb(240, 240, 240);
}

.color-rgba {
    background-color: rgba(37, 99, 235, 0.3);
}

.color-hsl {
    color: hsl(217, 91%, 60%);
}

/* Font properties */
.heading {
    font-family: "Arial", "Helvetica", sans-serif;
    font-size: 32px;
    font-weight: bold;
    color: #333;
    text-align: center;
}

.paragraph {
    font-family: "Georgia", serif;
    font-size: 16px;
    line-height: 1.6;
    color: #666;
    text-align: justify;
}

.italic-text {
    font-style: italic;
}

.underline-text {
    text-decoration: underline;
}

.uppercase-text {
    text-transform: uppercase;
    letter-spacing: 2px;
}

.monospace {
    font-family: "Courier New", monospace;
    font-size: 14px;
}

/* Web-safe font stack */
body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", 
                 Roboto, "Helvetica Neue", Arial, sans-serif;
}',
   '/* Colors */
color: colorvalue;
background-color: colorvalue;

/* Fonts */
font-family: "Font Name", fallback, generic;
font-size: size;
font-weight: normal | bold | 100-900;
font-style: normal | italic;
line-height: value;
text-align: left | right | center | justify;
text-decoration: none | underline | overline;
text-transform: uppercase | lowercase | capitalize;',
   'Always provide fallback fonts. Use web-safe fonts or Google Fonts. Set line-height for better readability (1.5-1.6). Use relative units (em, rem) for responsive text.',
   '1. Create a colorful heading with gradient background
2. Style a paragraph with custom font and spacing
3. Design a quote block with italic text and special styling
4. Create a button with hover color change
5. Build a text showcase with different font properties',
   '{"telugu": ["https://www.youtube.com/watch?v=wNX7lWzchow"], "english": ["https://www.youtube.com/watch?v=Elg66-ASVXg"]}',
   2);

  -- ============================================
  -- JAVASCRIPT TOPICS
  -- ============================================
  
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (js_id, 'beginner', 'JavaScript Variables', 'Understanding variables and data types',
   'Variables are containers for storing data values in JavaScript.

Variable Declaration:

1. var (old way):
   - Function-scoped
   - Can be redeclared
   - Hoisted to top
   - Avoid using in modern code

2. let (modern way):
   - Block-scoped
   - Cannot be redeclared in same scope
   - Not hoisted
   - Preferred for variables that change

3. const (modern way):
   - Block-scoped
   - Cannot be reassigned
   - Must be initialized
   - Preferred for constants

Data Types in JavaScript:

Primitive Types:

1. Number:
   - Integers and decimals
   - Special values: Infinity, -Infinity, NaN

2. String:
   - Text enclosed in quotes
   - Single, double, or backticks
   - Template literals with backticks

3. Boolean:
   - true or false
   - Used in conditions

4. Undefined:
   - Variable declared but not assigned
   - Default value

5. Null:
   - Intentional absence of value
   - Explicitly set

6. Symbol:
   - Unique identifier
   - Advanced use

7. BigInt:
   - Very large integers
   - Rarely used

Reference Types:

1. Object:
   - Collection of key-value pairs
   - Complex data structure

2. Array:
   - Ordered list of values
   - Special type of object

3. Function:
   - Reusable code block
   - First-class objects

Type Checking:
- typeof operator
- Returns string with type name',
   '// Variable declarations
let name = "John";
const age = 25;
var city = "New York"; // Avoid using var

// Reassignment
name = "Jane"; // OK with let
// age = 26;   // ERROR with const

// Multiple declarations
let x = 5, y = 10, z = 15;

// Number type
let integer = 42;
let decimal = 3.14;
let negative = -10;
let scientific = 2.5e6; // 2500000

// String type
let singleQuote = ''Hello'';
let doubleQuote = "World";
let templateLiteral = `Hello ${name}`; // String interpolation

// Boolean type
let isStudent = true;
let hasLicense = false;

// Undefined and Null
let notAssigned;        // undefined
let emptyValue = null;  // null

// Type checking
console.log(typeof name);      // "string"
console.log(typeof age);       // "number"
console.log(typeof isStudent); // "boolean"
console.log(typeof notAssigned); // "undefined"
console.log(typeof emptyValue);  // "object" (quirk)

// Type conversion
let numString = "123";
let num = Number(numString);    // 123
let str = String(456);          // "456"
let bool = Boolean(1);          // true

// Template literals
let firstName = "John";
let lastName = "Doe";
let fullName = `${firstName} ${lastName}`;
console.log(fullName); // "John Doe"

// Multi-line strings
let message = `This is
a multi-line
string`;',
   '// Variable declaration
let variableName = value;
const constantName = value;

// Data types
let number = 42;
let string = "text";
let boolean = true;
let nothing = null;
let notDefined;

// Type checking
typeof variable

// Template literal
`Text ${variable} more text`',
   'Use const by default, let when value will change. Never use var. Use camelCase for variable names. Choose descriptive names. Constants in UPPERCASE for true constants.',
   '1. Declare variables of different types and log them
2. Create a program using template literals for user greeting
3. Practice type conversion between strings and numbers
4. Build a simple calculator using variables
5. Create variables for personal information and display formatted output',
   '{"telugu": ["https://www.youtube.com/watch?v=W6NZfCO5SIk"], "english": ["https://www.youtube.com/watch?v=W6NZfCO5SIk"]}',
   1);

  -- ============================================
  -- C PROGRAMMING TOPICS
  -- ============================================
  
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (c_id, 'beginner', 'C Programming Basics', 'Introduction to C language',
   'C is a general-purpose, procedural programming language developed by Dennis Ritchie in 1972 at Bell Labs.

Key Features of C:

1. Procedural Language:
   - Follows top-down approach
   - Uses functions
   - Structured programming

2. Low-level Access:
   - Direct memory manipulation
   - Pointers for memory addresses
   - Close to hardware

3. Portable:
   - Code can run on different platforms
   - With minimal modifications
   - Platform-independent

4. Efficient:
   - Fast execution
   - Minimal runtime overhead
   - Compiled language

5. Rich Library:
   - Standard library functions
   - Built-in functions
   - Extensive support

Structure of C Program:

1. Preprocessor Directives:
   - #include statements
   - Header files
   - Macros

2. Main Function:
   - Entry point of program
   - Returns integer
   - Contains program logic

3. Statements:
   - Instructions to execute
   - End with semicolon
   - Sequential execution

4. Comments:
   - Single line: //
   - Multi-line: /* */
   - Documentation

Basic Input/Output:

1. printf():
   - Print output to console
   - Format specifiers
   - %d (int), %f (float), %c (char), %s (string)

2. scanf():
   - Read input from user
   - Requires & operator for variables
   - Format specifiers

Compilation Process:
1. Preprocessing
2. Compilation
3. Assembly
4. Linking',
   '#include <stdio.h>

// Main function
int main() {
    // Print statements
    printf("Hello, World!\\n");
    printf("Welcome to C Programming\\n");
    
    // Variables
    int age = 25;
    float height = 5.9;
    char grade = ''A'';
    
    // Output with format specifiers
    printf("Age: %d\\n", age);
    printf("Height: %.1f feet\\n", height);
    printf("Grade: %c\\n", grade);
    
    // Input from user
    int number;
    printf("Enter a number: ");
    scanf("%d", &number);
    printf("You entered: %d\\n", number);
    
    // Multiple inputs
    char name[50];
    int marks;
    printf("Enter name: ");
    scanf("%s", name);
    printf("Enter marks: ");
    scanf("%d", &marks);
    printf("%s scored %d marks\\n", name, marks);
    
    return 0;
}

/* 
Multi-line comment
This program demonstrates basic C syntax
*/',
   '#include <stdio.h>

int main() {
    // Your code here
    
    return 0;
}

// Print
printf("format", variables);

// Input
scanf("format", &variable);',
   'Every C program must have main() function. Statements end with semicolon. Use & operator with scanf for variables. Include stdio.h for input/output. Return 0 indicates successful execution.',
   '1. Write a program to print your name and age
2. Create a program to take user input and display it
3. Calculate sum of two numbers entered by user
4. Write a program to display student information
5. Create a simple calculator for two numbers',
   '{"telugu": ["https://www.youtube.com/watch?v=irqbmMNs2Bo"], "english": ["https://www.youtube.com/watch?v=KJgsSFOSQv0"]}',
   1);

  -- ============================================
  -- SQL TOPICS
  -- ============================================
  
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (sql_id, 'beginner', 'SQL SELECT Statement', 'Retrieving data from databases',
   'The SELECT statement is used to retrieve data from database tables.

Basic SELECT Syntax:

SELECT column1, column2, ...
FROM table_name;

Key Concepts:

1. SELECT Clause:
   - Specifies columns to retrieve
   - Use * for all columns
   - Can include expressions

2. FROM Clause:
   - Specifies table name
   - Required in SELECT
   - Can join multiple tables

3. Column Selection:
   - Specific columns: SELECT name, age
   - All columns: SELECT *
   - Calculated columns: SELECT price * quantity

4. DISTINCT Keyword:
   - Removes duplicate rows
   - SELECT DISTINCT column
   - Returns unique values only

5. Column Aliases:
   - Rename columns in output
   - AS keyword (optional)
   - SELECT name AS student_name

6. Limiting Results:
   - LIMIT clause (MySQL, PostgreSQL)
   - TOP clause (SQL Server)
   - ROWNUM (Oracle)

Common SELECT Patterns:

1. Select all columns:
   SELECT * FROM table;

2. Select specific columns:
   SELECT col1, col2 FROM table;

3. Select with alias:
   SELECT col AS alias FROM table;

4. Select distinct values:
   SELECT DISTINCT col FROM table;

5. Select with calculation:
   SELECT price * 1.1 AS new_price FROM products;

Best Practices:
- Avoid SELECT * in production
- Use specific column names
- Use aliases for clarity
- Limit results when testing',
   '-- Select all columns from students table
SELECT * FROM students;

-- Select specific columns
SELECT name, age, grade FROM students;

-- Select with alias
SELECT 
    name AS student_name,
    age AS student_age,
    grade AS final_grade
FROM students;

-- Select distinct values
SELECT DISTINCT city FROM students;

-- Select with calculation
SELECT 
    name,
    marks,
    marks * 0.1 AS bonus_marks,
    marks + (marks * 0.1) AS total_marks
FROM students;

-- Select with string concatenation
SELECT 
    first_name || '' '' || last_name AS full_name
FROM employees;

-- Limit results
SELECT * FROM students LIMIT 5;

-- Select with multiple tables (preview)
SELECT 
    students.name,
    courses.course_name
FROM students, courses;

-- Count rows
SELECT COUNT(*) FROM students;

-- Select current date/time
SELECT NOW();
SELECT CURRENT_DATE;',
   '-- Basic SELECT
SELECT column1, column2 FROM table_name;

-- Select all
SELECT * FROM table_name;

-- With alias
SELECT column AS alias FROM table_name;

-- Distinct values
SELECT DISTINCT column FROM table_name;

-- Limit results
SELECT * FROM table_name LIMIT n;',
   'SQL keywords are not case-sensitive but UPPERCASE is convention. Table and column names may be case-sensitive depending on database. Always end statements with semicolon. Use meaningful aliases.',
   '1. Select all records from a products table
2. Select only name and price columns from products
3. Find all unique cities from customers table
4. Calculate discounted price (10% off) for all products
5. Select top 10 highest-paid employees',
   '{"telugu": ["https://www.youtube.com/watch?v=hlGoQC332VM"], "english": ["https://www.youtube.com/watch?v=HXV3zeQKqGY"]}',
   1);

  -- ============================================
  -- DATA STRUCTURES TOPICS
  -- ============================================
  
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (ds_id, 'beginner', 'Arrays', 'Understanding array data structure',
   'An array is a collection of elements stored at contiguous memory locations. It is the simplest data structure where each element can be accessed directly using its index.

Key Concepts:

1. Definition:
   - Fixed-size sequential collection
   - Elements of same data type
   - Indexed from 0 to n-1

2. Characteristics:
   - Random access: O(1) time
   - Fixed size (in most languages)
   - Contiguous memory allocation
   - Cache-friendly

3. Types of Arrays:

   a) One-dimensional Array:
      - Linear sequence of elements
      - Single row or column
      - Example: [1, 2, 3, 4, 5]

   b) Two-dimensional Array:
      - Matrix or table structure
      - Rows and columns
      - Example: [[1,2], [3,4]]

   c) Multi-dimensional Array:
      - 3D or higher dimensions
      - Complex data structures

4. Array Operations:

   a) Traversal:
      - Visit each element
      - Time: O(n)

   b) Insertion:
      - At end: O(1)
      - At beginning/middle: O(n)

   c) Deletion:
      - At end: O(1)
      - At beginning/middle: O(n)

   d) Search:
      - Linear search: O(n)
      - Binary search (sorted): O(log n)

   e) Update:
      - Direct access: O(1)

5. Advantages:
   - Fast access using index
   - Simple to implement
   - Cache-friendly
   - Memory efficient

6. Disadvantages:
   - Fixed size
   - Insertion/deletion expensive
   - Wasted space if not full

Applications:
- Storing lists of items
- Implementing other data structures
- Matrix operations
- Lookup tables
- Buffers',
   '// C language array examples
#include <stdio.h>

int main() {
    // Array declaration and initialization
    int numbers[5] = {10, 20, 30, 40, 50};
    
    // Accessing elements
    printf("First element: %d\\n", numbers[0]);
    printf("Third element: %d\\n", numbers[2]);
    
    // Modifying elements
    numbers[1] = 25;
    printf("Modified second element: %d\\n", numbers[1]);
    
    // Array traversal
    printf("All elements: ");
    for(int i = 0; i < 5; i++) {
        printf("%d ", numbers[i]);
    }
    printf("\\n");
    
    // Finding sum
    int sum = 0;
    for(int i = 0; i < 5; i++) {
        sum += numbers[i];
    }
    printf("Sum: %d\\n", sum);
    
    // Finding maximum
    int max = numbers[0];
    for(int i = 1; i < 5; i++) {
        if(numbers[i] > max) {
            max = numbers[i];
        }
    }
    printf("Maximum: %d\\n", max);
    
    // Two-dimensional array
    int matrix[3][3] = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    };
    
    // Accessing 2D array
    printf("Element at [1][2]: %d\\n", matrix[1][2]);
    
    // 2D array traversal
    printf("Matrix:\\n");
    for(int i = 0; i < 3; i++) {
        for(int j = 0; j < 3; j++) {
            printf("%d ", matrix[i][j]);
        }
        printf("\\n");
    }
    
    return 0;
}',
   '// Array declaration
dataType arrayName[size];

// With initialization
dataType arrayName[size] = {val1, val2, ...};

// Access element
arrayName[index]

// 2D array
dataType arrayName[rows][cols];',
   'Array index starts at 0. Accessing out-of-bounds index causes undefined behavior. Size must be known at compile time (in C). Use loops for array operations.',
   '1. Create an array and find the sum of all elements
2. Find the largest and smallest elements in an array
3. Reverse an array
4. Search for an element in an array
5. Implement a 2D array and find sum of each row',
   '{"telugu": ["https://www.youtube.com/watch?v=AT14lCXuMKI"], "english": ["https://www.youtube.com/watch?v=55l-aZ7_F24"]}',
   1);

  -- ============================================
  -- ENGLISH COMMUNICATION TOPICS
  -- ============================================
  
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (eng_id, 'beginner', 'Grammar Basics', 'Foundation of English grammar',
   'English grammar is the set of structural rules that govern the composition of sentences, phrases, and words in the English language.

Parts of Speech:

1. Noun:
   - Person, place, thing, or idea
   - Types: Common, Proper, Abstract, Collective
   - Examples: dog, London, happiness, team

2. Pronoun:
   - Replaces a noun
   - Types: Personal, Possessive, Reflexive
   - Examples: he, she, it, they, mine, himself

3. Verb:
   - Action or state of being
   - Types: Action, Linking, Helping
   - Examples: run, is, have, will

4. Adjective:
   - Describes a noun
   - Answers: which, what kind, how many
   - Examples: beautiful, three, red

5. Adverb:
   - Modifies verb, adjective, or adverb
   - Often ends in -ly
   - Examples: quickly, very, well

6. Preposition:
   - Shows relationship between words
   - Examples: in, on, at, by, with

7. Conjunction:
   - Connects words or clauses
   - Types: Coordinating, Subordinating
   - Examples: and, but, or, because

8. Interjection:
   - Expresses emotion
   - Examples: Oh!, Wow!, Ouch!

Sentence Structure:

1. Subject:
   - Who or what the sentence is about
   - Performs the action

2. Predicate:
   - What the subject does
   - Contains the verb

3. Object:
   - Receives the action
   - Direct or indirect

Basic Sentence Patterns:

1. Subject + Verb
   - Example: Birds fly.

2. Subject + Verb + Object
   - Example: She reads books.

3. Subject + Verb + Complement
   - Example: He is happy.

4. Subject + Verb + Indirect Object + Direct Object
   - Example: I gave him a gift.

Articles:

1. Definite Article (the):
   - Specific noun
   - Example: the book

2. Indefinite Articles (a, an):
   - Non-specific noun
   - a: before consonant sounds
   - an: before vowel sounds',
   'Parts of Speech Examples:

1. Nouns:
   - The cat is sleeping. (common noun)
   - I live in Mumbai. (proper noun)
   - Love is beautiful. (abstract noun)

2. Pronouns:
   - He is my friend.
   - This is mine.
   - She hurt herself.

3. Verbs:
   - I run every morning. (action)
   - She is a teacher. (linking)
   - They have finished. (helping)

4. Adjectives:
   - The red car is fast.
   - She bought three apples.
   - It was a beautiful day.

5. Adverbs:
   - He runs quickly.
   - She is very smart.
   - They arrived yesterday.

6. Prepositions:
   - The book is on the table.
   - She arrived at 5 PM.
   - He went to school.

7. Conjunctions:
   - I like tea and coffee.
   - She is tired but happy.
   - He stayed home because it rained.

Sentence Examples:

Simple Sentences:
- The dog barks.
- Children play.
- She sings beautifully.

Complete Sentences:
- The teacher explains the lesson clearly.
- My brother bought a new car yesterday.
- Students are studying in the library.

Article Usage:
- I saw a cat. (any cat)
- The cat is black. (specific cat)
- She is an engineer. (profession)
- The sun rises in the east. (unique)',
   'Sentence Structure:
Subject + Verb + Object

Articles:
a/an - indefinite
the - definite

Parts of Speech:
Noun - person/place/thing
Verb - action/state
Adjective - describes noun
Adverb - modifies verb',
   'Every sentence needs a subject and verb. Use capital letters for proper nouns and sentence beginnings. End sentences with proper punctuation. Subject and verb must agree in number.',
   '1. Identify parts of speech in given sentences
2. Write 10 sentences using different sentence patterns
3. Practice using articles correctly in sentences
4. Create sentences with all parts of speech
5. Correct grammatical errors in sample sentences',
   '{"telugu": [], "english": ["https://www.youtube.com/watch?v=Rp3LqMYBhkQ", "https://www.youtube.com/watch?v=YMEYRk0VKjY"]}',
   1);

END $$;