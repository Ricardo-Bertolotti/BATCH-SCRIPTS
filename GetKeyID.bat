@ECHO OFF

REM COMANDOS PARA TRATAR A CODIFICAÇÃO DO CÓDIGO.
CHCP 1252>NUL

"%~dp0oa3tool.exe" /report /configfile=oa3tool.cfg

TYPE "reportProductKeyID.xml" > "%temp%\KEYID.txt"

SET "KeyID="

SET /P "KeyID=" < "%temp%\KEYID.txt"

SETLOCAL ENABLEDELAYEDEXPANSION

SET "TempKeyID=!KeyID:~19,13!"

CLS

ECHO.
ECHO --------------------------------------------------------------------
ECHO.
ECHO			      KeyID : ( !TempKeyID! )
ECHO.
ECHO --------------------------------------------------------------------
ECHO.

PAUSE