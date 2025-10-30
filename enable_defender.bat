@echo off
:: Run as administrator check
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Please run this batch file as Administrator.
    pause
    exit /b
)

echo Enabling Windows Defender...

:: Enable Windows Defender by removing DisableAntiSpyware or setting it to 0
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableAntiSpyware" /t REG_DWORD /d 0 /f

:: Enable Windows Defender Real-Time Protection
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 0 /f

echo Enabling User Account Control (UAC)...

:: Enable UAC by setting EnableLUA to 1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 1 /f

echo Done. Please restart your computer for changes to take effect.
pause
