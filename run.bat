```bat id="q0z6m8"
@echo off
title Smart Classroom AI System

color 0A

echo ==========================================
echo        SMART CLASSROOM AI SYSTEM
echo ==========================================
echo.
echo Starting Backend Server...
echo Starting Streamlit Dashboard...
echo.

REM ==========================================
REM START BACKEND HIDDEN
REM ==========================================

start /min cmd /c "cd backend && uvicorn main:app --reload"

REM WAIT
timeout /t 3 >nul

REM ==========================================
REM START STREAMLIT HIDDEN
REM ==========================================

start /min cmd /c "cd frontend && streamlit run finalfrontend2.py"

echo ==========================================
echo.
echo Backend Running  : http://127.0.0.1:8000
echo Frontend Running : http://localhost:8501
echo.
echo Type EXIT and press ENTER to stop system
echo ==========================================
echo.

:loop
set /p command=

if /I "%command%"=="exit" goto shutdown

goto loop

:shutdown

echo.
echo Stopping Smart Classroom System...
echo.

REM Kill Streamlit
taskkill /F /IM streamlit.exe >nul 2>&1

REM Kill Uvicorn / Python
taskkill /F /IM python.exe >nul 2>&1

echo System Stopped Successfully.
timeout /t 2 >nul
exit
```
