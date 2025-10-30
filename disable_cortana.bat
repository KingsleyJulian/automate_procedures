@echo off
echo Disabling Cortana...

:: Add registry key to disable Cortana
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f

echo Cortana has been disabled. A restart is required for changes to take effect.
pause
