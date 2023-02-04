import os
import glob
import shutil

######################################
#
# main
if __name__ == "__main__":

    m3us = glob.glob(os.path.join("*.m3u"), recursive=False)
    for m3u in m3us:
        with open(m3u, "r", encoding="utf8") as f:
            for line in f.readlines():
                line = line.rstrip()

                filename = os.path.join(line)
                new_filename = (
                    os.path.split(filename)[0] + " - " + os.path.split(filename)[1]
                )
                try:
                    shutil.copy(filename, new_filename)
                except Exception as e:
                    pass
