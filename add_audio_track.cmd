FOR %%a IN (*.mkv) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.mkv" -i "%%~na.mka" -codec copy -map 0:v:0 -map 1:a:0 -map 0:a:0 "new_%%~na.mkv"
FOR %%a IN (*.mp4) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.mp4" -i "%%~na.mka" -codec copy -map 0:v:0 -map 1:a:0 -map 0:a:0 "new_%%~na.mp4"

pause