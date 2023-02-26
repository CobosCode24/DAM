@echo off

:: 5 parametros.

:: %1 cambiar la letra del disco C: -> R:
:: %2 crear directorio.
:: %3 copiar archivos con la extencion a dicho directorio.
:: %4 copiar contenido de los archivos del %3 a un fichero llamado por el %4.
:: %5 crear CONTE.TXT con el contenido pasado por %5 y mostrar contenido.

echo Cambiando label del disco C: ...
LABEL C: %1

echo mostrando la label del disco C: ...
VOL C:

echo creando directorio llamado %2 ...
mkdir %2

echo copiando archivos con la extension %3 al directorio %2
COPY *.%3 %2

echo copiando el contenido de los ficheros con extension %3 al fichero %4
COPY *.%3 %4

echo creando CONTE.txt con el contenido %5.
echo %5 > CONTE.txt

echo mostrando CONTE.txt...
type CONTE.txt

pause>nul