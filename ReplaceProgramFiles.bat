@echo off
setlocal

if "%1" == "" exit /b 1
if "%2" == "" exit /b 2

set tmpfile=%2

type nul >%tmpfile%

for /f "delims=" %%A in (%1) do (
  set line=%%A
  if not "%%A" == "pause" call :REPLACE
)

GOTO :eof

:REPLACE
  echo %line:Program Files (x86)=Program Files% >> %tmpfile%
  exit /b
