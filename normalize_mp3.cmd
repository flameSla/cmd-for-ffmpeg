
FOR %%a IN (*.mp3) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -acodec libmp3lame -filter:a loudnorm=I=-16:TP=-1:LRA=12  "Norm_%%~na.mp3"

pause

rem FOR %%a IN (*.ac3) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -acodec libmp3lame "Norm_%%a.mp3"
rem https://trac.ffmpeg.org/wiki/Encode/MP3