@echo off
setlocal
setlocal ENABLEEXTENSIONS
setlocal ENABLEDELAYEDEXPANSION

set BASENAME=%~n1

rem Demux AAC
ffmpeg -i Original_MP4\%BASENAME%.mp4 -y -c copy output\intermediate\%BASENAME%.adts
timeout /T 1 /nobreak > nul

rem AAC to 61937
spdifaac.exe output\intermediate\%BASENAME%.adts output\intermediate\%BASENAME%.dat
timeout /T 1 /nobreak > nul

rem 61937 to WAV
sox -t raw -e signed-integer -b 16 -r %2 -c 2 -B output\intermediate\%BASENAME%.dat output\%BASENAME%.wav
timeout /T 1 /nobreak > nul

