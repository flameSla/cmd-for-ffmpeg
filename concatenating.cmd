"C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i 000.mp4 -vf scale=1280:-1 -c:v hevc_nvenc -preset slow -qp 26  -codec:a libmp3lame -b:a 132k 000.mp4.mkv
"C:\Program Files\ffmpeg\bin\ffmpeg.exe" -i 001.mp4 -vf scale=1280:-1 -c:v hevc_nvenc -preset slow -qp 26  -codec:a libmp3lame -b:a 132k 001.mp4.mkv


"C:\Program Files\ffmpeg\bin\ffmpeg.exe" -f concat -safe 0 -i mylist.txt -c copy output.mkv