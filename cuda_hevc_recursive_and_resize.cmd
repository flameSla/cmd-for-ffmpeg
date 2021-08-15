FOR /r %%a IN (*.mkv) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -vf scale=1280:-1 -c:v hevc_nvenc -preset slow -qp 26 -c:a copy -c:s copy "%%~dpahevc_%%~na.mkv"
FOR /r %%a IN (*.mp4) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -vf scale=1280:-1 -c:v hevc_nvenc -preset slow -qp 26 -c:a copy -c:s copy "%%~dpahevc_%%~na.mkv"
FOR /r %%a IN (*.avi) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -vf scale=1280:-1 -c:v hevc_nvenc -preset slow -qp 26 -c:a copy -c:s copy "%%~dpahevc_%%~na.mkv"
FOR /r %%a IN (*.wmv) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -vf scale=1280:-1 -c:v hevc_nvenc -preset slow -qp 26 -c:a copy -c:s copy "%%~dpahevc_%%~na.mkv"

rem echo "files:" > 1.txt
rem FOR /r %%a IN (*.mp4) DO echo "%%~dpa%%~nxa" >> 1.txt
rem FOR /r %%a IN (*.mkv) DO echo "%%~dpa%%~nxa" >> 1.txt
rem FOR /r %%a IN (*.avi) DO echo "%%~dpa%%~nxa" >> 1.txt

pause