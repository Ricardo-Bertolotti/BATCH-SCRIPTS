@ECHO OFF

REM COMANDOS PARA TRATAR A CODIFICA��O DO C�DIGO.
FOR /f "tokens=2 delims=:." %%x IN ('CHCP') DO SET cp=%%x
CHCP 1252>NUL

REM TEXTO PARA EXIBIR AS INFORMA��ES DOS ENDERE�OS F�SICOS.
ECHO --------------------------------------------------------------------
ECHO.
ECHO	          INFORMA��ES DOS ENDERE�OS F�SICOS DA M�QUINA
ECHO.
ECHO --------------------------------------------------------------------
ECHO.
ECHO              ENDERE�O F�SICO   ...   NOME DE TRANSPORTE              
ECHO.
ECHO --------------------------------------------------------------------

GETMAC | FINDSTR /V "transporte" | FINDSTR /V "="    
ECHO.
ECHO --------------------------------------------------------------------
ECHO.

REM PAUSA PARA O USU�RIO CONSEGUIR VISUALIZAR O TEXTO ANTERIOR.
PAUSE

REM COMANDO PARA RETORNAR A CODIFICA��O DO C�DIGO PARA CODIFICA��O PADR�O.
CHCP %cp%>NUL














