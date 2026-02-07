@echo off
setlocal
set "SCRIPT=%~dp0Install-BankAloneGuides.ps1"
powershell -NoProfile -ExecutionPolicy Bypass -File "%SCRIPT%"
pause
