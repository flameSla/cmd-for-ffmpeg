FOR %%a IN (*.mp4) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.mp4" -c:s copy -codec copy -map 0:v:0 -map 0:a:1 -map 0:3 "new_%%~na.mkv"

rem To make the second subtitle stream the default stream and remove the default disposition from the first subtitle stream:
rem ffmpeg -i in.mkv -c copy -disposition:s:0 0 -disposition:s:1 default out.mkv

rem ffmpeg -i "video.mp4" -sub_charenc UTF-8 -i "video.srt" -c:v copy -c:a copy -c:s mov_text -metadata:s:s:0 language=eng -metadata:s:s:0 handler="English" -id3v2_version 3 -write_id3v1 1 "subbed_video.mp4"
rem -metadata:s:s:0 language=rus -metadata:s:s:0 handler="Russian" 