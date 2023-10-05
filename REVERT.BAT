@ECHO OFF

C:

CD "C:\Windows\System32"

GOTO SETHC
REM GOTO UTILMAN

:SETHC

REN "C:\Windows\System32\sethc.exe" "cmd.exe"

REN "C:\Windows\System32\sethc1.exe" "sethc.exe"

DEL /Q "C:\Windows\System32\cmd_copia.exe"

DEL /Q "C:\Windows\System32\sethc_copia.exe"

GOTO END

:UTILMAN

REN "C:\Windows\System32\Utilman.exe" "cmd.exe"

REN "C:\Windows\System32\Utilman1.exe" "Utilman.exe"

DEL /Q "C:\Windows\System32\cmd_copia.exe"

DEL /Q "C:\Windows\System32\Utilman_copia.exe"

:END

PAUSE

SHUTDOWN /R /T 0
