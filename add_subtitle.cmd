@rem FOR %%a IN (*.mkv) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.mkv" -sub_charenc UTF-8 -i "%%~na.ass" -c:v copy -c:a copy -c:s srt -metadata:s:s:0 language=rus -metadata:s:s:0 handler="Russian" "new_%%~na.mkv"
FOR %%a IN (*.mkv) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.mkv" -i "%%~na.ass" -c:v copy -c:a copy -c:s srt -metadata:s:s:0 language=rus -metadata:s:s:0 handler="Russian" "new_%%~na.mkv"
FOR %%a IN (*.mp4) DO "C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i "%%~na.mp4" -i "%%~na.ass" -c:v copy -c:a copy -c:s mov_text -metadata:s:s:0 language=rus -metadata:s:s:0 handler="Russian" "new_%%~na.mp4"

@rem To make the second subtitle stream the default stream and remove the default disposition from the first subtitle stream:
@rem ffmpeg -i in.mkv -c copy -disposition:s:0 0 -disposition:s:1 default out.mkv

@rem ffmpeg -i "video.mp4" -sub_charenc UTF-8 -i "video.srt" -c:v copy -c:a copy -c:s mov_text -metadata:s:s:0 language=eng -metadata:s:s:0 handler="English" -id3v2_version 3 -write_id3v1 1 "subbed_video.mp4"
@rem -metadata:s:s:0 language=rus -metadata:s:s:0 handler="Russian" 

@rem MP4: ffmpeg -i input.mp4 -f srt -i input.srt -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s mov_text output.mp4
@rem MKV: ffmpeg -i input.mp4 -f srt -i input.srt -map 0:0 -map 0:1 -map 1:0 -c:v copy -c:a copy -c:s srt  output.mkv



pause