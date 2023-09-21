import inspect
import os
import sys
import shutil
from os import walk

####################################
translation = {
    # " ": "_",
    # ",": "",
    "а": "a",
    "б": "b",
    "в": "v",
    "г": "g",
    "д": "d",
    "е": "e",
    "ё": "yo",
    "ж": "zh",
    "з": "z",
    "и": "i",
    "й": "y",
    "к": "k",
    "л": "l",
    "м": "m",
    "н": "n",
    "о": "o",
    "п": "p",
    "р": "r",
    "с": "s",
    "т": "t",
    "у": "u",
    "ф": "f",
    "х": "h",
    "ц": "c",
    "ч": "ch",
    "ш": "sh",
    "щ": "shch",
    "ъ": "y",
    "ы": "y",
    "ь": "'",
    "э": "e",
    "ю": "yu",
    "я": "ya",
    "А": "A",
    "Б": "B",
    "В": "V",
    "Г": "G",
    "Д": "D",
    "Е": "E",
    "Ё": "Yo",
    "Ж": "Zh",
    "З": "Z",
    "И": "I",
    "Й": "Y",
    "К": "K",
    "Л": "L",
    "М": "M",
    "Н": "N",
    "О": "O",
    "П": "P",
    "Р": "R",
    "С": "S",
    "Т": "T",
    "У": "U",
    "Ф": "F",
    "Х": "H",
    "Ц": "Ts",
    "Ч": "Ch",
    "Ш": "Sh",
    "Щ": "Shch",
    "Ъ": "Y",
    "Ы": "Y",
    "Ь": "'",
    "Э": "E",
    "Ю": "Yu",
    "Я": "Ya",
}


def translit(s):
    return "".join(map(lambda x: translation.get(x, x), s))


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
    for dirpath, dirnames, filenames in walk(mypath):
        # print("dirpath = ", type(dirpath), dirpath)
        # print("dirnames = ", type(dirnames), dirnames)
        # print("filenames = ", type(filenames), filenames)
        # os.makedirs(os.path.join(mypath, "Rename-translit"), exist_ok=True)
        for name in filenames:
            old_filename = os.path.join(dirpath, name)
            new_filename = os.path.join(
                dirpath.replace(mypath, os.path.join(mypath, "Rename-translit")),
                translit(name),
            )
            new_dirname = os.path.dirname(new_filename)
            if not os.path.exists(new_dirname):
                os.makedirs(new_dirname, exist_ok=True)
            shutil.copy(old_filename, new_filename)
            print(new_filename)
