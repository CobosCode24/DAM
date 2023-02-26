@echo off

if "%1" NEQ "" if "%2" NEQ "" (goto fin)
echo ha introducido %1
if exist %1 (goto mostrar) else (goto crearDirec)

:mostrar
dir %1
goto fin

:crearDirec
echo El directorio %1 no existe. creando directorio...
mkdir %1

:fin
pause>nul