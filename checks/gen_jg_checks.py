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

def get_from_config(section):
    basedir = f"{os.getcwd()}/../.."
    corename = os.getcwd().split("/")[-1]
    coredir = basedir.rstrip('../..')
    vec = []
    with open('checks.cfg', 'r') as file:
        is_wanted_section = False
        for line in file:
            is_comment = 0
            if len(line.strip()) != 0:
                is_comment = (line.strip()[0] == "#")
            if not is_comment:
                if re.search(r'\[.*\]', line):
                    is_wanted_section = False
                if is_wanted_section and line.strip()!='':
                    item = line.strip()
                    item = replace_string(item, "@basedir@/cores/@core@", coredir)
                    item = replace_string(item, "@basedir@", basedir)
                    item = replace_string(item, "@core@", corename)
                    vec.append(item)
                if section in line:
                    is_wanted_section = True
    return vec

def get_from_sby(check, section):
    my_str = ""
    with open("checks/"+check+".sby", 'r') as file:
        is_wanted_section = False
        for line in file:
            if re.search(r'\[.*\]', line):
                is_wanted_section = False
            if is_wanted_section and line.strip()!='':
                my_str += line
            if section in line:
                is_wanted_section = True
    return my_str

def get_option_from_sby(check_ch, option):
    sby_options_str = get_from_sby(check_ch, "[options]")
    sby_options_str = sby_options_str.splitlines()
    option_val = ""
    for line in sby_options_str:
        if option in line:
            option_val = line.split()[1]
    return option_val

def gen_tcl_str(incdirs_vec, sv_files_vec, vhdl_files_vec, check_ch, bound):
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
    tcl_str += "elaborate -top rvfi_testbench -create_related_covers witness\n\n"
    tcl_str += "clock clock\n\nreset reset\n\n"
    tcl_str += "check_assumptions -show -dead_end\n\n"
    # tcl_str += "prove -property :noDeadEnd\n\n"
    tcl_str += "set_prove_target_bound "+bound+"\n"
    tcl_str += "prove -instance checker_inst -bg -iter "+bound+"\n"
    return tcl_str

# def gen_makefile_str(checks_vec, no_channels):
#     makefile_str = "all: "
#     for ch in range(0, no_channels):
#         for check in checks_vec:
#             check_ch = check + "_ch" + str(ch)
#             makefile_str += check_ch + " "
#     makefile_str += "\n"
#     for ch in range(0, no_channels):
#         for check in checks_vec:
#             check_ch = check + "_ch" + str(ch)
#             makefile_str += check_ch + ":\n"
#             makefile_str += "\tcd " + check_ch + "_jg; \\\n"
#             # makefile_str += "\tjg jg_script.tcl -batch; \\\n"
#             makefile_str += "\tjg jg_script.tcl; \\\n"
#             makefile_str += "\tpython3 ../../../../checks/get_jg_summary.py\n"
#     return makefile_str
def gen_makefile_str(checks_vec):
    makefile_str = "all: "
    for check in checks_vec:
        makefile_str += check + " "
    makefile_str += "\n\n"
    for check in checks_vec:
        makefile_str += check + ":\n"
        makefile_str += "\tcd " + check + "_jg; \\\n"
        makefile_str += "\tjg jg_script.tcl -batch; \\\n"
        # makefile_str += "\tjg jg_script.tcl; \\\n"
        makefile_str += "\tpython3 ../../../../checks/get_jg_summary.py\n\n"
    return makefile_str

def write_file(wr_file, wr_str):
    with open(wr_file, 'w') as file:
        file.write(wr_str)

# ====================  FUNCTIONS END  ==================== #

# ====================  MAIN CODE BEGIN  ==================== #

subprocess.run(['python3' , '../../checks/genchecks.py'])

coredir = f"{os.getcwd()}"

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

# Get isa from config file
options_vec = get_from_config("[options]")
for option in options_vec:
    if "isa" in option: isa = option.split()[1]

# Capture which checks are defined in the config file
depth_vec = get_from_config("[depth]")
checks_vec = []
for check in depth_vec:
    if "insn " in check:
        with open(f"../../insns/isa_{isa}.txt") as isa_file:
            for insn in isa_file:
                for chanidx in range(nret):
                    checks_vec.append(f"insn_{insn.strip()}_ch{chanidx:d}")
    elif "insn_" in check:
        for chanidx in range(nret):
            checks_vec.append(f"{check.split()[0]}_ch{chanidx:d}")
    else:
        checks_vec.append(check.split()[0])

# Capture the SystemVerilog source files 
sv_files_vec = get_from_config("[verilog-files]")
            
# Capture the VHDL source files 
vhdl_files_vec = get_from_config("[vhdl-files]")
            
# Check include directories in the config file
incdirs_vec = get_from_config("[incdirs]")
            
# Generate the required files
print("Converting SymbiYosys scripts into Jasper tcl scripts...")
for check in checks_vec:
    check_dir = coredir + "/checks/" + check + "_jg"
    os.makedirs(check_dir)
    # Get the bound value
    bound = get_option_from_sby(check, "skip")
    # Generate the check .tcl file
    tcl_str = gen_tcl_str(incdirs_vec, sv_files_vec, vhdl_files_vec, check, bound)
    write_file(check_dir+"/jg_script.tcl", tcl_str)
    # Get the contents of the defines.sv file
    defines_str = get_from_sby(check, "[file defines.sv]")
    write_file(check_dir+"/defines.sv", defines_str)
    # Get the contents of the `check`.sv file
    check_str = get_from_sby(check, "[file "+check+".sv]")
    write_file(check_dir+"/"+check+".sv", check_str)
    # Capture which files are required to be copied
    cp_files_str = get_from_sby(check, "[files]")
    for file in cp_files_str.splitlines():
        shutil.copy(file, check_dir)
    if check == "cover":
        # Get the contents of the cover_stmts.vh file
        cover_stmts_str = get_from_sby(check, "[file cover_stmts.vh]")
        write_file(check_dir+"/cover_stmts.vh", cover_stmts_str)
    # Get the contents of the assume_stmts.vh file
    assume_stmts_str = get_from_sby(check, "[file assume_stmts.vh]")
    if assume_stmts_str != "":
        write_file(check_dir+"/assume_stmts.vh", assume_stmts_str)
print("Converting done.")
            
# Delete files generated for SymbiYosys
for file in os.listdir("checks"):
    if file.endswith(".sby"):
        file_path = os.path.join("checks", file)
        os.remove(file_path)
print(f"Deleted sby files.")
os.remove("checks/makefile")

# Generate Makefile
makefile_str = gen_makefile_str(checks_vec)
write_file(coredir+"/checks/Makefile", makefile_str)

# ====================  MAIN CODE END  ==================== #
