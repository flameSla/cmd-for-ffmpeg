import inspect
import os
import glob
import sys
from PIL import Image

# python3 -m pip install --upgrade pip
# python3 -m pip install --upgrade Pillow


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
    for name in (os.path.splitext(file)[0] for file in glob.glob("*.bmp")):
        old_filename = name + ".bmp"
        new_filename = name + ".jpg"
        print(old_filename, new_filename)
        if not os.path.exists(new_filename):
            try:
                with Image.open(old_filename) as im:
                    im.save(new_filename)
            except OSError:
                print("cannot convert", old_filename)
