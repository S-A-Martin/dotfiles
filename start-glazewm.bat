@echo off
REM Start GlazeWM (adjust the path if needed)
start "" "C:\Program Files\glzr.io\GlazeWM\glazewm.exe"
REM Wait 5 seconds for apps to start
timeout /t 3 /nobreak >nul
REM Launch your apps
start "" "chrome"
start "" "code"
start "" "wt"
start "" "ms-teams"
start "" "explorer"
start "" "C:\Program Files\Oracle\VirtualBox\VirtualBoxVM.exe"
start "" "C:\Program Files\PowerToys\PowerToys.exe"