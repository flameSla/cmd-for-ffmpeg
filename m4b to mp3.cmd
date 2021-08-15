FOR %%a IN (*.m4b) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -acodec libmp3lame -ar 22050 -filter:a "atempo=1.5" -vn "speed_%%a.mp3"
