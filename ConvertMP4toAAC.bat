@echo off
setlocal
setlocal ENABLEEXTENSIONS
setlocal ENABLEDELAYEDEXPANSION

rem check tool exist
if not exist "C:\Program Files\ffmpeg\bin\ffmpeg.exe" (
  echo not exist ffmpeg.exe
  pause
)

if not exist "C:\Program Files (x86)\sox\sox.exe" (
  echo not exist sox.exe
  pause
)

if not exist "C:\Program Files\spdifaac\spdifaac.exe" (
  echo not exist spdifaac.exe
  pause
)

rem check folder exist
set BASE_DIR="C:\work\tani\work\content\MPEG-4"
if not exist %BASE_DIR% (
  echo not exist %BASE_DIR% folder
  pause
)
cd %BASE_DIR%

set MP4_DIR=Original_MP4
if not exist %MP4_DIR% (
  echo not exist %MP4_DIR% folder
  pause
)

set OUT_DIR=output
if not exist %OUT_DIR% (
  mkdir %OUT_DIR%
  mkdir %OUT_DIR%\intermediate
)

set PROC_EXE=%~dp0\ConvertAACProc.bat

rem start converting
call %PROC_EXE% al00_32.mp4 32000
call %PROC_EXE% al00_44.mp4 44100
call %PROC_EXE% al00_48.mp4 48000

call %PROC_EXE% al01_32.mp4 32000
call %PROC_EXE% al01_44.mp4 44100
call %PROC_EXE% al01_48.mp4 48000

call %PROC_EXE% al02_32.mp4 32000
call %PROC_EXE% al02_44.mp4 44100
call %PROC_EXE% al02_48.mp4 48000

call %PROC_EXE% al03_32.mp4 32000
call %PROC_EXE% al03_44.mp4 44100
call %PROC_EXE% al03_48.mp4 48000

call %PROC_EXE% al04_32.mp4 32000
call %PROC_EXE% al04_44.mp4 44100
call %PROC_EXE% al04_48.mp4 48000

call %PROC_EXE% al05_32.mp4 32000
call %PROC_EXE% al05_44.mp4 44100
call %PROC_EXE% al05_48.mp4 48000

call %PROC_EXE% al06_32.mp4 32000
call %PROC_EXE% al06_44.mp4 44100
call %PROC_EXE% al06_48.mp4 48000

call %PROC_EXE% al07_32.mp4 32000
call %PROC_EXE% al07_44.mp4 44100
call %PROC_EXE% al07_48.mp4 48000

call %PROC_EXE% al08_32.mp4 32000
call %PROC_EXE% al08_44.mp4 44100
call %PROC_EXE% al08_48.mp4 48000

call %PROC_EXE% al14_32.mp4 32000
call %PROC_EXE% al14_44.mp4 44100
call %PROC_EXE% al14_48.mp4 48000

call %PROC_EXE% al15_32.mp4 32000
call %PROC_EXE% al15_44.mp4 44100
call %PROC_EXE% al15_48.mp4 48000

call %PROC_EXE% al16_32.mp4 32000
call %PROC_EXE% al16_44.mp4 44100
call %PROC_EXE% al16_48.mp4 48000

call %PROC_EXE% al17_32.mp4 32000
call %PROC_EXE% al17_44.mp4 44100
call %PROC_EXE% al17_48.mp4 48000

call %PROC_EXE% al18_32.mp4 32000
call %PROC_EXE% al18_44.mp4 44100
call %PROC_EXE% al18_48.mp4 48000

call %PROC_EXE% al19_32.mp4 32000
call %PROC_EXE% al19_44.mp4 44100
call %PROC_EXE% al19_48.mp4 48000

pause
