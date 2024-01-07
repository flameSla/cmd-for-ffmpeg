FOR %%a IN (*.mkv) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.mkv" -c:v libx265 -crf 26 -preset fast -c:a copy -c:s copy "libx265_%%~na.mkv"
FOR %%a IN (*.mp4) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.mp4" -c:v libx265 -crf 26 -preset fast -c:a copy -c:s copy "libx265_%%~na.mkv"
FOR %%a IN (*.avi) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.avi" -c:v libx265 -crf 26 -preset fast -c:a copy -c:s copy "libx265_%%~na.mkv"

pause