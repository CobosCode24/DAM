@echo off

echo Creando el fichero %3 ...
echo a > %3

echo copiando el contenido del fichero %1 a %3 ...
type %1 > %3

echo copiando el contenido del fichero %2 a %3 ...
type %2 >> %3

pause > nul