@echo off
cd /d "C:\Users\dhira\OneDrive\Desktop\Apps\Recipe"

echo ==============================
echo   My Recipe Box - Git Push
echo ==============================
echo.

git status
echo.

git add .

git diff --cached --quiet
if %errorlevel%==0 (
    echo No changes to commit.
    echo.
    pause
    exit /b
)

set /p msg=Enter commit message (or press Enter for default): 

if "%msg%"=="" set msg=Update Recipe Box

git commit -m "%msg%"

if %errorlevel% neq 0 (
    echo.
    echo Commit failed.
    pause
    exit /b
)

git push

echo.
if %errorlevel%==0 (
    echo Successfully pushed Recipe Box to GitHub.
) else (
    echo Push failed. Check the message above.
)

echo.
pause