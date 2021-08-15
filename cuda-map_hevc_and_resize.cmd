FOR %%a IN (*.mkv) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.mkv" -vf scale=1280:-1 -c:v h264_nvenc -preset slow -qp 26 -c:a copy -map 0:v:0 -map 0:a:0 -map 0:a:1 -map 0:s:0 "cuda_%%~na.mkv"
FOR %%a IN (*.mp4) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.mp4" -vf scale=1280:-1 -c:v h264_nvenc -preset slow -qp 26 -c:a copy -map 0:v:0 -map 0:a:0 -map 0:a:1 -map 0:s:0 "cuda_%%~na.mkv"
FOR %%a IN (*.avi) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.avi" -vf scale=1280:-1 -c:v h264_nvenc -preset slow -qp 26 -c:a copy -map 0:v:0 -map 0:a:0 -map 0:a:1 -map 0:s:0 "cuda_%%~na.mkv"

pause