@ECHO OFF

REM COMANDOS PARA TRATAR A CODIFICA��O DO C�DIGO.
CHCP 1252>NUL

NET LOCALGROUP Usu�rios | FINDSTR "MLTBR" > "%temp%\User0.txt"

SET /P USER=<"%temp%\User0.txt"

NET LOCALGROUP Administradores %USER:~6% /ADD

PAUSE

DEL "%temp%\User0.txt"

SHUTDOWN /R /T 0




