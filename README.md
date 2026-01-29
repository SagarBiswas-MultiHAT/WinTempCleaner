# Cache Cleaner

**Cache Cleaner by Sagar_Biswas** is a lightweight Windows batch script that wipes the most common temporary file locations in one go. Use it to reclaim disk space, clear stubborn cache files that slow apps down, and tidy your system without clicking through multiple folders.

### Video: https://www.facebook.com/share/r/18Fj7dnB3p/

## Features

- Interactive confirmation so you stay in control of every cleanup run.
- Cleans `%TEMP%`, `%WINDIR%\Temp`, `%USERPROFILE%\AppData\Local\Temp`, and `C:\WINDOWS\Prefetch`.
- Forces removal of read-only files while hiding noisy error output for a cleaner console.
- Switches to a green console (`color 2`) during the deletion phase so you can tell the script is working.

## Requirements

- Windows 7 or newer with a standard Command Prompt.
- Standard user rights cover `%TEMP%` and the per-user AppData temp folder.
- **Run as administrator** to remove entries from `C:\WINDOWS\Prefetch` and `%WINDIR%\Temp`, which often require elevated permissions.

## How to Use

1. Download or clone this repository.
2. Right-click `Clean Temporary Files.bat` and choose **Run as administrator** if you want all locations cleaned.
3. When prompted with `Delete All Temporary Files? (Y/n)`, press `Y` (or just hit Enter) to confirm, or type `N` to cancel.
4. Watch the console output; once you see `All Temporary Files Successfully Deleted!`, the job is done.
5. Press any key when prompted to close the window.

> Tip: Pin the batch file to your taskbar or schedule it with Task Scheduler for recurring cleanups.

## Script Details

```batch
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
REM %temp% -> Uses the %temp% environment variable to target the user's temp directory.
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
REM pause -> Wait for user to press a key so they can read the result.
```

### Command Breakdown

- `@echo off` hides the commands themselves so only purposeful output shows.
- `@echo.` prints blank lines to keep the console easy to read.
- `set /p` captures user input inline without opening a new prompt window.
- `/I` on an `if` statement makes the comparison case-insensitive, so `y` works like `Y`.
- `color 2` switches the console text to green during cleanup.
- `Del /S /F /Q` deletes files recursively, forces removal of read-only items, and skips confirmation prompts.
- `2>nul` suppresses error messages such as access-denied or in-use warnings.
- `pause` waits for a key press so you can read the final status before the window closes.

## Notes and Safety

- The script only removes files; it leaves directory structures intact.
- Windows rebuilds Prefetch entries automatically, so clearing them occasionally is safe but not mandatory.
- If a file is in use, Windows quietly skips it. Close the blocking application and run the script again if needed.

## Customization Ideas

- Add or remove directories near the bottom of the script to target other cache locations.
- Comment out `color 2` if you prefer the default console color scheme.
- Swap `pause` with `exit` when you want the console window to close automatically after each run.

## Troubleshooting

- **Permission denied**: Relaunch the batch file with elevated rights (right-click, run as administrator).
- **Nothing deleted**: Verify that temporary files exist or confirm that `%TEMP%` points to the expected folder.
- **Different temp paths**: If your environment redirects temp folders, update the directory list in the script.

## Author

[SagarBiswas-MultiHAT](https://github.com/SagarBiswas-MultiHAT)

## License

No license file is bundled yet. If you plan to republish or modify this script, consider adding a suitable open-source license to the repository.
