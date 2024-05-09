#!/usr/bin/env python3
#
# Copyright (C) 2017  Claire Xenia Wolf <claire@yosyshq.com>
#
# Permission to use, copy, modify, and/or distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

import os, sys, shutil, re
from functools import reduce

nret = 1
isa = "rv32i"
ilen = 32
xlen = 32
buslen = 32
nbus = 1
csrs = set()
custom_csrs = set()
illegal_csrs = set()
csr_tests = {}
csr_spec = None
compr = False
custom_isa = False

depths = list()
groups = [None]
blackbox = False

cfgname = "checks"
basedir = f"{os.getcwd()}/../.."
corename = os.getcwd().split("/")[-1]
solver = "boolector"
dumpsmt2 = False
abspath = False
sbycmd = "sby"
jgcmd = "jg"
config = dict()
mode = "bmc"

if len(sys.argv) > 1:
    assert len(sys.argv) == 2
    cfgname = sys.argv[1]

print(f"Reading {cfgname}.cfg.")
with open(f"{cfgname}.cfg", "r") as f:
    cfgsection = None
    cfgsubsection = None
    for line in f:
        line = line.strip()

        if line.startswith("#"):
            continue

        if line.startswith("[") and line.endswith("]"):
            cfgsection = line.lstrip("[").rstrip("]")
            cfgsubsection = None
            if cfgsection.startswith("assume ") or cfgsection == "assume":
                cfgsubsection = cfgsection.split()[1:]
                cfgsection = "assume"
            continue

        if cfgsection is not None:
            if cfgsubsection is None:
                if cfgsection not in config:
                    config[cfgsection] = ""
                config[cfgsection] += f"{line}\n"
            else:
                if cfgsection not in config:
                    config[cfgsection] = []
                config[cfgsection].append((cfgsubsection, line))

if "options" in config:
    for line in config["options"].split("\n"):
        line = line.split()

        if len(line) == 0:
            continue

        elif line[0] == "nret":
            assert len(line) == 2
            nret = int(line[1])

        elif line[0] == "isa":
            assert len(line) == 2
            isa = line[1]

        elif line[0] == "blackbox":
            assert len(line) == 1
            blackbox = True

        elif line[0] == "solver":
            assert len(line) == 2
            solver = line[1]

        elif line[0] == "dumpsmt2":
            assert len(line) == 1
            dumpsmt2 = True

        elif line[0] == "abspath":
            assert len(line) == 1
            abspath = True

        elif line[0] == "mode":
            assert len(line) == 2
            assert(line[1] in ("bmc", "prove", "cover"))
            mode = line[1]

        elif line[0] == "buslen":
            assert len(line) == 2
            buslen = int(line[1])

        elif line[0] == "nbus":
            assert len(line) == 2
            nbus = int(line[1])

        elif line[0] == "csr_spec":
            assert len(line) == 2
            csr_spec = line[1]

        else:
            print(line)
            assert 0

if "64" in isa:
    xlen = 64

if "c" in isa:
    compr = True

if "x" in isa:
    custom_isa = True

def add_csr_tests(name, test_str):
    # use regex to split by spaces, unless those spaces are inside quotation marks
    # e.g. const="32'h dead_beef" is one match not two
    #      const="32'h 0"_mask="32'h dead_beef" is also one match
    tests = re.findall("((?:\S*?\"[^\"]*\")+|\S+)", test_str)
    csr_tests[name] = tests

def add_csr(csr_str):
    try:
        (name, tests) = csr_str.split(maxsplit=1)
        add_csr_tests(name, tests)
    except ValueError: # no tests
        name = csr_str.strip()
    csrs.add(name)
    return name

def mask_bits(test: str, bits: "list[int]", mask_len: int, invert=False):
    mask = reduce(lambda x, y: x | 1<<y, bits, 0)
    fstring = f"{test}_mask={'~' if invert else ''}{mask_len}'b{{:0{mask_len}b}}"
    return fstring.format(mask)

if csr_spec == "1.12":
    spec_csrs = {
        "mvendorid"     : ["const"],
        "marchid"       : ["const"],
        "mimpid"        : ["const"],
        "mhartid"       : ["const"],
        "mconfigptr"    : ["const"],
        # All reserved bits should be 0
        "mstatus"       : [mask_bits("zero", 
                                     [0, 2, 4, *range(23, 31)] + ([31, *range(38, 63)] if xlen==64 else []), 
                                     xlen)],
        "misa"          : [mask_bits("zero", 
                                     [6, 10, 11, 14, 17, 19, 22, 24, 25, *range(26, xlen-2)], 
                                     xlen)],
        "mie"           : None,
        "mtvec"         : None,
        "mscratch"      : ["any"],
        "mepc"          : None,
        "mcause"        : None,
        "mtval"         : None,
        "mip"           : None,
        "mcycle"        : ["inc"],
        "minstret"      : ["inc"],
    }
    spec_csrs.update({f"mhpmcounter{i}" : None for i in range(3, 32)})
    spec_csrs.update({f"mhpmevent{i}" : None for i in range(3, 32)})

    restricted_csrs = {
        "medeleg"       : ("s",  "302", None),
        "mideleg"       : ("s",  "303", None),
        "mcounteren"    : ("u",  "306", None),
        "mstatush"      : ("32", "310", [mask_bits("zero", [4, 5], xlen, invert=True)]),
        "mtinst"        : ("h",  "34A", None),
        "mtval2"        : ("h",  "34B", None),
        "menvcfg"       : ("u",  "30A", None),
        "menvcfgh"      : ("u",  "31A", None),  # u-mode only *and* 32bit only
    }
    for (name, data) in restricted_csrs.items():
        if data[0] in isa:
            spec_csrs[name] = data[2]
        else:
            illegal_csrs.add(
                (data[1], "m", "rw"),
            )

    for (name, tests) in spec_csrs.items():
        csrs.add(name)
        if tests:
            csr_tests[name] = tests

if "csrs" in config:
    for line in config["csrs"].split("\n"):
        if line:
            add_csr(line)

if "custom_csrs" in config:
    for line in config["custom_csrs"].split("\n"):
        try:
            (addr, levels, csr_str) = line.split(maxsplit=2)
        except ValueError: # no csr
            continue
        name = add_csr(csr_str)
        custom_csrs.add((name, int(addr, base=16), levels))

if "illegal_csrs" in config:
    for line in config["illegal_csrs"].split("\n"):
        line = tuple(line.split())

        if len(line) == 0:
            continue

        assert len(line) == 3
        illegal_csrs.add(line)

if "groups" in config:
    groups += config["groups"].split()

print(f"Creating {cfgname} directory.")
shutil.rmtree(cfgname, ignore_errors=True)
os.mkdir(cfgname)

def hfmt(text, **kwargs):
    lines = []
    for line in text.split("\n"):
        match = re.match(r"^\s*: ?(.*)", line)
        if match:
            line = match.group(1)
        elif line.strip() == "":
            continue
        lines.append(re.sub(r"@([a-zA-Z0-9_]+)@",
                lambda match: str(kwargs[match.group(1)]), line))
    return lines

def print_hfmt(f, text, **kwargs):
    for line in hfmt(text, **kwargs):
        print(line, file=f)

hargs = dict()
hargs["basedir"] = basedir
hargs["core"] = corename
hargs["nret"] = nret
hargs["xlen"] = xlen
hargs["ilen"] = ilen
hargs["buslen"] = buslen
hargs["nbus"] = nbus
hargs["append"] = 0
hargs["mode"] = mode

if "cover" in config:
    hargs["cover"] = config["cover"]

instruction_checks = set()
consistency_checks = set()

if solver == "bmc3":
    hargs["engine"] = "abc bmc3"
    hargs["ilang_file"] = f"{corename}-gates.il"
elif solver == "btormc":
    hargs["engine"] = "btor btormc"
    hargs["ilang_file"] = f"{corename}-hier.il"
else:
    hargs["engine"] = f"smtbmc {'--dumpsmt2 ' if dumpsmt2 else ''}{solver}"
    hargs["ilang_file"] = f"{corename}-hier.il"

def test_disabled(check):
    if "filter-checks" in config:
        for line in config["filter-checks"].split("\n"):
            line = line.strip().split()
            if len(line) == 0: continue
            assert len(line) == 2 and line[0] in ["-", "+"]
            if re.match(line[1], check):
                return line[0] == "-"
    return False

def get_depth_cfg(patterns):
    ret = None
    if "depth" in config:
        for line in config["depth"].split("\n"):
            line = line.strip().split()
            if len(line) == 0:
                continue
            for pat in patterns:
                if re.fullmatch(line[0], pat):
                    ret = [int(s) for s in line[1:]]
    return ret

def print_custom_csrs():
    custom_csr_str = ""
    fstrings = {
        "inputs": "  ,input [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_{csr}_{signal} \\",
        "wires": "  (* keep *) wire [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_{csr}_{signal}; \\",
        "conn": "  ,.rvfi_csr_{csr}_{signal} (rvfi_csr_{csr}_{signal}) \\",
        "channel": "  wire [`RISCV_FORMAL_XLEN - 1 : 0] csr_{csr}_{signal} = rvfi_csr_{csr}_{signal} [(_idx)*(`RISCV_FORMAL_XLEN) +: `RISCV_FORMAL_XLEN]; \\",
        "signals": "`RISCV_FORMAL_CHANNEL_SIGNAL(`RISCV_FORMAL_NRET, `RISCV_FORMAL_XLEN, csr_{csr}_{signal}) \\",
        "outputs": "  ,output [`RISCV_FORMAL_NRET * `RISCV_FORMAL_XLEN - 1 : 0] rvfi_csr_{csr}_{signal} \\",
        "indices": "  localparam [11:0] csr_{level}index_{name} = 12'h{index:03X}; \\"
    }
    for (macro, fstring) in fstrings.items():
        if macro == "channel":
            custom_csr_str += f"`define RISCV_FORMAL_CUSTOM_CSR_{macro.upper()}(_idx) \\\n"
        else:
            custom_csr_str += f"`define RISCV_FORMAL_CUSTOM_CSR_{macro.upper()} \\\n"
        for custom_csr in custom_csrs:
            name = custom_csr[0]
            addr = custom_csr[1]
            levels = custom_csr[2]
            if macro == "indices":
                for level in ["m", "s", "u"]:
                    if level in levels:
                        macro_string = fstring.format(level=level, name=name, index=addr)
                    else:
                        macro_string = fstring.format(level=level, name=name, index=0xfff)
                    custom_csr_str += macro_string+"\n"
            else:
                for signal in ["rmask", "wmask", "rdata", "wdata"]:
                    macro_string = fstring.format(csr=name, signal=signal)
                    custom_csr_str += macro_string+"\n"
        custom_csr_str += "\n"
    return [custom_csr_str]

# ------------------------------ Instruction Checkers ------------------------------

def check_insn(grp, insn, chanidx, csr_mode=False, illegal_csr=False):
    pf = "" if grp is None else grp+"_"
    if illegal_csr:
        (ill_addr, ill_modes, ill_rw) = insn
        insn = f"12'h{int(ill_addr, base=16):03X}"
        check = f"{pf}csr_ill_{ill_addr}_ch{chanidx:d}"
        depth_cfg = get_depth_cfg([f"{pf}csr_ill", f"{pf}csr_ill_ch{chanidx:d}", f"{pf}csr_ill_{ill_addr}", f"{pf}csr_ill_{ill_addr}_ch{chanidx:d}"])
    else:
        if csr_mode:
            check = "csrw"
        else:
            check = "insn"
        depth_cfg = get_depth_cfg([f"{pf}{check}", f"{pf}{check}_ch{chanidx:d}", f"{pf}{check}_{insn}", f"{pf}{check}_{insn}_ch{chanidx:d}"])
        check = f"{pf}{check}_{insn}_ch{chanidx:d}"

    if depth_cfg is None: return
    assert len(depth_cfg) == 1

    if test_disabled(check): return
    instruction_checks.add(check)

    hargs["insn"] = insn
    hargs["checkch"] = check
    hargs["channel"] = f"{chanidx:d}"
    hargs["depth"] = depth_cfg[0]
    hargs["depth_plus"] = depth_cfg[0] + 1
    hargs["skip"] = depth_cfg[0]
    
    os.mkdir(f"{cfgname}/{check}")

    with open(f"{cfgname}/{check}/{check}_jg.tcl", "w") as tcl_file:
        print_hfmt(tcl_file, """
                : clear -all
                :
                : set depth @depth_plus@
                :
        """, **hargs)

        if "script-defines" in config:
            print_hfmt(tcl_file, config["script-defines"], **hargs)
        
        inc_dirs = []
        if "include-dirs" in config:
            inc_dirs += hfmt(config["include-dirs"], **hargs)

        sv_files = [f"{check}.sv"]
        if "verilog-files" in config:
            sv_files += hfmt(config["verilog-files"], **hargs)

        vhdl_files = []
        if "vhdl-files" in config:
            vhdl_files += hfmt(config["vhdl-files"], **hargs)

        if len(sv_files):
            print("analyze -sv12 \\", file=tcl_file)
            if len(inc_dirs):
                for x in inc_dirs:
                    print(f"    +incdir+{x} \\", file=tcl_file)
            for x in sv_files:
                mystr = f"    {x} "
                if x != sv_files[-1]: mystr += "\\"
                else: mystr += "\n"
                print(mystr, file=tcl_file)

        if len(vhdl_files):
            print("analyze -vhdl08 \\", file=tcl_file)
            if len(inc_dirs):
                for x in inc_dirs:
                    print(f"    +incdir+{x} \\", file=tcl_file)
            for x in vhdl_files:
                mystr = f"    {x} "
                if x != vhdl_files[-1]: mystr += "\\"
                else: mystr += "\n"
                print(mystr, file=tcl_file)

        if "script-sources" in config:
            print_hfmt(tcl_file, config["script-sources"], **hargs)
        
        if "mul" in insn: bbox_str = "-bbox_mul 256"
        elif "div" in insn: bbox_str = "-bbox_div 256"
        elif "rem" in insn: bbox_str = "-bbox_div 256"
        elif "dot" in insn: bbox_str = "-bbox_mul 256"
        else: bbox_str = ""
        
        # print(f"elaborate -top rvfi_testbench -create_related_covers witness {bbox_str}\n", file=tcl_file)
        print(f"elaborate -top rvfi_testbench -no_preconditions {bbox_str}\n", file=tcl_file)
        print("clock clock\nreset reset\n", file=tcl_file)

        if "script-link" in config:
            print_hfmt(tcl_file, config["script-link"], **hargs)
        
        print_hfmt(tcl_file, """
                : set_prove_target_bound $depth
                : set_max_trace_length $depth
                : set_trace_optimization standard
                : prove -instance checker_inst -dump_trace -dump_trace_type vcd -dump_trace_dir traces
                : 
                : report -summary
                : 
        """, **hargs)
                # : check_assumptions -show -dead_end
                # : 
                # : prove -bg -instance checker_inst -iter $depth -dump_trace -dump_trace_type vcd -dump_trace_dir traces
        
        check_dir = f"{cfgname}/{check}/"
        shutil.copy(basedir+"/checks/rvfi_macros.vh", check_dir)
        shutil.copy(basedir+"/checks/rvfi_channel.sv", check_dir)
        shutil.copy(basedir+"/checks/rvfi_testbench.sv", check_dir)

        if illegal_csr:
            shutil.copy(basedir+"/checks/rvfi_csr_ill_check.sv", check_dir)
        elif csr_mode:
            shutil.copy(basedir+"/checks/rvfi_csrw_check.sv", check_dir)
        else:
            shutil.copy(basedir+"/checks/rvfi_insn_check.sv", check_dir)
            shutil.copy(basedir+"/insns/insn_"+insn+".v", check_dir)

        defines_str = hfmt("""
                : `define RISCV_FORMAL
                : `define RISCV_FORMAL_NRET @nret@
                : `define RISCV_FORMAL_XLEN @xlen@
                : `define RISCV_FORMAL_ILEN @ilen@
                : `define RISCV_FORMAL_RESET_CYCLES 1
                : `define RISCV_FORMAL_CHECK_CYCLE @depth@
                : `define RISCV_FORMAL_CHANNEL_IDX @channel@
        """, **hargs)

        if "assume" in config:
            defines_str += hfmt("`define RISCV_FORMAL_ASSUME\n", **hargs)
        
        if mode == "prove":
            defines_str += hfmt("`define RISCV_FORMAL_UNBOUNDED\n", **hargs)

        for csr in sorted(csrs):
            defines_str += hfmt(f"`define RISCV_FORMAL_CSR_{csr.upper()}", **hargs)

        if csr_mode and insn in ("mcycle", "minstret"):
            defines_str += hfmt("`define RISCV_FORMAL_CSRWH", **hargs)
        
        if illegal_csr:
            defines_str += hfmt("`define RISCV_FORMAL_CHECKER rvfi_csr_ill_check", **hargs)
            defines_str += hfmt("`define RISCV_FORMAL_ILL_CSR_ADDR @insn@", **hargs)
            if 'm' in ill_modes:
                defines_str += hfmt("`define RISCV_FORMAL_ILL_MMODE", **hargs)
            if 's' in ill_modes:
                defines_str += hfmt("`define RISCV_FORMAL_ILL_SMODE", **hargs)
            if 'u' in ill_modes:
                defines_str += hfmt("`define RISCV_FORMAL_ILL_UMODE", **hargs)
            if 'r' in ill_rw:
                defines_str += hfmt("`define RISCV_FORMAL_ILL_READ", **hargs)
            if 'w' in ill_rw:
                defines_str += hfmt("`define RISCV_FORMAL_ILL_WRITE", **hargs)
        elif csr_mode:
            defines_str += hfmt("`define RISCV_FORMAL_CHECKER rvfi_csrw_check", **hargs)
            defines_str += hfmt("`define RISCV_FORMAL_CSRW_NAME @insn@", **hargs)
        else:
            defines_str += hfmt("`define RISCV_FORMAL_CHECKER rvfi_insn_check", **hargs)
            defines_str += hfmt("`define RISCV_FORMAL_INSN_MODEL rvfi_insn_@insn@", **hargs)
        
        if custom_csrs:
            defines_str += print_custom_csrs()

        if blackbox:
            defines_str += hfmt("`define RISCV_FORMAL_BLACKBOX_REGS", **hargs)

        if compr:
            defines_str += hfmt("`define RISCV_FORMAL_COMPRESSED", **hargs)
            
        if "defines" in config:
            defines_str += hfmt(config["defines"], **hargs)
        
        defines_str += hfmt("`include \"rvfi_macros.vh\"", **hargs)
        with open(f"{cfgname}/{check}/defines.sv", "w") as defines_file:
            for line in defines_str:
                print(line, file=defines_file)

        checkch_str = hfmt("""
                : `include "defines.sv"
                : `include "rvfi_channel.sv"
                : `include "rvfi_testbench.sv"
        """, **hargs)

        if illegal_csr:
            checkch_str += hfmt("`include \"rvfi_csr_ill_check.sv\"", **hargs)
        elif csr_mode:
            checkch_str += hfmt("`include \"rvfi_csrw_check.sv\"", **hargs)
        else:
            checkch_str += hfmt("`include \"rvfi_insn_check.sv\"", **hargs)
            checkch_str += hfmt("`include \"insn_@insn@.v\"", **hargs)
        
        checkch_path = hfmt("@checkch@.sv", **hargs)[0]
        with open(f"{cfgname}/{check}/{checkch_path}", "w") as checkch_file:
            for line in checkch_str:
                print(line, file=checkch_file)
        
        if "assume" in config:
            assume_stmts_str = ""
            for pat, line in config["assume"]:
                enabled = True
                for p in pat:
                    if p.startswith("!"):
                        p = p[1:]
                        enabled = False
                    else:
                        enabled = True
                    if re.match(p, check):
                        enabled = not enabled
                        break
                if enabled:
                    assume_stmts_str += line
            with open(f"{cfgname}/{check}/assume_stmts.vh", "w") as assume_stmts_file:
                print(assume_stmts_str, file=assume_stmts_file)

for grp in groups:
    with open(f"../../insns/isa_{isa}.txt") as isa_file:
        for insn in isa_file:
            for chanidx in range(nret):
                check_insn(grp, insn.strip(), chanidx)

    for csr in sorted(csrs):
        for chanidx in range(nret):
            check_insn(grp, csr, chanidx, csr_mode=True)

    for ill_csr in sorted(illegal_csrs, key=lambda csr: csr[0]):
        for chanidx in range(nret):
            check_insn(grp, ill_csr, chanidx, illegal_csr=True)

# ------------------------------ Consistency Checkers ------------------------------

def check_cons(grp, check, chanidx=None, start=None, trig=None, depth=None, csr_mode=False, csr_test=None, bus_mode=False):
    pf = "" if grp is None else grp+"_"
    if csr_mode:
        csr_name = check
        if csr_test is not None:
            # Check for provided mask
            mask_idx = csr_test.find("_mask")
            if mask_idx >= 0:
                try:
                    csr_mask = str(csr_test[mask_idx:]).split('=', maxsplit=1)[1].strip('"')
                except IndexError: # no value provided
                    print(csr_test)
                    assert 0
                csr_test = csr_test[:mask_idx]
            if csr_test.startswith("const"):
                try:
                    constval = str(csr_test).split('=', maxsplit=1)[1].strip('"')
                except IndexError: # no value provided
                    constval = "rdata_shadow"
                check = f"{pf}csrc_const_{csr_name}"
                check_name = f"csrc_const"
            elif csr_test.startswith("hpm"):
                try:
                    hpmevent = str(csr_test).split('=', maxsplit=1)[1].strip('"')
                except IndexError: # no value provided
                    pass
                hpmcounter = str(csr_name).replace("event", "counter")
                if hpmcounter not in csrs:
                    csrs.add(hpmcounter)
                check = f"{pf}csrc_hpm_{csr_name}"
                check_name = f"csrc_hpm"
            else:
                check = f"{pf}csrc_{csr_test}_{csr_name}"
                check_name =f"csrc_{csr_test}"

        else:
            check = f"{pf}csrc_{csr_name}"
            check_name = "csrc"

        hargs["check"] = check_name

        if chanidx is not None:
            depth_cfg = get_depth_cfg([f"{pf}{check_name}", check, f"{pf}{check_name}_ch{chanidx:d}", f"{check}_ch{chanidx:d}"])
            hargs["channel"] = f"{chanidx:d}"
            check = f"{check}_ch{chanidx:d}"

        else:
            depth_cfg = get_depth_cfg([f"{check_name}", check])
    else:
        hargs["check"] = check
        check = pf + check

        if chanidx is not None:
            depth_cfg = get_depth_cfg([check, f"{check}_ch{chanidx:d}"])
            hargs["channel"] = f"{chanidx:d}"
            check = f"{check}_ch{chanidx:d}"

        else:
            depth_cfg = get_depth_cfg([check])

    if depth_cfg is None: return

    if start is not None:
        start = depth_cfg[start]
    else:
        start = 1

    if trig is not None:
        trig = depth_cfg[trig]

    if depth is not None:
        depth = depth_cfg[depth]

    hargs["start"] = start
    hargs["depth"] = depth
    hargs["depth_plus"] = depth + 1
    hargs["skip"] = depth

    hargs["checkch"] = check

    hargs["xmode"] = hargs["mode"]
    if check == "cover" or "csrc_hpm" in check: hargs["xmode"] = "cover"

    if test_disabled(check): return
    consistency_checks.add(check)
    
    os.mkdir(f"{cfgname}/{check}")

    with open(f"{cfgname}/{check}/{check}_jg.tcl", "w") as tcl_file:
        print_hfmt(tcl_file, """
                : clear -all
                :
                : set depth @depth_plus@
                :
        """, **hargs)

        if "script-defines" in config:
            print_hfmt(tcl_file, config["script-defines"], **hargs)

        if (f"script-defines {hargs['check']}") in config:
            print_hfmt(tcl_file, config[f"script-defines {hargs['check']}"], **hargs)
        
        inc_dirs = []
        if "include-dirs" in config:
            inc_dirs += hfmt(config["include-dirs"], **hargs)

        sv_files = [f"{check}.sv"]
        if "verilog-files" in config:
            sv_files += hfmt(config["verilog-files"], **hargs)

        vhdl_files = []
        if "vhdl-files" in config:
            vhdl_files += hfmt(config["vhdl-files"], **hargs)

        if len(sv_files):
            print("analyze -sv12 \\", file=tcl_file)
            if len(inc_dirs):
                for x in inc_dirs:
                    print(f"    +incdir+{x} \\", file=tcl_file)
            for x in sv_files:
                mystr = f"    {x} "
                if x != sv_files[-1]: mystr += "\\"
                else: mystr += "\n"
                print(mystr, file=tcl_file)

        if len(vhdl_files):
            print("analyze -vhdl08 \\", file=tcl_file)
            if len(inc_dirs):
                for x in inc_dirs:
                    print(f"    +incdir+{x} \\", file=tcl_file)
            for x in vhdl_files:
                mystr = f"    {x} "
                if x != vhdl_files[-1]: mystr += "\\"
                else: mystr += "\n"
                print(mystr, file=tcl_file)

        if "script-sources" in config:
            print_hfmt(tcl_file, config["script-sources"], **hargs)

        # print("elaborate -top rvfi_testbench -create_related_covers witness\n", file=tcl_file)
        print(f"elaborate -top rvfi_testbench -no_preconditions \n", file=tcl_file)
        print("clock clock\nreset reset\n", file=tcl_file)

        if "script-link" in config:
            print_hfmt(tcl_file, config["script-link"], **hargs)
        
        check_dir = f"{cfgname}/{check}/"
        shutil.copy(basedir+"/checks/rvfi_macros.vh", check_dir)
        shutil.copy(basedir+"/checks/rvfi_channel.sv", check_dir)
        shutil.copy(basedir+"/checks/rvfi_testbench.sv", check_dir)
        temp = hfmt("@check@", **hargs)[0]
        shutil.copy(f"{basedir}/checks/rvfi_{temp}_check.sv", check_dir)
        
        # DECTECT THE NON-DETERMINISTIC CONSTANTS
        with open(f"{basedir}/checks/rvfi_{temp}_check.sv", 'r') as f:
            for line in f.readlines():
                if "rvformal_rand_const_reg" in line:
                    ndc = line.split()[-1][:-1]
                    print(f"assume -name ASM_{ndc}_const {{@(posedge clock) (checker_inst.{ndc} == $past(checker_inst.{ndc}))}}", file=tcl_file)
        
        print_hfmt(tcl_file, """
                :
                : set_prove_target_bound $depth
                : set_max_trace_length $depth
                : set_trace_optimization standard
                : prove -instance checker_inst -dump_trace -dump_trace_type vcd -dump_trace_dir traces
                : 
                : report -summary
                : 
        """, **hargs)
                # : check_assumptions -show -dead_end
                # : 
                # : prove -bg -instance checker_inst -iter $depth -dump_trace -dump_trace_type vcd -dump_trace_dir traces

        defines_str = hfmt("""
                : `define RISCV_FORMAL
                : `define RISCV_FORMAL_NRET @nret@
                : `define RISCV_FORMAL_XLEN @xlen@
                : `define RISCV_FORMAL_ILEN @ilen@
                : `define RISCV_FORMAL_CHECKER rvfi_@check@_check
                : `define RISCV_FORMAL_RESET_CYCLES @start@
                : `define RISCV_FORMAL_CHECK_CYCLE @depth@
        """, **hargs)

        if "assume" in config:
            defines_str += hfmt("`define RISCV_FORMAL_ASSUME\n", **hargs)

        if mode == "prove":
            defines_str += hfmt("`define RISCV_FORMAL_UNBOUNDED\n", **hargs)

        for csr in sorted(csrs):
            defines_str += hfmt(f"`define RISCV_FORMAL_CSR_{csr.upper()}", **hargs)

        if csr_mode:
            localdict = locals()
            if "constval" in localdict:
                defines_str += hfmt(f"`define RISCV_FORMAL_CSRC_CONSTVAL {constval}", **hargs)
            if "hpmevent" in localdict:
                defines_str += hfmt(f"`define RISCV_FORMAL_CSRC_HPMEVENT {hpmevent}", **hargs)
            if "hpmcounter" in localdict:
                defines_str += hfmt(f"`define RISCV_FORMAL_CSRC_HPMCOUNTER {hpmcounter}", **hargs)
            if "csr_mask" in localdict:
                defines_str += hfmt(f"`define RISCV_FORMAL_CSRC_MASK {csr_mask}", **hargs)
            defines_str += hfmt(f"`define RISCV_FORMAL_CSRC_NAME {csr_name}", **hargs)
        
        if custom_csrs:
            defines_str += print_custom_csrs()

        if blackbox and hargs["check"] != "liveness":
            defines_str += hfmt("`define RISCV_FORMAL_BLACKBOX_ALU", **hargs)

        if blackbox and hargs["check"] != "reg":
            defines_str += hfmt("`define RISCV_FORMAL_BLACKBOX_REGS", **hargs)

        if chanidx is not None:
            defines_str += hfmt(f"`define RISCV_FORMAL_CHANNEL_IDX {chanidx:d}", **hargs)

        if trig is not None:
            defines_str += hfmt(f"`define RISCV_FORMAL_TRIG_CYCLE {trig:d}", **hargs)

        if bus_mode:
            defines_str += hfmt("""
                    : `define RISCV_FORMAL_BUS
                    : `define RISCV_FORMAL_NBUS @nbus@
                    : `define RISCV_FORMAL_BUSLEN @buslen@
            """, **hargs)

        if hargs["check"] in ("liveness", "hang"):
            defines_str += hfmt("`define RISCV_FORMAL_FAIRNESS", **hargs)

        if "defines" in config:
            defines_str += hfmt(config["defines"], **hargs)

        if (f"defines {hargs['check']}") in config:
            defines_str += hfmt(config[f"defines {hargs['check']}"], **hargs)

        defines_str += hfmt("`include \"rvfi_macros.vh\"", **hargs)
        with open(f"{cfgname}/{check}/defines.sv", "w") as defines_file:
            for line in defines_str:
                print(line, file=defines_file)
        
        checkch_str = hfmt("""
                : `include "defines.sv"
                : `include "rvfi_channel.sv"
                : `include "rvfi_testbench.sv"
                : `include "rvfi_@check@_check.sv"
        """, **hargs)

        checkch_path = hfmt("@checkch@.sv", **hargs)[0]
        with open(f"{cfgname}/{check}/{checkch_path}", "w") as checkch_file:
            for line in checkch_str:
                print(line, file=checkch_file)
        
        if check == pf+"cover":
            cover_stmts_str = hfmt("@cover@", **hargs)
            with open(f"{cfgname}/{check}/cover_stmts.vh", "w") as cover_stmts_file:
                for line in cover_stmts_str:
                    print(line, file=cover_stmts_file)

        if "assume" in config:
            assume_stmts_str = ""
            for pat, line in config["assume"]:
                enabled = True
                for p in pat:
                    if p.startswith("!"):
                        p = p[1:]
                        enabled = False
                    else:
                        enabled = True
                    if re.match(p, check):
                        enabled = not enabled
                        break
                if enabled:
                    assume_stmts_str += line
            with open(f"{cfgname}/{check}/assume_stmts.vh", "w") as assume_stmts_file:
                print(assume_stmts_str, file=assume_stmts_file)

for grp in groups:
    for i in range(nret):
        check_cons(grp, "reg", chanidx=i, start=0, depth=1)
        check_cons(grp, "pc_fwd", chanidx=i, start=0, depth=1)
        check_cons(grp, "pc_bwd", chanidx=i, start=0, depth=1)
        check_cons(grp, "liveness", chanidx=i, start=0, trig=1, depth=2)
        check_cons(grp, "unique", chanidx=i, start=0, trig=1, depth=2)
        check_cons(grp, "causal", chanidx=i, start=0, depth=1)
        check_cons(grp, "causal_mem", chanidx=i, start=0, depth=1)
        check_cons(grp, "causal_io", chanidx=i, start=0, depth=1)
        check_cons(grp, "ill", chanidx=i, depth=0)
        check_cons(grp, "fault", chanidx=i, depth=0)

        check_cons(grp, "bus_imem", chanidx=i, start=0, depth=1, bus_mode=True)
        check_cons(grp, "bus_imem_fault", chanidx=i, start=0, depth=1, bus_mode=True)
        check_cons(grp, "bus_dmem", chanidx=i, start=0, depth=1, bus_mode=True)
        check_cons(grp, "bus_dmem_fault", chanidx=i, start=0, depth=1, bus_mode=True)
        check_cons(grp, "bus_dmem_io_read", chanidx=i, start=0, depth=1, bus_mode=True)
        check_cons(grp, "bus_dmem_io_read_fault", chanidx=i, start=0, depth=1, bus_mode=True)
        check_cons(grp, "bus_dmem_io_write", chanidx=i, start=0, depth=1, bus_mode=True)
        check_cons(grp, "bus_dmem_io_write_fault", chanidx=i, start=0, depth=1, bus_mode=True)
        check_cons(grp, "bus_dmem_io_order", chanidx=i, start=0, depth=1, bus_mode=True)

    check_cons(grp, "hang", start=0, depth=1)
    check_cons(grp, "cover", start=0, depth=1)

    for csr in sorted(csrs):
        for chanidx in range(nret):
            for csr_test in csr_tests.get(csr, [None]):
                check_cons(grp, csr, chanidx, start=0, depth=1, csr_mode=True, csr_test=csr_test)

# ------------------------------ Makefile ------------------------------

def checks_key(check):
    if "sort" in config:
        for index, line in enumerate(config["sort"].split("\n")):
            if re.fullmatch(line.strip(), check):
                return f"{index:04d}-{check}"
    if check.startswith("insn_"):
        return f"9999-{check}"
    return f"9998-{check}"

with open(f"{cfgname}/Makefile", "w") as mkfile:
    print("BATCH = -batch", file=mkfile)
    print("all:", end="", file=mkfile)

    checks = list(sorted(consistency_checks | instruction_checks, key=checks_key))

    for check in checks:
        print(f" {check}", end="", file=mkfile)
    print(file=mkfile)

    for check in checks:
        print(f"{check}: {check}/jgproject", file=mkfile)
        print(f"{check}/jgproject:", file=mkfile)
        if abspath:
            print(f"\tcd $(shell pwd)/{check} && {jgcmd} $(shell pwd)/{check}_jg.tcl $(BATCH)", file=mkfile)
            print(f"\tgzip -rfd $(shell pwd)/{check}/traces", file=mkfile)
            print(f"\tcd $(shell pwd)/{check} && python3 $(shell pwd)/../../../../checks/get_jg_summary.py", file=mkfile)
        else:
            print(f"\tcd {check} && {jgcmd} {check}_jg.tcl $(BATCH)", file=mkfile)
            print(f"\tgzip -rfd {check}/traces", file=mkfile)
            print(f"\tcd {check} && python3 ../../../../checks/get_jg_summary.py", file=mkfile)
        print(f".PHONY: {check}", file=mkfile)

print(f"Generated {len(consistency_checks) + len(instruction_checks)} checks.")
