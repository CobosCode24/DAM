@echo off

echo Creando directorio llamado %1 ...
md %1

echo Copiando todos lor archivos que contienen %2 a %1 ...
copy ^%2*  %1

::^%2.*

echo Creando fichero llamado %3 con la fecha actual ...
echo %date% > %3

echo mostrando la fecha del archivo %3 ...
type %3

echo +++++++FIN++++++

pause>nul