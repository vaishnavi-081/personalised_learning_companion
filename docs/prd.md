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
Login → Career Domains (Optional Learning) → Subject Domains → Subject Selection → Knowledge Popup → Assessment Quiz OR Beginner Modules → Learning Topics → Topic Quiz → Final Exam → Course Completed → Progress Tracking

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
Redirect to Career Domains page after successful login

## 5. Career Domains (Knowledge Only)

### 5.1 Purpose
Career Domains are informational only. Users do NOT enroll in career domains. Career Domains only show career options, roadmaps, required skills, required subjects, and career videos for knowledge and guidance purposes.

### 5.2 Career Domains List

#### 5.2.1 Engineering & Technology
**Careers:**
- Software Engineer
- Mechanical Engineer
- Civil Engineer
- Electrical Engineer
- Electronics Engineer

**Roadmap:**
Basic Science → Engineering Degree → Technical Skills → Projects → Job

**Videos:**
- Engineering Career Guide
- Day in Life Engineer

#### 5.2.2 Medical & Life Sciences
**Careers:**
- Doctor
- Pharmacist
- Nurse
- Biotechnologist
- Lab Technician

**Roadmap:**
Biology Basics → Medical Education → Internship → Practice

**Videos:**
- Medical Career Guide
- Doctor Life

#### 5.2.3 Commerce & Finance
**Careers:**
- Accountant
- Bank Officer
- Financial Analyst
- CA
- Business Analyst

**Roadmap:**
Commerce Basics → Accounting Skills → Finance Knowledge → Certification

**Videos:**
- Commerce Career Guide
- Finance Jobs

#### 5.2.4 Arts & Humanities
**Careers:**
- Teacher
- Journalist
- Content Writer
- Designer
- Psychologist

**Roadmap:**
Subject Knowledge → Communication Skills → Practice → Career

**Videos:**
- Arts Career Guide

#### 5.2.5 MBA & Business
**Careers:**
- Manager
- HR Manager
- Marketing Manager
- Business Analyst

**Roadmap:**
Business Basics → MBA → Internship → Career

**Videos:**
- MBA Career Guide

#### 5.2.6 Government Jobs
**Careers:**
- IAS
- Police
- Railways
- Banking
- SSC Jobs

**Roadmap:**
General Knowledge → Preparation → Exam → Job

**Videos:**
- Government Jobs Guide

#### 5.2.7 Software & IT Careers
**Careers:**
- Frontend Developer
- Backend Developer
- Full Stack Developer
- Data Scientist
- AI Engineer
- Cybersecurity Engineer

**Roadmap:**
Programming Basics → Projects → Advanced Skills → Job

**Videos:**
- Software Career Guide
- Developer Life

#### 5.2.8 Study Abroad
**Careers:**
- International Education

**Roadmap:**
English Tests → Applications → University → Study

**Videos:**
- Study Abroad Guide

#### 5.2.9 Entrepreneurship
**Careers:**
- Startup Founder
- Business Owner

**Roadmap:**
Idea → Planning → Funding → Business

**Videos:**
- Startup Guide

## 6. Subject Domain Structure

### 6.1 Subject Domains
Subjects are grouped under domains. Users select Subject Domains to view available subjects.

#### 6.1.1 Engineering & Technology Subjects
- C Programming
- C++
- Data Structures

#### 6.1.2 Software & IT Subjects
- Java
- Python
- HTML
- CSS
- JavaScript
- SQL
- PHP

#### 6.1.3 Commerce Subjects
- English Communication

### 6.2 Subject Selection Rules
- Manual subject selection (no auto-enrollment)
- Users can select and learn multiple subjects
- Progress saved separately for each subject
- Example: Java → 60%, Python → 30%

## 7. Knowledge Assessment

### 7.1 Knowledge Popup
After subject selection, display popup: \"Do you have knowledge about this subject?\"

### 7.2 Options

**New Learner:**
- Skip quiz
- Assign Beginner Level
- Show Beginner Modules

**I Have Knowledge:**
- Start assessment quiz

### 7.3 Assessment Quiz Structure
Every subject must include an Initial Assessment Quiz with the following structure:

- Total Questions: 10
- Question Types: 5 MCQ + 5 Fill in the blanks
- Difficulty Distribution:
  - 3 Beginner questions
  - 4 Intermediate questions
  - 3 Expert questions

### 7.4 Level Detection
- Score 0-3: Beginner
- Score 4-7: Intermediate
- Score 8-10: Expert
- Display only the detected level, hide others
- Store: Subject, Score, Level

### 7.5 Assessment Quiz Questions by Subject

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

## 8. Learning Structure

### 8.1 Hierarchy
Subject → Level → Topics → Topic Page

Example: Java → Beginner → Variables → Topic Page

### 8.2 Topic Page Content
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

### 8.3 YouTube Video Integration

**Video Format:**
All videos must use embed links in the format: youtube.com/embed/videoID

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

## 9. Subject Roadmaps and Complete Module Structure

### 9.1 Java
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

### 9.2 Python
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

### 9.3 HTML
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

### 9.4 CSS
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

### 9.5 JavaScript
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

### 9.6 C Programming
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

### 9.7 C++
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

### 9.8 PHP
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

### 9.9 SQL
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

### 9.10 Data Structures
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

### 9.11 English Communication
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

## 10. Module Structure Requirements

### 10.1 Universal Module Requirements
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

### 10.2 Topic Page Structure
Each topic must be clickable and open a Topic Learning Page containing:
- Full theory explanation
- Syntax
- Examples
- Notes
- Exercises
- 1-2 YouTube videos

Content must be detailed and comprehensive, not short summaries.

## 11. Module Quiz

### 11.1 Quiz Structure
Every module in every subject must include a Module Quiz:
- 5 Questions per module
- Question Types: Mix of MCQ + Fill in the blanks

### 11.2 Pass/Fail Logic
- Score ≤ 2: Retake quiz
- Score ≥ 3: Module completed, proceed to next

### 11.3 Universal Quiz Rule
All subjects must include:
- Assessment Quiz (10 Questions)
- Module Quiz (5 Questions per module)
- Level Detection (Beginner/Intermediate/Expert)

No subject should skip quiz functionality.

## 12. Final Course Exam

### 12.1 Exam Trigger
After completing all modules in a subject, show Final Exam.

### 12.2 Final Exam Structure
- Total Questions: 20
- Question Types: 10 MCQ + 10 Fill in the blanks

### 12.3 Pass Rule
- Score ≥ 10: Course Completed

### 12.4 Fail Rule
- Score < 10: Retake Exam

### 12.5 Course Completion
After passing exam show:
- ✔ Course Completed
- ✔ Certificate Ready Message

Example: \"Congratulations! You completed Java Course.\"

## 13. Dashboard

### 13.1 Dashboard Elements
- Student Name
- Selected Subjects
- Skill Levels
- Progress Percentage
- Overall Progress
- Study Suggestions
- Weak Areas
- Study Streak
- Alerts

## 14. Study Reminders

### 14.1 Reminder Types
- Daily Reminder
- Quiz Reminder
- Incomplete Module Reminder

### 14.2 Notification System
- In-app notifications only
- Notification Bell icon

## 15. Study Streak

### 15.1 Streak Display
- Show: 🔥 Study Streak X Days
- Reset if user misses a day

## 16. Help Desk

### 16.1 Help Desk Fields
- Name
- Email
- Message

### 16.2 Functionality
- Store all messages for admin review

## 17. Feedback System

### 17.1 Feedback Trigger
After subject completion

### 17.2 Feedback Questions
- Was this helpful?
- Suggestions

## 18. Admin Panel

### 18.1 Admin Access
- Admin Login functionality

### 18.2 Admin Features
- View all users
- View user progress
- View help desk messages

## 19. Final Goals

The system must function as:
- Real Learning Platform
- Career Guide
- Roadmap Builder
- Confidence Builder

Specifically designed for first-generation students to provide comprehensive learning support and career guidance.

All subjects must behave consistently with complete modules, topics, learning pages, assessment quizzes, module quizzes, final exams, and videos following the W3Schools model.

## 20. Quiz Implementation Summary

All 11 subjects must include:
- Initial Assessment Quiz after subject selection
- Module Quizzes after completing each module
- Final Course Exam after completing all modules
- Level detection based on assessment score
- Pass/fail logic for module progression

Expected flow for all subjects:
Subject Selection → Knowledge Popup → Assessment Quiz → Level Detection → Modules → Module Quiz → Final Exam → Course Completed → Progress Tracking