@echo off
title Online Quiz Application - Java Server
echo ======================================================================
echo   Compiling Java Online Quiz Application...
echo ======================================================================
javac -encoding UTF-8 -d src src/Person.java src/User.java src/Question.java src/QuizConfig.java src/QuizCalculator.java src/FileManager.java src/UITheme.java src/LoginFrame.java src/AdminDashboardFrame.java src/QuizSelectionFrame.java src/QuizFrame.java src/ResultFrame.java src/QuizWebServer.java src/Main.java

if %errorlevel% neq 0 (
    echo [ERROR] Compilation failed!
    pause
    exit /b %errorlevel%
)

echo [OK] Compilation successful! Starting application...
echo.
java -cp src Main %*
pause
