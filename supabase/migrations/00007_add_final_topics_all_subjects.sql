DO $$
DECLARE
  cpp_id UUID;
  php_id UUID;
  ds_id UUID;
  eng_id UUID;
  html_id UUID;
  css_id UUID;
BEGIN
  SELECT id INTO cpp_id FROM subjects WHERE name = 'C++';
  SELECT id INTO php_id FROM subjects WHERE name = 'PHP';
  SELECT id INTO ds_id FROM subjects WHERE name = 'Data Structures';
  SELECT id INTO eng_id FROM subjects WHERE name = 'English Communication';
  SELECT id INTO html_id FROM subjects WHERE name = 'HTML';
  SELECT id INTO css_id FROM subjects WHERE name = 'CSS';

  -- ============================================
  -- C++ TOPICS
  -- ============================================
  
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (cpp_id, 'beginner', 'C++ Basics', 'Introduction to C++ programming',
   'C++ is a general-purpose programming language created as an extension of C with object-oriented features.

Key Features:

1. Object-Oriented:
   - Classes and objects
   - Inheritance, polymorphism
   - Encapsulation

2. Low-level Manipulation:
   - Pointers and references
   - Memory management
   - Direct hardware access

3. Standard Template Library (STL):
   - Containers (vector, map, set)
   - Algorithms
   - Iterators

4. Performance:
   - Compiled language
   - Fast execution
   - Efficient memory usage

Basic Structure:

1. Preprocessor Directives:
   - #include <iostream>
   - Header files

2. Namespace:
   - using namespace std;
   - Avoids std:: prefix

3. Main Function:
   - Entry point
   - Returns int

4. Input/Output:
   - cout: Output stream
   - cin: Input stream
   - << and >> operators

Differences from C:
- Classes and objects
- Function overloading
- References
- Better type checking
- STL library',
   '#include <iostream>
using namespace std;

int main() {
    // Output
    cout << "Hello, World!" << endl;
    cout << "Welcome to C++" << endl;
    
    // Variables
    int age = 25;
    double height = 5.9;
    char grade = ''A'';
    string name = "John";
    
    // Output with variables
    cout << "Name: " << name << endl;
    cout << "Age: " << age << endl;
    cout << "Height: " << height << endl;
    cout << "Grade: " << grade << endl;
    
    // Input
    int number;
    cout << "Enter a number: ";
    cin >> number;
    cout << "You entered: " << number << endl;
    
    // Multiple inputs
    string firstName, lastName;
    cout << "Enter first name: ";
    cin >> firstName;
    cout << "Enter last name: ";
    cin >> lastName;
    cout << "Full name: " << firstName << " " << lastName << endl;
    
    // Arithmetic operations
    int a = 10, b = 5;
    cout << "Sum: " << (a + b) << endl;
    cout << "Difference: " << (a - b) << endl;
    cout << "Product: " << (a * b) << endl;
    cout << "Quotient: " << (a / b) << endl;
    
    return 0;
}',
   '#include <iostream>
using namespace std;

int main() {
    // Output
    cout << "text" << variable << endl;
    
    // Input
    cin >> variable;
    
    return 0;
}',
   'Use endl or \\n for new line. Include <string> for string type. cin stops at whitespace. Use getline() for full line input. Always return 0 from main.',
   '1. Write a program to print your name and age
2. Create a program to take user input and display it
3. Calculate area of rectangle using user input
4. Build a simple calculator for two numbers
5. Create a program to swap two numbers',
   '{"telugu": ["https://www.youtube.com/watch?v=yGB9jhsEsr8"], "english": ["https://www.youtube.com/watch?v=vLnPwxZdW4Y"]}',
   1),

  (cpp_id, 'intermediate', 'Classes and Objects', 'OOP fundamentals in C++',
   'Classes and Objects are the foundation of Object-Oriented Programming in C++.

Key Concepts:

1. Class:
   - User-defined data type
   - Blueprint for objects
   - Contains data members and member functions

2. Object:
   - Instance of a class
   - Has its own copy of data members
   - Can call member functions

3. Access Specifiers:
   - private: Accessible only within class
   - public: Accessible from anywhere
   - protected: Accessible in class and derived classes

4. Constructor:
   - Special member function
   - Same name as class
   - No return type
   - Called automatically when object is created

5. Destructor:
   - Special member function
   - Name: ~ClassName
   - Called when object is destroyed
   - Cleanup resources

6. Member Functions:
   - Functions inside class
   - Can be defined inside or outside class
   - Access class members

7. this Pointer:
   - Points to current object
   - Used to access members
   - Implicit parameter

Benefits:
- Data encapsulation
- Code organization
- Reusability
- Abstraction',
   '#include <iostream>
#include <string>
using namespace std;

class Student {
private:
    string name;
    int age;
    double gpa;

public:
    // Constructor
    Student(string n, int a, double g) {
        name = n;
        age = a;
        gpa = g;
        cout << "Student object created" << endl;
    }
    
    // Destructor
    ~Student() {
        cout << "Student object destroyed" << endl;
    }
    
    // Getter methods
    string getName() {
        return name;
    }
    
    int getAge() {
        return age;
    }
    
    double getGpa() {
        return gpa;
    }
    
    // Setter methods
    void setGpa(double g) {
        if(g >= 0 && g <= 4.0) {
            gpa = g;
        }
    }
    
    // Display method
    void displayInfo() {
        cout << "Name: " << name << endl;
        cout << "Age: " << age << endl;
        cout << "GPA: " << gpa << endl;
    }
    
    // Check honor roll
    bool isHonorRoll() {
        return gpa >= 3.5;
    }
};

int main() {
    // Creating objects
    Student s1("Alice", 20, 3.8);
    Student s2("Bob", 21, 3.2);
    
    // Using methods
    s1.displayInfo();
    cout << "Honor Roll: " << (s1.isHonorRoll() ? "Yes" : "No") << endl;
    
    cout << endl;
    
    s2.displayInfo();
    s2.setGpa(3.9);
    cout << "Updated GPA: " << s2.getGpa() << endl;
    
    return 0;
}',
   'class ClassName {
private:
    // Private members
    dataType member;

public:
    // Constructor
    ClassName(parameters) {
        // Initialize
    }
    
    // Destructor
    ~ClassName() {
        // Cleanup
    }
    
    // Member functions
    returnType functionName() {
        // Function body
    }
};

// Creating object
ClassName obj(arguments);',
   'Use private for data members. Provide public getters/setters. Initialize members in constructor. Use const for methods that don''t modify object. Follow naming conventions.',
   '1. Create a BankAccount class with deposit/withdraw methods
2. Implement a Rectangle class with area and perimeter methods
3. Build a Book class with borrowing functionality
4. Create an Employee class with salary calculation
5. Design a Car class with start/stop methods',
   '{"telugu": ["https://www.youtube.com/watch?v=1v_4dL8l8pQ"], "english": ["https://www.youtube.com/watch?v=wN0x9eZLix4"]}',
   1),

  (cpp_id, 'expert', 'Standard Template Library', 'Using STL containers and algorithms',
   'The Standard Template Library (STL) is a powerful set of C++ template classes providing common data structures and algorithms.

Main Components:

1. Containers:
   - Store collections of objects
   - Different types for different needs

2. Iterators:
   - Access container elements
   - Similar to pointers
   - Used with algorithms

3. Algorithms:
   - Common operations
   - Work with iterators
   - Generic implementations

Common Containers:

1. vector:
   - Dynamic array
   - Random access
   - Fast insertion at end

2. list:
   - Doubly linked list
   - Fast insertion/deletion
   - No random access

3. map:
   - Key-value pairs
   - Sorted by key
   - Unique keys

4. set:
   - Unique elements
   - Sorted
   - Fast lookup

5. stack:
   - LIFO structure
   - push, pop, top

6. queue:
   - FIFO structure
   - push, pop, front

Common Algorithms:
- sort(): Sort elements
- find(): Search element
- reverse(): Reverse order
- count(): Count occurrences
- max_element(): Find maximum',
   '#include <iostream>
#include <vector>
#include <map>
#include <set>
#include <algorithm>
using namespace std;

int main() {
    // Vector
    vector<int> numbers;
    numbers.push_back(10);
    numbers.push_back(20);
    numbers.push_back(30);
    
    cout << "Vector elements: ";
    for(int num : numbers) {
        cout << num << " ";
    }
    cout << endl;
    
    // Sorting
    vector<int> nums = {5, 2, 8, 1, 9};
    sort(nums.begin(), nums.end());
    cout << "Sorted: ";
    for(int n : nums) {
        cout << n << " ";
    }
    cout << endl;
    
    // Map
    map<string, int> ages;
    ages["Alice"] = 25;
    ages["Bob"] = 30;
    ages["Charlie"] = 28;
    
    cout << "Ages:" << endl;
    for(auto pair : ages) {
        cout << pair.first << ": " << pair.second << endl;
    }
    
    // Set
    set<int> uniqueNums;
    uniqueNums.insert(5);
    uniqueNums.insert(2);
    uniqueNums.insert(5); // Duplicate ignored
    uniqueNums.insert(8);
    
    cout << "Set elements: ";
    for(int n : uniqueNums) {
        cout << n << " ";
    }
    cout << endl;
    
    // Find algorithm
    vector<int> data = {1, 2, 3, 4, 5};
    auto it = find(data.begin(), data.end(), 3);
    if(it != data.end()) {
        cout << "Found: " << *it << endl;
    }
    
    return 0;
}',
   '// Vector
#include <vector>
vector<type> vec;
vec.push_back(value);

// Map
#include <map>
map<keyType, valueType> m;
m[key] = value;

// Set
#include <set>
set<type> s;
s.insert(value);

// Algorithms
#include <algorithm>
sort(begin, end);
find(begin, end, value);',
   'Include appropriate headers. Use auto for iterator types. Prefer range-based for loops. Use emplace_back() instead of push_back() for efficiency. Check iterator validity.',
   '1. Create a vector and perform various operations
2. Use map to store student grades
3. Implement a set to remove duplicates from array
4. Sort a vector of custom objects
5. Use STL algorithms to find min/max elements',
   '{"telugu": ["https://www.youtube.com/watch?v=RRVYpIET_RU"], "english": ["https://www.youtube.com/watch?v=g-1Cn3ccwXY"]}',
   1);

  -- ============================================
  -- PHP TOPICS
  -- ============================================
  
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (php_id, 'beginner', 'PHP Basics', 'Introduction to PHP programming',
   'PHP (Hypertext Preprocessor) is a server-side scripting language designed for web development.

Key Features:

1. Server-Side:
   - Runs on web server
   - Generates dynamic content
   - Processes before sending to browser

2. Easy to Learn:
   - Simple syntax
   - Similar to C
   - Beginner-friendly

3. Database Integration:
   - MySQL, PostgreSQL
   - Easy database operations
   - Built-in functions

4. Cross-Platform:
   - Works on Windows, Linux, Mac
   - Most web servers support it
   - Portable code

Basic Syntax:

1. PHP Tags:
   - <?php ... ?>
   - Code must be inside tags
   - Can mix with HTML

2. Variables:
   - Start with $
   - No declaration needed
   - Dynamically typed

3. Echo/Print:
   - Output to browser
   - echo: No return value
   - print: Returns 1

4. Comments:
   - Single line: //
   - Multi-line: /* */
   - Shell style: #

5. Data Types:
   - String, Integer, Float
   - Boolean, Array, Object
   - NULL

File Extension:
- .php files
- Processed by PHP engine
- Can contain HTML, CSS, JavaScript',
   '<?php
// Basic output
echo "Hello, World!";
echo "<br>";
print "Welcome to PHP";

// Variables
$name = "John";
$age = 25;
$height = 5.9;
$isStudent = true;

// Output with variables
echo "<h2>Student Information</h2>";
echo "Name: " . $name . "<br>";
echo "Age: " . $age . "<br>";
echo "Height: " . $height . " feet<br>";

// String concatenation
$firstName = "John";
$lastName = "Doe";
$fullName = $firstName . " " . $lastName;
echo "Full Name: " . $fullName . "<br>";

// Arithmetic operations
$a = 10;
$b = 5;
echo "Sum: " . ($a + $b) . "<br>";
echo "Difference: " . ($a - $b) . "<br>";
echo "Product: " . ($a * $b) . "<br>";
echo "Quotient: " . ($a / $b) . "<br>";

// Constants
define("SITE_NAME", "My Website");
echo "Welcome to " . SITE_NAME . "<br>";

// Arrays
$fruits = array("Apple", "Banana", "Orange");
echo "First fruit: " . $fruits[0] . "<br>";

// Associative array
$person = array(
    "name" => "Alice",
    "age" => 30,
    "city" => "New York"
);
echo "Person: " . $person["name"] . "<br>";
?>',
   '<?php
// Output
echo "text";
print "text";

// Variables
$variableName = value;

// Concatenation
$result = $str1 . $str2;

// Constants
define("NAME", value);

// Arrays
$arr = array(val1, val2);
$assoc = array("key" => "value");
?>',
   'PHP code must be inside <?php ?> tags. Variables start with $. Use . for string concatenation. Statements end with semicolon. Case-sensitive for variables.',
   '1. Create a PHP page that displays your personal information
2. Write a program to calculate sum of two numbers
3. Create an array of your favorite movies and display them
4. Build a simple calculator using PHP
5. Create a page that displays current date and time',
   '{"telugu": ["https://www.youtube.com/watch?v=1SnPKhCdlsU"], "english": ["https://www.youtube.com/watch?v=OK_JCtrrv-c"]}',
   1),

  (php_id, 'intermediate', 'PHP Forms and Sessions', 'Handling user input and sessions',
   'PHP provides powerful features for handling form data and maintaining user sessions.

Form Handling:

1. Form Methods:
   - GET: Data in URL
   - POST: Data in request body
   - POST preferred for sensitive data

2. Superglobals:
   - $_GET: GET data
   - $_POST: POST data
   - $_REQUEST: Both GET and POST
   - $_SERVER: Server information

3. Form Validation:
   - Check if fields are empty
   - Validate data types
   - Sanitize input
   - Prevent SQL injection

4. Form Security:
   - htmlspecialchars(): Prevent XSS
   - filter_var(): Validate/sanitize
   - prepared statements: Prevent SQL injection

Sessions:

1. What are Sessions:
   - Store user data across pages
   - Server-side storage
   - Unique session ID

2. Session Functions:
   - session_start(): Start session
   - $_SESSION: Session array
   - session_destroy(): End session

3. Common Uses:
   - User login
   - Shopping cart
   - User preferences
   - Multi-page forms

Cookies:
- Client-side storage
- setcookie(): Create cookie
- $_COOKIE: Access cookies
- Expire time setting',
   '<?php
// Form handling
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST["name"];
    $email = $_POST["email"];
    $age = $_POST["age"];
    
    // Validation
    if (empty($name)) {
        echo "Name is required<br>";
    }
    
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Invalid email format<br>";
    }
    
    if (!is_numeric($age)) {
        echo "Age must be a number<br>";
    }
    
    // Sanitize
    $name = htmlspecialchars($name);
    $email = filter_var($email, FILTER_SANITIZE_EMAIL);
    
    echo "Name: " . $name . "<br>";
    echo "Email: " . $email . "<br>";
    echo "Age: " . $age . "<br>";
}
?>

<form method="post" action="<?php echo $_SERVER[''PHP_SELF'']; ?>">
    Name: <input type="text" name="name"><br>
    Email: <input type="email" name="email"><br>
    Age: <input type="number" name="age"><br>
    <input type="submit" value="Submit">
</form>

<?php
// Session example
session_start();

// Set session variables
$_SESSION["username"] = "john_doe";
$_SESSION["email"] = "john@example.com";

// Access session variables
echo "Username: " . $_SESSION["username"] . "<br>";

// Check if session exists
if (isset($_SESSION["username"])) {
    echo "User is logged in<br>";
}

// Destroy session
// session_destroy();

// Cookie example
setcookie("user", "John", time() + (86400 * 30), "/");

if (isset($_COOKIE["user"])) {
    echo "User cookie: " . $_COOKIE["user"];
}
?>',
   '// Form handling
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $var = $_POST["fieldname"];
}

// Validation
if (empty($var)) { }
filter_var($var, FILTER_VALIDATE_EMAIL);

// Sessions
session_start();
$_SESSION["key"] = value;

// Cookies
setcookie("name", "value", expire);
$_COOKIE["name"]',
   'Always validate and sanitize user input. Use POST for sensitive data. Start session before any output. Use htmlspecialchars() to prevent XSS. Check if form is submitted before processing.',
   '1. Create a registration form with validation
2. Build a login system using sessions
3. Create a multi-page form using sessions
4. Implement a simple shopping cart
5. Build a contact form with email validation',
   '{"telugu": ["https://www.youtube.com/watch?v=1SnPKhCdlsU"], "english": ["https://www.youtube.com/watch?v=1SnPKhCdlsU"]}',
   1);

  -- Add more intermediate/expert topics for Data Structures and English
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (ds_id, 'intermediate', 'Stack Data Structure', 'LIFO data structure implementation',
   'A Stack is a linear data structure that follows the Last In First Out (LIFO) principle.

Key Concepts:

1. LIFO Principle:
   - Last element added is first to be removed
   - Like a stack of plates
   - Top element is accessible

2. Basic Operations:

   a) Push:
      - Add element to top
      - Time complexity: O(1)
      - Increases size

   b) Pop:
      - Remove top element
      - Time complexity: O(1)
      - Decreases size

   c) Peek/Top:
      - View top element
      - Does not remove
      - Time complexity: O(1)

   d) isEmpty:
      - Check if stack is empty
      - Returns boolean
      - Time complexity: O(1)

3. Implementation Methods:

   a) Array-based:
      - Fixed size
      - Simple implementation
      - May waste space

   b) Linked List-based:
      - Dynamic size
      - No size limit
      - Extra memory for pointers

4. Applications:
   - Function call management
   - Expression evaluation
   - Undo/Redo operations
   - Browser back button
   - Syntax parsing
   - Backtracking algorithms

5. Advantages:
   - Simple operations
   - Fast access to top
   - Memory efficient

6. Disadvantages:
   - Limited access (only top)
   - Fixed size (array implementation)
   - No random access',
   '#include <stdio.h>
#include <stdlib.h>
#define MAX 100

// Array-based stack
typedef struct {
    int items[MAX];
    int top;
} Stack;

// Initialize stack
void initStack(Stack* s) {
    s->top = -1;
}

// Check if empty
int isEmpty(Stack* s) {
    return s->top == -1;
}

// Check if full
int isFull(Stack* s) {
    return s->top == MAX - 1;
}

// Push operation
void push(Stack* s, int value) {
    if (isFull(s)) {
        printf("Stack Overflow\\n");
        return;
    }
    s->items[++(s->top)] = value;
    printf("Pushed: %d\\n", value);
}

// Pop operation
int pop(Stack* s) {
    if (isEmpty(s)) {
        printf("Stack Underflow\\n");
        return -1;
    }
    return s->items[(s->top)--];
}

// Peek operation
int peek(Stack* s) {
    if (isEmpty(s)) {
        printf("Stack is empty\\n");
        return -1;
    }
    return s->items[s->top];
}

// Display stack
void display(Stack* s) {
    if (isEmpty(s)) {
        printf("Stack is empty\\n");
        return;
    }
    printf("Stack elements: ");
    for (int i = 0; i <= s->top; i++) {
        printf("%d ", s->items[i]);
    }
    printf("\\n");
}

int main() {
    Stack s;
    initStack(&s);
    
    push(&s, 10);
    push(&s, 20);
    push(&s, 30);
    display(&s);
    
    printf("Top element: %d\\n", peek(&s));
    printf("Popped: %d\\n", pop(&s));
    display(&s);
    
    return 0;
}',
   '// Stack operations
push(value)    // Add to top
pop()          // Remove from top
peek()         // View top
isEmpty()      // Check if empty

// Time complexities
Push:  O(1)
Pop:   O(1)
Peek:  O(1)',
   'Always check for overflow before push. Always check for underflow before pop. Top pointer points to last inserted element. Initialize top to -1 for empty stack.',
   '1. Implement a stack using array
2. Implement a stack using linked list
3. Check for balanced parentheses using stack
4. Reverse a string using stack
5. Implement two stacks in one array',
   '{"telugu": ["https://www.youtube.com/watch?v=I5lq6sCuABE"], "english": ["https://www.youtube.com/watch?v=F1F2imiOJfk"]}',
   1),

  (eng_id, 'intermediate', 'Vocabulary Building', 'Expanding your word knowledge',
   'Vocabulary is the foundation of effective communication. A rich vocabulary helps express ideas clearly and understand others better.

Why Vocabulary Matters:

1. Better Communication:
   - Express ideas precisely
   - Understand complex texts
   - Avoid repetition

2. Professional Success:
   - Impress in interviews
   - Write better emails
   - Communicate with confidence

3. Academic Achievement:
   - Understand lectures
   - Write better essays
   - Score higher on tests

Vocabulary Learning Strategies:

1. Read Regularly:
   - Books, newspapers, articles
   - Note unfamiliar words
   - Understand context

2. Use New Words:
   - Practice in sentences
   - Use in conversations
   - Write with new words

3. Word Associations:
   - Connect to known words
   - Create mental images
   - Use mnemonics

4. Learn Word Families:
   - Root words
   - Prefixes and suffixes
   - Related words

5. Context Clues:
   - Understand from context
   - Look for definitions
   - Use surrounding words

Common Word Categories:

1. Synonyms:
   - Words with similar meanings
   - Happy: joyful, cheerful, delighted
   - Big: large, huge, enormous

2. Antonyms:
   - Words with opposite meanings
   - Hot ↔ Cold
   - Fast ↔ Slow

3. Homophones:
   - Same sound, different meaning
   - Their/There/They''re
   - To/Too/Two

4. Collocations:
   - Words that go together
   - Make a decision
   - Take a break
   - Do homework',
   'Common Vocabulary Examples:

1. Everyday Words:
   - Essential: absolutely necessary
   - Significant: important, meaningful
   - Adequate: sufficient, enough
   - Efficient: productive, effective
   - Relevant: connected, applicable

2. Academic Words:
   - Analyze: examine in detail
   - Evaluate: assess, judge
   - Demonstrate: show, prove
   - Interpret: explain meaning
   - Synthesize: combine elements

3. Business Words:
   - Collaborate: work together
   - Implement: put into action
   - Negotiate: discuss to reach agreement
   - Prioritize: arrange by importance
   - Delegate: assign tasks

4. Descriptive Words:
   - Ambitious: having strong desire to succeed
   - Diligent: hardworking, careful
   - Innovative: creative, original
   - Meticulous: very careful, precise
   - Versatile: adaptable, flexible

5. Action Words:
   - Accomplish: achieve, complete
   - Enhance: improve, increase
   - Facilitate: make easier
   - Maintain: keep in good condition
   - Optimize: make most effective

Practice Sentences:

1. It is essential to practice English daily.
2. She demonstrated excellent leadership skills.
3. The team collaborated on the project.
4. He is a diligent student who studies regularly.
5. We need to prioritize our tasks effectively.

Word Families:

1. Create (verb)
   - Creation (noun)
   - Creative (adjective)
   - Creatively (adverb)
   - Creator (noun)

2. Communicate (verb)
   - Communication (noun)
   - Communicative (adjective)
   - Communicator (noun)',
   'Vocabulary Learning Tips:

1. Learn in context
2. Use flashcards
3. Practice daily
4. Read extensively
5. Keep a vocabulary journal
6. Use apps and tools
7. Learn word roots
8. Practice with native speakers',
   'Learn 5-10 new words daily. Use new words in sentences immediately. Review regularly to retain. Focus on words relevant to your goals. Don''t just memorize, understand usage.',
   '1. Create a personal vocabulary journal
2. Learn 10 new words and use them in sentences
3. Find synonyms for common words you use
4. Practice word families (create, creation, creative)
5. Write a paragraph using 5 new vocabulary words',
   '{"telugu": [], "english": ["https://www.youtube.com/watch?v=IzuHmAkq7e4", "https://www.youtube.com/watch?v=Z-zNHHpXoMM"]}',
   1);

  -- Add HTML intermediate topic
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (html_id, 'intermediate', 'HTML Forms', 'Creating interactive forms',
   'HTML Forms are used to collect user input and send data to a server for processing.

Form Elements:

1. <form> Tag:
   - Container for form elements
   - action: Where to send data
   - method: GET or POST
   - Attributes: name, id

2. <input> Tag:
   - Most versatile form element
   - type attribute determines behavior
   - Common types:
     * text: Single-line text
     * password: Hidden text
     * email: Email validation
     * number: Numeric input
     * date: Date picker
     * checkbox: Multiple selections
     * radio: Single selection
     * submit: Submit button
     * reset: Reset form

3. <textarea>:
   - Multi-line text input
   - rows and cols attributes
   - For longer text

4. <select> and <option>:
   - Dropdown list
   - Multiple options
   - selected attribute for default

5. <button>:
   - Clickable button
   - type: submit, reset, button
   - Can contain HTML

6. <label>:
   - Label for input
   - for attribute links to input id
   - Improves accessibility

Form Attributes:

1. name:
   - Identifies form data
   - Required for submission
   - Used in server-side processing

2. value:
   - Default or current value
   - Submitted with form

3. placeholder:
   - Hint text
   - Disappears on input

4. required:
   - Makes field mandatory
   - HTML5 validation

5. disabled:
   - Disables input
   - Not submitted

6. readonly:
   - Cannot be modified
   - Still submitted',
   '<!DOCTYPE html>
<html>
<head>
    <title>Registration Form</title>
</head>
<body>
    <h2>Student Registration Form</h2>
    
    <form action="/submit" method="post">
        <!-- Text input -->
        <label for="name">Full Name:</label>
        <input type="text" id="name" name="name" required>
        <br><br>
        
        <!-- Email input -->
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <br><br>
        
        <!-- Password input -->
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <br><br>
        
        <!-- Number input -->
        <label for="age">Age:</label>
        <input type="number" id="age" name="age" min="18" max="100">
        <br><br>
        
        <!-- Radio buttons -->
        <label>Gender:</label>
        <input type="radio" id="male" name="gender" value="male">
        <label for="male">Male</label>
        <input type="radio" id="female" name="gender" value="female">
        <label for="female">Female</label>
        <br><br>
        
        <!-- Checkboxes -->
        <label>Interests:</label><br>
        <input type="checkbox" id="sports" name="interests" value="sports">
        <label for="sports">Sports</label><br>
        <input type="checkbox" id="music" name="interests" value="music">
        <label for="music">Music</label><br>
        <input type="checkbox" id="reading" name="interests" value="reading">
        <label for="reading">Reading</label>
        <br><br>
        
        <!-- Dropdown -->
        <label for="country">Country:</label>
        <select id="country" name="country">
            <option value="">Select Country</option>
            <option value="india">India</option>
            <option value="usa">USA</option>
            <option value="uk">UK</option>
        </select>
        <br><br>
        
        <!-- Textarea -->
        <label for="message">Message:</label><br>
        <textarea id="message" name="message" rows="4" cols="50"></textarea>
        <br><br>
        
        <!-- Submit button -->
        <button type="submit">Register</button>
        <button type="reset">Reset</button>
    </form>
</body>
</html>',
   '<form action="url" method="post">
    <label for="id">Label:</label>
    <input type="text" id="id" name="name" required>
    
    <input type="email" name="email">
    <input type="password" name="password">
    <input type="number" name="age">
    
    <input type="radio" name="group" value="val">
    <input type="checkbox" name="item" value="val">
    
    <select name="dropdown">
        <option value="val">Text</option>
    </select>
    
    <textarea name="text" rows="4"></textarea>
    
    <button type="submit">Submit</button>
</form>',
   'Always use labels for accessibility. Use appropriate input types for validation. Include name attribute for all inputs. Use required for mandatory fields. Test forms before deployment.',
   '1. Create a contact form with name, email, and message
2. Build a survey form with various input types
3. Create a login form with username and password
4. Design a job application form
5. Build a feedback form with rating system',
   '{"telugu": ["https://www.youtube.com/watch?v=fNcJuPIZ2WE"], "english": ["https://www.youtube.com/watch?v=fNcJuPIZ2WE"]}',
   1);

  -- Add CSS expert topic
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (css_id, 'expert', 'CSS Animations', 'Creating smooth animations',
   'CSS Animations allow you to animate transitions between CSS styles without JavaScript.

Key Concepts:

1. Transitions:
   - Smooth change between states
   - Triggered by state change
   - Simple animations

2. Keyframe Animations:
   - Complex animations
   - Multiple steps
   - More control

Transition Properties:

1. transition-property:
   - Which property to animate
   - all, specific property

2. transition-duration:
   - How long animation takes
   - Seconds (s) or milliseconds (ms)

3. transition-timing-function:
   - Speed curve
   - ease, linear, ease-in, ease-out

4. transition-delay:
   - Wait before starting
   - Seconds or milliseconds

Keyframe Animations:

1. @keyframes:
   - Define animation steps
   - from/to or percentages
   - Multiple properties

2. animation-name:
   - Name of keyframes
   - Links to @keyframes

3. animation-duration:
   - Length of animation
   - Required property

4. animation-timing-function:
   - Speed curve
   - Same as transitions

5. animation-delay:
   - Wait before starting

6. animation-iteration-count:
   - How many times
   - Number or infinite

7. animation-direction:
   - normal, reverse, alternate

Transform Properties:
- translate(): Move
- rotate(): Rotate
- scale(): Resize
- skew(): Skew',
   '/* Transitions */
.button {
    background-color: #2563eb;
    color: white;
    padding: 10px 20px;
    border: none;
    transition: all 0.3s ease;
}

.button:hover {
    background-color: #1d4ed8;
    transform: scale(1.05);
}

/* Multiple transitions */
.box {
    width: 100px;
    height: 100px;
    background: red;
    transition: width 0.5s, height 0.5s, background 0.5s;
}

.box:hover {
    width: 150px;
    height: 150px;
    background: blue;
}

/* Keyframe animations */
@keyframes slideIn {
    from {
        transform: translateX(-100%);
        opacity: 0;
    }
    to {
        transform: translateX(0);
        opacity: 1;
    }
}

.slide-element {
    animation: slideIn 1s ease-out;
}

/* Complex animation */
@keyframes bounce {
    0%, 100% {
        transform: translateY(0);
    }
    50% {
        transform: translateY(-20px);
    }
}

.bouncing-ball {
    width: 50px;
    height: 50px;
    background: red;
    border-radius: 50%;
    animation: bounce 1s infinite;
}

/* Rotate animation */
@keyframes rotate {
    from {
        transform: rotate(0deg);
    }
    to {
        transform: rotate(360deg);
    }
}

.spinner {
    animation: rotate 2s linear infinite;
}

/* Fade in */
@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

.fade-element {
    animation: fadeIn 2s ease-in;
}',
   '/* Transition */
.element {
    transition: property duration timing-function delay;
}

/* Keyframe animation */
@keyframes name {
    from { property: value; }
    to { property: value; }
}

.element {
    animation: name duration timing-function delay iteration-count;
}

/* Transform */
transform: translate(x, y);
transform: rotate(deg);
transform: scale(x, y);',
   'Use transitions for simple hover effects. Use keyframes for complex animations. Consider performance - animate transform and opacity. Test on different devices. Use animation-fill-mode to control end state.',
   '1. Create a button with hover animation
2. Build a loading spinner using CSS animation
3. Create a fade-in effect for page elements
4. Design a bouncing ball animation
5. Build a sliding menu with transitions',
   '{"telugu": ["https://www.youtube.com/watch?v=YszONjKpgg4"], "english": ["https://www.youtube.com/watch?v=YszONjKpgg4"]}',
   1);

END $$;