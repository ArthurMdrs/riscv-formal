import os

with open('summary.txt', 'w') as summary_file:
    for root, dirs, files in os.walk('checks'):
        for file in files:
            if file == 'PASS' or file == 'FAIL' or file == 'ERROR':
                folder_name = os.path.basename(root)
                result = file
                summary_file.write(f"{folder_name}: {result}\n")
                with open(os.path.join(root, file), 'r') as f:
                    for line in f:
                        if "counterexample" in line:
                            temp = line.split(":")[-1]
                            summary_file.write(temp)
                summary_file.write("\n")
