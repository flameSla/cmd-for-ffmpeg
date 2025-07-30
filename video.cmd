@echo off

rename_files_to_cp866.exe

del files.tmp
FOR /r %%a IN (*.mpg) DO echo "%%a" >> files.tmp
FOR /r %%a IN (*.mov) DO echo "%%a" >> files.tmp
FOR /r %%a IN (*.flv) DO echo "%%a" >> files.tmp
FOR /r %%a IN (*.mkv) DO echo "%%a" >> files.tmp
FOR /r %%a IN (*.mp4) DO echo "%%a" >> files.tmp
FOR /r %%a IN (*.avi) DO echo "%%a" >> files.tmp
FOR /r %%a IN (*.wmv) DO echo "%%a" >> files.tmp

notepad.exe files.tmp

set ffmpeg="C:\Program Files\ffmpeg\bin\ffmpeg.exe"

@rem resize
cls
echo.
echo 1 - do not change
echo 2 - resize ( 1920 )
echo 3 - resize ( 1280 )
echo 4 - resize ( 640 )
echo.
set resize=
choice /c 1234 /m "default - 1" /t 30 /d 1
if "%ERRORLEVEL%"=="2" ( set resize=-vf scale=1920:-1 )
if "%ERRORLEVEL%"=="3" ( set resize=-vf scale=1280:-1 )
if "%ERRORLEVEL%"=="4" ( set resize=-vf scale=640:-1 )

echo.
echo 1 - hevc_nvenc
echo 2 - hevc_nvenc -b:v ?k
echo 3 - hevc_nvenc -b:v ?k ac3 ?k
echo.
choice /c 123 /m "default - 1" /t 30 /d 1

goto answer%ERRORLEVEL%
:answer1
FOR /F "usebackq delims==" %%a IN (files.tmp) DO %ffmpeg% -i %%a %resize%-c:v hevc_nvenc -preset slow -qp 26 -c:a copy -c:s copy "%%~dpahevc_nvenc_%%~na.mkv"
goto exit

:answer2
set /p vbitrate=Enter the video bitrate (1200k):
FOR /F "usebackq delims==" %%a IN (files.tmp) DO %ffmpeg% -i %%a %resize%-c:v hevc_nvenc -preset slow -b:v %vbitrate% -c:a copy -c:s copy "%%~dpahevc_nvenc_%%~na.mkv"
goto exit

:answer3
set /p vbitrate=Enter the video bitrate (1200k):
set /p abitrate=Enter the audio bitrate (192k):
FOR /F "usebackq delims==" %%a IN (files.tmp) DO %ffmpeg% -i %%a %resize%-c:v hevc_nvenc -preset slow -b:v %vbitrate% -c:a ac3 -ac 2 -b:a %abitrate% -c:s copy "%%~dpahevc_nvenc_%%~na.mkv"
goto exit

:exit

echo resize=%resize% > out.txt
echo vbitrate=%vbitrate% >> out.txt
echo abitrate=%abitrate% >> out.txt

del files.tmp

pause