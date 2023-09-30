@ECHO OFF

SET LINHAS=ECHO -----------------------------------------------------------------------------------------------------------------

%LINHAS%
ECHO.
CD /D "C:\ADB ANDROID"
CMD /K "adb version && ECHO. && %LINHAS% && ECHO. && adb devices -l && %LINHAS%"

EXIT
