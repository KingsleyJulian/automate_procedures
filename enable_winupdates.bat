@echo off
echo Enabling Windows Update service...

:: Set Windows Update service startup to automatic
sc config wuauserv start= auto

:: Start the Windows Update service
net start wuauserv

echo Windows Update service has been enabled.
pause
