import os

# ====================  FUNCTIONS BEGIN  ==================== #

def get_summary_from_log():
    vec = []
    status = "PASS"
    assertions     = 0
    proven         = 0
    bounded_proven = 0
    marked_proven  = 0
    cex            = 0
    ar_cex         = 0
    undetermined   = 0
    unknown        = 0
    error          = 0
    
    covers              = 0
    unreachable         = 0
    bounded_unreachable = 0
    covered             = 0
    ar_covered          = 0
    
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
                    assertions += int(line.split()[-1])
                if "- proven" in line:
                    proven += int(line.split()[-1])
                if "- bounded_proven" in line:
                    bounded_proven += int(line.split()[-1])
                if "- marked_proven" in line:
                    marked_proven += int(line.split()[-1])
                if "- cex" in line:
                    cex += int(line.split()[-1])
                if "- ar_cex" in line:
                    ar_cex += int(line.split()[-1])
                if "- undetermined" in line:
                    undetermined += int(line.split()[-1])
                if "- unknown" in line:
                    unknown += int(line.split()[-1])
                if "- error" in line:
                    error += int(line.split()[-1])
                if "covers" in line:
                    covers += int(line.split()[-1])
                if "- unreachable" in line:
                    unreachable += int(line.split()[-1])
                if "- bounded_unreachable" in line:
                    bounded_unreachable += int(line.split()[-1])
                if "- covered" in line:
                    covered += int(line.split()[-1])
                if "- ar_covered" in line:
                    ar_covered += int(line.split()[-1])
    if found_summary == False or error != 0:
        status = "ERROR"
    elif assertions != (proven + bounded_proven + marked_proven):
        status = "FAIL"
    elif covers != (covered + ar_covered):
        status = "FAIL"
    return vec, status

# ====================  FUNCTIONS END  ==================== #

# ====================  MAIN CODE BEGIN  ==================== #  

if os.path.exists('jgproject/jg.log'):
    summary_vec, status = get_summary_from_log()
    with open(status, 'w') as file:
        for line in summary_vec:
            file.write(line)
else:
    print(f"Cannot find jgproject/jg.log in {os.getcwd()}")

# ====================  MAIN CODE END  ==================== #    
