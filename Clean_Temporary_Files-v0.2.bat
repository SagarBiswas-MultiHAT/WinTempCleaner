@echo off 
REM @echo off -> Turn command echoing OFF so the commands themselves are not printed.
REM              The leading @ hides the echo command itself from being shown.

@echo
REM @echo -> Without anything after it, this checks echo status instead of printing a blank line.
REM It shows "ECHO is off." because echoing was turned off earlier with @echo off.
REM To print a blank line, use echo. instead.

@echo.
@echo.
REM @echo. -> Prints a blank line on the console. 
REM The dot ensures it doesn’t show "ECHO is off/on" — it's just used for spacing in output.

@echo Cache Cleaner by Sagar_Biswas
REM Show a simple title.

set /p confirm=Delete All Temporary Files? (Y/n) 
REM set /p -> Prompts the user for input and stores it in the confirm variable.
if /I "%confirm%"=="" set confirm=Y
REM /I -> Compares strings case-insensitively.
REM If the user just presses Enter (empty input), it sets confirm to 'Y' by default.

if /I "%confirm%" NEQ "Y" goto end
REM If confirm is not 'Y', it jumps to the :end label to skip deletion.

REM if the user confirmed, proceed to delete temp files
color 2
echo Deleting temporary files...

REM Delete temporary files from various common temp directories.
Del /S /F /Q %temp% 2>nul
REM /S -> Deletes files from all subdirectories.
REM /F -> Forces deletion of read-only files.
REM /Q -> Quiet mode, no prompts for confirmation.
REM 2>nul -> Redirects error messages to nul (ignores them).

REM Delete temp files from Windows Temp and Prefetch directories, and user temp directory.
Del /S /F /Q %Windir%\Temp 2>nul
Del /S /F /Q C:\WINDOWS\Prefetch 2>nul
Del /S /F /Q "%USERPROFILE%\AppData\Local\Temp" 2>nul

@echo.
@echo All Temporary Files Successfully Deleted!
@echo. 

:end
REM :end -> Label to mark the end of the script or a section.
pause 
REM pause -> Wait for the user to press a key so they can read the result.
