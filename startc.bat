title ALTIS LIFE SERVER
@echo off
C:\Windows\SysWOW64\mode con cols=50 lines=7 >nul
set /a var=0
color f
 
:start
cls
 
title ALTIS LIFE SERVER ( %var% CRASHES )
echo -------------------------------------------------
echo           SERVER HAS CRASHED %var% TIME(S)
echo ---This Server Session Started At: %time%---
echo ---------------- Running Server -----------------
echo ---------------- ARMA DEDICATED -----------------
echo ----------Created For/By Vennessa------------
echo -------------------------------------------------
 
start "" /wait /high "C:\Program Files (x86)\Steam\steamapps\common\Arma 3\arma3server_x64.exe" -malloc=tbbmalloc_x64 -pid=pid -server -port=2302 "-config=C:\Program Files (x86)\Steam\steamapps\common\Arma 3\config\server.cfg" "-cfg=C:\Program Files (x86)\Steam\steamapps\common\Arma 3\config\basic.cfg" "-profiles=C:\Program Files (x86)\Steam\steamapps\common\Arma 3\config\Users\mylife" -name=mylife -filePatching "-servermod=@VRR_server;@extDB3;@infiSTAR_A3;@The_Programmer;@obfusqf" -autoInit -bepath=C:\Program Files (x86)\Steam\steamapps\common\Arma 3\config\BattleEye
set /a var+=1
cls
title ALTIS LIFE SERVER ( %var% CRASHES )

quit﻿