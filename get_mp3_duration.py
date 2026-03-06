# получить длительность для mp3 файлов


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
def get_duration(filename):
    res = datetime.timedelta()

    # "C:/Program Files/ffmpeg/bin/ffmpeg.exe" -v quiet -stats -i "%%a" -f null -
    argList = ["C:/Program Files/ffmpeg/bin/ffmpeg.exe", "-v", "quiet", "-stats", "-i"]
    argList.append(filename)
    argList.extend(["-f", "null", "-"])
    ret = subprocess.run(
        argList,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        encoding="utf8",
    )
    p = re.compile(R"time=(\d\d):(\d\d):(\d\d.\d\d)")
    line = (ret.stdout + ret.stderr).rstrip().split("\n")[-1]
    # print("line = ", type(line), line)
    s = p.search(line)
    if s:
        h = int(s[1])
        m = int(s[2])
        s = float(s[3])
        if h == 0 and m == 0 and s == 0.0:
            print()
            print("==================")
            print(ret.stdout + ret.stderr)
            print()
            raise Exception("Считана нулевая длина")
        res = datetime.timedelta(hours=h, minutes=m, seconds=s)
        # print(res)
    return res


######################################
#
# main
if __name__ == "__main__":

    start_time = time.time()

    files = [
        file
        for file in get_current_working_directory().iterdir()
        if file.is_file() and file.suffix == ".mp3"
    ]

    all_dur = datetime.timedelta()
    for file in files:
        res = get_duration(file)
        all_dur += res
        print(
            "{:>13.2f}s {:>13.2f}s {}".format(
                res.total_seconds(), all_dur.total_seconds(), file.name
            )
        )

    print("time elapsed: {} s".format(time.time() - start_time))

    print(all_dur)
    print(all_dur / 1.5)
