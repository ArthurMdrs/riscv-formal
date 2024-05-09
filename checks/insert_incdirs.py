import os
import re
import sys

# ====================  FUNCTIONS BEGIN  ==================== #

def replace_string(subject_string, search_string, replace_string):
    if search_string in subject_string:
        return subject_string.replace(search_string, replace_string)
    else:
        return subject_string

def get_from_config(section, vec, cfgname):
    basedir = f"{os.getcwd()}/../.."
    corename = os.getcwd().split("/")[-1]
    coredir = basedir.rstrip('../..')
    with open(cfgname+'.cfg', 'r') as file:
        is_wanted_section = False
        for line in file:
            if re.search(r'\[.*\]', line):
                is_wanted_section = False
            if is_wanted_section and line.strip()!='':
                item = line.split()[0]
                item = replace_string(item, "@basedir@/cores/@core@", coredir)
                item = replace_string(item, "@basedir@", basedir)
                item = replace_string(item, "@core@", corename)
                vec.append(item)
            if section in line:
                is_wanted_section = True

def get_file_names(folder_path):
    file_names = ""
    for file in os.listdir(folder_path):
        file_names += os.path.join(folder_path, file) + "\n"
    return file_names

def process_files_in_folder(folder_path, insert_str):
    print("Adjusting .sby files in "+folder_path)
    for file in os.listdir(folder_path):
        if file.endswith(".sby"):
            file_path = os.path.join(folder_path, file)
            with open(file_path, 'r') as file:
                lines = file.readlines()
            with open(file_path, 'w') as file:
                temp = False
                for line in lines:
                    if temp and not "read " in line: 
                        file.write("read -sv ")
                        for x in insert_str.split("\n"):
                            file.write(x+" ")
                        file.write("\n")
                        temp = False
                    file.write(line)
                    if line.strip() == "[script]":
                        temp = True

# ====================  FUNCTIONS END  ==================== #

# ====================  MAIN CODE BEGIN  ==================== #

incdirs_vec = []
incdirs_str = ""
cfgname = "checks"
cwd = f"{os.getcwd()}"

if len(sys.argv) > 1:
    assert len(sys.argv) == 2
    cfgname = sys.argv[1]

# Check include directories in the config file
get_from_config("[include-dirs]", incdirs_vec, cfgname)

# Store all files and folders from the incdirs in a string
for dir_path in incdirs_vec:
    incdirs_str += get_file_names(dir_path)
    # dir = dir_path.split("/")[-1]
    link_path = f"{os.getcwd()}/include{incdirs_vec.index(dir_path)}"
    # system(f"ln -s {dir_path} {cfgname}/{}")
    # print(dir_path)
    # print(link_path)

# Insert the string into all the .sby files
process_files_in_folder(cfgname, incdirs_str)

# ====================  MAIN CODE END  ==================== #