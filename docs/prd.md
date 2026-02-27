# Personalized Learning Companion for First-Generation Students Requirements Document

## 1. Application Overview

### 1.1 Application Name
Personalized Learning Companion

### 1.2 Application Description
A modern web-based learning platform that acts as a digital learning mentor, helping first-generation students determine what to study, when to study, how to improve, which career to choose, track learning progress, and build confidence. The platform provides structured learning similar to W3Schools but personalized for individual students.

### 1.3 Core Objectives
- Guide students on learning paths
- Provide personalized study recommendations
- Track and visualize learning progress
- Offer career guidance based on skills
- Build student confidence through structured learning
- Deliver W3Schools-style comprehensive content

## 2. UI Design Requirements

### 2.1 Color Scheme
- Primary Color: Deep Blue (#2563EB)
- Secondary Gradient: Purple to Blue (#7C3AED → #2563EB)
- Accent Color: Cyan (#06B6D4)
- Background: White to Light Blue Gradient

### 2.2 Design Style
- Glassmorphism Cards
- Soft Shadows
- Rounded Corners
- Smooth Animations
- Hover Effects
- Animated Progress Bars
- Modern Dashboard Layout
- Professional learning platform appearance

## 3. User Flow

### 3.1 Complete User Journey
Login → Subject Selection → Knowledge Popup → Assessment Quiz OR Beginner Modules → Learning Topics → Topic Quiz → Progress Tracking

## 4. Authentication System

### 4.1 Login Features
- Sign Up
- Login
- Logout

### 4.2 User Data Storage
- Name
- Email
- Password

### 4.3 Post-Login Redirect
Redirect to /subjects page after successful login

## 5. Subject Selection

### 5.1 Available Subjects
- Java
- Python
- HTML
- CSS
- JavaScript
- C Programming
- C++
- PHP
- SQL
- Data Structures
- English Communication

### 5.2 Selection Rules
- Manual subject selection (no auto-enrollment)
- Users can select and learn multiple subjects
- Progress saved separately for each subject
- Example: Java → 60%, Python → 30%

## 6. Knowledge Assessment

### 6.1 Knowledge Popup
After subject selection, display popup: \"Do you have knowledge about this subject?\"

### 6.2 Options

**New Learner:**
- Skip quiz
- Assign Beginner Level
- Show Beginner Modules

**I Have Knowledge:**
- Start assessment quiz

### 6.3 Assessment Quiz Structure
Every subject must include an Initial Assessment Quiz with the following structure:

- Total Questions: 10
- Question Types: 5 MCQ + 5 Fill in the blanks
- Difficulty Distribution:
  - 3 Beginner questions
  - 4 Intermediate questions
  - 3 Expert questions

### 6.4 Level Detection
- Score 0-3: Beginner
- Score 4-7: Intermediate
- Score 8-10: Expert
- Display only the detected level, hide others
- Store: Subject, Score, Level

### 6.5 Assessment Quiz Questions by Subject

**Java Quiz:**
- MCQ: Which keyword is used for inheritance in Java? (a) extends (b) include (c) inherit (d) super
- Fill Blank: Java is a ______ programming language. (Answer: Object-Oriented)

**Python Quiz:**
- MCQ: Which symbol is used for comments? (a) // (b) # (c) /* */
- Fill Blank: Python uses indentation to define ______. (Answer: Blocks)

**HTML Quiz:**
- MCQ: Which tag creates a paragraph? (a) p (b) div (c) span
- Fill Blank: HTML stands for ______ Markup Language. (Answer: HyperText)

**CSS Quiz:**
- MCQ: Which property changes text color? (a) color (b) font (c) background
- Fill Blank: CSS stands for ______ Style Sheets. (Answer: Cascading)

**JavaScript Quiz:**
- MCQ: Which keyword declares variable? (a) let (b) var (c) const (d) All
- Fill Blank: JavaScript runs inside the ______. (Answer: Browser)

**C Programming Quiz:**
- MCQ: Which symbol ends statement? (a) ; (b) : (c) .
- Fill Blank: C is a ______ language. (Answer: Procedural)

**C++ Quiz:**
- MCQ: Which concept supports inheritance? (a) OOP (b) Procedural (c) Functional
- Fill Blank: C++ supports ______ programming. (Answer: Object-Oriented)

**PHP Quiz:**
- MCQ: PHP runs on: (a) Server (b) Client (c) Both
- Fill Blank: PHP stands for ______ Hypertext Preprocessor. (Answer: Personal Home Page)

**SQL Quiz:**
- MCQ: Which command retrieves data? (a) SELECT (b) INSERT (c) UPDATE
- Fill Blank: SQL stands for Structured ______ Language. (Answer: Query)

**Data Structures Quiz:**
- MCQ: Stack follows: (a) LIFO (b) FIFO (c) Random
- Fill Blank: Queue follows ______. (Answer: FIFO)

**English Communication Quiz:**
- MCQ: Past tense of go: (a) Went (b) Gone (c) Going
- Fill Blank: Communication means sharing ______. (Answer: Information)

## 7. Learning Structure

### 7.1 Hierarchy
Subject → Level → Topics → Topic Page

Example: Java → Beginner → Variables → Topic Page

### 7.2 Topic Page Content
Each topic must include:
- Full theory explanation
- Code examples
- Explanation
- Syntax
- Notes
- Examples
- Exercises
- Quiz
- 1-2 YouTube videos

Content must be detailed and comprehensive like W3Schools, not short summaries.

### 7.3 YouTube Video Integration

**Telugu Channels:**
- Telugu Web Guru
- SoftwareSchool Telugu
- Naresh i Technologies Telugu

**English Channels:**
- freeCodeCamp
- The Net Ninja
- ProgrammingKnowledge

**Additional:**
- W3Schools YouTube Channel
- English Speaking Channel (for English Communication)

Use topic-based videos, not full course videos.

## 8. Subject Roadmaps and Complete Module Structure

### 8.1 Java
**Roadmap:** Basics → OOP → Collections → Database → Spring → Projects → Job Ready

**Beginner Topics:**
- Introduction to Java
- Variables
- Data Types
- Conditions
- Loops
- Arrays
- Methods

**Intermediate Topics:**
- Classes
- Objects
- Inheritance
- Polymorphism
- Exception Handling
- Collections

**Expert Topics:**
- JDBC
- Multithreading
- Spring Boot

**Career Paths:**
- Java Developer
- Backend Developer

**Projects:**
- Student System
- Banking System

**YouTube Channels:**
- freeCodeCamp
- Telugu Web Guru
- W3Schools

**Assessment Quiz:** Included (10 Questions)
**Module Quiz:** Included (5 Questions per module)

### 8.2 Python
**Roadmap:** Basics → Functions → OOP → Libraries → Web → Projects → Job Ready

**Beginner Topics:**
- Python Basics
- Variables
- Conditions
- Loops
- Functions
- Lists

**Intermediate Topics:**
- OOP
- File Handling
- Libraries

**Expert Topics:**
- Flask Intro
- Data Analysis Intro

**Career Paths:**
- Python Developer
- Data Analyst

**Projects:**
- Todo App

**YouTube Channels:**
- freeCodeCamp
- SoftwareSchool Telugu
- W3Schools

**Assessment Quiz:** Included (10 Questions)
**Module Quiz:** Included (5 Questions per module)

### 8.3 HTML
**Roadmap:** Tags → Lists → Tables → Forms → Semantic → Responsive → Projects

**Beginner Topics:**
- HTML Basics
- Tags
- Lists
- Tables

**Intermediate Topics:**
- Forms
- Semantic HTML

**Expert Topics:**
- Responsive HTML

**Career Paths:**
- Frontend Developer

**Projects:**
- Portfolio

**YouTube Channels:**
- freeCodeCamp
- Telugu Web Guru
- W3Schools

**Assessment Quiz:** Included (10 Questions)
**Module Quiz:** Included (5 Questions per module)

### 8.4 CSS
**Roadmap:** Selectors → Box Model → Flexbox → Grid → Animations → Responsive

**Beginner Topics:**
- Selectors
- Colors
- Fonts
- Box Model

**Intermediate Topics:**
- Flexbox
- Grid
- Positioning

**Expert Topics:**
- Animations
- Responsive Design

**YouTube Channels:**
- freeCodeCamp
- Telugu Web Guru
- W3Schools

**Assessment Quiz:** Included (10 Questions)
**Module Quiz:** Included (5 Questions per module)

### 8.5 JavaScript
**Roadmap:** Basics → Functions → DOM → Events → ES6 → APIs → Projects

**Beginner Topics:**
- Variables
- Loops
- Functions

**Intermediate Topics:**
- DOM
- Events
- Arrays
- Objects

**Expert Topics:**
- ES6
- Fetch API

**YouTube Channels:**
- freeCodeCamp
- Net Ninja
- W3Schools

**Assessment Quiz:** Included (10 Questions)
**Module Quiz:** Included (5 Questions per module)

### 8.6 C Programming
**Roadmap:** Basics → Functions → Arrays → Pointers → Structures

**Beginner Topics:**
- Variables
- Data Types
- Operators

**Intermediate Topics:**
- Functions
- Arrays
- Pointers

**Expert Topics:**
- Structures
- File Handling

**YouTube Channels:**
- freeCodeCamp
- Naresh IT Telugu
- W3Schools

**Assessment Quiz:** Included (10 Questions)
**Module Quiz:** Included (5 Questions per module)

### 8.7 C++
**Roadmap:** Basics → OOP → STL → Projects

**Beginner Topics:**
- Basics
- Loops
- Functions

**Intermediate Topics:**
- Classes
- Objects
- Inheritance

**Expert Topics:**
- STL
- File Handling

**YouTube Channels:**
- freeCodeCamp
- Naresh IT Telugu
- W3Schools

**Assessment Quiz:** Included (10 Questions)
**Module Quiz:** Included (5 Questions per module)

### 8.8 PHP
**Roadmap:** Basics → Forms → Database → CRUD

**Beginner Topics:**
- Variables
- Forms

**Intermediate Topics:**
- Sessions
- MySQL

**Expert Topics:**
- CRUD Operations

**YouTube Channels:**
- freeCodeCamp
- Telugu Web Guru
- W3Schools

**Assessment Quiz:** Included (10 Questions)
**Module Quiz:** Included (5 Questions per module)

### 8.9 SQL
**Roadmap:** Queries → Joins → Functions → Optimization

**Beginner Topics:**
- SELECT
- WHERE

**Intermediate Topics:**
- JOINS
- GROUP BY

**Expert Topics:**
- Functions
- Indexes

**YouTube Channels:**
- freeCodeCamp
- Naresh IT Telugu
- W3Schools

**Assessment Quiz:** Included (10 Questions)
**Module Quiz:** Included (5 Questions per module)

### 8.10 Data Structures
**Roadmap:** Arrays → Lists → Stack → Queue → Trees → Graphs

**Beginner Topics:**
- Arrays
- Linked Lists

**Intermediate Topics:**
- Stack
- Queue

**Expert Topics:**
- Trees
- Graphs

**YouTube Channels:**
- freeCodeCamp
- ProgrammingKnowledge
- W3Schools

**Assessment Quiz:** Included (10 Questions)
**Module Quiz:** Included (5 Questions per module)

### 8.11 English Communication
**Roadmap:** Grammar → Vocabulary → Speaking → Interview Skills

**Beginner Topics:**
- Grammar Basics
- Tenses

**Intermediate Topics:**
- Vocabulary
- Sentence Formation

**Expert Topics:**
- Interview Skills
- Speaking Practice

**YouTube Channels:**
- English Speaking Channel
- W3Schools English Lessons

**Assessment Quiz:** Included (10 Questions)
**Module Quiz:** Included (5 Questions per module)

## 9. Module Structure Requirements

### 9.1 Universal Module Requirements
Every subject must include:
- Roadmap section
- Initial Assessment Quiz (10 Questions)
- Beginner Level Modules
- Intermediate Level Modules
- Expert Level Modules
- Topics (clickable)
- Topic Learning Pages
- Detailed theory
- Syntax
- Examples
- Notes
- Exercises
- Module Quiz (5 Questions per module)
- 1-2 YouTube videos per topic

### 9.2 Topic Page Structure
Each topic must be clickable and open a Topic Learning Page containing:
- Full theory explanation
- Syntax
- Examples
- Notes
- Exercises
- 1-2 YouTube videos

Content must be detailed and comprehensive, not short summaries.

## 10. Module Quiz

### 10.1 Quiz Structure
Every module in every subject must include a Module Quiz:
- 5 Questions per module
- Question Types: Mix of MCQ + Fill in the blanks

### 10.2 Pass/Fail Logic
- Score ≤ 2: Retake quiz
- Score ≥ 3: Module completed, proceed to next

### 10.3 Universal Quiz Rule
All subjects must include:
- Assessment Quiz (10 Questions)
- Module Quiz (5 Questions per module)
- Level Detection (Beginner/Intermediate/Expert)

No subject should skip quiz functionality.

## 11. Dashboard

### 11.1 Dashboard Elements
- Student Name
- Selected Subjects
- Skill Levels
- Progress Percentage
- Overall Progress
- Study Suggestions
- Weak Areas
- Study Streak
- Alerts

## 12. Study Reminders

### 12.1 Reminder Types
- Daily Reminder
- Quiz Reminder
- Incomplete Module Reminder

### 12.2 Notification System
- In-app notifications only
- Notification Bell icon

## 13. Study Streak

### 13.1 Streak Display
- Show: 🔥 Study Streak X Days
- Reset if user misses a day

## 14. Help Desk

### 14.1 Help Desk Fields
- Name
- Email
- Message

### 14.2 Functionality
- Store all messages for admin review

## 15. Feedback System

### 15.1 Feedback Trigger
After subject completion

### 15.2 Feedback Questions
- Was this helpful?
- Suggestions

## 16. Admin Panel

### 16.1 Admin Access
- Admin Login functionality

### 16.2 Admin Features
- View all users
- View user progress
- View help desk messages

## 17. Final Goals

The system must function as:
- Real Learning Platform
- Career Guide
- Roadmap Builder
- Confidence Builder

Specifically designed for first-generation students to provide comprehensive learning support and career guidance.

All subjects must behave consistently with complete modules, topics, learning pages, assessment quizzes, module quizzes, and videos following the W3Schools model.

## 18. Quiz Implementation Summary

All 11 subjects must include:
- Initial Assessment Quiz after subject selection
- Module Quizzes after completing each module
- Level detection based on assessment score
- Pass/fail logic for module progression

Expected flow for all subjects:
Subject Selection → Knowledge Popup → Assessment Quiz → Level Detection → Modules → Module Quiz → Progress Tracking