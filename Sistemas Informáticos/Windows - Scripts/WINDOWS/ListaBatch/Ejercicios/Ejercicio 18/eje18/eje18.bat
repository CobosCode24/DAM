@echo off

echo opcion A.
echo opcion B.
echo opcion C.
echo opcion D.
echo .
set /p select=Elige una opcion 

if %select% EQU A (goto correct)
if %select% EQU B (goto correct)
if %select% EQU C (goto correct)
if %select% EQU D (goto correct) else (goto fin)

:correct
echo Has elegido la opcion %select%

:fin
pause>nul