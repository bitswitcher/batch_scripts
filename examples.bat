@echo off
setlocal
setlocal ENABLEEXTENSIONS
setlocal ENABLEDELAYEDEXPANSION

rem get filename with extention
echo %~nx0

rem get filename without extention
echo %~nx0

rem get dirname without filename
echo %~dp0

rem change title bar
title %~nx0

rem make YYYYMMDD_HHMM format string
set tmptime=%time: =0%
set tmpname=%date:~-10,4%%date:~-5,2%%date:~-2,2%_%tmptime:~0,2%%tmptime:~3,2%

rem check exist file/dir
set BASE=TmpDir
if not exist %BASE% mkdir %BASE%

rem touch empty file
type nul > %BASE%\%tmpname%.txt

rem echo blank line (several approaches exist)
echo AAA
echo:
echo BBB
echo;
echo CCC
echo,
echo DDD
echo.

rem part of string
set STR1=0123456789
rem 0123456789
echo %STR1:~0%
rem 012
echo %STR1:~0,3%
rem 3456789
echo %STR1:~3%
rem 34567
echo %STR1:~3,5%
rem 34
echo %STR1:~3,-5%
rem 56789
echo %STR1:~-5%
rem 56
echo %STR1:~-5,2%
rem 567
echo %STR1:~-5,-2%

rem substitute string
set STR2=foobar
rem bazbar
echo %STR2:foo=baz%
rem foo
echo %STR2:bar=%

rem compare substitute string
if not "!STR2:foo=!" == "!STR2!" (
  echo match foo
)
if not "!STR2:bak=!" == "!STR2!" (
  echo match bak
) else (
  echo mismatch bak
)

rem random
echo %RANDOM%

rem support both ProgramFiles location system
if exist "%ProgramFiles(x86)%" (
  set CSBASE="%ProgramFiles(x86)%\%CSDIR%\"
) else (
  set CSBASE="%ProgramFiles%\%CSDIR%\"
)

rem "

rem check errorcode
if %ERRORLEVEL% neq 0 (
  echo error is occur!
  exit /b %ERRORLEVEL%
)

rem loop
for /l %%i in (1,1,3) do (
  call :test_func1 %%i
  if !ERRORLEVEL! neq 0 (
    echo error is occur!
    exit /b %ERRORLEVEL%
  )
)

rem endless loop with counter
for /l %%j in (0,0,0) do (
  set /a j+=1
  call :test_func2 !j!
  if !ERRORLEVEL! neq 0 (
    echo error is occur!
    exit /b %ERRORLEVEL%
  )
)

if not "%1" == "nowait" pause

rem function (must have return code [exit /b errorcode])
:test_func1
  echo [%1] sleeping...
  timeout /nobreak /t 1 > nul
  exit /b 0

:test_func2
  echo [%1] sleeping...
  timeout /nobreak /t 1 > nul
  if %1 equ 3 (
    exit /b 1
  )
  exit /b 0

