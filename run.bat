```bat
@echo off
title Smart Classroom AI System Launcher By Agreem Srivastava

echo ==========================================
echo     SMART CLASSROOM AI SYSTEM
echo ==========================================
echo.
echo Starting Backend Server...
echo Starting Streamlit Dashboard...
echo.

REM Activate virtual environment (optional)
REM Uncomment if using venv
REM call venv\Scripts\activate

REM Start FastAPI Backend
start "FastAPI Backend" cmd /k "cd backend && uvicorn main:app --reload"

REM Wait 2 seconds
timeout /t 2 >nul

REM Start Streamlit Frontend
start "Streamlit Dashboard" cmd /k "cd frontend && streamlit run finalfrontend2.py"

echo.
echo ==========================================
echo Servers Started Successfully
echo ==========================================
echo.
echo Backend:
echo http://127.0.0.1:8000
echo.
echo Frontend:
echo http://localhost:8501
echo.
pause
```

