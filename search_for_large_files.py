# поиск больших файлов в архивах
# больше 500кб и нет "res_" в имени файлов
from pathlib import Path
import zipfile


# ====================================
def get_script_dir():
    return Path(__file__).parent.resolve()


# ====================================
def get_current_working_directory():
    return Path().resolve()


# ====================================
def check_folder(folder):
    print("=========================")
    print("Currebt dir = {}".format(folder))
    print()
    for file in folder.iterdir():
        if file.is_file() and file.suffix.lower() == ".zip":
            # print("file = ", type(file), file)
            # просмотр файлов в архиве
            with zipfile.ZipFile(file, "r") as myzip:
                if not all(
                    [
                        ("res_" in f.filename)
                        for f in myzip.infolist()
                        if f.is_dir() is False
                    ]
                ):
                    print(file, file=log)

                # print("files = ", type(files), files)
                # break

        elif file.is_dir():
            check_folder(file)
            # print("\tdir\t= {}".format(file))


######################################
#
# main
if __name__ == "__main__":
    with open("яяя_log.txt", "w", encoding="utf8") as log:
        check_folder(get_current_working_directory())
