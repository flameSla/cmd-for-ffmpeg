# получить битрейт потоков файлов


from pathlib import Path
import re
import subprocess
import datetime
import time


# ====================================
def get_script_dir():
    return Path(__file__).parent.resolve()


# ====================================
def get_current_working_directory():
    return Path().resolve()


# ====================================
def get_vbitrate(filename):
    res = "v"
    # %ffprobe% -i %%a -v quiet -select_streams v:0 -show_entries stream=bit_rate -of default=noprint_wrappers=1
    argList = ["C:/Program Files/ffmpeg/bin/ffprobe.exe", "-i"]
    argList.append(filename)
    argList.extend(
        [
            "-v",
            "quiet",
            "-select_streams",
            "v:0",
            "-show_entries",
            "stream=bit_rate",
            "-of",
            "default=noprint_wrappers=1",
        ]
    )

    ret = subprocess.run(
        argList,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        encoding="utf8",
    )
    # line = ret.stdout + ret.stderr

    res += ret.stdout.rstrip()
    return res


# ====================================
def get_abitrate(filename):
    res = "a"
    # "C:\Program Files\ffmpeg\bin\ffprobe.exe"  -i %%a -v quiet -select_streams a:0 -show_entries stream=bit_rate -of default=noprint_wrappers=1
    argList = ["C:/Program Files/ffmpeg/bin/ffprobe.exe", "-i"]
    argList.append(filename)
    argList.extend(
        [
            "-v",
            "quiet",
            "-select_streams",
            "a:0",
            "-show_entries",
            "stream=bit_rate",
            "-of",
            "default=noprint_wrappers=1",
        ]
    )

    ret = subprocess.run(
        argList,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        encoding="utf8",
    )
    # line = ret.stdout + ret.stderr

    res += ret.stdout.rstrip()
    return res


######################################
#
# main
if __name__ == "__main__":

    # set ffprobe="C:\Program Files\ffmpeg\bin\ffprobe.exe"
    # %ffprobe% -i %%a -v quiet -select_streams v:0 -show_entries stream=bit_rate -of default=noprint_wrappers=1
    # %ffprobe% -i %%a -v quiet -select_streams a:0 -show_entries stream=bit_rate -of default=noprint_wrappers=1

    start_time = time.time()

    suffixes = (".mpg", ".mov", ".flv", ".mkv", ".mp4", ".avi", ".wmv", ".mp3")
    files = [
        file
        for file in get_current_working_directory().iterdir()
        if file.is_file() and file.suffix in suffixes
    ]

    for file in files:
        abitrate = get_abitrate(file)
        vbitrate = get_vbitrate(file)

        print("{:20s}\t{:20s}\t{}".format(abitrate, vbitrate, file.name))

    print("time elapsed: {} s".format(time.time() - start_time))
