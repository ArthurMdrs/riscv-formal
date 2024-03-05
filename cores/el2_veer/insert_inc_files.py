import os

def process_files_in_folder(folder_path):
    for filename in os.listdir(folder_path):
        if filename.endswith(".sby"):
            file_path = os.path.join(folder_path, filename)
            print("Adjusting file "+file_path)
            process_file(file_path)

def process_file(file_path):
    dir = f"{os.getcwd()}"
    print(dir)
    with open(file_path, 'r') as file:
        lines = file.readlines()

    with open(file_path, 'w') as file:
        for line in lines:
            if "cores/el2_veer/../../cores/el2_veer" in line:
                # Replace the search_string with the replace_string
                line = line.replace("cores/el2_veer/../../cores/el2_veer", "cores/el2_veer")
            file.write(line)
            if line.strip() == "[files]":
                file.write(dir+"/snapshots/default/el2_pdef.vh\n")
                file.write(dir+"/snapshots/default/el2_param.vh\n")
                file.write(dir+"/snapshots/default/pic_map_auto.h\n")
            

# Replace 'your_folder_path' with the actual path to your folder containing the text files
folder_path = 'checks'
process_files_in_folder(folder_path)