####################################
#
# get a list of files whose codec differs from 265
#
####################################

import inspect
import os
import sys
from os import walk
import psutil
import subprocess

ffmpeg = r"C:\Program Files\ffmpeg-2023-08-14\bin\ffmpeg.exe"
extension_for_video_files = (
    "mpg",
    "mov",
    "flv",
    "mkv",
    "mp4",
    "avi",
    "wmv",
)


####################################
def get_script_dir(follow_symlinks=True):
    if getattr(sys, "frozen", False):  # py2exe, PyInstaller, cx_Freeze
        path = os.path.abspath(sys.executable)
    else:
        path = inspect.getabsfile(get_script_dir)
    if follow_symlinks:
        path = os.path.realpath(path)
    return os.path.dirname(path)


######################################
def run_ffmpeg(video_filename):
    global ffmpeg
    temp = "temp.ffmpeg"

    argList = []
    argList.append(ffmpeg)
    argList.extend(["-i", video_filename])
    process = psutil.Popen(args=argList, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out, err = process.communicate()
    with open(temp, "wb") as f:
        f.write(out)
        f.write(err)

    return temp


######################################
#
# main
if __name__ == "__main__":
    mypath = get_script_dir()
    temp = ""
    files = []

    for dirpath, dirnames, filenames in walk(mypath):
        for file in filenames:
            filename = os.path.join(dirpath, file)
            if filename.split(".")[-1] in extension_for_video_files:
                # print(filename)
                temp = run_ffmpeg(filename)
                with open(temp, encoding="utf-8", errors="ignore") as f:
                    for line in f.readlines():
                        line = line.rstrip()
                        if "Stream" in line and "Video:" in line:
                            if "HEVC" not in line.upper():
                                files.append(filename)
                            break

    if os.path.exists(temp):
        os.remove(temp)

    with open(
        "get_codecs_info_out1.txt", mode="w", encoding="utf-8", errors="ignore"
    ) as f1:
        for filename in files:
            print(filename, file=f1)
