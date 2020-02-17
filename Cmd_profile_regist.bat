@echo off
setlocal

reg add   "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" /v AutoRun /d %~dp0cmd_profile.bat
reg query "HKEY_CURRENT_USER\Software\Microsoft\Command Processor" /v AutoRun

pause
