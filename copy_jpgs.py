import inspect
import os
import sys
from os import walk
import shutil

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
#
# main
if __name__ == "__main__":

    mypath = get_script_dir()
    dirpaths = {}
    for (dirpath, dirnames, filenames) in walk(mypath):
        dirpath = dirpath.replace(mypath, "")
        if dirpath:
            for filename in filenames:
                if dirpath not in dirpaths:
                    dirpaths[dirpath] = len(dirpaths)
                old_filename = "{}\\{}".format(dirpath[1:], filename)
                print(old_filename, end="\t")
                new_filename = "{0:03d} - {1:}".format(dirpaths[dirpath], filename)
                print(new_filename)
                shutil.copy(old_filename, new_filename)
                print("{} - {}".format(old_filename, new_filename))

    # print("dirpaths = ", type(dirpaths), dirpaths)
