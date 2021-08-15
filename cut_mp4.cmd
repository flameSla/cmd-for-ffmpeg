FOR %%a IN (*.mp4) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i %%a -c copy -f segment -segment_time 3600 -y %%a_%%003d.mkv
rem -i input.mkv -c copy -f segment -segment_time 10 -y output%03d.mkv