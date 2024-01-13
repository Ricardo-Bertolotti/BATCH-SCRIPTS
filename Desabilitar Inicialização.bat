@ECHO OFF

REM COMANDOS PARA TRATAR A CODIFICA��O DO C�DIGO.
CHCP 1252>NUL

:: POSS�VEIS CAMINHOS DOS ARQUIVOS BIN�RIOS DE INICIALIZA��O
SET "registryPath=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run"
REM SET "registryPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run

:: DEFINIR O NOME DO PROGRAMA QUE TER� A INICIALIZA��O DESABILITADA.
SET "programName=NomeDoPrograma"

:: UTILIZAR O COMANDO REG.EXE PARA OBTER O ATUAL VALOR BIN�RIO DO ARQUIVO E SALVA-LO EM UM ARQUIVO TEMPOR�RIO.
REG QUERY "%registryPath%" /V "%programName%" | FINDSTR /R /C:"2" > "%temp%\0_regedit.txt"

:: VARI�VEL PARA ALOCAR O VALOR BIN�RIO ORIGINAL DO ARQUIVO QUE SER� MODIFICADO.
SET /P binaryValor=<"%temp%\0_regedit.txt"

:: DEFINIR UM NOVO VALOR BIN�RIO PARA DESABILITAR A INICIALIZA��O DO PROGRAMA DESEJADO.
SET "newBinaryValor=0300000039E4E5E4AC45DA01"

:: MENSAGENS PARA EXIBIR O VALOR BIN�RIO ORIGINAL E O VALOR MODIFICADO DO PROGRAMA
ECHO.
ECHO --------------------------------------------------------------------
ECHO.
ECHO O valor bin�rio atual da entrada %programName% � : %binaryValor:~27,100% .
ECHO.
ECHO --------------------------------------------------------------------
ECHO.
ECHO valor bin�rio atual da entrada %programName% foi alterado para : %newBinaryValor% .
ECHO.
ECHO --------------------------------------------------------------------

:: UTILIZAR O COMANDO REG.EXE PARA MODIFICAR O VALOR DO REGISTRO DO PROGRAMA
REG ADD "%registryPath%" /V "%programName%" /T REG_BINARY /D %newBinaryValor% /F

PAUSE
