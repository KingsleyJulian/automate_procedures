@echo off
setlocal ENABLEDELAYEDEXPANSION

:: Function to prompt and install
call :PromptInstall "Python" "Python.Python.3"
call :PromptInstall "C++ Build Tools (Visual Studio)" "Microsoft.VisualStudio.2022.BuildTools"
call :PromptInstall "Visual Studio Code" "Microsoft.VisualStudioCode"
call :PromptInstall "Arduino IDE" "ArduinoSA.IDE.stable"
call :PromptInstall "Docker Desktop" "Docker.DockerDesktop"
call :PromptInstall "Git" "Git.Git"
call :PromptInstall "GitHub CLI" "GitHub.cli"

echo All selected installations complete.
pause
exit /b

:PromptInstall
set "toolName=%~1"
set "toolId=%~2"

:AskUser
set /p choice=Do you want to install %toolName%? (Yes/No): 
if /i "%choice%"=="Yes" (
    echo Installing %toolName%...
    winget install --id %toolId% --silent --accept-source-agreements --accept-package-agreements
    echo.
) else if /i "%choice%"=="No" (
    echo Skipping %toolName%.
    echo.
) else (
    echo Invalid input. Please type Yes or No.
    goto AskUser
)

goto :eof
