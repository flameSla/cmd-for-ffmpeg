from pathlib import Path
from PIL import Image


max_res = 1600


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
        if file.is_file():
            if file.suffix.lower() in (
                ".jpg",
                ".png",
                ".bmp",
                ".webp",
            ):
                new_file = file.with_name("res_" + file.name).with_suffix(".jpg")
                with Image.open(file) as im:
                    im = Image.open(file)
                    m = max(im.width, im.height)
                    k = max_res / m
                    new_size = (im.width * k, im.height * k)
                    print("\tnew_file = ", new_file)

                    if m > max_res:
                        im.thumbnail(new_size, Image.Resampling.LANCZOS)
                    rgb_im = im.convert("RGB")
                    rgb_im.save(new_file, "JPEG", quality=90)

                # если размер файла увеличился
                #  переименовываем файл
                s0 = file.stat().st_size / 1024 / 1024
                s1 = new_file.stat().st_size / 1024 / 1024
                print("\told = {:0.2f}Mb\tnew={:0.2f}Mb".format(s0, s1))
                if s0 < s1:
                    print("\t\trename")
                    new_file.unlink(missing_ok=True)
                    file.rename(new_file)
                else:
                    file.unlink(missing_ok=True)

        elif file.is_dir():
            check_folder(file)
            # print("\tdir\t= {}".format(file))


######################################
#
# main
if __name__ == "__main__":

    check_folder(get_current_working_directory())
