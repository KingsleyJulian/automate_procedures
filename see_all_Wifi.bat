@echo off
echo Showing all saved Wi-Fi profiles and their passwords:
echo.

for /f "tokens=*" %%a in ('netsh wlan show profiles') do (
    echo %%a | findstr "All User Profile" >nul
    if not errorlevel 1 (
        for /f "tokens=4 delims=: " %%b in ("%%a") do (
            echo Profile: %%b
            netsh wlan show profile name="%%b" key=clear | findstr "Key Content"
            echo.
        )
    )
)

echo.
pause
