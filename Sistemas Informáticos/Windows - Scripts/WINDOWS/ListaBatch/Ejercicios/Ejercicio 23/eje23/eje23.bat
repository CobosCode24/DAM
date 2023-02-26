@echo off

set intentos=3
set intentosInicial=3

:bucle
set /p respuesta=¿Cuanto es 6+2?
if "%respuesta%" EQU "8" (goto correcto) else (goto mensajes)

:mensajes
if "%intentos%" EQU "0" (goto dead)
echo te quedan %intentos% intentos.
set /a intentos=%intentos%-1
goto bucle

:dead
echo GAME OVER
goto fin

:correcto
set /a result=%intentosInicial%-%intentos%
echo CORRECTO, has acertado en %result% intentos.
goto fin

:fin
pause>nul