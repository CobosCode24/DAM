@echo off

:inicio
set aciertos=0
set /p nombreJugador=Introduce tu nombre: 

FIND /i "%nombreJugador%" CONCURSANTES.txt>null

if ERRORLEVEL 1 (goto nojugado)
if ERRORLEVEL 0 (goto haJugado)

:haJugado
echo Ya has jugado, no puedes jugar mas.
goto fin

:noJugado
echo bienvenido %nombreJugador% .
echo %nombreJugador% >> nombres_partidas_anteriores.txt
set /p P=¿2+2?
if "%P%" EQU "4" (set /a aciertos=%aciertos%+1 && echo ACIERTO) else (echo ERROR)
set /p P=¿3+3?
if "%P%" EQU "6" (set /a aciertos=%aciertos%+1 && echo ACIERTO) else (echo ERROR)
set /p P=¿4+4?
if "%P%" EQU "8" (set /a aciertos=%aciertos%+1 && echo ACIERTO) else (echo ERROR)
echo Has tenido %aciertos% aciertos.
echo %aciertos% %nombreJugador% >> CONCURSANTES.txt
set /p respuestaVerConcursantes=¿Quieres ver el archivo CONCURSANTES.txt? (S/N)
if "%respuestaVerConcursantes%" EQU "S" (goto ordenadoPuntosNombres) 
if "%respuestaVerConcursantes%" EQU "N" (goto otroJugador)

:ordenadoPuntosNombres
set /p respuestaOrdenar=¿Ordenar por puntos (p) o por nombre (n)?
if "%respuestaOrdenar%" EQU "p" (goto ordenarPuntos)
if "%respuestaOrdenar%" EQU "n" (goto ordenarNombre)

:ordenarpuntos
TYPE CONCURSANTES.txt | SORT /+1 CONCURSANTES.txt 
goto otroJugador

:ordenarNombre
TYPE CONCURSANTES.txt | SORT /+3 CONCURSANTES.txt
goto otroJugador

:otroJugador
set /p respuestaOtroJugador=¿Quiere jugar otro jugador? ( S / N )
if "%respuestaOtroJugador%" EQU "S" (goto inicio)
if "%respuestaOtroJugador%" EQU "N" (goto fin)

:fin
echo Adios!...
pause>nul