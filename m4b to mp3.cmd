@set x=1
FOR %%a IN (*.m4b) DO (
    "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -acodec libmp3lame -ar 22050 -vn "%x%.mp3"
    py m4b_to_mp3.py -f "%x%.mp3"
    del "%x%.mp3"
    @set /a x+=1
)
