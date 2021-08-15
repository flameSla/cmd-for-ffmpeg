FOR %%a IN (*.mkv) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.mkv" -vf scale=1280:-1 -c:v hevc_nvenc -preset slow -qp 26 -c:a copy -c:s copy "hevc_%%~na.mkv"
FOR %%a IN (*.mp4) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.mp4" -vf scale=1280:-1 -c:v hevc_nvenc -preset slow -qp 26 -c:a copy -c:s copy "hevc_%%~na.mkv"
FOR %%a IN (*.avi) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.avi" -vf scale=1280:-1 -c:v hevc_nvenc -preset slow -qp 26 -c:a copy -c:s copy "hevc_%%~na.mkv"

pause