используй MKVmkvtoolnix-gui



@rem ffmpeg -i input.mp4 -c copy -map 0 -segment_time 1800 -f segment -reset_timestamps 1 output%03d.mp4
@rem Example: Split into 10-minute chunks:
@rem ffmpeg -i input.mp4 -c copy -map 0 -segment_time 600 -f segment -reset_timestamps 1 output%03d.mp4