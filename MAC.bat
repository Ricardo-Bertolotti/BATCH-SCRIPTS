@ECHO OFF

REM COMANDOS PARA TRATAR A CODIFICAÇÃO DO CÓDIGO.
FOR /f "tokens=2 delims=:." %%x IN ('CHCP') DO SET cp=%%x
CHCP 1252>NUL

REM TEXTO PARA EXIBIR AS INFORMAÇÕES DOS ENDEREÇOS FÍSICOS.
ECHO --------------------------------------------------------------------
ECHO.
ECHO	          INFORMAÇÕES DOS ENDEREÇOS FÍSICOS DA MÁQUINA
ECHO.
ECHO --------------------------------------------------------------------
ECHO.
ECHO              ENDEREÇO FÍSICO   ...   NOME DE TRANSPORTE              
ECHO.
ECHO --------------------------------------------------------------------

GETMAC | FINDSTR /V "transporte" | FINDSTR /V "="    
ECHO.
ECHO --------------------------------------------------------------------
ECHO.

REM PAUSA PARA O USUÁRIO CONSEGUIR VISUALIZAR O TEXTO ANTERIOR.
PAUSE

REM COMANDO PARA RETORNAR A CODIFICAÇÃO DO CÓDIGO PARA CODIFICAÇÃO PADRÃO.
CHCP %cp%>NUL














