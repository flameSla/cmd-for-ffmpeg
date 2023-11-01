@set time_to_split=00:02:00
@set /P time_to_split="Enter time to split [%time_to_split%]: "

@FOR %%a IN (*.mp3, *.mp4, *.mkv) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -t %time_to_split% -c copy "%%~na-1.%%~xa" -ss %time_to_split% -codec copy "%%~na-2.%%~xa"
@rem ffmpeg -i video.mp4 -t 00:00:50 -c copy small-1.mp4 -ss 00:00:50 -codec copy small-2.mp4