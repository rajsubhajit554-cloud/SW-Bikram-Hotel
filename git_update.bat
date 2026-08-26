@echo off
setlocal enabledelayedexpansion
title SW Bikram Hotel - Git Auto Updater
echo ======================================================
echo          SW BIKRAM HOTEL - GIT AUTO UPDATER
echo ======================================================
echo.

:: Check git installation
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed or not found in PATH.
    echo Please install Git from https://git-scm.com/
    pause
    exit /b 1
)

echo [1/4] Checking Git status...
git status
echo.

:: Get commit message from user
set /p "commit_msg=Enter commit message (Press Enter for default message): "
if "!commit_msg!"=="" (
    set "commit_msg=Update website files - %date% %time%"
)

echo.
echo [2/4] Adding all changes (git add .)...
git add .

echo.
echo [3/4] Creating commit...
git commit -m "!commit_msg!"

echo.
echo [4/4] Pushing to GitHub (origin main)...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ======================================================
    echo [SUCCESS] Git repository successfully updated and pushed!
    echo ======================================================
) else (
    echo.
    echo ======================================================
    echo [WARNING / ERROR] Push failed. Please check your internet or git credentials.
    echo ======================================================
)

echo.
pause
