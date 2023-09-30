@ECHO OFF

REM COMANDOS PARA TRATAR A CODIFICAÇÃO DO CÓDIGO.
CHCP 1252>NUL

REM COMANDO PARA LISTAR A SAIDA DO COMANDO PARA UM ARQUIVO TEMPORÁRIO.
NETSH WLAN SHOW INTERFACES > "%temp%\LISTA1.txt"

REM COMANDO PARA SELECIONAR UM TRECHO ESPECÍFICO DO ARQUIVO TEMPORÁRIO.
FOR /f "delims= skip=8" %%a in (%temp%\LISTA1.txt) DO (

REM VARIÁVEL PARA GUARDAR O SSID DA REDE WI-FI.
SET SSID=%%a

GOTO END_1

)

REM CAMINHO PARA FINALIZAR AS AÇÕES DOS PRIMEIROS COMANDOS.
:END_1

REM COMANDO PARA LISTAR A SAIDA DO COMANDO PARA UM ARQUIVO TEMPORÁRIO
NETSH WLAN SHOW PROFILE "%SSID:~29,100%" key"="clear > "%temp%\LISTA2.txt"

REM COMANDO PARA SELECIONAR UM TRECHO ESPECÍFICO DO ARQUIVO TEMPORÁRIO.
FOR /f "delims= skip=32" %%a in (%temp%\LISTA2.txt) DO (

REM VARIÁVEL PARA GUARDAR A SENHA DA REDE WI-FI.
SET SENHA=%%a

GOTO END_2

)

REM CAMINHO PARA FINALIZAR AS AÇÕES DOS SEGUNDOS COMANDOS.
:END_2

REM TEXTO PARA EXIBIR AS INFORMAÇÕES DA REDE WI-FI CONECTADA.
ECHO --------------------------------------------------------------------
ECHO.
ECHO	          INFORMAÇÕES DA REDE WI-FI CONECTADA ATUALMENTE
ECHO.
ECHO --------------------------------------------------------------------
ECHO.
ECHO			      SSID  : ( %SSID:~29,100% )          
ECHO.
ECHO			      SENHA : ( %SENHA:~35,100% )
ECHO.
ECHO --------------------------------------------------------------------
ECHO.

REM PAUSA PARA O USUÁRIO CONSEGUIR VISUALIZAR O TEXTO ANTERIOR.
PAUSE
