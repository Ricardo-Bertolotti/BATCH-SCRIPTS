@ECHO OFF

CHCP 1252>NUL

SET LINHAS=------------------------------------------------------------------

ECHO.
NET SESSION >nul 2>&1 && GOTO MAIN

COLOR 04
ECHO %LINHAS%
ECHO.
ECHO ESTE SCRIPT REQUER PRIVILÉGIOS DE ADMINISTRADOR
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
ECHO. [ 1 ] - DESATIVAR TODOS OS SERVIÇOS
ECHO.
ECHO. [ 2 ] - DESATIVAR O WINDOWS DEFENDER
ECHO.
ECHO. [ 3 ] - DESATIVAR O FIREWALL
ECHO.
ECHO. [ 4 ] - DESATIVAR O WINDOWS UPDATE
ECHO.
ECHO %LINHAS%
ECHO.
CHOICE /C 1234 /N /M "ESCOLHA UMA OPÇÃO : "
ECHO.
CLS

IF %ERRORLEVEL%==1 GOTO OPÇÃO_1
IF %ERRORLEVEL%==2 GOTO OPÇÃO_2
IF %ERRORLEVEL%==3 GOTO OPÇÃO_3
ELSE GOTO OPÇÃO_4

:OPÇÃO_1

@echo off

REM Desativar o Windows Defender
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableIntrusionPreventionSystem /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableIOAVProtection /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f >nul

echo Windows Defender foi desativado. Lembre-se de ter um antivírus alternativo instalado.

pause

GOTO END



:OPÇÃO_2

GOTO END



:OPÇÃO_3

GOTO END



:OPÇÃO_4

@echo off

REM Desativar o Windows Defender
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableIntrusionPreventionSystem /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender" /v DisableIOAVProtection /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender" /v DisableRealtimeMonitoring /t REG_DWORD /d 0 /f >nul

echo Windows Defender foi desativado. Lembre-se de ter um antivírus alternativo instalado.

pause

:END

COLOR 02
ECHO.
ECHO %LINHAS%
ECHO.
ECHO SCRIPT EXECUTADO COM SUCESSO!!!
ECHO.
ECHO FUNÇÃO "CTRL + ALT + DEL" %CONTROLE% PARA LOGIN
ECHO CONFIRMAÇÃO PARA REQUISIÇÕES EM MODO ADMIN
ECHO.
ECHO REINICIE SUA MÁQUINA PARA QUE AS ALTERAÇÕES SEJAM APLICADAS!!
ECHO.
ECHO %LINHAS%
ECHO.
PAUSE

EXIT