# Копируем файлы из диреторий
#  новое имя файла: имя директории + имя файла

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
    for dirpath, dirnames, filenames in walk(mypath):
        dirpath = dirpath.replace(str(mypath), "")[1:]
        if dirpath:
            for filename in filenames:
                old_filename = "{}\\{}".format(dirpath, filename)
                new_filename = "{0:} - {1:}".format(
                    dirpath.replace("\\", " - "), filename
                )
                shutil.copy(old_filename, new_filename)
                print("{} -> {}".format(old_filename, new_filename))

    # print("dirpaths = ", type(dirpaths), dirpaths)
