@ECHO OFF

REM COMANDO PARA TRATAR A CODIFICA��O DO C�DIGO.
CHCP 1252>NUL

REM LOOP PARA TESTAR A CONEX�O DE REDE
:REDE

REM TEXTO SOBRE A A��O DE VERIFICAR A REDE
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
ECHO -                                                                           -
ECHO =            CONFERINDO A CONEX�O DA M�QUINA COM A INTERNET                 =
ECHO -                                                                           -
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

REM COMANDO PARA CHECAR SE A CONEX�O COM A REDE EST� FUNCIONANDO
PING 10.1.0.18

REM CONDI��O PARA TRATAR O ERRO, CASO A REDE N�O ESTEJA FUNCIONANDO
IF %ERRORLEVEL% EQU 1 (

	REM TEXTO ESCLARECENDO QUE HOUVE UM ERRO DIRANTE A TENTATIVA DE CONEX�O
	COLOR 04
	ECHO -----------------------------------------------------------------------------
	ECHO.
	ECHO            N�O FOI POSS�VEL ESTABELECER UMA CONEX�O COM O SERVIDOR.
	ECHO        POR FAVOR, VERIFIQUE SE SUA REDE EST� NO DOM�NIO E FUNCIONANDO.
	ECHO.
	ECHO -----------------------------------------------------------------------------
	ECHO.

	PAUSE

	CLS

	COLOR 07

	REM TRATATIVA PARA O ERRO DE REDE ( VOLTAR AO LOOP E REFAZER O PROCESSO )
	GOTO :REDE 

) ELSE (

	REM TEXTO ESCLARECENDO QUE A CONEX�O COM A REDE FUNCIONOU COM �XITO
	COLOR 02
	ECHO -----------------------------------------------------------------------------
	ECHO.
	ECHO            A CONEX�O COM O SERVIDOR FOI ESTABELECIDA COM SUCESSO!!!
	ECHO.
	ECHO -----------------------------------------------------------------------------
	ECHO.

	PAUSE

	COLOR 07

)

REM TEXTO SOBRE A A��O DE CHECAR O MAPEAMNETO DAS UNIDADES
ECHO.
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
ECHO -                                                                           -
ECHO =                    CHECANDO O MAPEAMNETO DAS UNIDADES                     =
ECHO -                                                                           -
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
ECHO.

REM LISTA COM TODAS AS POSS�VEIS UNIDADES DO SISTEMA
SET "UNIDADES=C D E F G H I J K L M N O P Q R S T U V W X Y Z"

ECHO -----------------------------------------------------------------------------

REM LOOP PARA VERIFICAR OS STATUS DE CADA POSS�VEL UNIDADE DO SISTEMA
FOR %%u in (%UNIDADES%) DO (

	ECHO.

	REM COMANDO PARA HABILITAR O DEBUG DO TEMPO DE RELA��O DAS VARI�VEIS NO LOOP
	SETLOCAL ENABLEDELAYEDEXPANSION

	REM COMANDO PARA VERIFICAR SE A UNIDADE � DO TIPO "REDE", SE FOR, GERA UM TXT COM CONTE�DO, CASO CONTRARIO, O TXT FICA VAZIO
	NET USE %%u: > %temp%\UNIDADE_%%u.txt 2>NUL

	REM COMANDO PARA ADICIONAR O CONTE�DO DOS ARQUIVOS TXT GERADOS ANTERIORMENTE EM UMA VARI�VEL
	SET /P UNIDADE=<%temp%\UNIDADE_%%u.txt 2>NUL

	REM CONDI��O PARA FILTRAR AS UNIDADES LIVRES, SE A VARI�VEL ESTIVER VAZIA, � FEITO OUTROS COMANDOS E UMA NOVA CONDI��O, CASO CONTR�RIO, A UNIDADE � DE REDE
	IF "!UNIDADE!"=="" (

		REM CONDI��O PARA FILTRAR AS UNIDADES LIVRES, SE A UNIDADE EXISTIR, � UMA UNIDADE F�SICA, CASO CONTR�RIO, A UNIDADE EST� LIVRE.
		IF EXIST "%%u:\" (

			REM TEXTO PARA CASO A UNIDADE SEJA F�SICA
			ECHO A UNIDADE F�SICA "%%u:" J� EST� EM USO

		) ELSE (

			REM TEXTO PARA CASO A UNIDADE ESTEJA LIVRE
			ECHO A UNIDADE "%%u:" EST� LIVRE PARA USO
		)

	) ELSE ( 

		REM TEXTO PARA CASO A UNIDADE SEJA DE REDE
		ECHO A UNIDADE DE REDE "%%u:" J� EST� EM USO 

	)

	REM COMANDO PARA DELETAR OS ARQUIVOS TXT GERADOS DURANTE O LOOP
	DEL "%temp%\UNIDADE_%%u.txt" 2>NUL
	DEL "%temp%\UNI_%%u.txt" 2>NUL

	ECHO.
	ECHO -----------------------------------------------------------------------------

	REM COMANDO PARA DESABILITAR O DEBUG DO TEMPO DE RELA��O DAS VARI�VEIS NO LOOP
	ENDLOCAL 

)

ECHO.

PAUSE

EXIT