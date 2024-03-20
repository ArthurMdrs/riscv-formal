#!/usr/bin/env python3

from Verilog_VCD.Verilog_VCD import parse_vcd
from os import system
from sys import argv

rvfi_valid = None
rvfi_order = None
rvfi_insn = None

for netinfo in parse_vcd(argv[1]).values():
    # print(netinfo.keys())
    for net in netinfo['nets']:
        # print(net["hier"], net["name"])
        if net["hier"] == "rvfi_testbench.wrapper" and net["name"] == "rvfi_valid":
            rvfi_valid = netinfo['tv']
        if net["hier"] == "rvfi_testbench.wrapper" and (net["name"] == "rvfi_order" or net["name"] == "rvfi_order[63:0]"):
            rvfi_order = netinfo['tv']
        if net["hier"] == "rvfi_testbench.wrapper" and (net["name"] == "rvfi_insn" or net["name"] == "rvfi_insn[31:0]"):
            rvfi_insn = netinfo['tv']

# print(len(rvfi_valid), "==" ,len(rvfi_order),"?")
# print(len(rvfi_valid), "==" ,len(rvfi_insn),"?")
time_vals = []
valid_time_vals = []
order_time_vals = []
insn_time_vals = []
    
for val in rvfi_valid:
    valid_time_vals.append(val[0])
    if val[0] not in time_vals: time_vals.append(val[0])
    # print(f"At time {val[0]:4d}, rvfi_valid is {val[1]}")
for val in rvfi_order:
    order_time_vals.append(val[0])
    if val[0] not in time_vals: time_vals.append(val[0])
    # print(f"At time {val[0]:4d}, rvfi_order is {val[1]}")
for val in rvfi_insn:
    insn_time_vals.append(val[0])
    if val[0] not in time_vals: time_vals.append(val[0])
    # print(f"At time {val[0]:4d}, rvfi_insn is  {val[1]}")

time_vals.sort()
# print("time_vals:", time_vals)
# print("valid_time_vals:", valid_time_vals)
# print("order_time_vals:", order_time_vals)
# print("insn_time_vals:", insn_time_vals)
time_start = min(time_vals)
time_end   = max(time_vals)

def fill_time_slots (time_vals, unfilled_slots, tuple_vec):
    new_vec = []
    prev_val = ""
    for time in time_vals:
        if time in unfilled_slots:
            idx = unfilled_slots.index(time)
            new_vec.append(tuple_vec[idx])
            prev_val = tuple_vec[idx][1]
        else: 
            new_vec.append([time, prev_val])
    return new_vec

rvfi_valid = fill_time_slots(time_vals, valid_time_vals, rvfi_valid)
rvfi_order = fill_time_slots(time_vals, order_time_vals, rvfi_order)
rvfi_insn  = fill_time_slots(time_vals, insn_time_vals , rvfi_insn )

assert len(rvfi_valid) == len(rvfi_order)
assert len(rvfi_valid) == len(rvfi_insn)

prog = list()

for tv_valid, tv_order, tv_insn in zip(rvfi_valid, rvfi_order, rvfi_insn):
    if tv_valid[1] == '1':
        prog.append((int(tv_order[1], 2), int(tv_insn[1], 2)))

with open("disasm.s", "w") as f:
    for tv_order, tv_insn in sorted(prog):
        if tv_insn & 3 != 3 and tv_insn & 0xffff0000 == 0:
            print(".hword 0x%04x # %d" % (tv_insn, tv_order), file=f)
        else:
            print(".word 0x%08x # %d" % (tv_insn, tv_order), file=f)

system("riscv32-unknown-elf-gcc -march=rv32imfc_xpulpv1 -c disasm.s")
system("riscv32-unknown-elf-objdump -d -M numeric,no-aliases disasm.o")

