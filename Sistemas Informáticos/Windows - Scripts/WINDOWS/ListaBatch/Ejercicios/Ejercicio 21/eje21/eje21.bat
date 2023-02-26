@echo off

set /p num1=numero 1:
set /p num2=numero 2:
set /p operacion=Operación :

if "%operacion%" EQU "+" (goto mas)
if "%operacion%" EQU "-" (goto menos) 
if "%operacion%" EQU "*" (goto por)
if "%operacion%" EQU "/" (goto div)

:mas
set /a result=%num1%+%num2%
echo El resultado de %num1% + %num2% es %result%
goto fin

:menos
set /a result=%num1%-%num2%
echo El resultado de %num1% - %num2% es %result%
goto fin

:por
set /a result=%num1%*%num2%
echo El resultado de %num1% * %num2% es %result%
goto fin

:div
set /a result=%num1%/%num2%
echo El resultado de %num1% / %num2% es %result%
goto fin

:fin
pause>nul