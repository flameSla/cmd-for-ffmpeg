from pathlib import Path
from PIL import Image


# ====================================
def get_current_working_directory():
    return Path().resolve()


######################################
#
# main
if __name__ == "__main__":
    max_res = 1600
    for file in get_current_working_directory().iterdir():
        if file.is_file() and file.suffix.lower() in (".jpg", ".png", ".bmp", ".webp"):
            new_file = file.with_name("res_" + file.name).with_suffix(".jpg")
            with Image.open(file) as im:
                im = Image.open(file)
                m = max(im.width, im.height)
                k = max_res / m
                new_size = (im.width * k, im.height * k)
                print("new_file = ", new_file)

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
                print("\trename")
                new_file.unlink(missing_ok=True)
                file.rename(new_file)
