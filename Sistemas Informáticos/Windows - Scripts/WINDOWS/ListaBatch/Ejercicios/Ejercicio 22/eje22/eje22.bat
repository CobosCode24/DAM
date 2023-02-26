@echo off

set contadorNumeros=0
set media=0
set suma=0

:bucle
	set /p numero=introduce numero: 
	if "%numero%" EQU "99" (goto fin)
	set /a suma=%suma%+%numero%
	set /a contadorNumeros=%contadorNumeros%+1
	goto bucle

:fin
cls
set /a media=(%suma%/%contadorNumeros%)

echo Has introducido %contadorNumeros% numeros.
echo La media de los numeros introducidos es: %media% .

pause>nul