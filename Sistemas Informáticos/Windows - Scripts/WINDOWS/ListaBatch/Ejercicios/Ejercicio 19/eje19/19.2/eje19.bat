@echo off

set /p select=choice /c VLAS /m "V. Ver agenda, L. Ordena por localidades, A. Ordena por apellidos, S. Salir "
if %select% EQU V (goto vernormal)
if %select% EQU L (goto ordlocal)
if %select% EQU A (goto ordapel)
if %select% EQU S (goto fin)

:vernormal
echo has entrado a Ver normal.

type AMIGOS.txt
echo .
goto fin

:ordlocal
cls

echo has entrado a Ordenar por Localidad.

SORT /+23 separado.txt
goto fin

:ordapel
echo has entrado a Ordenar por Apellido.

SORT /+9 separado.txt
goto fin

:fin
echo Saliendo de la agenda...
pause>nul