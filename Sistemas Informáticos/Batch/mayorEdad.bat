@echo off

SET age=18
SET MSG_YES=Puedes entrar, diviertete.
SET MSG_NO=Vete a tu casa anda.

SET /P age_user=Introduzca su edad:
if /i %age_user% LSS %age% (goto denied)
if /i %age_user% GEQ %age% (goto correct) 

:correct
echo %MSG_YES%
goto end

:denied
echo %MSG_NO%
goto end

:end
pause>nul