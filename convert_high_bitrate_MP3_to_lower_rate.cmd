@echo off

del files.tmp
FOR /r %%a IN (*.mp3) DO echo "%%a" >> files.tmp

notepad.exe files.tmp

cls
echo.
echo 1 - 128k
echo 2 - 64k
echo 3 - 32k
echo.
choice /c 123 /m "default - 1" /t 10 /d 1
if "%ERRORLEVEL%"=="1" ( set bitrate=128k )
if "%ERRORLEVEL%"=="2" ( set bitrate=64k)
if "%ERRORLEVEL%"=="3" ( set bitrate=32k)


@rem ffmpeg -i input.mp3 -codec:a libmp3lame -b:a 128k output.mp3 %resize%
FOR /F "usebackq delims==" %%a IN (files.tmp) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i %%a -c:a libmp3lame -b:a %bitrate% "%%~dpanew_%bitrate%_%%~na.mp3"

del files.tmp

pause