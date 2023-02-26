@echo off

echo Creando un directorio llamado %1 ...
mkdir %1

echo Creando un directorio llamado %2 ...
mkdir %2

echo Creando un fichero llamado %3 ...
echo %time% > %3

pause>nul