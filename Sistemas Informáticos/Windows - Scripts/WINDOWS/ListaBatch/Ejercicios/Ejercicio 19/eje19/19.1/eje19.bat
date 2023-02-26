@echo off

chcp 65001>nul

set /p select=choice /c VLAS /m "V. Ver agenda, L. Ordena por localidades, A. Ordena por apellidos, S. Salir "
if %select% EQU V (call vernormal.bat)
if %select% EQU L (call ordlocal.bat)
if %select% EQU A (call ordapel.bat)
if %select% EQU S (goto fin)

:fin
echo Saliendo de la agenda...
pause>nul