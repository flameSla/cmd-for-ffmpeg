FOR %%a IN (*.mp4) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%a" -filter_complex "[0:v]setpts=0.625*PTS[v];[0:a]atempo=1.6[a]" -map "[v]" -map "[a]" "speed_%%a.mkv"


@echo ^G
pause
