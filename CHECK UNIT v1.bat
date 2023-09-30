@ECHO OFF

REM COMANDO PARA TRATAR A CODIFICAÇÃO DO CÓDIGO.
CHCP 1252>NUL

REM LOOP PARA TESTAR A CONEXÃO DE REDE
:REDE

REM TEXTO SOBRE A AÇÃO DE VERIFICAR A REDE
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
ECHO -                                                                           -
ECHO =            CONFERINDO A CONEXÃO DA MÁQUINA COM A INTERNET                 =
ECHO -                                                                           -
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

REM COMANDO PARA CHECAR SE A CONEXÃO COM A REDE ESTÁ FUNCIONANDO
PING 10.1.0.18

REM CONDIÇÃO PARA TRATAR O ERRO, CASO A REDE NÃO ESTEJA FUNCIONANDO
IF %ERRORLEVEL% EQU 1 (

	REM TEXTO ESCLARECENDO QUE HOUVE UM ERRO DIRANTE A TENTATIVA DE CONEXÃO
	COLOR 04
	ECHO -----------------------------------------------------------------------------
	ECHO.
	ECHO            NÃO FOI POSSÍVEL ESTABELECER UMA CONEXÃO COM O SERVIDOR.
	ECHO        POR FAVOR, VERIFIQUE SE SUA REDE ESTÁ NO DOMÍNIO E FUNCIONANDO.
	ECHO.
	ECHO -----------------------------------------------------------------------------
	ECHO.

	PAUSE

	CLS

	COLOR 07

	REM TRATATIVA PARA O ERRO DE REDE ( VOLTAR AO LOOP E REFAZER O PROCESSO )
	GOTO :REDE 

) ELSE (

	REM TEXTO ESCLARECENDO QUE A CONEXÃO COM A REDE FUNCIONOU COM ÊXITO
	COLOR 02
	ECHO -----------------------------------------------------------------------------
	ECHO.
	ECHO            A CONEXÃO COM O SERVIDOR FOI ESTABELECIDA COM SUCESSO!!!
	ECHO.
	ECHO -----------------------------------------------------------------------------
	ECHO.

	PAUSE

	COLOR 07

)

REM TEXTO SOBRE A AÇÃO DE CHECAR O MAPEAMNETO DAS UNIDADES
ECHO.
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
ECHO -                                                                           -
ECHO =                    CHECANDO O MAPEAMNETO DAS UNIDADES                     =
ECHO -                                                                           -
ECHO =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
ECHO.

REM LISTA COM TODAS AS POSSÍVEIS UNIDADES DO SISTEMA
SET "UNIDADES=C D E F G H I J K L M N O P Q R S T U V W X Y Z"

ECHO -----------------------------------------------------------------------------

REM LOOP PARA VERIFICAR OS STATUS DE CADA POSSÍVEL UNIDADE DO SISTEMA
FOR %%u in (%UNIDADES%) DO (

	ECHO.

	REM COMANDO PARA HABILITAR O DEBUG DO TEMPO DE RELAÇÃO DAS VARIÁVEIS NO LOOP
	SETLOCAL ENABLEDELAYEDEXPANSION

	REM COMANDO PARA VERIFICAR SE A UNIDADE É DO TIPO "REDE", SE FOR, GERA UM TXT COM CONTEÚDO, CASO CONTRARIO, O TXT FICA VAZIO
	NET USE %%u: > %temp%\UNIDADE_%%u.txt 2>NUL

	REM COMANDO PARA ADICIONAR O CONTEÚDO DOS ARQUIVOS TXT GERADOS ANTERIORMENTE EM UMA VARIÁVEL
	SET /P UNIDADE=<%temp%\UNIDADE_%%u.txt 2>NUL

	REM CONDIÇÃO PARA FILTRAR AS UNIDADES LIVRES, SE A VARIÁVEL ESTIVER VAZIA, É FEITO OUTROS COMANDOS E UMA NOVA CONDIÇÃO, CASO CONTRÁRIO, A UNIDADE É DE REDE
	IF "!UNIDADE!"=="" (

		REM CONDIÇÃO PARA FILTRAR AS UNIDADES LIVRES, SE A UNIDADE EXISTIR, É UMA UNIDADE FÍSICA, CASO CONTRÁRIO, A UNIDADE ESTÁ LIVRE.
		IF EXIST "%%u:\" (

			REM TEXTO PARA CASO A UNIDADE SEJA FÍSICA
			ECHO A UNIDADE FÍSICA "%%u:" JÁ ESTÁ EM USO

		) ELSE (

			REM TEXTO PARA CASO A UNIDADE ESTEJA LIVRE
			ECHO A UNIDADE "%%u:" ESTÁ LIVRE PARA USO
		)

	) ELSE ( 

		REM TEXTO PARA CASO A UNIDADE SEJA DE REDE
		ECHO A UNIDADE DE REDE "%%u:" JÁ ESTÁ EM USO 

	)

	REM COMANDO PARA DELETAR OS ARQUIVOS TXT GERADOS DURANTE O LOOP
	DEL "%temp%\UNIDADE_%%u.txt" 2>NUL
	DEL "%temp%\UNI_%%u.txt" 2>NUL

	ECHO.
	ECHO -----------------------------------------------------------------------------

	REM COMANDO PARA DESABILITAR O DEBUG DO TEMPO DE RELAÇÃO DAS VARIÁVEIS NO LOOP
	ENDLOCAL 

)

ECHO.

PAUSE

EXIT