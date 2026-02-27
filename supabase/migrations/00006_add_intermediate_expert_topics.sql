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

  -- Add more Java Intermediate topics
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (java_id, 'intermediate', 'Inheritance', 'Code reusability through inheritance',
   'Inheritance is a mechanism where a new class inherits properties and methods from an existing class, promoting code reusability.

Key Concepts:

1. Parent Class (Superclass):
   - Base class that is inherited
   - Contains common properties and methods

2. Child Class (Subclass):
   - Derived class that inherits
   - Can add new features
   - Can override parent methods

3. extends Keyword:
   - Used to inherit from parent class
   - Java supports single inheritance only

4. super Keyword:
   - Refers to parent class
   - Call parent constructor
   - Access parent methods

5. Method Overriding:
   - Child class provides specific implementation
   - Same method signature as parent
   - @Override annotation

6. Types of Inheritance:
   - Single: A → B
   - Multilevel: A → B → C
   - Hierarchical: A → B, A → C
   - Multiple: Not supported in Java (use interfaces)

Benefits:
- Code reusability
- Method overriding
- Polymorphism support
- Organized code structure',
   'class Animal {
    protected String name;
    protected int age;
    
    public Animal(String name, int age) {
        this.name = name;
        this.age = age;
    }
    
    public void eat() {
        System.out.println(name + " is eating");
    }
    
    public void sleep() {
        System.out.println(name + " is sleeping");
    }
    
    public void makeSound() {
        System.out.println("Animal makes a sound");
    }
}

class Dog extends Animal {
    private String breed;
    
    public Dog(String name, int age, String breed) {
        super(name, age);  // Call parent constructor
        this.breed = breed;
    }
    
    @Override
    public void makeSound() {
        System.out.println(name + " barks: Woof! Woof!");
    }
    
    public void fetch() {
        System.out.println(name + " is fetching the ball");
    }
}

class Cat extends Animal {
    public Cat(String name, int age) {
        super(name, age);
    }
    
    @Override
    public void makeSound() {
        System.out.println(name + " meows: Meow!");
    }
}

public class Main {
    public static void main(String[] args) {
        Dog dog = new Dog("Buddy", 3, "Golden Retriever");
        dog.eat();
        dog.makeSound();
        dog.fetch();
        
        Cat cat = new Cat("Whiskers", 2);
        cat.eat();
        cat.makeSound();
    }
}',
   'class ChildClass extends ParentClass {
    // Child class members
    
    public ChildClass() {
        super(); // Call parent constructor
    }
    
    @Override
    public void method() {
        // Override parent method
    }
}',
   'Use protected for members that should be accessible in child classes. Always call super() in child constructor if parent has parameterized constructor. Use @Override annotation for clarity.',
   '1. Create Vehicle parent class and Car, Bike child classes
2. Implement Employee parent and Manager, Developer child classes
3. Create Shape parent with Circle, Rectangle children
4. Build a multilevel inheritance example
5. Practice method overriding with different classes',
   '{"telugu": ["https://www.youtube.com/watch?v=9JpNY-XAseg"], "english": ["https://www.youtube.com/watch?v=9W7NRDqJLyY"]}',
   2);

  -- Java Expert topics
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (java_id, 'expert', 'Multithreading', 'Concurrent programming in Java',
   'Multithreading allows concurrent execution of two or more parts of a program for maximum CPU utilization.

Key Concepts:

1. Thread:
   - Lightweight subprocess
   - Smallest unit of processing
   - Independent execution path

2. Multitasking vs Multithreading:
   - Multitasking: Multiple processes
   - Multithreading: Multiple threads in one process

3. Thread Lifecycle:
   - New: Thread created
   - Runnable: Ready to run
   - Running: Executing
   - Blocked: Waiting for resource
   - Terminated: Finished execution

4. Creating Threads:
   
   Method 1: Extend Thread class
   - Override run() method
   - Call start() to begin

   Method 2: Implement Runnable interface
   - Implement run() method
   - Pass to Thread constructor
   - Preferred approach

5. Thread Methods:
   - start(): Begin execution
   - run(): Contains thread code
   - sleep(): Pause execution
   - join(): Wait for thread to finish
   - setPriority(): Set thread priority

6. Synchronization:
   - Prevents thread interference
   - synchronized keyword
   - Ensures thread safety

Benefits:
- Better CPU utilization
- Responsive applications
- Parallel processing
- Improved performance',
   'class MyThread extends Thread {
    public void run() {
        for(int i = 1; i <= 5; i++) {
            System.out.println(Thread.currentThread().getName() + ": " + i);
            try {
                Thread.sleep(500);
            } catch(InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

class MyRunnable implements Runnable {
    public void run() {
        for(int i = 1; i <= 5; i++) {
            System.out.println(Thread.currentThread().getName() + ": " + i);
            try {
                Thread.sleep(500);
            } catch(InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}

class Counter {
    private int count = 0;
    
    public synchronized void increment() {
        count++;
    }
    
    public int getCount() {
        return count;
    }
}

public class Main {
    public static void main(String[] args) {
        // Method 1: Extend Thread
        MyThread t1 = new MyThread();
        t1.setName("Thread-1");
        t1.start();
        
        // Method 2: Implement Runnable
        MyRunnable r = new MyRunnable();
        Thread t2 = new Thread(r);
        t2.setName("Thread-2");
        t2.start();
        
        // Synchronized example
        Counter counter = new Counter();
        Thread t3 = new Thread(() -> {
            for(int i = 0; i < 1000; i++) {
                counter.increment();
            }
        });
        t3.start();
    }
}',
   '// Extend Thread
class MyThread extends Thread {
    public void run() {
        // Thread code
    }
}

// Implement Runnable
class MyRunnable implements Runnable {
    public void run() {
        // Thread code
    }
}

// Synchronized method
public synchronized void method() {
    // Thread-safe code
}',
   'Always use start() not run() to begin thread. Handle InterruptedException. Use synchronization for shared resources. Prefer Runnable over Thread extension.',
   '1. Create two threads that print numbers simultaneously
2. Implement a thread that downloads files concurrently
3. Create a synchronized counter accessed by multiple threads
4. Build a producer-consumer problem solution
5. Implement thread priority demonstration',
   '{"telugu": ["https://www.youtube.com/watch?v=TCd8QIS-2KI"], "english": ["https://www.youtube.com/watch?v=r_MbozD32eo"]}',
   1);

  -- Python Intermediate
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (python_id, 'intermediate', 'Object-Oriented Programming', 'OOP concepts in Python',
   'Object-Oriented Programming (OOP) is a programming paradigm based on objects that contain data and code.

Key Concepts:

1. Class:
   - Blueprint for creating objects
   - Defines attributes and methods
   - Uses class keyword

2. Object:
   - Instance of a class
   - Has state and behavior
   - Created using class constructor

3. __init__ Method:
   - Constructor method
   - Called when object is created
   - Initializes object attributes

4. self Parameter:
   - Refers to current instance
   - Must be first parameter
   - Used to access attributes

5. Attributes:
   - Instance attributes: Unique to each object
   - Class attributes: Shared by all objects

6. Methods:
   - Instance methods: Work with instance data
   - Class methods: Work with class data
   - Static methods: Independent functions

7. Encapsulation:
   - Data hiding
   - Private attributes: __attribute
   - Getter and setter methods

8. Inheritance:
   - Code reusability
   - Parent and child classes
   - super() function

9. Polymorphism:
   - Method overriding
   - Same interface, different implementation',
   'class Student:
    # Class attribute
    school_name = "ABC School"
    
    def __init__(self, name, age, grade):
        # Instance attributes
        self.name = name
        self.age = age
        self.grade = grade
        self.__gpa = 0.0  # Private attribute
    
    # Instance method
    def display_info(self):
        print(f"Name: {self.name}")
        print(f"Age: {self.age}")
        print(f"Grade: {self.grade}")
    
    # Getter method
    def get_gpa(self):
        return self.__gpa
    
    # Setter method
    def set_gpa(self, gpa):
        if 0 <= gpa <= 4.0:
            self.__gpa = gpa
        else:
            print("Invalid GPA")
    
    # Class method
    @classmethod
    def change_school(cls, new_name):
        cls.school_name = new_name
    
    # Static method
    @staticmethod
    def is_adult(age):
        return age >= 18

# Creating objects
student1 = Student("Alice", 20, "A")
student2 = Student("Bob", 19, "B")

# Using methods
student1.display_info()
student1.set_gpa(3.8)
print(f"GPA: {student1.get_gpa()}")

# Inheritance example
class GraduateStudent(Student):
    def __init__(self, name, age, grade, thesis):
        super().__init__(name, age, grade)
        self.thesis = thesis
    
    def display_info(self):
        super().display_info()
        print(f"Thesis: {self.thesis}")

grad = GraduateStudent("Charlie", 24, "A", "AI Research")
grad.display_info()',
   'class ClassName:
    def __init__(self, parameters):
        self.attribute = value
    
    def method(self):
        # Method code
        pass

# Create object
obj = ClassName(arguments)

# Inheritance
class Child(Parent):
    def __init__(self):
        super().__init__()
',
   'Use PascalCase for class names. Use self for instance reference. Private attributes start with __. Use super() to call parent class methods.',
   '1. Create a BankAccount class with deposit and withdraw methods
2. Implement a Library system with Book and Member classes
3. Create inheritance hierarchy for different types of vehicles
4. Build an Employee management system with different employee types
5. Implement encapsulation with private attributes and getters/setters',
   '{"telugu": ["https://www.youtube.com/watch?v=qiSCMNBIP2g"], "english": ["https://www.youtube.com/watch?v=JeznW_7DlB0"]}',
   1);

  -- CSS Intermediate
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (css_id, 'intermediate', 'Flexbox Layout', 'Modern layout system with Flexbox',
   'Flexbox is a one-dimensional layout method for arranging items in rows or columns.

Key Concepts:

1. Flex Container:
   - Parent element with display: flex
   - Controls layout of children
   - Flex items are direct children

2. Main Axis vs Cross Axis:
   - Main axis: Primary direction (row/column)
   - Cross axis: Perpendicular direction

3. Container Properties:

   display: flex | inline-flex
   - Creates flex container

   flex-direction: row | column | row-reverse | column-reverse
   - Sets main axis direction

   justify-content: flex-start | center | flex-end | space-between | space-around
   - Aligns items on main axis

   align-items: flex-start | center | flex-end | stretch | baseline
   - Aligns items on cross axis

   flex-wrap: nowrap | wrap | wrap-reverse
   - Controls wrapping

   gap: value
   - Space between items

4. Item Properties:

   flex-grow: number
   - Growth factor

   flex-shrink: number
   - Shrink factor

   flex-basis: size
   - Initial size

   flex: grow shrink basis
   - Shorthand

   align-self: auto | flex-start | center | flex-end
   - Override align-items

   order: number
   - Change visual order

Benefits:
- Responsive layouts
- Easy alignment
- Flexible sizing
- No floats needed',
   '/* Flex container */
.container {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    gap: 20px;
    padding: 20px;
}

/* Flex items */
.item {
    flex: 1;
    padding: 20px;
    background: #f0f0f0;
}

/* Centering example */
.center-box {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Navigation bar */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem 2rem;
    background: #333;
}

.nav-links {
    display: flex;
    gap: 2rem;
    list-style: none;
}

/* Card layout */
.card-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
}

.card {
    flex: 1 1 300px;
    padding: 20px;
    border: 1px solid #ddd;
}

/* Column layout */
.columns {
    display: flex;
    gap: 20px;
}

.column {
    flex: 1;
}

/* Responsive flex */
@media (max-width: 768px) {
    .container {
        flex-direction: column;
    }
}',
   '/* Flex container */
.container {
    display: flex;
    flex-direction: row | column;
    justify-content: flex-start | center | flex-end | space-between;
    align-items: flex-start | center | flex-end | stretch;
    flex-wrap: nowrap | wrap;
    gap: value;
}

/* Flex items */
.item {
    flex: grow shrink basis;
    align-self: auto | center | flex-end;
    order: number;
}',
   'Use flexbox for one-dimensional layouts. Set display: flex on parent. Use gap instead of margins. flex: 1 makes items equal width. Combine with media queries for responsive design.',
   '1. Create a navigation bar with flexbox
2. Build a card layout that wraps responsively
3. Center a div both horizontally and vertically
4. Create a footer with multiple columns
5. Design a pricing table using flexbox',
   '{"telugu": ["https://www.youtube.com/watch?v=Y8zMYaD1bz0"], "english": ["https://www.youtube.com/watch?v=fYq5PXgSsbE"]}',
   1);

  -- JavaScript Intermediate
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (js_id, 'intermediate', 'DOM Manipulation', 'Interacting with HTML elements',
   'The Document Object Model (DOM) is a programming interface for HTML documents that represents the page structure as a tree of objects.

Key Concepts:

1. DOM Tree:
   - Document is root
   - Elements are nodes
   - Hierarchical structure

2. Selecting Elements:

   getElementById(id)
   - Returns single element
   - Most specific

   getElementsByClassName(class)
   - Returns HTMLCollection
   - Live collection

   getElementsByTagName(tag)
   - Returns HTMLCollection
   - All elements of type

   querySelector(selector)
   - Returns first match
   - CSS selector syntax

   querySelectorAll(selector)
   - Returns NodeList
   - All matches

3. Modifying Elements:

   textContent
   - Get/set text content
   - Plain text only

   innerHTML
   - Get/set HTML content
   - Can include tags

   setAttribute(name, value)
   - Set attribute value

   style.property
   - Modify CSS styles

   classList.add/remove/toggle
   - Manage classes

4. Creating Elements:

   createElement(tag)
   - Create new element

   appendChild(element)
   - Add as last child

   insertBefore(new, existing)
   - Insert before element

   removeChild(element)
   - Remove element

5. Event Handling:

   addEventListener(event, function)
   - Attach event listener
   - Multiple listeners allowed

Common Events:
- click, dblclick
- mouseover, mouseout
- keydown, keyup
- submit, change
- load, DOMContentLoaded',
   '// Selecting elements
const heading = document.getElementById(''main-heading'');
const paragraphs = document.getElementsByClassName(''text'');
const firstPara = document.querySelector(''.text'');
const allParas = document.querySelectorAll(''p'');

// Modifying content
heading.textContent = ''New Heading'';
heading.innerHTML = ''<strong>Bold Heading</strong>'';

// Modifying styles
heading.style.color = ''blue'';
heading.style.fontSize = ''32px'';
heading.style.backgroundColor = ''#f0f0f0'';

// Working with classes
heading.classList.add(''highlight'');
heading.classList.remove(''old-class'');
heading.classList.toggle(''active'');

// Creating elements
const newDiv = document.createElement(''div'');
newDiv.textContent = ''New Content'';
newDiv.className = ''box'';
document.body.appendChild(newDiv);

// Event listeners
const button = document.querySelector(''#myButton'');
button.addEventListener(''click'', function() {
    alert(''Button clicked!'');
});

// Form handling
const form = document.querySelector(''#myForm'');
form.addEventListener(''submit'', function(e) {
    e.preventDefault();
    const input = document.querySelector(''#nameInput'');
    console.log(''Name:'', input.value);
});

// Multiple elements
const items = document.querySelectorAll(''.item'');
items.forEach(item => {
    item.addEventListener(''click'', function() {
        this.classList.toggle(''selected'');
    });
});',
   '// Select element
const element = document.querySelector(''selector'');

// Modify content
element.textContent = ''text'';
element.innerHTML = ''<tag>html</tag>'';

// Modify style
element.style.property = ''value'';

// Modify classes
element.classList.add(''class'');
element.classList.remove(''class'');

// Create element
const newEl = document.createElement(''tag'');
parent.appendChild(newEl);

// Event listener
element.addEventListener(''event'', function() {
    // Code
});',
   'Use querySelector for modern code. Cache DOM selections in variables. Use textContent for security (prevents XSS). Always preventDefault() on form submit. Use event delegation for dynamic elements.',
   '1. Create a button that changes page background color
2. Build a todo list with add/remove functionality
3. Create an image gallery with click events
4. Implement a form validator
5. Build a simple calculator using DOM manipulation',
   '{"telugu": ["https://www.youtube.com/watch?v=y17RuWkWdn8"], "english": ["https://www.youtube.com/watch?v=5fb2aPlgoys"]}',
   1);

  -- SQL Intermediate
  INSERT INTO topics (subject_id, level, title, description, theory, code_examples, syntax, notes, exercises, youtube_videos, order_index) VALUES
  (sql_id, 'intermediate', 'SQL JOINS', 'Combining data from multiple tables',
   'SQL JOINS are used to combine rows from two or more tables based on a related column.

Types of JOINS:

1. INNER JOIN:
   - Returns matching rows from both tables
   - Most common join type
   - Only rows with matches in both tables

2. LEFT JOIN (LEFT OUTER JOIN):
   - Returns all rows from left table
   - Matching rows from right table
   - NULL for non-matching right rows

3. RIGHT JOIN (RIGHT OUTER JOIN):
   - Returns all rows from right table
   - Matching rows from left table
   - NULL for non-matching left rows

4. FULL JOIN (FULL OUTER JOIN):
   - Returns all rows from both tables
   - NULL where no match exists
   - Not supported in MySQL

5. CROSS JOIN:
   - Cartesian product
   - All combinations
   - Rarely used

6. SELF JOIN:
   - Table joined with itself
   - Uses aliases
   - Find relationships within table

JOIN Syntax Components:

1. ON Clause:
   - Specifies join condition
   - Usually foreign key = primary key

2. USING Clause:
   - Shorthand when column names match
   - USING (column_name)

3. Table Aliases:
   - Short names for tables
   - Makes queries readable

Best Practices:
- Use INNER JOIN by default
- Use LEFT JOIN for optional relationships
- Always specify join conditions
- Use table aliases for clarity',
   '-- Sample tables
-- customers: id, name, email
-- orders: id, customer_id, amount, date

-- INNER JOIN
SELECT 
    customers.name,
    orders.amount,
    orders.date
FROM customers
INNER JOIN orders ON customers.id = orders.customer_id;

-- LEFT JOIN
SELECT 
    c.name,
    o.amount
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id;

-- Multiple JOINS
SELECT 
    c.name,
    o.amount,
    p.product_name
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
INNER JOIN products p ON o.product_id = p.id;

-- SELF JOIN (employees and managers)
SELECT 
    e.name AS employee,
    m.name AS manager
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.id;

-- JOIN with WHERE
SELECT 
    c.name,
    o.amount
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
WHERE o.amount > 1000;

-- JOIN with GROUP BY
SELECT 
    c.name,
    COUNT(o.id) AS order_count,
    SUM(o.amount) AS total_spent
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name;',
   '-- INNER JOIN
SELECT columns
FROM table1
INNER JOIN table2 ON table1.column = table2.column;

-- LEFT JOIN
SELECT columns
FROM table1
LEFT JOIN table2 ON table1.column = table2.column;

-- Multiple JOINS
SELECT columns
FROM table1
JOIN table2 ON condition1
JOIN table3 ON condition2;',
   'Use meaningful table aliases. Always specify join type explicitly. Test with small datasets first. Use LEFT JOIN when you need all records from one table. Consider performance with large tables.',
   '1. Join customers and orders tables to show customer purchases
2. Find all customers who have never placed an order (LEFT JOIN)
3. Join three tables: students, courses, enrollments
4. Use self join to find employees and their managers
5. Calculate total sales per customer using JOIN and GROUP BY',
   '{"telugu": ["https://www.youtube.com/watch?v=0OQJDd3QqQM"], "english": ["https://www.youtube.com/watch?v=9yeOJ0ZMUYw"]}',
   1);

END $$;