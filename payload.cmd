@echo off
REM An example payload.bat file


echo This is a payload!
timeout 2

exit


:plugins
if %1==shutdown shutdown -r -t 0
