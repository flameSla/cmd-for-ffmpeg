import inspect
import os
import sys
from os import walk

####################################
def get_script_dir(follow_symlinks=True):
    if getattr(sys, 'frozen', False): # py2exe, PyInstaller, cx_Freeze
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
    with open('out.m3u', 'w', encoding='utf8') as f:
        for (dirpath, dirnames, filenames) in walk(mypath):
            dirpath = dirpath.replace(mypath, '')
            for i in [dirpath+'\\'+f for f in filenames]:
                #print(i.split('.')[-1])
                if i.split('.')[-1] not in ('py','m3u','lnk'):
                    print(i[1:], file=f, flush=True)

    #a = input('...')
