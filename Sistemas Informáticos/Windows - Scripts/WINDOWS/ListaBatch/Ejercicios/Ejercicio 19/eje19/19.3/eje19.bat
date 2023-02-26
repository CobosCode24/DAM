@echo off

echo Opciones V (normal) L (localidades) A (apellidos) S (salir).
choice /c VLAS > nul
if %errorlevel% EQU 1 (goto vernormal)
if %errorlevel% EQU 2 (goto localidad)
if %errorlevel% EQU 3 (goto apellido)
if %errorlevel% EQU 4 (goto fin)

:vernormal
call vernormal.bat
goto fin

:localidad
call ordlocal.bat
goto fin

:apellido
call ordapel.bat
goto fin

:fin
echo Saliendo de la agenda...
pause>nul