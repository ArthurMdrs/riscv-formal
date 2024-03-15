import os
import shutil

def is_directory_empty(directory):
    # Check if the directory is empty
    if not os.listdir(directory):
        return True    
    # Check if all subdirectories are empty
    for item in os.listdir(directory):
        item_path = os.path.join(directory, item)
        if os.path.isfile(item_path):
            return False
        elif os.path.isdir(item_path) and not is_directory_empty(item_path):
            return False
    return True

def delete_files_except_exceptions(cwd):
    exceptions = ["engine_0", "config.sby", "logfile.txt", "PASS", "FAIL", "ERROR", ".log"]
    for root, dirs, files in os.walk(cwd):
        for file in files:
            should_delete = True
            for x in exceptions: 
                if x in file: should_delete = False
            if should_delete is True:
                os.remove(os.path.join(root, file))
                # print(f"Deleted file: {file}")
        for directory in dirs:
            path = os.path.join(root, directory)
            delete_files_except_exceptions(path)
            if is_directory_empty(path) and directory not in exceptions:
                os.rmdir(path)
                # print(f"Deleted directory: {directory}")



if __name__ == "__main__":
    cwd = os.getcwd()
    # Iterate over all folders in the current directory
    for item in os.listdir(cwd):
        item_path = os.path.join(cwd, item)
        # If it's a directory, proccess it
        if os.path.isdir(item_path):
            delete_files_except_exceptions(item_path)
