FOR %%a IN (*.mp3) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i %%a -c copy -f segment -segment_time 3600 -y %%a_%%003d.mp3