FOR %%a IN (*.mp3) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -filter:a "atempo=1.5" -vn "speed_%%a.mp3"