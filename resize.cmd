FOR %%a IN (*.mkv) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.mkv" -vf scale=w=1280:h=-1:force_original_aspect_ratio=decrease -c:a copy "resize_%%~na.mkv"
pause