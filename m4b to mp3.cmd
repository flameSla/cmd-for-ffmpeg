FOR %%a IN (*.m4b) DO (
    "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -acodec libmp3lame -ar 22050 -vn "%%~na.mp3"
    py m4b_to_mp3.py -f "%%~na.mp3"
    del "%%~na.mp3"
)
pause
