@echo off

:: Tres parametros. YES
:: A A A
:: mas de 3 parametros. YES
:: A A A A
:: Dos parametros. YES
:: A   A
:: A A  
::   A A
:: Un parametro. YES
:: A    
::   A   
::     A
:: ningun parametro. YES
::      

:: Mas de tres.
if "%4" NEQ "" (goto masDeTres)

:: Ninguno
if "%1" EQU "" if "%2" EQU "" if "%3" EQU "" (goto ninguno)

:: Tres
if "%1" NEQ "" if "%2" NEQ "" if "%3" NEQ "" (goto tres)

:: Dos
if "%1" NEQ "" if "%2" EQU "" if "%3" NEQ "" (goto dos)
if "%1" NEQ "" if "%2" NEQ "" if "%3" EQU "" (goto dos)
if "%1" EQU "" if "%2" NEQ "" if "%3" NEQ "" (goto dos)

:: Uno
if "%1" NEQ "" if "%2" EQU "" if "%3" EQU "" (goto uno)
if "%1" EQU "" if "%2" NEQ "" if "%3" EQU "" (goto uno)
if "%1" EQU "" if "%2" EQU "" if "%3" NEQ "" (goto uno)
	
:ninguno
echo No ha introducido ningún parámetro debe introducir 3.
goto fin

:uno
echo Ha introducido 1 parametro debe introducir 3.
goto fin

:dos
echo ha introducido dos parámetros debe introducir 3.
goto fin

:tres
echo Correcto, ha introducido 3 parámetros.
goto fin

:masDeTres
echo Ha introducido mas de tres parámetros debe introcudir 3.
goto fin

:fin
pause>nul