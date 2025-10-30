@echo off
echo Disabling Windows Update service...

:: Stop the Windows Update service
net stop wuauserv

:: Disable the Windows Update service
sc config wuauserv start= disabled

echo Windows Update service has been disabled.
pause
