@echo off

rem change code page
rem  932(shift_jis) / 51932 (euc-jp) / 65001(utf-8)
chcp 932

rem alias
doskey pwd=cd
doskey p=cd
doskey ..=cd ..
doskey ls=dir /b $*
doskey ll=dir $*
doskey la=dir /a:h
doskey cat=type $*
doskey t=tree /f
doskey td=tree
doskey mv=move $*
doskey rm=del $*
doskey clear=cls
doskey less=more /e $*
doskey lv=more /e $*
doskey ifc=ipconfig
doskey pingl=ping 192.168.$1

rem alias (cd)
set PREV_PWD_FILE=%TEMP%\pwd.prev
set PREV_PWD_TEMP=%TEMP%\pwd.temp
doskey cd=if ""=="$1" (^
    @cd ^
) else if "-"=="$1" (^
    @for /f "usebackq tokens=*" %%i in ^(`cd`^) do @echo %%i^>"%PREV_PWD_TEMP%" ^& ^
    @for /f "usebackq tokens=*" %%i in ^("%PREV_PWD_FILE%"^) do @cd "%%i" ^&^& ^
    @type "%PREV_PWD_FILE%" ^& ^
    @type "%PREV_PWD_TEMP%" ^> "%PREV_PWD_FILE%" ^
) else (^
    @for /f "usebackq tokens=*" %%i in ^(`cd`^) do @echo %%i^>"%PREV_PWD_TEMP%" ^& @cd $* ^&^& @type "%PREV_PWD_TEMP%" ^> "%PREV_PWD_FILE%" ^
)
set PREV_PWD_FILE=
set PREV_PWD_TEMP=

rem clear initial display
cls
echo %cd%

rem prompt setting
prompt $$$s
rem prompt $n:$s$$$s
rem prompt %%cd%$s$$$s
