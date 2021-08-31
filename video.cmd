@echo off

del files.tmp
FOR /r %%a IN (*.mkv) DO echo "%%a" >> files.tmp
FOR /r %%a IN (*.mp4) DO echo "%%a" >> files.tmp
FOR /r %%a IN (*.avi) DO echo "%%a" >> files.tmp
FOR /r %%a IN (*.wmv) DO echo "%%a" >> files.tmp

notepad.exe files.tmp

cls
echo.
echo 1 - do not change
echo 2 - resize ( 1280 )
echo.
choice /c 12 /m "default - 1" /t 10 /d 1
if "%ERRORLEVEL%"=="1" ( set resize= )
if "%ERRORLEVEL%"=="2" ( set resize=-vf scale=1280:-1 )
rem echo "%resize%"

echo.
echo 1 - hevc_nvenc
echo 2 - hevc_qsv
echo.
choice /c 12 /m "default - 1" /t 10 /d 1
if "%ERRORLEVEL%"=="1" ( FOR /F "usebackq delims==" %%a IN (files.tmp) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i %%a %resize%-c:v hevc_nvenc -preset slow -qp 26 -c:a copy -c:s copy "%%~dpahevc_nvenc_%%~na.mkv" )
if "%ERRORLEVEL%"=="2" ( FOR /F "usebackq delims==" %%a IN (files.tmp) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i %%a %resize%-c:v hevc_qsv -preset slow -global_quality 26 -c:a copy -c:s copy "%%~dpahevc_Intel_%%~na.mkv" )

del files.tmp

pause