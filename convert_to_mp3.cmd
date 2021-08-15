FOR %%a IN (*.mp4) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -codec:a libmp3lame -q:a 5 "%%a.mp3"

rem FOR %%a IN (*.mp4) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -codec:a libmp3lame -q:a 0 "%%a.mp3"
rem FOR %%a IN (*.ac3) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -acodec libmp3lame "%%a.mp3"

rem https://trac.ffmpeg.org/wiki/Encode/MP3