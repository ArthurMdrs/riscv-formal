import os

# ====================  FUNCTIONS BEGIN  ==================== #

def get_summary_from_log():
    vec = []
    all_proven = True
    no_asserts = 0
    no_proven = 0
    with open('jgproject/jg.log', 'r') as file:
        found_summary = False
        no_lines = 21
        for line in file:
            if line.strip() == 'SUMMARY':
                found_summary = True
            if found_summary and no_lines != 0:
                vec.append(line)
                no_lines -= 1
                if "assertions" in line:
                    no_asserts = line.split()[-1]
                if "- proven" in line:
                    no_proven = line.split()[-1]
    if no_asserts != no_proven or found_summary == False:
        all_proven = False
    return vec, all_proven

# ====================  FUNCTIONS END  ==================== #

# ====================  MAIN CODE BEGIN  ==================== #  

if os.path.exists('jgproject/jg.log'):
    summary_vec, success = get_summary_from_log()
    if success:
        log_name = "SUCCESS.log"
    else:
        log_name = "FAIL.log"
    with open(log_name, 'w') as file:
        for line in summary_vec:
            file.write(line)
else:
    print("Cannot find jgproject/jg.log")

# ====================  MAIN CODE END  ==================== #    
