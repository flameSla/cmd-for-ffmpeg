from os import walk
import shutil
from pathlib import Path


####################################
def get_current_working_directory():
    return Path().resolve()


######################################
#
# main
if __name__ == "__main__":
    mypath = get_current_working_directory()
    print(mypath)
    print()
    dirpaths = {}
    for dirpath, dirnames, filenames in walk(mypath):
        dirpath = dirpath.replace(str(mypath), "")
        if dirpath:
            for filename in filenames:
                if dirpath not in dirpaths:
                    dirpaths[dirpath] = len(dirpaths)
                old_filename = "{}\\{}".format(dirpath[1:], filename)
                new_filename = "{0:03d} - {1:}".format(dirpaths[dirpath], filename)
                shutil.copy(old_filename, new_filename)
                print("{} -> {}".format(old_filename, new_filename))

    # print("dirpaths = ", type(dirpaths), dirpaths)
