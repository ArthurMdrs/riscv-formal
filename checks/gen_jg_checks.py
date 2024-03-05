import subprocess
import re
import os
import shutil

# ====================  FUNCTIONS BEGIN  ==================== #

def replace_string(subject_string, search_string, replace_string):
    if search_string in subject_string:
        return subject_string.replace(search_string, replace_string)
    else:
        return subject_string

def get_from_config(section, vec):
    with open('checks.cfg', 'r') as file:
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

def get_from_sby(check_ch, section):
    my_str = ""
    with open("checks/"+check_ch+".sby", 'r') as file:
        is_wanted_section = False
        for line in file:
            if re.search(r'\[.*\]', line):
                is_wanted_section = False
            if is_wanted_section and line.strip()!='':
                my_str += line
            if section in line:
                is_wanted_section = True
    return my_str

def gen_tcl_str(incdirs_vec, sv_files_vec, vhdl_files_vec, check_ch):
    tcl_str = "clear -all\n\nanalyze -sv12 \\\n"
    for x in incdirs_vec:
        tcl_str += "    +incdir+"+x+" \\\n"
    tcl_str += "    "+check_ch+".sv \\\n"
    for x in sv_files_vec:
        tcl_str += "    "+x+" \\\n"
    tcl_str = tcl_str[:-3]+"\n\n"
    if (len(vhdl_files_vec) != 0):
        tcl_str += "analyze -vhdl08 \\\n"
        for x in vhdl_files_vec:
            tcl_str += "    "+x+" \\\n"
        tcl_str = tcl_str[:-3]+"\n\n"
    tcl_str += "elaborate -top rvfi_testbench\n\nclock clock\n\nreset reset\n\nprove -all\n"
    return tcl_str
                
def write_file(wr_file, wr_str):
    with open(wr_file, 'w') as file:
        file.write(wr_str)

# def copy_file(file_to_copy)

# ====================  FUNCTIONS END  ==================== #

# ====================  MAIN CODE BEGIN  ==================== #

subprocess.run(['python3' , '../../checks/genchecks.py'])

basedir = f"{os.getcwd()}/../.."
corename = os.getcwd().split("/")[-1]
coredir = basedir.rstrip('../..')

nret = 1
checks_vec = []
sv_files_vec = []
vhdl_files_vec = []
incdirs_vec = []
cp_files_vec = []

# Check for the nret option
with open('checks.cfg', 'r') as file:
    options_start = False
    for line in file:
        if re.search(r'\[.*\]', line):
            options_start = False
        if options_start and line.strip()!='':
            if 'nret' in line:
                nret = int(line.split()[1])
        if '[options]' in line:
            options_start = True
            
# Capture which checks are defined in the config file
get_from_config("[depth]", checks_vec)
            
# Capture the SystemVerilog source files 
get_from_config("[verilog-files]", sv_files_vec)
            
# Capture the VHDL source files 
get_from_config("[vhdl-files]", vhdl_files_vec)
            
# Check include directories in the config file
get_from_config("[incdirs]", incdirs_vec)
            
# Generate the required files
for check in checks_vec:
    for ch in range(0, nret):
        check_ch = check + "_ch" + str(ch)
        check_dir = coredir + "/checks/" + check_ch + "_jg"
        os.makedirs(check_dir)
        # Generate the check .tcl file
        tcl_str = gen_tcl_str(incdirs_vec, sv_files_vec, vhdl_files_vec, check_ch)
        write_file(check_dir+"/jg_script.tcl", tcl_str)
        # Get the contents of the defines.sv file
        defines_str = get_from_sby(check_ch, "[file defines.sv]")
        write_file(check_dir+"/defines.sv", defines_str)
        # Get the contents of the `check_ch`.sv file
        check_ch_str = get_from_sby(check_ch, "[file "+check_ch+".sv]")
        write_file(check_dir+"/"+check_ch+".sv", check_ch_str)
        # Capture which files are required to be copied
        cp_files_str = get_from_sby(check_ch, "[files]")
        for file in cp_files_str.splitlines():
            shutil.copy(file, check_dir)
            
# Delete files generated for SymbiYosys
for file in os.listdir("checks"):
    if file.endswith(".sby"):
        file_path = os.path.join("checks", file)
        os.remove(file_path)
        print(f"Deleted: {file_path}")
os.remove("checks/makefile")

# ====================  MAIN CODE END  ==================== #