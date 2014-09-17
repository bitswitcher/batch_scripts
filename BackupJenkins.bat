@echo off
setlocal

set BKUPBASE=backup\

set TMPTIME=%time: =0%
set BKUPDIR=%date:~-10,4%%date:~-5,2%%date:~-2,2%_%TMPTIME:~0,2%%TMPTIME:~3,2%\

pushd %~dp0

if not exist "config.xml" (
  echo "Not found Jenkins config file"
  exit /b 1
)

mkdir %BKUPBASE%%BKUPDIR%plugins

rem backup config files and plugins
xcopy /d /y /k *.xml %BKUPBASE%%BKUPDIR%
xcopy /d /y /k plugins\*.jpi %BKUPBASE%%BKUPDIR%plugins

rem backup jobs (config, builds)
for /d %%i in (jobs\*) do (
  mkdir %BKUPBASE%%BKUPDIR%%%i
  xcopy /d /y /k %%i\*.xml %BKUPBASE%%BKUPDIR%%%i

  xcopy /d /y /b /e /h /k %%i\*.lnk %BKUPBASE%%BKUPDIR%%%i\
  xcopy /d /y /b /e /h /k %%i\builds %BKUPBASE%%BKUPDIR%%%i\builds
)

rem backup other
if exist logparse (
  mkdir %BKUPBASE%%BKUPDIR%logparse
  xcopy /d /y /k logparse\* %BKUPBASE%%BKUPDIR%logparse
)

popd
pause
