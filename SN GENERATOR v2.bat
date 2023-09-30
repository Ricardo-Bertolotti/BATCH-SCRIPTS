@ECHO OFF

REM COMANDO PARA TRATAR A CODIFICAÇÃO DO CÓDIGO.
CHCP 1252>NUL

REM COMANDO PARA ATIVAR A EXPANSÃO ATRASADA DE VARIÁVEIS.
SETLOCAL ENABLEDELAYEDEXPANSION

REM VARIÁVEL PARA DEFINIR O CARACTER QUE SERÁ USADO.
SET "CARACTER=-"

REM VARIÁVEL PARA DEFINIR O COMPRIMENTO DO DESENHO ( QUANTIDADE DE CARACTERES ).
SET "LINHAS_REPETIÇÃO=73

REM COMANDO PARA CRIAR UMA VARIÁVEL COM O DESENHO, USANDO OS PARÂMETROS DEFINIDOS.
FOR /L %%i IN (2,1,%LINHAS_REPETIÇÃO%) DO SET "CARACTER=!CARACTER!%CARACTER%"
SET "DESENHAR_LINHAS=!CARACTER!"
ENDLOCAL & SET "DESENHAR_LINHAS=%DESENHAR_LINHAS%"

REM CABEÇALHO
ECHO %DESENHAR_LINHAS%
ECHO.
ECHO 		GERADOR DE NÚMEROS DE SÉRIE OU SEQUÊNCIAS
ECHO.
ECHO %DESENHAR_LINHAS%
ECHO.

REM COMANDO PARA DEFINIR O PREFIXO.
SET /p PREFIXO=DIGITE O PREFIXO : 
ECHO.

REM COMANDO PARA DEFINIR O INICIO DO INTERVALO.
:INICIO
SET /p INICIAL=DIGITE O VALOR INICIAL : 
ECHO.

REM COMANDO PARA TRATAR UMA ENTRADA VAZIA NO "VALOR INICIAL".
IF NOT DEFINED INICIAL (

	CLS

	ECHO %DESENHAR_LINHAS%
	ECHO.
	ECHO 		GERADOR DE NÚMEROS DE SÉRIE OU SEQUÊNCIAS
	ECHO.
	ECHO %DESENHAR_LINHAS%
	ECHO.

	ECHO PREFIXO DEFINIDO ANTERIORMENTE : "%PREFIXO%"
	ECHO.

	ECHO ERRO: VALOR INICIAL NÃO DEFINIDO...
	ECHO.

	GOTO INICIO

)

REM COMANDO PARA TRATAR UMA ENTRADA VAZIA NO "VALOR INICIAL".
IF "%INICIAL:~0,1%" EQU " " ( 

	CLS

	ECHO %DESENHAR_LINHAS%
	ECHO.
	ECHO 		GERADOR DE NÚMEROS DE SÉRIE OU SEQUÊNCIAS
	ECHO.
	ECHO %DESENHAR_LINHAS%
	ECHO.

	ECHO PREFIXO DEFINIDO ANTERIORMENTE : "%PREFIXO%"
	ECHO.

	ECHO ERRO: VALOR INICIAL NÃO DEFINIDO...
	ECHO.

	GOTO INICIO

)

REM COMANDO PARA VERIFICAR SE O "VALOR INICIAL" É NUMÉRICO.
SET "ERRO="
FOR /f "delims=0123456789" %%i IN ("%INICIAL%") DO SET "ERRO=1"
IF DEFINED ERRO ( 

	CLS

	ECHO %DESENHAR_LINHAS%
	ECHO.
	ECHO 		GERADOR DE NÚMEROS DE SÉRIE OU SEQUÊNCIAS
	ECHO.
	ECHO %DESENHAR_LINHAS%
	ECHO.

	ECHO PREFIXO DEFINIDO ANTERIORMENTE : "%PREFIXO%"
	ECHO.

	ECHO ERRO: O VALOR INICIAL DEVE CONTER APENAS NÚMEROS
	ECHO.

	GOTO INICIO

)

REM COMANDO PARA DEFINIR O FIM DO INTERVALO.
:FIM
SET /p FINAL=DIGITE O VALOR FINAL : 
ECHO.

REM COMANDO PARA TRATAR UMA ENTRADA VAZIA NO "VALOR FINAL".
IF NOT DEFINED FINAL (

	CLS

	ECHO %DESENHAR_LINHAS%
	ECHO.
	ECHO 		GERADOR DE NÚMEROS DE SÉRIE OU SEQUÊNCIAS
	ECHO.
	ECHO %DESENHAR_LINHAS%
	ECHO.

	ECHO PREFIXO DEFINIDO ANTERIORMENTE : "%PREFIXO%"
	ECHO.

	ECHO VALOR INICIAL DEFINIDO ANTERIORMENTE : "%INICIAL%"
	ECHO.

	ECHO ERRO: VALOR FINAL NÃO DEFINIDO...
	ECHO.

	GOTO FIM

)

REM COMANDO PARA TRATAR UMA ENTRADA VAZIA NO "VALOR FINAL".
IF "%FINAL:~0,1%" EQU " " ( 

	CLS

	ECHO %DESENHAR_LINHAS%
	ECHO.
	ECHO 		GERADOR DE NÚMEROS DE SÉRIE OU SEQUÊNCIAS
	ECHO.
	ECHO %DESENHAR_LINHAS%
	ECHO.

	ECHO PREFIXO DEFINIDO ANTERIORMENTE : "%PREFIXO%"
	ECHO.

	ECHO VALOR INICIAL DEFINIDO ANTERIORMENTE : "%INICIAL%"
	ECHO.

	ECHO ERRO: VALOR FINAL NÃO DEFINIDO...
	ECHO.

	GOTO FIM

)

REM COMANDO PARA VERIFICAR SE O "VALOR INICIAL" É NUMÉRICO.
SET "ERRO="
FOR /f "delims=0123456789" %%i IN ("%FINAL%") DO SET "ERRO=1"
IF DEFINED ERRO ( 

	CLS

	ECHO %DESENHAR_LINHAS%
	ECHO.
	ECHO 		GERADOR DE NÚMEROS DE SÉRIE OU SEQUÊNCIAS
	ECHO.
	ECHO %DESENHAR_LINHAS%
	ECHO.

	ECHO PREFIXO DEFINIDO ANTERIORMENTE : "%PREFIXO%"
	ECHO.

	ECHO VALOR INICIAL DEFINIDO ANTERIORMENTE : "%INICIAL%"
	ECHO.

	ECHO ERRO: O VALOR FINAL DEVE CONTER APENAS NÚMEROS
	ECHO.

	GOTO FIM

)

REM COMANDO PARA VERIFICAR SE O VALOR FINAL É MAIOR QUE O INICIAL ( RANGE ).
IF %FINAL% LSS %INICIAL% (

	CLS

	ECHO %DESENHAR_LINHAS%
	ECHO.
	ECHO 		GERADOR DE NÚMEROS DE SÉRIE OU SEQUÊNCIAS
	ECHO.
	ECHO %DESENHAR_LINHAS%
	ECHO.

	ECHO PREFIXO DEFINIDO ANTERIORMENTE : "%PREFIXO%"
	ECHO.

	ECHO VALOR INICIAL DEFINIDO ANTERIORMENTE : "%INICIAL%"
	ECHO.

	ECHO ERRO: O VALOR FINAL DEVE SER MAIOR QUE O VALOR INICIAL
	ECHO.

	GOTO FIM

)

ECHO %DESENHAR_LINHAS%
ECHO.

REM DEFININDO VARIÁVEIS QUE SERÃO USADAS NOS COMANDOS PARA OBTER O RANGE MÍNIMO E MÁXIMO DOS SN'S.
SET /A CONTADOR_MAX=0
SET MAXIMO=%PREFIXO%%FINAL%

REM COMANDO PARA OBTER O RANGE MÁXIMO DO SN.
:LOOP_CONTADOR_MAXIMO

IF "%MAXIMO%" == "" ( SET MAXIMO=%CONTADOR_MAX% & GOTO FIM_LOOP_CONTADOR_MAXIMO )

IF %MAXIMO% NEQ "" (

	SET /A CONTADOR_MAX=%CONTADOR_MAX% + 1
 	SET MAXIMO=%MAXIMO:~0,-1%
 	GOTO LOOP_CONTADOR_MAXIMO
)

:FIM_LOOP_CONTADOR_MAXIMO

SET /A CONTADOR_MIN=0
SET MINIMO=%PREFIXO%%INICIAL%

:LOOP_CONTADOR_MINIMO

IF "%MINIMO%" == "" ( SET MINIMO=%CONTADOR_MIN% & GOTO FIM_LOOP_CONTADOR_MINIMO )

IF %MINIMO% NEQ "" (

	SET /A CONTADOR_MIN=%CONTADOR_MIN% + 1
 	SET MINIMO=%MINIMO:~0,-1%
 	GOTO LOOP_CONTADOR_MINIMO
)

REM COMANDO PARA OBTER O RANGE MÍNIMO DO SN.
:FIM_LOOP_CONTADOR_MINIMO

SET /A DIFERENCA=%MAXIMO%-%MINIMO%

SET ZEROS=
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /l %%i IN (1,1,%DIFERENCA%) DO SET ZEROS=!ZEROS!0
ENDLOCAL

REM DEPOIS CMT
SET /A FINAL=%FINAL% + 1


:GERADOR_LOOP

REM COMANDO PARA VERIFICAR QUANDO O RANGE MÍNIMO ATINGIRÁ O RANGE MÁXIMO.
IF %INICIAL% LSS %FINAL% (

	SET VAR=%INICIAL%

) ELSE ( GOTO ENDIF )


SET /A CONTADOR_ATUAL=0
SET ATUAL=%PREFIXO%%VAR%

REM COMANDO PARA OBTER QUANTOS "ZEROS À ESQUERDA" O ATUAL SN DO LOOP DEVE TER.
:INICIO_LOOP_CONTADOR_ATUAL

IF "%ATUAL%" == "" ( SET ATUAL=CONTADOR_ATUAL & GOTO FINAL_LOOP_CONTADOR_ATUAL )

SET ATUAL=%ATUAL:~0,-1%
SET /A CONTADOR_ATUAL=%CONTADOR_ATUAL% + 1

GOTO INICIO_LOOP_CONTADOR_ATUAL

:FINAL_LOOP_CONTADOR_ATUAL

SET /A DIFERENCA=%MAXIMO% - %CONTADOR_ATUAL%

REM COMANDO PARA ADICONAR OS "ZEROS À ESQUERDA" NO SN.
SET ZEROS=
SETLOCAL ENABLEDELAYEDEXPANSION
FOR /l %%i IN (1,1,%DIFERENCA%) DO SET ZEROS=!ZEROS!0
ENDLOCAL & SET "ZEROS=%ZEROS%"

REM COMANDO PARA EXIBIR OS SN'S DO RANGE DEFINIDO.
ECHO %PREFIXO%%ZEROS%%INICIAL%

REM COMANDO PARA SEGUIR COM O PRÓXIMO SN, AUMENTANDO O SEU VALOR EM 1 UNIDADE.
SET /A INICIAL=%VAR% + 1

GOTO GERADOR_LOOP

:ENDIF

ECHO.
ECHO %DESENHAR_LINHAS%
ECHO.

PAUSE

EXIT