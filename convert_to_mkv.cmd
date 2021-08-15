FOR %%a IN (*.flv) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i %%a -acodec copy -vcodec copy %%a.mkv
rem FOR %%a IN (*.flv) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i %%a -c:v libx264 -preset fast -qp 0 %%a.mkv
rem FOR %%a IN (*.flv) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i %%a -c:v libx264 -preset slow -crf 22 -c:a copy %%a.mkv
rem http://trac.ffmpeg.org/wiki/Encode/H.264