@echo off

SET NUMBER=16
SET ATTEMPTS=6
SET CONT_ATTEMPTS=0

goto start

:start

SET /P number_user=Introduzca un numero:
SET /A ATTEMPTS=%ATTEMPTS%-1
if %ATTEMPTS%==0 (goto fail)
if %NUMBER% == %number_user% (goto correct)
echo Tienes %ATTEMPTS% intentos.
if %NUMBER% LSS %number_user% (goto less)
if %NUMBER% GTR %number_user% (goto plus)


:correct
echo muy bien, has adivinado el numero.
goto end

:less
echo el numero a adivinar es menor que %number_user% .
goto start

:plus
echo el numero a adivinar es mayor que %number_user% .
goto start

:fail
echo Lo siento, has agotado tus intentos. El numero era %NUMBER%

:end
pause>nul