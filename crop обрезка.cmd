rem обрезка
rem 

"C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i hevc_000.mkv -filter:v "crop=1280:720:0:46" -c:v hevc_nvenc -preset slow -qp 26 -c:a copy -c:s copy out.mkv



pause

rem FOR %%a IN (*.ac3) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -acodec libmp3lame "%%a.mp3"
rem https://trac.ffmpeg.org/wiki/Encode/MP3