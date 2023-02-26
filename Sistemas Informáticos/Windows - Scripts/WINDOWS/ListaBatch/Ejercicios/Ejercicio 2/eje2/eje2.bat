@echo off

dir *.%1
md %2 & echo Se ha creado un directorio %2
copy * %2
tree /f

pause > nul