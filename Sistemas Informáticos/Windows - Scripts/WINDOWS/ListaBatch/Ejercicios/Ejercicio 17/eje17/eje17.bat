@echo off

for /L %%x in (%1, %3, %2) do (
	echo %%x
)

pause>nul