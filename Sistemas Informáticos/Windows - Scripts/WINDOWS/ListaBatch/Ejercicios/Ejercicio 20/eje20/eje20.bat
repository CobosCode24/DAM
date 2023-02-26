@echo off

set /p input=introduce el nombre de un directorio o archivo para comprobar si existe...  
echo se esta filtrando por %input% ...

IF EXIST %input% (goto encontrado) ELSE (goto noEncontrado)

:encontrado
echo Si se ha encontrado %input% ...
goto fin

:noEncontrado
echo no se ha encontrado %input%
goto fin

:fin
pause>nul