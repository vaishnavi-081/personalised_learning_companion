# Task: Build Personalized Learning Companion for First-Generation Students

## Plan
- [x] Step 1: Setup Design System & Theme
- [x] Step 2: Initialize Supabase Backend
- [x] Step 3: Setup Authentication System
- [x] Step 4: Create Core Layout & Navigation
- [x] Step 5: Build Subject Selection & Assessment
- [x] Step 6: Build Learning Content System
- [x] Step 7: Build Dashboard & Progress Tracking
- [x] Step 8: Build Notification System
- [x] Step 9: Build Help Desk & Feedback
- [x] Step 10: Build Admin Panel
- [x] Step 11: Create API Layer & Database Functions
- [x] Step 12: Add Complete Topics for ALL Subjects
- [x] Step 13: Add Assessment Quizzes for ALL Subjects
- [x] Step 14: Add Module Quizzes for ALL Topics
- [x] Step 15: Fix YouTube Video Display
- [x] Step 16: Make Learning Modules Interactive
- [x] Step 17: Build Career Domain Guidance System
- [x] Step 18: Add Subject Domain Grouping & Final Exam
- [x] Step 19: Fix Career Navigation & Video Issues
  - [x] Update all topic videos with working embed URLs
  - [x] Add required_subjects field to careers table
  - [x] Map all careers to their required subjects
  - [x] Create CareerRequiredSubjectsPage
  - [x] Update CareerPathPage to navigate to required subjects
  - [x] Add route for career required subjects page
- [x] Step 20: Final Testing & Validation

## Notes
- Using Supabase for authentication and database
- ALL subjects now have comprehensive W3Schools-style content
- **Assessment Quizzes**: All 11 subjects have 10-question assessment quizzes
- **Module Quizzes**: All topics have 5-question module quizzes
- **YouTube Videos**: All videos now use working embed URLs
  * Java: https://www.youtube.com/embed/grEKMHGYyns
  * Python: https://www.youtube.com/embed/_uQrJ0TkZlc
  * HTML: https://www.youtube.com/embed/pQN-pnXPaVg
  * CSS: https://www.youtube.com/embed/1PnVor36_40
  * JavaScript: https://www.youtube.com/embed/W6NZfCO5SIk
  * C Programming: https://www.youtube.com/embed/KJgsSFOSQv0
  * C++: https://www.youtube.com/embed/vLnPwxZdW4Y
  * SQL: https://www.youtube.com/embed/HXV3zeQKqGY
  * Data Structures: https://www.youtube.com/embed/RBSGKlAvoiM
  * English Communication: https://www.youtube.com/embed/juKd26qkNAw
- **Interactive Learning System**: Colorful cards, code blocks, quiz lock system
- **Career Domain Guidance System**: 9 domains with 40+ careers
- **Career Navigation Flow**: Career Domains → Select Career → View Career Path → Required Subjects → Select Subject → Knowledge Check → Quiz → Modules → Final Exam
- **Subject Domains**: Engineering & Technology, Software & IT, Commerce & Business
- **Final Exam System**: 20 questions (10 MCQ + 10 fill blanks), pass score ≥10
- **Career-Subject Mapping**:
  * Software Engineer → Java, Python, HTML, CSS, JavaScript, SQL, Data Structures
  * Frontend Developer → HTML, CSS, JavaScript
  * Backend Developer → Java, Python, SQL, PHP
  * Full Stack Developer → HTML, CSS, JavaScript, Java, Python, SQL
  * Data Scientist → Python, SQL, Data Structures
  * AI Engineer → Python, Data Structures
  * Cybersecurity Engineer → Python, C Programming, Data Structures
  * Engineering Careers → C Programming, C++, Data Structures
  * Other Careers → English Communication
- Quiz flow: Subject Selection → Knowledge Check → Assessment Quiz → Topics → Module Quiz → Next Topic Unlocked
- Career flow: Career Domains → Select Domain → Select Career → View Career Path → Required Subjects → Select Subject → Start Learning
- First user to register will automatically become admin
- Study streak updates when completing topics
- Platform is now a complete Learning + Career Guidance + AI Mentor System
