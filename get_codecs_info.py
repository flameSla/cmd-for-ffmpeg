import inspect
import os
import sys
from os import walk
import psutil
import subprocess

ffmpeg = r"C:\Program Files\ffmpeg-2023-08-14\bin\ffmpeg.exe"


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

    # print("video_filename = ", type(video_filename), video_filename)
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
    files = {}

    for dirpath, dirnames, filenames in walk(mypath):
        # print("dirpath = ", type(dirpath), dirpath)
        # print("filenames = ", type(filenames), filenames)

        # dirpath = dirpath.replace(mypath, "")
        for file in filenames:
            filename = os.path.join(dirpath, file)
            temp = run_ffmpeg(filename)
            with open(temp, encoding="utf-8", errors="ignore") as f:
                for line in f.readlines():
                    line = line.rstrip()
                    if "Stream" in line and "Video:" in line:
                        if "HEVC" not in line.upper():
                            files[filename] = line
                        break

    # print("files = ", type(files), files)
    if os.path.exists(temp):
        os.remove(temp)

    with open("get_codecs_info_out1.txt", "w") as f1:
        with open("get_codecs_info_out2.txt", "w") as f2:
            for k, v in files.items():
                print(k + "; " + v, file=f1)
                print(k, file=f2)

        #     # print(i.split('.')[-1])
        #     if i.split(".")[-1] not in ("py", "m3u", "lnk", "ini"):
        #         print(i[1:], file=f, flush=True)

    # a = input('...')
