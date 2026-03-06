del files.tmp
FOR /r %%a IN (*.mp3) DO echo "%%a" >> files.tmp

FOR /F "usebackq delims==" %%a IN (files.tmp) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i %%a -filter:a "atempo=1.5" -vn "%%~dpaspeed_%%~na.mp3"

pause