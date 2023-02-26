@echo off

echo comprobando ...

if not exist %1 (
	echo No existe el fichero %1 .
) else (
	echo Si existe el fichero %1 .
)

pause > nul