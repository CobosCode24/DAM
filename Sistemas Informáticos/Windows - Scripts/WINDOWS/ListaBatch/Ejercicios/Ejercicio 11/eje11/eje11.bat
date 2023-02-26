@echo off

if %1 EQU %2 (goto siguienteComp) else (goto distintos)

:siguienteComp
if %1 EQU %3 (goto iguales) else (goto distintos)

:iguales
echo los tres %1 %2 %3 son iguales.
goto fin

:distintos
echo Hay alguno diferente.

:fin
pause>nul