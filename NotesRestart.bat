@echo off
setlocal
setlocal ENABLEEXTENSIONS
setlocal ENABLEDELAYEDEXPANSION

rem force kill Lotus Notes/Domino process
set NOTES_PROC=ntaskldr.exe
tasklist | find "%NOTES_PROC%" > nul
if not errorlevel 1  (
   taskkill /im %NOTES_PROC% /F /T
)

set NOTES_PROC=nlnotes.exe
tasklist | find "%NOTES_PROC%" > nul
if not errorlevel 1  (
   taskkill /im %NOTES_PROC% /F /T
)

set NOTES_PROC=nnotesmm.exe
tasklist | find "%NOTES_PROC%" > nul
if not errorlevel 1  (
   taskkill /im %NOTES_PROC% /F /T
)

rem start Lotus Notes/Domino process
start " " "C:\Program Files (x86)\lotus\notes\notes.exe"
