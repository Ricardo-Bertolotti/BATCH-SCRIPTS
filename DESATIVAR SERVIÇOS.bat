@ECHO OFF

CHCP 1252>NUL

SET LINHAS=------------------------------------------------------------------

ECHO.
NET SESSION >nul 2>&1 && GOTO MAIN

COLOR 04
ECHO %LINHAS%
ECHO.
ECHO ESTE SCRIPT REQUER PRIVIL�GIOS DE ADMINISTRADOR
ECHO POR FAVOR, EXECUTE O SCRIPT COMO ADMINISTRADOR
ECHO.
ECHO %LINHAS%
ECHO.
PAUSE
EXIT /B

:MAIN
COLOR 01
ECHO %LINHAS%
ECHO.
ECHO. [ 1 ] - DESATIVAR TODOS OS SERVI�OS
ECHO.
ECHO. [ 2 ] - DESATIVAR O WINDOWS DEFENDER
ECHO.
ECHO. [ 3 ] - DESATIVAR O FIREWALL
ECHO.
ECHO. [ 4 ] - DESATIVAR O WINDOWS UPDATE
ECHO.
ECHO %LINHAS%
ECHO.
CHOICE /C 1234 /N /M "ESCOLHA UMA OP��O : "
ECHO.
CLS

IF %ERRORLEVEL%==1 GOTO OP��O_1
IF %ERRORLEVEL%==2 GOTO OP��O_2
IF %ERRORLEVEL%==3 GOTO OP��O_3
ELSE GOTO OP��O_4

:OP��O_1

@echo off

REM Desativar o Windows Defender
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableIntrusionPreventionSystem /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableIOAVProtection /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f >nul

echo Windows Defender foi desativado. Lembre-se de ter um antiv�rus alternativo instalado.

pause

GOTO END



:OP��O_2

GOTO END



:OP��O_3

GOTO END



:OP��O_4

@echo off

REM Desativar o Windows Defender
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableIntrusionPreventionSystem /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableIOAVProtection /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRealtimeMonitoring /t REG_DWORD /d 0 /f >nul

echo Windows Defender foi desativado. Lembre-se de ter um antiv�rus alternativo instalado.

pause

:END

COLOR 02
ECHO.
ECHO %LINHAS%
ECHO.
ECHO SCRIPT EXECUTADO COM SUCESSO!!!
ECHO.
ECHO FUN��O "CTRL + ALT + DEL" %CONTROLE% PARA LOGIN
ECHO CONFIRMA��O PARA REQUISI��ES EM MODO ADMIN
ECHO.
ECHO REINICIE SUA M�QUINA PARA QUE AS ALTERA��ES SEJAM APLICADAS!!
ECHO.
ECHO %LINHAS%
ECHO.
PAUSE

EXIT