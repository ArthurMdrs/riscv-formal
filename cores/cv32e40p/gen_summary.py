import os

with open('summary.txt', 'w') as summary_file:
    for root, dirs, files in os.walk('checks'):
        for file in files:
            if file == 'PASS' or file == 'FAIL' or file == 'ERROR':
                folder_name = os.path.basename(root)
                result = file
                summary_file.write(f"{folder_name}: {result}\n")
