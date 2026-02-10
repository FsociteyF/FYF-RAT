@echo off
title RAT Setup 

:: Banner
echo #################################################
echo #                                               #
echo #      FYF RAT SETUP                            #
echo #      (Auto-EXE Generation Support)            #
echo #                                               #
echo #################################################
echo.

:: Check for Python
echo [*] Checking for Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [-] Python is not installed! Please install Python from python.org and make sure it's added to your system's PATH.
    pause
    exit /b
)

echo [+] Python found.

:: Upgrade pip
echo [*] Upgrading pip...
python -m pip install --upgrade pip

:: Install requirements
echo [*] Installing required libraries...
echo [*] This includes PyInstaller for EXE conversion and Pillow for screenshots.
pip install pyinstaller pillow customtkinter pyautogui

if %errorlevel% neq 0 (
    echo [-] An error occurred while installing requirements.
    echo [!] Trying to install individually...
    pip install pyinstaller
    pip install pillow
    pip install customtkinter
    pip install pyautogui
)

echo.
echo [+] All requirements installed successfully.
echo.
pause
