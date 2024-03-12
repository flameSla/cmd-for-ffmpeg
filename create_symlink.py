from pathlib import Path


# ====================================
def get_script_dir():
    return Path(__file__).parent.resolve()


# ====================================
def get_current_working_directory():
    return Path().resolve()


######################################
#
# main
if __name__ == "__main__":
    link_dir = Path(input("directory for symlink:"))
    print("symlink = {}".format(link_dir))
    if (
        link_dir.exists()
    ):  # follow_symlinks=False (Changed in version 3.12: The follow_symlinks parameter was added.)
        raise Exception("директория существует")

    else:
        target = Path(input("directory for target:"))
        print("target = {}".format(target))
        link_dir.symlink_to(target, target_is_directory=True)
