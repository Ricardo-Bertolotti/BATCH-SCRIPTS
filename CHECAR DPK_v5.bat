@ECHO OFF

REM SCRIPT PARA EXIBIR AS INFORMAÇÕES DE NÚMERO DE SÉRIE, CHAVE DA MÁQUINA E O RESULTADO DO TESTE DE VALIDAÇÃO DA CHAVE. 
REM E CASO PRECISE, É POSSÍVEL ARMAZENAR AS INFORMAÇÕES EM UM DOCUMENTO DE TEXTO COM O NOME ESCOLHIDO PELO USUÁRIO.

ECHO ------------------------------------------------------------------------------------------------------------------------

REM ARQUIVO TEMPORÁRIO PARA SETAR A CHAVE DA MÁQUINA NA VARIÁVEL ( Chave ).
wmic path softwarelicensingservice get OA3xOriginalProductKey | find /I /V "OA3xOriginalProductKey" > "%temp%\Chave.txt"
SET /p Chave=<"%temp%\Chave.txt"

REM TEXO COM O VALOR DA CHAVE DA MÁQUINA.
ECHO.
ECHO 				   Chave da maquina : %Chave%
ECHO.

REM ARQUIVO TEMPORÁRIO PARA SETAR O NÚMERO DE SÉRIE DA MÁQUINA NA VARIÁVEL ( Número_de_Série ).
wmic bios get serialnumber | findstr /v Serial > "%temp%\Número_de_Série.txt"
SET /p Número_de_Série=<"%temp%\Número_de_Série.txt"

REM TEXO COM O VALOR DO NÚMERO DE SÉRIE DA MÁQUINA.
ECHO.
ECHO 				   Numero de serie da maquina : %Número_de_Série%
ECHO.

REM VARIÁVEL PARA TRATAR ERRO DE CARACTERE INVÁLIDO.
SET Escolha_Inválida=0

ECHO ------------------------------------------------------------------------------------------------------------------------

REM CAMINHO PARA TRATAR O ERRO DE CARACTERE INVÁLIDO.
:Escolha_relatorio

IF %Escolha_Inválida% EQU 1 (
	ECHO.
	COLOR 04
	ECHO Caracter invalido, tente novamente...
)

REM VARIÁVEL DE ESCOLHA PARA GERAR OU NÃO UM RELATÓRIO COM AS INFORMAÇÕES DE NÚMERO DE SÉRIE E CHAVE.
ECHO.
SET CHOICE=
SET /p CHOICE=Gerar um relatorio dos dados [S/N]? 
ECHO.
ECHO ------------------------------------------------------------------------------------------------------------------------

REM CONDIÇÕES PARA TRATAR A VARIÁVEL DA ESCOLHA.
IF '%CHOICE%'=='s' GOTO Gerar_relatorio
IF '%CHOICE%'=='S' GOTO Gerar_relatorio
if '%CHOICE%'=='n' GOTO Finalizar_script
IF '%CHOICE%'=='N' GOTO Finalizar_script

REM CONDIÇÃO PARA TRATAR UM ERRO DE CARACTRE INVÁLIDO.
IF %ERRORLEVEL% NEQ 1 (   
   SET Escolha_Inválida=1
   GOTO :Escolha_relatorio
)

REM CAMINHO PARA A GERAÇÃO DE RELATÓRIO.
:Gerar_relatorio

COLOR 07
ECHO.

REM VARIÁVEL PARA GRAVAR O NOME DO RELATÓRIO.
SET /p Relatorio=Nome do arquivo :  
ECHO.

REM COMANDO PARA GRAVAR O NÚMERO DE SÉRIE NO RELATÓRIO.
wmic bios get serialnumber | findstr /v Serial > %Relatorio%_Info.txt

REM COMANDO PARA GRAVAR A CHAVE NO RELATÓRIO.
wmic path softwarelicensingservice get OA3xOriginalProductKey | FINDSTR /v Key >> %Relatorio%_Info.txt

REM TEXTO PARA EXIBIR O SUCESSO DA GERAÇÃO DO RELATÓRIO.
COLOR 02
ECHO ------------------------------------------------------------------------------------------------------------------------
ECHO.
ECHO 					  Relatorio gerado com sucesso!
ECHO.
ECHO ------------------------------------------------------------------------------------------------------------------------
ECHO.

PAUSE

EXIT

REM CAMINHO PARA FINALIZAR O SCRIPT SEM GERAR O RELATÓRIO.
:Finalizar_script

COLOR 06
ECHO.
ECHO 				   		Operacao finalizada... 
ECHO.
ECHO ------------------------------------------------------------------------------------------------------------------------
ECHO.

PAUSE

EXIT
