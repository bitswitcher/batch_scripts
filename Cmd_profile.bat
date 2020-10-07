@echo off

rem change code page
rem  932(shift_jis) / 51932 (euc-jp) / 65001(utf-8)
rem chcp 932

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

rem prompt setting
prompt $$$s
rem prompt $n:$s$$$s
rem prompt %%cd%$s$$$s
