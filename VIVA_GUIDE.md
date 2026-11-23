# Online Quiz Application — Complete Viva & Demonstration Guide

## 1. How to Compile & Run the Project

### Option A: One-Click Batch Script (Recommended for Viva)
From `d:\java project`, double-click **`run.bat`** or run in PowerShell/CMD:
```powershell
.\run.bat
```
- **Web Application (Laptop):** http://localhost:8080
- **Web Application (Mobile Phone on same Wi-Fi/Hotspot):** `http://<Your-PC-IP>:8080`
- **Desktop Swing GUI Mode (Optional):** `.\run.bat --swing`

---

## 2. Core Java & OOP Concepts Used (Where to Show Examiner)

| # | OOP / Java Concept | Class & Method Location | How to Explain in Viva |
|---|---|---|---|
| 1 | **Encapsulation** | `Person.java`, `User.java`, `Question.java`, `QuizConfig.java` | All data fields (`username`, `password`, `role`, `options`, `marksPerQuestion`, `examTimeWindow`) are declared `private` and accessed safely via `public` getters and setters. |
| 2 | **Single Inheritance & `super`** | `User.java` (`User extends Person`) | `Person` is the parent class storing `username`; `User` is the child class that calls `super(username)` in its constructor and adds `password` and `role`. |
| 3 | **Constructor Overloading** | `User.java` & `QuizConfig.java` | `User` has a 3-arg constructor `(username, password, role)` and a 2-arg constructor `(username, password)` that defaults new registrations to `"STUDENT"`. `QuizConfig` has 7-arg, 5-arg, and 4-arg overloaded constructors. |
| 4 | **Compile-Time Polymorphism (Method Overloading)** | `QuizCalculator.java` | Two methods named `calculateScore`: a 2-parameter version `(correctAnswers, marksPerQuestion)` for standard scoring, and a 4-parameter version `(correctAnswers, wrongAnswers, marksPerQuestion, negativeMarks)` for negative marking. |
| 5 | **1D Arrays** | `Question.java` (`String[] options`), `QuizWebServer.java` (`int[] userAnswers`) | Fixed 4-element `String[]` array holds Options A, B, C, and D for each MCQ. |
| 6 | **Collections Framework (`ArrayList` & `Collections.shuffle`)** | `FileManager.java` (`getQuestionsForQuiz`) | Uses dynamic `ArrayList<Question>` to load questions from `questions.txt` and `Collections.shuffle()` to randomize question order for every student attempt. |
| 7 | **File Handling (`.txt` CSV Storage)** | `FileManager.java` | Uses `BufferedReader`, `FileReader`, `BufferedWriter`, and `FileWriter` to persist data across 4 text files (`users.txt`, `quiz_config.txt`, `questions.txt`, `results.txt`) without any external database. |
| 8 | **Exception Handling (`try-catch` & `try-with-resources`)** | `FileManager.java`, `QuizConfig.java`, `QuizWebServer.java` | Handles `IOException` during file read/write and `NumberFormatException` when parsing numbers from text inputs. |
| 9 | **Built-in JDK HTTP Server (`HttpServer`)** | `QuizWebServer.java` | Uses `com.sun.net.httpserver.HttpServer` and `HttpHandler` interfaces from standard Java SE (`jdk.httpserver`) to serve the web UI and JSON REST endpoints on port `8080`. |

---

## 3. Data File Schemas (`.txt` Files in Project Root)

1. **`users.txt`** — `username,password,role`
   - Example: `admin,admin123,ADMIN` and `student1,pass123,STUDENT`
2. **`quiz_config.txt`** — `subject,numQuestionsToPick,timePerQuestionSeconds,marksPerQuestion,negativeMarks,examActive,examTimeWindow`
   - Example: `Java Programming,5,15,4.0,1.0,true,00:00|23:59`
3. **`questions.txt`** — `subject,questionText,optionA,optionB,optionC,optionD,correctOptionIndex`
   - Example: `Java Programming,Which keyword is used to inherit a class in Java?,implements,extends,inherits,super,1`
4. **`results.txt`** — `username,subject,score,maxScore,status,locked`
   - Example: `student1,Java Programming,15.0,20.0,COMPLETED,true`

---

## 4. 2-Minute Live Demo Script for Your Examiner

1. **Login as Student (`student1` / `pass123`):**
   - Show the **Available Examinations** cards with live timing badges (`● Live Now`), question count, timer per question, and `+4.0 / -1.0` marking scheme.
2. **Demonstrate Live Timer & Anti-Cheating:**
   - Start **Java Programming**, answer 1–2 questions, and show the per-question countdown timer bar.
   - Switch to another browser tab (or press `Alt + Tab`): show how the exam **immediately auto-submits** with `⚠ AUTO-SUBMITTED (TAB SWITCH)`, locks the attempt, and displays the **GATE/JEE-style Candidate Response Sheet** with green/red answer highlights and the official correct answer bar.
3. **Show Exam Attempt Lock:**
   - Click **Back to Assessments** and show that **Java Programming** now says `🔒 Attempt Locked — Contact Professor to Unlock`.
4. **Login as Professor (`admin` / `admin123`):**
   - **Tab 1 (Configure Quiz & Timings):** Show how the Professor can change Marks per Question, Negative Penalty, Exam Start/End Time, or click **`⏸ Pause / Close`** to close an exam live.
   - **Tab 2 (Question Bank):** Add a new MCQ to `questions.txt`.
   - **Tab 3 (Student Results & Bulk Unlock):** Show the student's `AUTO-SUBMITTED (TAB SWITCH)` record and click **"🔓 Unlock All Students (Selected Subject)"** or **"🌐 Global Unlock All"** to grant immediate rewrite access!
