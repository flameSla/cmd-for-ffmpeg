FOR %%a IN (*.wv) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" "%%a.flac"

pause

rem FOR %%a IN (*.ac3) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -acodec libmp3lame "%%a.mp3"

rem https://trac.ffmpeg.org/wiki/Encode/MP3