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

cls
echo.
echo 1 - do not change
echo 2 - resize ( 1280 )
echo 3 - resize ( 640 )
echo 4 - resize ( 1920 )
echo.
choice /c 1234 /m "default - 1" /t 10 /d 1
if "%ERRORLEVEL%"=="1" ( set resize= )
if "%ERRORLEVEL%"=="2" ( set resize=-vf scale=1280:-1 )
if "%ERRORLEVEL%"=="3" ( set resize=-vf scale=640:-1 )
if "%ERRORLEVEL%"=="4" ( set resize=-vf scale=1920:-1 )
rem echo "%resize%"

rem ffmpeg -i input.avi -b:v 64k -bufsize 64k output.mp4
echo.
echo 1 - hevc_nvenc
echo 2 - hevc_qsv
echo 3 - av-1
echo 4 - hevc_nvenc -b:v 1200k
echo 5 - hevc_nvenc -b:v 1200k ac3 192k
echo 6 - hevc_nvenc ac3 128k
echo.
choice /c 123456 /m "default - 1" /t 10 /d 1
rem if "%ERRORLEVEL%"=="1" ( FOR /F "usebackq delims==" %%a IN (files.tmp) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i %%a -map 0:v -map 0:a %resize%-c:v hevc_nvenc -preset slow -qp 26 -c:a copy -c:s copy "%%~dpahevc_nvenc_%%~na.mkv" )
if "%ERRORLEVEL%"=="1" ( FOR /F "usebackq delims==" %%a IN (files.tmp) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i %%a %resize%-c:v hevc_nvenc -preset slow -qp 26 -c:a copy -c:s copy "%%~dpahevc_nvenc_%%~na.mkv" )
if "%ERRORLEVEL%"=="2" ( FOR /F "usebackq delims==" %%a IN (files.tmp) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i %%a %resize%-c:v hevc_qsv -preset slow -global_quality 26 -c:a copy -c:s copy "%%~dpahevc_Intel_%%~na.mkv" )
if "%ERRORLEVEL%"=="3" ( FOR /F "usebackq delims==" %%a IN (files.tmp) DO "C:\Program Files\ffmpeg-2023-08-14\bin\ffmpeg.exe" -i %%a %resize%-c:v libaom-av1 -crf 30 -cpu-used 8 -row-mt 1 -tiles 4x1 -c:a copy -c:s copy "%%~dpahevc_av1_%%~na.mkv" )
if "%ERRORLEVEL%"=="4" ( FOR /F "usebackq delims==" %%a IN (files.tmp) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i %%a %resize%-c:v hevc_nvenc -preset slow -b:v 1200k -c:a copy -c:s copy "%%~dpahevc_nvenc_%%~na.mkv" )
if "%ERRORLEVEL%"=="5" ( FOR /F "usebackq delims==" %%a IN (files.tmp) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i %%a %resize%-c:v hevc_nvenc -preset slow -b:v 1200k -c:a ac3 -ac 2 -b:a 192k -c:s copy "%%~dpahevc_nvenc_%%~na.mkv" )
if "%ERRORLEVEL%"=="6" ( FOR /F "usebackq delims==" %%a IN (files.tmp) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i %%a %resize%-c:v hevc_nvenc -preset slow -qp 26 -c:a ac3 -ac 2 -b:a 128k -c:s copy "%%~dpahevc_nvenc_%%~na.mkv" )

del files.tmp

pause