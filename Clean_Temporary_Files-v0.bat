@echo off
@echo 
@echo.
@echo Cache Cleaner by BareFox
@echo Delete All Temporary Files?
@echo.
pause

color 2
Del /S /F /Q %temp%
Del /S /F /Q %Windir%\Temp
Del /S /F /Q C:\WINDOWS\Prefetch
@echo.
@echo All Temporary Files Sucessfully Deleted!
@echo. 
pause