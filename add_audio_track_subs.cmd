FOR %%a IN (*.mkv) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.mkv" -i "%%~na.mka" -i "%%~na.ass" -map 0:v:0 -map 1:a:0 -map 2  -c copy -c:s srt "- metadata: s: s: 0 language = ru" "new_%%~na.mkv"