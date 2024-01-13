@ECHO OFF

REM COMANDOS PARA TRATAR A CODIFICAÇÃO DO CÓDIGO.
CHCP 1252>NUL

:: POSSÍVEIS CAMINHOS DOS ARQUIVOS BINÁRIOS DE INICIALIZAÇÃO
SET "registryPath=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run"
REM SET "registryPath=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run

:: DEFINIR O NOME DO PROGRAMA QUE TERÁ A INICIALIZAÇÃO DESABILITADA.
SET "programName=NomeDoPrograma"

:: UTILIZAR O COMANDO REG.EXE PARA OBTER O ATUAL VALOR BINÁRIO DO ARQUIVO E SALVA-LO EM UM ARQUIVO TEMPORÁRIO.
REG QUERY "%registryPath%" /V "%programName%" | FINDSTR /R /C:"2" > "%temp%\0_regedit.txt"

:: VARIÁVEL PARA ALOCAR O VALOR BINÁRIO ORIGINAL DO ARQUIVO QUE SERÁ MODIFICADO.
SET /P binaryValor=<"%temp%\0_regedit.txt"

:: DEFINIR UM NOVO VALOR BINÁRIO PARA DESABILITAR A INICIALIZAÇÃO DO PROGRAMA DESEJADO.
SET "newBinaryValor=0300000039E4E5E4AC45DA01"

:: MENSAGENS PARA EXIBIR O VALOR BINÁRIO ORIGINAL E O VALOR MODIFICADO DO PROGRAMA
ECHO.
ECHO --------------------------------------------------------------------
ECHO.
ECHO O valor binário atual da entrada %programName% é : %binaryValor:~27,100% .
ECHO.
ECHO --------------------------------------------------------------------
ECHO.
ECHO valor binário atual da entrada %programName% foi alterado para : %newBinaryValor% .
ECHO.
ECHO --------------------------------------------------------------------

:: UTILIZAR O COMANDO REG.EXE PARA MODIFICAR O VALOR DO REGISTRO DO PROGRAMA
REG ADD "%registryPath%" /V "%programName%" /T REG_BINARY /D %newBinaryValor% /F

PAUSE
