@echo off

:: todos iguales.
if "%1" EQU "%2" if "%2" EQU "%3" (
	echo Todos son iguales.
)

:: todos distintos.
if "%1" NEQ "%2" if "%1" NEQ "%3" (
	echo Todos son distintos.
)

:: El distinto es %1
if "%2" EQU "%3" if "%2" NEQ "%1" (
	echo El distinto es %1.
)

:: El distinto es %2
if "%1" EQU "%3" if "%1" NEQ "%2" (
	echo El distinto es %2.
)

:: El distinto es %3
if %2 EQU %1 if %2 NEQ %3 (
	echo El distinto es %3.
)

pause>nul