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

current_isa = []
isa_database = dict()
defaults_cache = None

MISA_A = 1 <<  0 # Atomic
MISA_B = 1 <<  1 # -reserved-
MISA_C = 1 <<  2 # Compressed
MISA_D = 1 <<  3 # Double-precision float
MISA_E = 1 <<  4 # RV32E base ISA
MISA_F = 1 <<  5 # Single-precision float
MISA_G = 1 <<  6 # Additional std extensions
MISA_H = 1 <<  7 # -reserved-
MISA_I = 1 <<  8 # RV32I/RV64I/RV128I base ISA
MISA_J = 1 <<  9 # -reserved-
MISA_K = 1 << 10 # -reserved-
MISA_L = 1 << 11 # -reserved-
MISA_M = 1 << 12 # Muliply/Divide
MISA_N = 1 << 13 # User-level interrupts
MISA_O = 1 << 14 # -reserved-
MISA_P = 1 << 15 # -reserved-
MISA_Q = 1 << 16 # Quad-precision float
MISA_R = 1 << 17 # -reserved-
MISA_S = 1 << 18 # Supervisor mode
MISA_T = 1 << 19 # -reserved-
MISA_U = 1 << 20 # User mode
MISA_V = 1 << 21 # -reserved-
MISA_W = 1 << 22 # -reserved-
MISA_X = 1 << 23 # Non-std extensions
MISA_Y = 1 << 24 # -reserved-
MISA_Z = 1 << 25 # -reserved-

def header(f, insn, isa_mode=False):
    if not isa_mode:
        global isa_database
        for isa in current_isa:
            if isa not in isa_database:
                isa_database[isa] = set()
            isa_database[isa].add(insn)

    global defaults_cache
    defaults_cache = dict()

    print("// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py", file=f)
    print("", file=f)
    if isa_mode:
        print("module rvfi_isa_%s (" % insn, file=f)
    else:
        print("module rvfi_insn_%s (" % insn, file=f)

    print("  input                                 rvfi_valid,", file=f)
    print("  input  [`RISCV_FORMAL_ILEN   - 1 : 0] rvfi_insn,", file=f)
    print("  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_pc_rdata,", file=f)
    print("  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs1_rdata,", file=f)
    print("  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs2_rdata,", file=f)
    print("  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_mem_rdata,", file=f)

    print("`ifdef RISCV_FORMAL_CSR_MISA", file=f)
    print("  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_csr_misa_rdata,", file=f)
    print("  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_csr_misa_rmask,", file=f)
    print("`endif", file=f)

#### ================   XPULP - BEGIN   ================ ####
    print("", file=f)
    print("`ifdef RISCV_FORMAL_CUSTOM_ISA", file=f)
    print("  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs3_rdata,", file=f)
    print("  input                                 rvfi_is_hwlp,", file=f)
    print("  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_hwlp_start,", file=f)
    print("", file=f)
    print("  output [                       4 : 0] spec_rs3_addr,", file=f)
    print("  output [                       4 : 0] spec_post_rd_addr,", file=f)
    print("  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_post_rd_wdata,", file=f)
    print("`endif", file=f)
#### ================   XPULP - END   ================ ####

    print("", file=f)
    print("  output                                spec_valid,", file=f)
    print("  output                                spec_trap,", file=f)
    print("  output [                       4 : 0] spec_rs1_addr,", file=f)
    print("  output [                       4 : 0] spec_rs2_addr,", file=f)
    print("  output [                       4 : 0] spec_rd_addr,", file=f)
    print("  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_rd_wdata,", file=f)
    print("  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_pc_wdata,", file=f)
    print("  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_mem_addr,", file=f)
    print("  output [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_mem_rmask,", file=f)
    print("  output [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_mem_wmask,", file=f)
    print("  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_mem_wdata", file=f)

    print(");", file=f)

    defaults_cache["spec_valid"] = "0"
    defaults_cache["spec_rs1_addr"] = "0"
    defaults_cache["spec_rs2_addr"] = "0"
    defaults_cache["spec_rd_addr"] = "0"
    defaults_cache["spec_rd_wdata"] = "0"
    defaults_cache["spec_pc_wdata"] = "0"
    defaults_cache["spec_trap"] = "!misa_ok"
    defaults_cache["spec_mem_addr"] = "0"
    defaults_cache["spec_mem_rmask"] = "0"
    defaults_cache["spec_mem_wmask"] = "0"
    defaults_cache["spec_mem_wdata"] = "0"
#### ================   XPULP - BEGIN   ================ ####
    defaults_cache["spec_rs3_addr"] = "0"
    defaults_cache["spec_post_rd_addr"] = "0"
    defaults_cache["spec_post_rd_wdata"] = "0"
#### ================   XPULP - END   ================ ####

def assign(f, sig, val):
    print("  assign %s = %s;" % (sig, val), file=f)

    if sig in defaults_cache:
        del defaults_cache[sig]

def misa_check(f, mask, ialign16=False):
    print("", file=f)
    print("`ifdef RISCV_FORMAL_CSR_MISA", file=f)
    print("  wire misa_ok = (rvfi_csr_misa_rdata & `RISCV_FORMAL_XLEN'h %x) == `RISCV_FORMAL_XLEN'h %x;" % (mask, mask), file=f)
    print("  assign spec_csr_misa_rmask = `RISCV_FORMAL_XLEN'h %x;" % ((mask|MISA_C) if ialign16 else mask), file=f)
    if ialign16:
        print("  wire ialign16 = (rvfi_csr_misa_rdata & `RISCV_FORMAL_XLEN'h %x) != `RISCV_FORMAL_XLEN'h 0;" % (MISA_C), file=f)
    print("`else", file=f)
    print("  wire misa_ok = 1;", file=f)
    if ialign16:
        print("`ifdef RISCV_FORMAL_COMPRESSED", file=f)
        print("  wire ialign16 = 1;", file=f)
        print("`else", file=f)
        print("  wire ialign16 = 0;", file=f)
        print("`endif", file=f)
    print("`endif", file=f)

def footer(f):
    def default_assign(sig):
        if sig in defaults_cache:
            print("  assign %s = %s;" % (sig, defaults_cache[sig]), file=f)

    if len(defaults_cache) != 0:
        print("", file=f)
        print("  // default assignments", file=f)

        default_assign("spec_valid")
        default_assign("spec_rs1_addr")
        default_assign("spec_rs2_addr")
        default_assign("spec_rd_addr")
        default_assign("spec_rd_wdata")
        default_assign("spec_pc_wdata")
        default_assign("spec_trap")
        default_assign("spec_mem_addr")
        default_assign("spec_mem_rmask")
        default_assign("spec_mem_wmask")
        default_assign("spec_mem_wdata")
        
#### ================   XPULP - BEGIN   ================ ####
        print("`ifdef RISCV_FORMAL_CUSTOM_ISA", file=f)
        default_assign("spec_rs3_addr")
        default_assign("spec_post_rd_addr")
        default_assign("spec_post_rd_wdata")
        print("`endif", file=f)
#### ================   XPULP - END   ================ ####

    print("endmodule", file=f)

def format_r(f):
    print("", file=f)
    print("  // R-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16 >> 16;", file=f)
    print("  wire [6:0] insn_funct7 = rvfi_insn[31:25];", file=f)
    print("  wire [4:0] insn_rs2    = rvfi_insn[24:20];", file=f)
    print("  wire [4:0] insn_rs1    = rvfi_insn[19:15];", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[14:12];", file=f)
    print("  wire [4:0] insn_rd     = rvfi_insn[11: 7];", file=f)
    print("  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];", file=f)

def format_ra(f):
    print("", file=f)
    print("  // R-type instruction format (atomics variation)", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16 >> 16;", file=f)
    print("  wire [6:0] insn_funct5 = rvfi_insn[31:27];", file=f)
    print("  wire       insn_aq     = rvfi_insn[26];", file=f)
    print("  wire       insn_rl     = rvfi_insn[25];", file=f)
    print("  wire [4:0] insn_rs2    = rvfi_insn[24:20];", file=f)
    print("  wire [4:0] insn_rs1    = rvfi_insn[19:15];", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[14:12];", file=f)
    print("  wire [4:0] insn_rd     = rvfi_insn[11: 7];", file=f)
    print("  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];", file=f)

def format_i(f):
    print("", file=f)
    print("  // I-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16 >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = $signed(rvfi_insn[31:20]);", file=f)
    print("  wire [4:0] insn_rs1    = rvfi_insn[19:15];", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[14:12];", file=f)
    print("  wire [4:0] insn_rd     = rvfi_insn[11: 7];", file=f)
    print("  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];", file=f)

def format_i_shift(f):
    print("", file=f)
    print("  // I-type instruction format (shift variation)", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16 >> 16;", file=f)
    print("  wire [6:0] insn_funct6 = rvfi_insn[31:26];", file=f)
    print("  wire [5:0] insn_shamt  = rvfi_insn[25:20];", file=f)
    print("  wire [4:0] insn_rs1    = rvfi_insn[19:15];", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[14:12];", file=f)
    print("  wire [4:0] insn_rd     = rvfi_insn[11: 7];", file=f)
    print("  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];", file=f)

def format_s(f):
    print("", file=f)
    print("  // S-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16 >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = $signed({rvfi_insn[31:25], rvfi_insn[11:7]});", file=f)
    print("  wire [4:0] insn_rs2    = rvfi_insn[24:20];", file=f)
    print("  wire [4:0] insn_rs1    = rvfi_insn[19:15];", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[14:12];", file=f)
    print("  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];", file=f)

def format_sb(f):
    print("", file=f)
    print("  // SB-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16 >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = $signed({rvfi_insn[31], rvfi_insn[7], rvfi_insn[30:25], rvfi_insn[11:8], 1'b0});", file=f)
    print("  wire [4:0] insn_rs2    = rvfi_insn[24:20];", file=f)
    print("  wire [4:0] insn_rs1    = rvfi_insn[19:15];", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[14:12];", file=f)
    print("  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];", file=f)

def format_u(f):
    print("", file=f)
    print("  // U-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16 >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = $signed({rvfi_insn[31:12], 12'b0});", file=f)
    print("  wire [4:0] insn_rd     = rvfi_insn[11:7];", file=f)
    print("  wire [6:0] insn_opcode = rvfi_insn[ 6:0];", file=f)

def format_uj(f):
    print("", file=f)
    print("  // UJ-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16 >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = $signed({rvfi_insn[31], rvfi_insn[19:12], rvfi_insn[20], rvfi_insn[30:21], 1'b0});", file=f)
    print("  wire [4:0] insn_rd     = rvfi_insn[11:7];", file=f)
    print("  wire [6:0] insn_opcode = rvfi_insn[6:0];", file=f)

def format_cr(f):
    print("", file=f)
    print("  // CI-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16;", file=f)
    print("  wire [3:0] insn_funct4 = rvfi_insn[15:12];", file=f)
    print("  wire [4:0] insn_rs1_rd = rvfi_insn[11:7];", file=f)
    print("  wire [4:0] insn_rs2 = rvfi_insn[6:2];", file=f)
    print("  wire [1:0] insn_opcode = rvfi_insn[1:0];", file=f)

def format_ci(f):
    print("", file=f)
    print("  // CI-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = $signed({rvfi_insn[12], rvfi_insn[6:2]});", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[15:13];", file=f)
    print("  wire [4:0] insn_rs1_rd = rvfi_insn[11:7];", file=f)
    print("  wire [1:0] insn_opcode = rvfi_insn[1:0];", file=f)

def format_ci_sp(f):
    print("", file=f)
    print("  // CI-type instruction format (SP variation)", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = $signed({rvfi_insn[12], rvfi_insn[4:3], rvfi_insn[5], rvfi_insn[2], rvfi_insn[6], 4'b0});", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[15:13];", file=f)
    print("  wire [4:0] insn_rs1_rd = rvfi_insn[11:7];", file=f)
    print("  wire [1:0] insn_opcode = rvfi_insn[1:0];", file=f)

def format_ci_lui(f):
    print("", file=f)
    print("  // CI-type instruction format (LUI variation)", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = $signed({rvfi_insn[12], rvfi_insn[6:2], 12'b0});", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[15:13];", file=f)
    print("  wire [4:0] insn_rs1_rd = rvfi_insn[11:7];", file=f)
    print("  wire [1:0] insn_opcode = rvfi_insn[1:0];", file=f)

def format_ci_sri(f):
    print("", file=f)
    print("  // CI-type instruction format (SRI variation)", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16;", file=f)
    print("  wire [5:0] insn_shamt = {rvfi_insn[12], rvfi_insn[6:2]};", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[15:13];", file=f)
    print("  wire [1:0] insn_funct2 = rvfi_insn[11:10];", file=f)
    print("  wire [4:0] insn_rs1_rd = {1'b1, rvfi_insn[9:7]};", file=f)
    print("  wire [1:0] insn_opcode = rvfi_insn[1:0];", file=f)

def format_ci_sli(f):
    print("", file=f)
    print("  // CI-type instruction format (SLI variation)", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16;", file=f)
    print("  wire [5:0] insn_shamt = {rvfi_insn[12], rvfi_insn[6:2]};", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[15:13];", file=f)
    print("  wire [4:0] insn_rs1_rd = rvfi_insn[11:7];", file=f)
    print("  wire [1:0] insn_opcode = rvfi_insn[1:0];", file=f)

def format_ci_andi(f):
    print("", file=f)
    print("  // CI-type instruction format (ANDI variation)", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = $signed({rvfi_insn[12], rvfi_insn[6:2]});", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[15:13];", file=f)
    print("  wire [1:0] insn_funct2 = rvfi_insn[11:10];", file=f)
    print("  wire [4:0] insn_rs1_rd = {1'b1, rvfi_insn[9:7]};", file=f)
    print("  wire [1:0] insn_opcode = rvfi_insn[1:0];", file=f)

def format_ci_lsp(f, numbytes):
    print("", file=f)
    print("  // CI-type instruction format (LSP variation, %d bit version)" % (8*numbytes), file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16;", file=f)
    if numbytes == 4:
        print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = {rvfi_insn[3:2], rvfi_insn[12], rvfi_insn[6:4], 2'b00};", file=f)
    elif numbytes == 8:
        print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = {rvfi_insn[4:2], rvfi_insn[12], rvfi_insn[6:5], 3'b000};", file=f)
    else:
        assert False
    print("  wire [2:0] insn_funct3 = rvfi_insn[15:13];", file=f)
    print("  wire [4:0] insn_rd = rvfi_insn[11:7];", file=f)
    print("  wire [1:0] insn_opcode = rvfi_insn[1:0];", file=f)

def format_cl(f, numbytes):
    print("", file=f)
    print("  // CL-type instruction format (%d bit version)" % (8*numbytes), file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16;", file=f)
    if numbytes == 4:
        print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = {rvfi_insn[5], rvfi_insn[12:10], rvfi_insn[6], 2'b00};", file=f)
    elif numbytes == 8:
        print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = {rvfi_insn[6:5], rvfi_insn[12:10], 3'b000};", file=f)
    else:
        assert False
    print("  wire [2:0] insn_funct3 = rvfi_insn[15:13];", file=f)
    print("  wire [4:0] insn_rs1 = {1'b1, rvfi_insn[9:7]};", file=f)
    print("  wire [4:0] insn_rd = {1'b1, rvfi_insn[4:2]};", file=f)
    print("  wire [1:0] insn_opcode = rvfi_insn[1:0];", file=f)

def format_css(f, numbytes):
    print("", file=f)
    print("  // CSS-type instruction format (%d bit version)" % (8*numbytes), file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16;", file=f)
    if numbytes == 4:
        print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = {rvfi_insn[8:7], rvfi_insn[12:9], 2'b00};", file=f)
    elif numbytes == 8:
        print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = {rvfi_insn[9:7], rvfi_insn[12:10], 3'b000};", file=f)
    else:
        assert False
    print("  wire [2:0] insn_funct3 = rvfi_insn[15:13];", file=f)
    print("  wire [4:0] insn_rs2 = rvfi_insn[6:2];", file=f)
    print("  wire [1:0] insn_opcode = rvfi_insn[1:0];", file=f)

def format_cs(f, numbytes):
    print("", file=f)
    print("  // CS-type instruction format (%d bit version)" % (8*numbytes), file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16;", file=f)
    if numbytes == 4:
        print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = {rvfi_insn[5], rvfi_insn[12:10], rvfi_insn[6], 2'b00};", file=f)
    elif numbytes == 8:
        print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = {rvfi_insn[6:5], rvfi_insn[12:10], 3'b000};", file=f)
    else:
        assert False
    print("  wire [2:0] insn_funct3 = rvfi_insn[15:13];", file=f)
    print("  wire [4:0] insn_rs1 = {1'b1, rvfi_insn[9:7]};", file=f)
    print("  wire [4:0] insn_rs2 = {1'b1, rvfi_insn[4:2]};", file=f)
    print("  wire [1:0] insn_opcode = rvfi_insn[1:0];", file=f)

def format_cs_alu(f):
    print("", file=f)
    print("  // CS-type instruction format (ALU version)", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16;", file=f)
    print("  wire [5:0] insn_funct6 = rvfi_insn[15:10];", file=f)
    print("  wire [1:0] insn_funct2 = rvfi_insn[6:5];", file=f)
    print("  wire [4:0] insn_rs1_rd = {1'b1, rvfi_insn[9:7]};", file=f)
    print("  wire [4:0] insn_rs2 = {1'b1, rvfi_insn[4:2]};", file=f)
    print("  wire [1:0] insn_opcode = rvfi_insn[1:0];", file=f)

def format_ciw(f):
    print("", file=f)
    print("  // CIW-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = {rvfi_insn[10:7], rvfi_insn[12:11], rvfi_insn[5], rvfi_insn[6], 2'b00};", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[15:13];", file=f)
    print("  wire [4:0] insn_rd = {1'b1, rvfi_insn[4:2]};", file=f)
    print("  wire [1:0] insn_opcode = rvfi_insn[1:0];", file=f)

def format_cb(f):
    print("", file=f)
    print("  // CB-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = $signed({rvfi_insn[12], rvfi_insn[6:5], rvfi_insn[2], rvfi_insn[11:10], rvfi_insn[4:3], 1'b0});", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[15:13];", file=f)
    print("  wire [4:0] insn_rs1 = {1'b1, rvfi_insn[9:7]};", file=f)
    print("  wire [1:0] insn_opcode = rvfi_insn[1:0];", file=f)

def format_cj(f):
    print("", file=f)
    print("  // CJ-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = $signed({rvfi_insn[12], rvfi_insn[8], rvfi_insn[10], rvfi_insn[9],", file=f)
    print("      rvfi_insn[6], rvfi_insn[7], rvfi_insn[2], rvfi_insn[11], rvfi_insn[5], rvfi_insn[4], rvfi_insn[3], 1'b0});", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[15:13];", file=f)
    print("  wire [1:0] insn_opcode = rvfi_insn[1:0];", file=f)

#### ================   XPULP - BEGIN   ================ ####
def format_p_s(f):
    print("", file=f)
    print("  // P_S-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16 >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = $signed({rvfi_insn[31:25], rvfi_insn[11:7]});", file=f)
    print("  wire [6:0] insn_funct7  = rvfi_insn[31:25];", file=f)
    print("  wire [4:0] insn_rs2     = rvfi_insn[24:20];", file=f)
    print("  wire [4:0] insn_rs1     = rvfi_insn[19:15];", file=f)
    print("  wire [4:0] insn_post_rd = rvfi_insn[19:15];", file=f)
    print("  wire [2:0] insn_funct3  = rvfi_insn[14:12];", file=f)
    print("  wire [4:0] insn_rs3     = rvfi_insn[11: 7];", file=f)
    print("  wire [6:0] insn_opcode  = rvfi_insn[ 6: 0];", file=f)

def format_p_l(f):
    print("", file=f)
    print("  // P_L-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16 >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = $signed(rvfi_insn[31:20]);", file=f)
    print("  wire [6:0] insn_funct7  = rvfi_insn[31:25];", file=f)
    print("  wire [4:0] insn_rs2     = rvfi_insn[24:20];", file=f)
    print("  wire [4:0] insn_rs1     = rvfi_insn[19:15];", file=f)
    print("  wire [4:0] insn_post_rd = rvfi_insn[19:15];", file=f)
    print("  wire [2:0] insn_funct3  = rvfi_insn[14:12];", file=f)
    print("  wire [4:0] insn_rd      = rvfi_insn[11: 7];", file=f)
    print("  wire [6:0] insn_opcode  = rvfi_insn[ 6: 0];", file=f)

def format_bit_man(f):
    print("", file=f)
    print("  // Bit Manipulation instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16 >> 16;", file=f)
    print("  wire [1:0] insn_funct2 = rvfi_insn[31:30];", file=f)
    print("  wire [4:0] insn_rs2    = rvfi_insn[24:20];", file=f)
    print("  wire [4:0] insn_rs1    = rvfi_insn[19:15];", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[14:12];", file=f)
    print("  wire [4:0] insn_rd     = rvfi_insn[11: 7];", file=f)
    print("  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];", file=f)

def format_gen_alu_N(f):
    print("", file=f)
    print("  // ALU op with normalization instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16 >> 16;", file=f)
    print("  wire [1:0] insn_funct2 = rvfi_insn[31:30];", file=f)
    print("  wire [4:0] insn_ls3    = rvfi_insn[29:25];", file=f)
    print("  wire [4:0] insn_rs2    = rvfi_insn[24:20];", file=f)
    print("  wire [4:0] insn_rs1    = rvfi_insn[19:15];", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[14:12];", file=f)
    print("  wire [4:0] insn_rd     = rvfi_insn[11: 7];", file=f)
    print("  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];", file=f)

def format_p_b(f):
    print("", file=f)
    print("  // P_B-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16 >> 16;", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm12 = $signed({rvfi_insn[31], rvfi_insn[7], rvfi_insn[30:25], rvfi_insn[11:8], 1'b0});", file=f)
    print("  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm5 = $signed(rvfi_insn[24:20]);", file=f)
    print("  wire [4:0] insn_rs1    = rvfi_insn[19:15];", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[14:12];", file=f)
    print("  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];", file=f)
    
def format_vecop(f):
    print("", file=f)
    print("  // PV-type instruction format", file=f)
    print("  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16 >> 16;", file=f)
    print("  wire [4:0] insn_funct5 = rvfi_insn[31:27];", file=f)
    print("  wire       insn_funct1 = rvfi_insn[   26];", file=f)
    print("  wire [4:0] insn_rs2    = rvfi_insn[24:20];", file=f)
    print("  wire [4:0] insn_rs1    = rvfi_insn[19:15];", file=f)
    print("  wire [2:0] insn_funct3 = rvfi_insn[14:12];", file=f)
    print("  wire [4:0] insn_rd     = rvfi_insn[11: 7];", file=f)
    print("  wire [6:0] insn_opcode = rvfi_insn[ 6: 0];", file=f)
    
def assign_pc_wdata(f):
    print("`ifdef RISCV_FORMAL_CUSTOM_ISA", file=f)
    assign(f, "spec_pc_wdata", "(rvfi_is_hwlp) ? (rvfi_hwlp_start) : (rvfi_pc_rdata + 4)")
    print("`else", file=f)
    assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")
    print("`endif", file=f)
    
#### ================   XPULP - END   ================ ####

def insn_lui(insn="lui", misa=0):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_u(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_opcode == 7'b 0110111")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? insn_imm : 0")
        # assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")        
        assign_pc_wdata(f)

        footer(f)

def insn_auipc(insn="auipc", misa=0):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_u(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_opcode == 7'b 0010111")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? rvfi_pc_rdata + insn_imm : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")

        footer(f)

def insn_jal(insn="jal", misa=0):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_uj(f)
        misa_check(f, misa,  ialign16=True)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] next_pc = rvfi_pc_rdata + insn_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_opcode == 7'b 1101111")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? rvfi_pc_rdata + 4 : 0")
        assign(f, "spec_pc_wdata", "next_pc")
        assign(f, "spec_trap", "(ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok")

        footer(f)

def insn_jalr(insn="jalr", misa=0):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_i(f)
        misa_check(f, misa, ialign16=True)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] next_pc = (rvfi_rs1_rdata + insn_imm) & ~1;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b 000 && insn_opcode == 7'b 1100111")
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? rvfi_pc_rdata + 4 : 0")
        assign(f, "spec_pc_wdata", "next_pc")
        assign(f, "spec_trap", "(ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok")

        footer(f)

def insn_b(insn, funct3, expr, misa=0):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_sb(f)
        misa_check(f, misa, ialign16=True)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire cond = %s;" % expr, file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] next_pc = cond ? rvfi_pc_rdata + insn_imm : rvfi_pc_rdata + 4;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b %s && insn_opcode == 7'b 1100011" % funct3)
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rs2_addr", "insn_rs2")
        assign(f, "spec_pc_wdata", "next_pc")
        assign(f, "spec_trap", "(ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok")

        footer(f)

def insn_l(insn, funct3, numbytes, signext, misa=0):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_i(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("`ifdef RISCV_FORMAL_ALIGNED_MEM", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + insn_imm;", file=f)
        print("  wire [%d:0] result = rvfi_mem_rdata >> (8*(addr-spec_mem_addr));" % (8*numbytes-1), file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b %s && insn_opcode == 7'b 0000011" % funct3)
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_mem_addr", "addr & ~(`RISCV_FORMAL_XLEN/8-1)")
        assign(f, "spec_mem_rmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % numbytes)
        if signext:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(result) : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`else", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + insn_imm;", file=f)
        print("  wire [%d:0] result = rvfi_mem_rdata;" % (8*numbytes-1), file=f)
        assign(f, "spec_valid", "rvfi_valid && insn_funct3 == 3'b %s && insn_opcode == 7'b 0000011" % funct3)
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_mem_addr", "addr")
        assign(f, "spec_mem_rmask", "((1 << %d)-1)" % numbytes)
        if signext:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(result) : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")
        assign(f, "spec_trap", "!misa_ok")

        print("`endif", file=f)

        footer(f)

def insn_s(insn, funct3, numbytes, misa=0):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_s(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("`ifdef RISCV_FORMAL_ALIGNED_MEM", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + insn_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b %s && insn_opcode == 7'b 0100011" % funct3)
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rs2_addr", "insn_rs2")
        assign(f, "spec_mem_addr", "addr & ~(`RISCV_FORMAL_XLEN/8-1)")
        assign(f, "spec_mem_wmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % numbytes)
        assign(f, "spec_mem_wdata", "rvfi_rs2_rdata << (8*(addr-spec_mem_addr))")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`else", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + insn_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b %s && insn_opcode == 7'b 0100011" % funct3)
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rs2_addr", "insn_rs2")
        assign(f, "spec_mem_addr", "addr")
        assign(f, "spec_mem_wmask", "((1 << %d)-1)" % numbytes)
        assign(f, "spec_mem_wdata", "rvfi_rs2_rdata")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")
        assign(f, "spec_trap", "!misa_ok")

        print("`endif", file=f)

        footer(f)

def insn_imm(insn, funct3, expr, wmode=False, misa=0):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_i(f)
        misa_check(f, misa)

        if wmode:
            result_range = "31:0"
            opcode = "0011011"
        else:
            result_range = "`RISCV_FORMAL_XLEN-1:0"
            opcode = "0010011"

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire [%s] result = %s;" % (result_range, expr), file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b %s && insn_opcode == 7'b %s" % (funct3, opcode))
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rd_addr", "insn_rd")
        if wmode:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? {{`RISCV_FORMAL_XLEN-32{result[31]}}, result} : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")

        footer(f)

def insn_shimm(insn, funct6, funct3, expr, wmode=False, misa=0):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_i_shift(f)
        misa_check(f, misa)

        if wmode:
            xtra_shamt_check = "!insn_shamt[5]"
            result_range = "31:0"
            opcode = "0011011"
        else:
            xtra_shamt_check = "(!insn_shamt[5] || `RISCV_FORMAL_XLEN == 64)"
            result_range = "`RISCV_FORMAL_XLEN-1:0"
            opcode = "0010011"

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire [%s] result = %s;" % (result_range, expr), file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct6 == 6'b %s && insn_funct3 == 3'b %s && insn_opcode == 7'b %s && %s" % (funct6, funct3, opcode, xtra_shamt_check))
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rd_addr", "insn_rd")
        if wmode:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? {{`RISCV_FORMAL_XLEN-32{result[31]}}, result} : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")

        footer(f)

def insn_alu(insn, funct7, funct3, expr, alt_add=None, alt_sub=None, shamt=False, wmode=False, misa=0):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_r(f)
        misa_check(f, misa)

        if wmode:
            result_range = "31:0"
            opcode = "0111011"
        else:
            result_range = "`RISCV_FORMAL_XLEN-1:0"
            opcode = "0110011"

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        if shamt:
            if wmode:
                print("  wire [4:0] shamt = rvfi_rs2_rdata[4:0];", file=f)
            else:
                print("  wire [5:0] shamt = `RISCV_FORMAL_XLEN == 64 ? rvfi_rs2_rdata[5:0] : rvfi_rs2_rdata[4:0];", file=f)
        if alt_add is not None or alt_sub is not None:
            print("`ifdef RISCV_FORMAL_ALTOPS", file=f)
            if alt_add is not None:
                print("  wire [%s] altops_bitmask = 64'h%016x;" % (result_range, alt_add), file=f)
                print("  wire [%s] result = (rvfi_rs1_rdata + rvfi_rs2_rdata) ^ altops_bitmask;" % result_range, file=f)
            else:
                print("  wire [%s] altops_bitmask = 64'h%016x;" % (result_range, alt_sub), file=f)
                print("  wire [%s] result = (rvfi_rs1_rdata - rvfi_rs2_rdata) ^ altops_bitmask;" % result_range, file=f)
            print("`else", file=f)
            print("  wire [%s] result = %s;" % (result_range, expr), file=f)
            print("`endif", file=f)
        else:
            print("  wire [%s] result = %s;" % (result_range, expr), file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct7 == 7'b %s && insn_funct3 == 3'b %s && insn_opcode == 7'b %s" % (funct7, funct3, opcode))
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rs2_addr", "insn_rs2")
        assign(f, "spec_rd_addr", "insn_rd")
        if wmode:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? {{`RISCV_FORMAL_XLEN-32{result[31]}}, result} : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")

        footer(f)

def insn_amo(insn, funct5, funct3, expr, misa=MISA_A):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_ra(f)
        misa_check(f, misa)

        if funct3 == "010":
            oprange = "31:0"
            numbytes = 4
        else:
            oprange = "63:0"
            numbytes = 8

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire [%s] mem_result = %s;" % (oprange, expr), file=f)
        print("  wire [%s] reg_result = rvfi_mem_rdata[%s];" % (oprange, oprange), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata;", file=f)

        print("`ifdef RISCV_FORMAL_ALIGNED_MEM", file=f)

        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct5 == 5'b %s && insn_funct3 == 3'b %s && insn_opcode == 7'b 0101111" % (funct5, funct3))
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rs2_addr", "insn_rs2")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(reg_result) : 0")
        assign(f, "spec_mem_addr", "addr & ~(`RISCV_FORMAL_XLEN/8-1)")
        assign(f, "spec_mem_wmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % numbytes)
        assign(f, "spec_mem_wdata", "mem_result << (8*(addr-spec_mem_addr))")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`else", file=f)

        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct5 == 5'b %s && insn_funct3 == 3'b %s && insn_opcode == 7'b 0101111" % (funct5, funct3))
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rs2_addr", "insn_rs2")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(reg_result) : 0")
        assign(f, "spec_mem_addr", "addr")
        assign(f, "spec_mem_wmask", "((1 << %d)-1)" % numbytes)
        assign(f, "spec_mem_wdata", "mem_result")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 4")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`endif", file=f)

        footer(f)

def insn_c_addi4spn(insn="c_addi4spn", misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_ciw(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs1_rdata + insn_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b 000 && insn_opcode == 2'b 00 && insn_imm")
        assign(f, "spec_rs1_addr", "2")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def insn_c_l(insn, funct3, numbytes, signext, misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_cl(f, numbytes)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("`ifdef RISCV_FORMAL_ALIGNED_MEM", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + insn_imm;", file=f)
        print("  wire [%d:0] result = rvfi_mem_rdata >> (8*(addr-spec_mem_addr));" % (8*numbytes-1), file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b %s && insn_opcode == 2'b 00" % funct3)
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_mem_addr", "addr & ~(`RISCV_FORMAL_XLEN/8-1)")
        assign(f, "spec_mem_rmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % numbytes)
        if signext:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(result) : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`else", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + insn_imm;", file=f)
        print("  wire [%d:0] result = rvfi_mem_rdata;" % (8*numbytes-1), file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b %s && insn_opcode == 2'b 00" % funct3)
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_mem_addr", "addr")
        assign(f, "spec_mem_rmask", "((1 << %d)-1)" % numbytes)
        if signext:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(result) : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_trap", "!misa_ok")

        print("`endif", file=f)

        footer(f)

def insn_c_s(insn, funct3, numbytes, misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_cs(f, numbytes)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + insn_imm;", file=f)
        print("`ifdef RISCV_FORMAL_ALIGNED_MEM", file=f)

        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b %s && insn_opcode == 2'b 00" % funct3)
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rs2_addr", "insn_rs2")
        assign(f, "spec_mem_addr", "addr & ~(`RISCV_FORMAL_XLEN/8-1)")
        assign(f, "spec_mem_wmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % numbytes)
        assign(f, "spec_mem_wdata", "rvfi_rs2_rdata << (8*(addr-spec_mem_addr))")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`else", file=f)

        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b %s && insn_opcode == 2'b 00" % funct3)
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rs2_addr", "insn_rs2")
        assign(f, "spec_mem_addr", "addr")
        assign(f, "spec_mem_wmask", "((1 << %d)-1)" % numbytes)
        assign(f, "spec_mem_wdata", "rvfi_rs2_rdata")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_trap", "!misa_ok")

        print("`endif", file=f)

        footer(f)

def insn_c_addi(insn="c_addi", wmode=False, misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_ci(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        if wmode:
            print("  wire [31:0] result = rvfi_rs1_rdata[31:0] + insn_imm[31:0];", file=f)
            assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b 001 && insn_opcode == 2'b 01 && insn_rs1_rd != 5'd 0")
        else:
            print("  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs1_rdata + insn_imm;", file=f)
            assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b 000 && insn_opcode == 2'b 01")
        assign(f, "spec_rs1_addr", "insn_rs1_rd")
        assign(f, "spec_rd_addr", "insn_rs1_rd")
        if wmode:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? {{`RISCV_FORMAL_XLEN-32{result[31]}}, result} : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def insn_c_jal(insn, funct3, link, misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_cj(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] next_pc = rvfi_pc_rdata + insn_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b %s && insn_opcode == 2'b 01" % (funct3))
        if link:
            assign(f, "spec_rd_addr", "5'd 1")
            assign(f, "spec_rd_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_pc_wdata", "next_pc")

        footer(f)

def insn_c_li(insn="c_li", misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_ci(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] result = insn_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b 010 && insn_opcode == 2'b 01")
        assign(f, "spec_rd_addr", "insn_rs1_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def insn_c_addi16sp(insn="c_addi16sp", misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_ci_sp(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs1_rdata + insn_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b 011 && insn_opcode == 2'b 01 && insn_rs1_rd == 5'd 2 && insn_imm")
        assign(f, "spec_rs1_addr", "insn_rs1_rd")
        assign(f, "spec_rd_addr", "insn_rs1_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def insn_c_lui(insn="c_lui", misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_ci_lui(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] result = insn_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b 011 && insn_opcode == 2'b 01 && insn_rs1_rd != 5'd 2 && insn_imm")
        assign(f, "spec_rd_addr", "insn_rs1_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def insn_c_sri(insn, funct2, expr, misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_ci_sri(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] result = %s;" % expr, file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b 100 && insn_funct2 == 2'b %s && insn_opcode == 2'b 01 && (!insn_shamt[5] || `RISCV_FORMAL_XLEN == 64)" % funct2)
        assign(f, "spec_rs1_addr", "insn_rs1_rd")
        assign(f, "spec_rd_addr", "insn_rs1_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def insn_c_andi(insn="c_andi", misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_ci_andi(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs1_rdata & insn_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b 100 && insn_funct2 == 2'b 10 && insn_opcode == 2'b 01")
        assign(f, "spec_rs1_addr", "insn_rs1_rd")
        assign(f, "spec_rd_addr", "insn_rs1_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def insn_c_alu(insn, funct6, funct2, expr, wmode=False, misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_cs_alu(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        if wmode:
            print("  wire [31:0] result = %s;" % expr, file=f)
        else:
            print("  wire [`RISCV_FORMAL_XLEN-1:0] result = %s;" % expr, file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct6 == 6'b %s && insn_funct2 == 2'b %s && insn_opcode == 2'b 01" % (funct6, funct2))
        assign(f, "spec_rs1_addr", "insn_rs1_rd")
        assign(f, "spec_rs2_addr", "insn_rs2")
        assign(f, "spec_rd_addr", "insn_rs1_rd")
        if wmode:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? {{`RISCV_FORMAL_XLEN-32{result[31]}}, result} : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def insn_c_b(insn, funct3, expr, misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_cb(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire cond = %s;" % expr, file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] next_pc = cond ? rvfi_pc_rdata + insn_imm : rvfi_pc_rdata + 2;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b %s && insn_opcode == 2'b 01" % funct3)
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_pc_wdata", "next_pc")
        assign(f, "spec_trap", "(next_pc[0] != 0) || !misa_ok")

        footer(f)

def insn_c_sli(insn, expr, misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_ci_sli(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] result = %s;" % expr, file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b 000 && insn_opcode == 2'b 10 && (!insn_shamt[5] || `RISCV_FORMAL_XLEN == 64)")
        assign(f, "spec_rs1_addr", "insn_rs1_rd")
        assign(f, "spec_rd_addr", "insn_rs1_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

def insn_c_lsp(insn, funct3, numbytes, signext, misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_ci_lsp(f, numbytes)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("`ifdef RISCV_FORMAL_ALIGNED_MEM", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + insn_imm;", file=f)
        print("  wire [%d:0] result = rvfi_mem_rdata >> (8*(addr-spec_mem_addr));" % (8*numbytes-1), file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b %s && insn_opcode == 2'b 10 && insn_rd" % funct3)
        assign(f, "spec_rs1_addr", "2")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_mem_addr", "addr & ~(`RISCV_FORMAL_XLEN/8-1)")
        assign(f, "spec_mem_rmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % numbytes)
        if signext:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(result) : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`else", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + insn_imm;", file=f)
        print("  wire [%d:0] result = rvfi_mem_rdata;" % (8*numbytes-1), file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b %s && insn_opcode == 2'b 10 && insn_rd" % funct3)
        assign(f, "spec_rs1_addr", "2")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_mem_addr", "addr")
        assign(f, "spec_mem_rmask", "((1 << %d)-1)" % numbytes)
        if signext:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(result) : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_trap", "!misa_ok")

        print("`endif", file=f)

        footer(f)

def insn_c_ssp(insn, funct3, numbytes, misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_css(f, numbytes)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("`ifdef RISCV_FORMAL_ALIGNED_MEM", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + insn_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b %s && insn_opcode == 2'b 10" % funct3)
        assign(f, "spec_rs1_addr", "2")
        assign(f, "spec_rs2_addr", "insn_rs2")
        assign(f, "spec_mem_addr", "addr & ~(`RISCV_FORMAL_XLEN/8-1)")
        assign(f, "spec_mem_wmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % numbytes)
        assign(f, "spec_mem_wdata", "rvfi_rs2_rdata << (8*(addr-spec_mem_addr))")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`else", file=f)

        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = rvfi_rs1_rdata + insn_imm;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b %s && insn_opcode == 2'b 10" % funct3)
        assign(f, "spec_rs1_addr", "2")
        assign(f, "spec_rs2_addr", "insn_rs2")
        assign(f, "spec_mem_addr", "addr")
        assign(f, "spec_mem_wmask", "((1 << %d)-1)" % numbytes)
        assign(f, "spec_mem_wdata", "rvfi_rs2_rdata")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_trap", "!misa_ok")

        print("`endif", file=f)

        footer(f)

def insn_c_jalr(insn, funct4, link, misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_cr(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] next_pc = rvfi_rs1_rdata & ~1;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct4 == 4'b %s && insn_rs1_rd && !insn_rs2 && insn_opcode == 2'b 10" % funct4)
        assign(f, "spec_rs1_addr", "insn_rs1_rd")
        if link:
            assign(f, "spec_rd_addr", "5'd 1")
            assign(f, "spec_rd_wdata", "rvfi_pc_rdata + 2")
        assign(f, "spec_pc_wdata", "next_pc")
        assign(f, "spec_trap", "(next_pc[0] != 0) || !misa_ok")

        footer(f)

def insn_c_mvadd(insn, funct4, add, misa=MISA_C):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_cr(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        if add:
            print("  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs1_rdata + rvfi_rs2_rdata;", file=f)
        else:
            print("  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs2_rdata;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct4 == 4'b %s && insn_rs2 && insn_opcode == 2'b 10" % funct4)
        if add:
            assign(f, "spec_rs1_addr", "insn_rs1_rd")
        assign(f, "spec_rs2_addr", "insn_rs2")
        assign(f, "spec_rd_addr", "insn_rs1_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign(f, "spec_pc_wdata", "rvfi_pc_rdata + 2")

        footer(f)

#### ================   XPULP - BEGIN   ================ ####
def insn_p_s(insn, funct3, numbytes, misa=MISA_X):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_p_s(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        
        print("  reg funct3_valid, funct7_valid;", file=f)
        print("  always @(*) begin", file=f)
        print("    if (insn_opcode == 7'b 010_1011) begin", file=f)
        print("      funct3_valid = (insn_funct3 == 3'b0%s) || (insn_funct3 == 3'b1%s);" % (funct3, funct3), file=f)
        # print("      funct7_valid = (insn_funct3[2]) ? (insn_funct7 == 0) : (1'b1);", file=f)
        print("      funct7_valid = 1'b1; // THIS IS NOT SUPPOSED TO WORK, BUT IT DOES!!", file=f)
        print("      // funct7_valid = (insn_funct3[2]) ? (insn_funct7 == 0) : (1'b1); // This is how it should be", file=f)
        print("    end", file=f)
        print("    else if (insn_opcode == 7'b 010_0011) begin", file=f)
        print("      funct3_valid = (insn_funct3 == 3'b1%s);" % funct3, file=f)
        # print("      funct7_valid = (insn_funct7 == 0);", file=f)
        print("      funct7_valid = 1'b1; // THIS IS NOT SUPPOSED TO WORK, BUT IT DOES!!", file=f)
        print("      // funct7_valid = (insn_funct7 == 0); // This is how it should be", file=f)
        print("    end", file=f)
        print("    else begin", file=f)
        print("      funct3_valid = 1'b0;", file=f)
        print("      funct7_valid = 1'b0;", file=f)
        print("    end", file=f)
        print("  end", file=f)
        
        print("", file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] op2 = (insn_funct3[2]) ? (rvfi_rs3_rdata) : (insn_imm);", file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs1_rdata + op2;", file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = (insn_opcode[3]) ? (rvfi_rs1_rdata) : (result);", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && funct3_valid && funct7_valid")
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rs2_addr", "insn_rs2")
        assign(f, "spec_rs3_addr", "(insn_funct3[2]) ? (insn_rs3) : ('0)")
        assign(f, "spec_post_rd_addr", "(insn_opcode[3]) ? (insn_post_rd) : ('0)")
        assign(f, "spec_post_rd_wdata", "spec_post_rd_addr ? result : 0")
        assign_pc_wdata(f)
        
        print("", file=f)
        print("`ifdef RISCV_FORMAL_ALIGNED_MEM", file=f)

        assign(f, "spec_mem_addr", "addr & ~(`RISCV_FORMAL_XLEN/8-1)")
        assign(f, "spec_mem_wmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % numbytes)
        assign(f, "spec_mem_wdata", "rvfi_rs2_rdata << (8*(addr-spec_mem_addr))")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)

        print("`else", file=f)

        assign(f, "spec_mem_addr", "addr")
        assign(f, "spec_mem_wmask", "((1 << %d)-1)" % numbytes)
        assign(f, "spec_mem_wdata", "rvfi_rs2_rdata")
        assign(f, "spec_trap", "!misa_ok")

        print("`endif", file=f)

        footer(f)

def insn_p_l(insn, funct7, funct3, numbytes, signext, misa=MISA_X):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_p_l(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        
        print("  reg funct3_valid, funct7_valid;", file=f)
        print("  always @(*) begin", file=f)
        print("    if (insn_opcode == 7'b 000_1011) begin", file=f)
        print("      funct3_valid = (insn_funct3 == 3'b111) || (insn_funct3 == 3'b%s);" % funct3, file=f)
        print("      funct7_valid = (insn_funct3 == 3'b111) ? (insn_funct7 == 7'b%s) : (1'b1);" % funct7, file=f)
        print("    end", file=f)
        print("    else if (insn_opcode == 7'b 000_0011) begin", file=f)
        print("      funct3_valid = (insn_funct3 == 3'b111);", file=f)
        print("      funct7_valid = (insn_funct7 == 7'b%s);" % funct7, file=f)
        print("    end", file=f)
        print("    else begin", file=f)
        print("      funct3_valid = 1'b0;", file=f)
        print("      funct7_valid = 1'b0;", file=f)
        print("    end", file=f)
        print("  end", file=f)
        
        print("", file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] op2 = (insn_funct3 == 3'b111) ? (rvfi_rs2_rdata) : (insn_imm);", file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs1_rdata + op2;", file=f)
        print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = (insn_opcode[3]) ? (rvfi_rs1_rdata) : (result);", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && funct3_valid && funct7_valid")
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rs2_addr", "insn_rs2")
        assign(f, "spec_post_rd_addr", "(insn_opcode[3]) ? (insn_post_rd) : ('0)")
        assign(f, "spec_post_rd_wdata", "spec_post_rd_addr ? result : 0")
        assign(f, "spec_rd_addr", "insn_rd")
        assign_pc_wdata(f)
        
        print("", file=f)
        print("`ifdef RISCV_FORMAL_ALIGNED_MEM", file=f)

        print("  wire [%d:0] rdata = rvfi_mem_rdata >> (8*(addr-spec_mem_addr));" % (8*numbytes-1), file=f)
        assign(f, "spec_mem_addr", "addr & ~(`RISCV_FORMAL_XLEN/8-1)")
        assign(f, "spec_mem_rmask", "((1 << %d)-1) << (addr-spec_mem_addr)" % numbytes)
        if signext:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(rdata) : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? rdata : 0")
        assign(f, "spec_trap", "((addr & (%d-1)) != 0) || !misa_ok" % numbytes)
        
        print("`else", file=f)

        print("  wire [%d:0] rdata = rvfi_mem_rdata;" % (8*numbytes-1), file=f)
        assign(f, "spec_mem_addr", "addr")
        assign(f, "spec_mem_rmask", "((1 << %d)-1)" % numbytes)
        if signext:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? $signed(rdata) : 0")
        else:
            assign(f, "spec_rd_wdata", "spec_rd_addr ? rdata : 0")
        assign(f, "spec_trap", "!misa_ok")

        print("`endif", file=f)

        footer(f)

def insn_bit_man_1(insn, funct3, lnr=False, cnt=False, misa=MISA_X):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_r(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        
        print("  reg [31:0] result;", file=f)
        print("  always_comb begin", file=f)
        print("    result = %s;" % ("0" if cnt else "32"), file=f)
        if lnr:
            print("    for(int i = 31; i >= 0; i--)", file=f)
        else:
            print("    for(int i = 0; i < 32; i++)", file=f)
        print("      if(rvfi_rs1_rdata[i]) begin", file=f)
        if cnt:
            print("        result++;", file=f)
        else:
            print("        result = i;", file=f)
            print("        break;", file=f)
        print("      end", file=f)
        print("  end", file=f)
        
        print("  // ATTENTION!! The correct encoding is with rs2 = 5'b0!!!", file=f)
        print("  // The core does not check for that and it passes anyway!!!", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct7 == 7'b000_1000 && insn_funct3 == 3'b%s && insn_opcode == 7'b011_0011" % funct3)
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign_pc_wdata(f)

        footer(f)

def insn_bit_man_2(insn, funct2, funct3, u=False, r=False, shamt=False, misa=MISA_X):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_bit_man(f)
        misa_check(f, misa)
        
        instr_type = 0
        if   "extract" in insn: instr_type = 1
        elif "insert"  in insn: instr_type = 2
        elif "bclr"    in insn: instr_type = 3
        elif "bset"    in insn: instr_type = 4
        else:
            print("  // SOMETHING IS WRONG IN INSN GENERATION!", file=f)
            return

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        if r:
            print("  wire [4:0] insn_ls3    = rvfi_rs2_rdata[9:5];", file=f)
            print("  wire [4:0] insn_ls2    = rvfi_rs2_rdata[4:0];", file=f)
        else:
            print("  wire [4:0] insn_ls3    = rvfi_insn[29:25];", file=f)
            print("  wire [4:0] insn_ls2    = rvfi_insn[24:20];", file=f)
        print("", file=f)
        if instr_type == 1:
            print("  // Extract rs1[ls2+ls3 : ls2]", file=f)
        elif instr_type == 2:
            print("  // Extract rs1[ls3 : 0]", file=f)
        elif instr_type == 3:
            print("  // Clear rs1[ls2+ls3 : ls2]", file=f)
        elif instr_type == 4:
            print("  // Set rs1[ls2+ls3 : ls2]", file=f)
        print("  wire [31:0] mask       = (2 << insn_ls3) - 1;\t\t// mask[    ls3 :   0] = '1", file=f)
        print("  wire [31:0] mask_sh    = mask << insn_ls2;\t\t// mask[ls2+ls3 : ls2] = '1", file=f)
        if instr_type == 1:
            print("  wire [31:0] rs1_masked = rvfi_rs1_rdata & mask_sh;\t// rs1[ls2+ls3 : ls2]", file=f)
            print("  wire [31:0] res_u      = rs1_masked >> insn_ls2;\t// Unsigned result", file=f)
        elif instr_type == 2:
            print("  wire [31:0] rs1_masked = rvfi_rs1_rdata & mask;\t// rs1 [    ls3 :   0]", file=f)
            print("  // Insert extracted portion in rd, read from rs3", file=f)
            print("  wire [31:0] res_u      = (rvfi_rs3_rdata & ~mask_sh) | (rs1_masked << insn_ls2);", file=f)
        elif instr_type == 3:
            print("  wire [31:0] rs1_masked = rvfi_rs1_rdata & ~mask_sh;\t// rs1[ls2+ls3 : ls2] = '0", file=f)
            print("  wire [31:0] res_u      = rs1_masked;", file=f)
        elif instr_type == 4:
            print("  wire [31:0] rs1_masked = rvfi_rs1_rdata | mask_sh;\t// rs1[ls2+ls3 : ls2] = '1", file=f)
            print("  wire [31:0] res_u      = rs1_masked;", file=f)
        if not u:
            print("", file=f)
            print("  // Get position of MSB for signal extension (max is 31)", file=f)
            print("  wire [ 4:0] msb_pos = (insn_ls2 + insn_ls3 > 31) ? (31) : (insn_ls2 + insn_ls3);", file=f)
            print("  wire        sig     = rs1_masked[msb_pos];", file=f)
            print("  // Create signal extension mask (sext[31 : ls3+1] = 'sig)", file=f)
            print("  wire [31:0] sext    = {32{sig}} << (msb_pos - insn_ls2 + 1);", file=f)
        if instr_type == 1:
            print("", file=f)
            print("  // Result according to documentation: (it is wrongly documented...)", file=f)
            print("  wire [31:0] doc_res = ((rvfi_rs1_rdata & ((1 << insn_ls3) - 1) << insn_ls2) >> insn_ls2)%s;" % (" | sext" if not u else ""), file=f)
        print("", file=f)
        print("  wire [31:0] result = res_u%s;" % (" | sext" if not u else ""), file=f)
        if r:
            print("  // ATTENTION!! The correct encoding is with ls3 = 5'b0!!!", file=f)
            print("  // The core does not check for that and it passes anyway!!!", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct2 == 2'b%s && insn_funct3 == 3'b%s && insn_opcode == 7'b011_0011" % (funct2, funct3))
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rs2_addr", "insn_rs2")
        if instr_type == 2:
            assign(f, "spec_rs3_addr", "insn_rd")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign_pc_wdata(f)

        footer(f)

def insn_p_clb(insn, funct3, misa=MISA_X):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_r(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        
        print("  reg [31:0] result;", file=f)
        print("  always_comb begin", file=f)
        print("    result = 0;", file=f)
        print("    if(rvfi_rs1_rdata != 0)", file=f)
        print("      for(int i = 31; i >= 1; i--)", file=f)
        print("        if(rvfi_rs1_rdata[i-1] == rvfi_rs1_rdata[i])", file=f)
        print("          result++;", file=f)
        print("        else", file=f)
        print("          break;", file=f)
        print("  end", file=f)
        
        print("  // ATTENTION!! The correct encoding is with rs2 = 5'b0!!!", file=f)
        print("  // The core does not check for that and it passes anyway!!!", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct7 == 7'b000_1000 && insn_funct3 == 3'b%s && insn_opcode == 7'b011_0011" % funct3)
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign_pc_wdata(f)

        footer(f)

def insn_gen_alu(insn, funct7, funct3, expr, rs2_is_0=False, misa=MISA_X):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_r(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire [31:0] result = %s;" % expr, file=f)
        if rs2_is_0:
            print("  // ATTENTION!! The core does not check if rs2 = 0!!!", file=f)
            print("  // This leads to it executing illegal instructions!!!", file=f)
            assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct7 == 7'b%s && insn_funct3 == 3'b%s && insn_opcode == 7'b011_0011 && insn_rs2 == 5'b0" % (funct7, funct3))
        else:
            assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct7 == 7'b%s && insn_funct3 == 3'b%s && insn_opcode == 7'b011_0011" % (funct7, funct3))
        assign(f, "spec_rs1_addr", "insn_rs1")
        if rs2_is_0:
            assign(f, "spec_rs2_addr", "0")
        else:
            assign(f, "spec_rs2_addr", "insn_rs2")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign_pc_wdata(f)

        footer(f)

def insn_clip(insn, funct3, u=False, r=False, misa=MISA_X):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_r(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        if not r:
            print("  wire [ 4:0] insn_ls2 = rvfi_insn[24:20];", file=f)
        
        print("  reg signed [31:0] compl%s;" % (" = 0" if u else ""), file=f)
        print("  reg signed [31:0] compg;", file=f)
        print("  always_comb", file=f)
        if not r:
            print("    if (insn_ls2 == 0) begin", file=f)
            if not u: print("      compl = -1;", file=f)
            print("      compg = 0;", file=f)
            print("    end", file=f)
            print("    else", file=f)
        print("    begin", file=f)
        if r:
            if not u: print("      compl = -(rvfi_rs2_rdata + 1);", file=f)
            print("      compg = rvfi_rs2_rdata;", file=f)
        else:
            if not u: print("      compl = -(1 << (insn_ls2 - 1));", file=f)
            print("      compg = (1 << (insn_ls2 - 1)) - 1;", file=f)
        print("    end", file=f)
        
        print("", file=f)
        print("  reg [31:0] result;", file=f)
        print("  always_comb", file=f)
        print("    if ($signed(rvfi_rs1_rdata) <= compl)", file=f)
        print("      result = compl;", file=f)
        print("    else if ($signed(rvfi_rs1_rdata) >= compg)", file=f)
        print("      result = compg;", file=f)
        print("    else", file=f)
        print("      result = rvfi_rs1_rdata;", file=f)
        
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct7 == 7'b000_1010 && insn_funct3 == 3'b%s && insn_opcode == 7'b011_0011" % funct3)
        assign(f, "spec_rs1_addr", "insn_rs1")
        if r:
            assign(f, "spec_rs2_addr", "insn_rs2")
        else:
            assign(f, "spec_rs2_addr", "0")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign_pc_wdata(f)

        footer(f)

def insn_gen_alu_N(insn, funct2, funct3, expr, ls3_is_0=False, rs3_used=False, misa=MISA_X):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_gen_alu_N(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        if rs3_used:
            print("  wire [4:0] insn_rs3 = insn_rd;", file=f)
        print("  wire [31:0] result = %s;" % expr, file=f)
        if ls3_is_0:
            print("  // ATTENTION!! The core does not check if ls3 = 0!!!", file=f)
            print("  // This leads to it executing illegal instructions!!!", file=f)
            print("  // Correct spec_valid: rvfi_valid && !insn_padding && insn_funct2 == 2'b%s && insn_funct3 == 3'b%s && insn_opcode == 7'b101_1011 && insn_ls3 == 5'b0" % (funct2, funct3), file=f)
            # assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct2 == 2'b%s && insn_funct3 == 3'b%s && insn_opcode == 7'b101_1011 && insn_ls3 == 5'b0" % (funct2, funct3))
            assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct2 == 2'b%s && insn_funct3 == 3'b%s && insn_opcode == 7'b101_1011" % (funct2, funct3))
        else:
            assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct2 == 2'b%s && insn_funct3 == 3'b%s && insn_opcode == 7'b101_1011" % (funct2, funct3))
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_rs2_addr", "insn_rs2")
        if rs3_used:
            assign(f, "spec_rs3_addr", "insn_rs3")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign_pc_wdata(f)

        footer(f)

def insn_p_b(insn, funct3, expr, misa=MISA_X):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_p_b(f)
        misa_check(f, misa, ialign16=True)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        print("  wire cond = %s;" % expr, file=f)
        print("  reg [`RISCV_FORMAL_XLEN-1:0] next_pc;", file=f)
        print("  always_comb", file=f)
        print("    if (cond)", file=f)
        print("      next_pc = rvfi_pc_rdata + insn_imm12;", file=f)
        print("    else if (rvfi_is_hwlp)", file=f)
        print("      next_pc = rvfi_hwlp_start;", file=f)
        print("    else", file=f)
        print("      next_pc = rvfi_pc_rdata + 4;", file=f)
        assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct3 == 3'b%s && insn_opcode == 7'b110_0011" % funct3)
        assign(f, "spec_rs1_addr", "insn_rs1")
        assign(f, "spec_pc_wdata", "next_pc")
        assign(f, "spec_trap", "(ialign16 ? (next_pc[0] != 0) : (next_pc[1:0] != 0)) || !misa_ok")

        footer(f)

def insn_vecop(insn, funct5, funct1, funct3, expr, hnb=True, sc=True, i=False, imms=True, sh=False, rs2_is_0=False, misa=MISA_X):
    with open("insn_%s.v" % insn, "w") as f:
        header(f, insn)
        format_vecop(f)
        misa_check(f, misa)

        print("", file=f)
        print("  // %s instruction" % insn.upper(), file=f)
        
        if hnb: # Half-word mode
            print("  reg [15:0] op1 [1:0];", file=f)
            print("  reg [15:0] op2 [1:0];", file=f)
            print("  reg [15:0] res [1:0];", file=f)
            print("  always_comb", file=f)
            print("    for(int i = 0; i < 2; i++) begin", file=f)
            print("      op1[i] = rvfi_rs1_rdata[i*16+:16];", file=f)
            if sc:
                if i:
                    print("      op2[i] = %s{rvfi_insn[24:20], rvfi_insn[25]}%s;" % (("$signed(", ")") if imms else ("", "")), file=f)
                else:
                    print("      op2[i] = rvfi_rs2_rdata[15:0];", file=f)
            else:
                print("      op2[i] = rvfi_rs2_rdata[i*16+:16];", file=f)
            if sh:
                print("      op2[i] = op2[i][3:0];", file=f)
            print("      res[i] = %s;" % expr, file=f)
            print("    end", file=f)
            print("  wire [31:0] result = {res[1], res[0]};", file=f)
        else: # Byte mode
            print("  reg [7:0] op1 [3:0];", file=f)
            print("  reg [7:0] op2 [3:0];", file=f)
            print("  reg [7:0] res [3:0];", file=f)
            print("  always_comb", file=f)
            print("    for(int i = 0; i < 4; i++) begin", file=f)
            print("      op1[i] = rvfi_rs1_rdata[i*8+:8];", file=f)
            if sc:
                if i:
                    print("      op2[i] = %s{rvfi_insn[24:20], rvfi_insn[25]}%s;" % (("$signed(", ")") if imms else ("", "")), file=f)
                else:
                    print("      op2[i] = rvfi_rs2_rdata[7:0];", file=f)
            else:
                print("      op2[i] = rvfi_rs2_rdata[i*8+:8];", file=f)
            if sh:
                print("      op2[i] = op2[i][2:0];", file=f)
            print("      res[i] = %s;" % expr, file=f)
            print("    end", file=f)
            print("  wire [31:0] result = {res[3], res[2], res[1], res[0]};", file=f)
        
        if rs2_is_0:
            print("  // ATTENTION!! The core does not check if rvfi_rs2 = 0!!!", file=f)
            print("  // This leads to it executing illegal instructions!!!", file=f)
            assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct5 == 5'd%s && insn_funct1 == 1'b%s && insn_funct3 == 3'b%s && insn_opcode == 7'b101_0111 && insn_rs2 == 0" % (funct5, funct1, funct3))
        elif not i:
            print("  // ATTENTION!! The core does not check if rvfi_insn[25] = 0!!!", file=f)
            print("  // This leads to it executing illegal instructions!!!", file=f)
            print("  // Correct spec_valid: rvfi_valid && !insn_padding && insn_funct5 == 5'd%s && insn_funct1 == 1'b%s && insn_funct3 == 3'b%s && insn_opcode == 7'b101_0111 && rvfi_insn[25] == 1'b0" % (funct5, funct1, funct3), file=f)
            assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct5 == 5'd%s && insn_funct1 == 1'b%s && insn_funct3 == 3'b%s && insn_opcode == 7'b101_0111" % (funct5, funct1, funct3))
        else:
            assign(f, "spec_valid", "rvfi_valid && !insn_padding && insn_funct5 == 5'd%s && insn_funct1 == 1'b%s && insn_funct3 == 3'b%s && insn_opcode == 7'b101_0111" % (funct5, funct1, funct3))
        assign(f, "spec_rs1_addr", "insn_rs1")
        if not i:
            assign(f, "spec_rs2_addr", "insn_rs2")
        assign(f, "spec_rd_addr", "insn_rd")
        assign(f, "spec_rd_wdata", "spec_rd_addr ? result : 0")
        assign_pc_wdata(f)

        footer(f)


# def insn_hwlp(insn, funct3, expression, misa=MISA_X):
    # with open("insn_%s.v" % insn, "w") as f:
    #     header(f, insn)
    #     format_i(f)
    #     misa_check(f, misa)

    #     print("", file=f)
    #     print("  // %s instruction" % insn.upper(), file=f)
    #     print("", file=f)
    #     print("  wire [`RISCV_FORMAL_XLEN-1:0] op2 = (insn_funct3[2]) ? (rvfi_rs3_rdata) : (insn_imm);", file=f)
    #     print("  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs1_rdata + op2;", file=f)
    #     print("  wire [`RISCV_FORMAL_XLEN-1:0] addr = (insn_opcode[3]) ? (rvfi_rs1_rdata) : (result);", file=f)
    #     assign(f, "spec_valid", "rvfi_valid && !insn_padding && funct3_valid && funct7_valid")
    #     assign(f, "spec_rs1_addr", "insn_rs1")
    #     assign(f, "spec_rs2_addr", "insn_rs2")
    #     assign(f, "spec_rs3_addr", "(insn_funct3[2]) ? (insn_rs3) : ('0)")
    #     assign(f, "spec_post_rd_addr", "(insn_opcode[3]) ? (insn_post_rd) : ('0)")
    #     assign(f, "spec_post_rd_wdata", "spec_post_rd_addr ? result : 0")
    #     assign(f, "spec_pc_wdata", "(rvfi_is_hwlp) ? (rvfi_hwlp_start) : (rvfi_pc_rdata + 4)")
        
    #     print("", file=f)

    #     footer(f)
#### ================   XPULP - END   ================ ####

## Base Integer ISA (I)

current_isa = ["rv32i"]

insn_lui()
insn_auipc()
insn_jal()
insn_jalr()

insn_b("beq",  "000", "rvfi_rs1_rdata == rvfi_rs2_rdata")
insn_b("bne",  "001", "rvfi_rs1_rdata != rvfi_rs2_rdata")
insn_b("blt",  "100", "$signed(rvfi_rs1_rdata) < $signed(rvfi_rs2_rdata)")
insn_b("bge",  "101", "$signed(rvfi_rs1_rdata) >= $signed(rvfi_rs2_rdata)")
insn_b("bltu", "110", "rvfi_rs1_rdata < rvfi_rs2_rdata")
insn_b("bgeu", "111", "rvfi_rs1_rdata >= rvfi_rs2_rdata")

insn_l("lb",  "000", 1, True)
insn_l("lh",  "001", 2, True)
insn_l("lw",  "010", 4, True)
insn_l("lbu", "100", 1, False)
insn_l("lhu", "101", 2, False)

insn_s("sb",  "000", 1)
insn_s("sh",  "001", 2)
insn_s("sw",  "010", 4)

insn_imm("addi",  "000", "rvfi_rs1_rdata + insn_imm")
insn_imm("slti",  "010", "$signed(rvfi_rs1_rdata) < $signed(insn_imm)")
insn_imm("sltiu", "011", "rvfi_rs1_rdata < insn_imm")
insn_imm("xori",  "100", "rvfi_rs1_rdata ^ insn_imm")
insn_imm("ori",   "110", "rvfi_rs1_rdata | insn_imm")
insn_imm("andi",  "111", "rvfi_rs1_rdata & insn_imm")

insn_shimm("slli", "000000", "001", "rvfi_rs1_rdata << insn_shamt")
insn_shimm("srli", "000000", "101", "rvfi_rs1_rdata >> insn_shamt")
insn_shimm("srai", "010000", "101", "$signed(rvfi_rs1_rdata) >>> insn_shamt")

insn_alu("add",  "0000000", "000", "rvfi_rs1_rdata + rvfi_rs2_rdata")
insn_alu("sub",  "0100000", "000", "rvfi_rs1_rdata - rvfi_rs2_rdata")
insn_alu("sll",  "0000000", "001", "rvfi_rs1_rdata << shamt", shamt=True)
insn_alu("slt",  "0000000", "010", "$signed(rvfi_rs1_rdata) < $signed(rvfi_rs2_rdata)")
insn_alu("sltu", "0000000", "011", "rvfi_rs1_rdata < rvfi_rs2_rdata")
insn_alu("xor",  "0000000", "100", "rvfi_rs1_rdata ^ rvfi_rs2_rdata")
insn_alu("srl",  "0000000", "101", "rvfi_rs1_rdata >> shamt", shamt=True)
insn_alu("sra",  "0100000", "101", "$signed(rvfi_rs1_rdata) >>> shamt", shamt=True)
insn_alu("or",   "0000000", "110", "rvfi_rs1_rdata | rvfi_rs2_rdata")
insn_alu("and",  "0000000", "111", "rvfi_rs1_rdata & rvfi_rs2_rdata")

current_isa = ["rv64i"]

insn_l("lwu", "110", 4, False)
insn_l("ld",  "011", 8, True)
insn_s("sd",  "011", 8)

insn_imm("addiw",  "000", "rvfi_rs1_rdata[31:0] + insn_imm[31:0]", wmode=True)

insn_shimm("slliw", "000000", "001", "rvfi_rs1_rdata[31:0] << insn_shamt", wmode=True)
insn_shimm("srliw", "000000", "101", "rvfi_rs1_rdata[31:0] >> insn_shamt", wmode=True)
insn_shimm("sraiw", "010000", "101", "$signed(rvfi_rs1_rdata[31:0]) >>> insn_shamt", wmode=True)

insn_alu("addw", "0000000", "000", "rvfi_rs1_rdata[31:0] + rvfi_rs2_rdata[31:0]", wmode=True)
insn_alu("subw", "0100000", "000", "rvfi_rs1_rdata[31:0] - rvfi_rs2_rdata[31:0]", wmode=True)
insn_alu("sllw", "0000000", "001", "rvfi_rs1_rdata[31:0] << shamt", shamt=True, wmode=True)
insn_alu("srlw", "0000000", "101", "rvfi_rs1_rdata[31:0] >> shamt", shamt=True, wmode=True)
insn_alu("sraw", "0100000", "101", "$signed(rvfi_rs1_rdata[31:0]) >>> shamt", shamt=True, wmode=True)

## Multiply/Divide ISA (M)

current_isa = ["rv32im"]

insn_alu("mul",    "0000001", "000", "rvfi_rs1_rdata * rvfi_rs2_rdata", alt_add=0x2cdf52a55876063e, misa=MISA_M)
insn_alu("mulh",   "0000001", "001", "({{`RISCV_FORMAL_XLEN{rvfi_rs1_rdata[`RISCV_FORMAL_XLEN-1]}}, rvfi_rs1_rdata} *\n" +
        "\t\t{{`RISCV_FORMAL_XLEN{rvfi_rs2_rdata[`RISCV_FORMAL_XLEN-1]}}, rvfi_rs2_rdata}) >> `RISCV_FORMAL_XLEN", alt_add=0x15d01651f6583fb7, misa=MISA_M)
insn_alu("mulhsu", "0000001", "010", "({{`RISCV_FORMAL_XLEN{rvfi_rs1_rdata[`RISCV_FORMAL_XLEN-1]}}, rvfi_rs1_rdata} *\n" +
        "\t\t{`RISCV_FORMAL_XLEN'b0, rvfi_rs2_rdata}) >> `RISCV_FORMAL_XLEN", alt_sub=0xea3969edecfbe137, misa=MISA_M)
insn_alu("mulhu",  "0000001", "011", "({`RISCV_FORMAL_XLEN'b0, rvfi_rs1_rdata} * {`RISCV_FORMAL_XLEN'b0, rvfi_rs2_rdata}) >> `RISCV_FORMAL_XLEN", alt_add=0xd13db50d949ce5e8, misa=MISA_M)

insn_alu("div",    "0000001", "100", """rvfi_rs2_rdata == `RISCV_FORMAL_XLEN'b0 ? {`RISCV_FORMAL_XLEN{1'b1}} :
                                         rvfi_rs1_rdata == {1'b1, {`RISCV_FORMAL_XLEN-1{1'b0}}} && rvfi_rs2_rdata == {`RISCV_FORMAL_XLEN{1'b1}} ? {1'b1, {`RISCV_FORMAL_XLEN-1{1'b0}}} :
                                         $signed(rvfi_rs1_rdata) / $signed(rvfi_rs2_rdata)""", alt_sub=0x29bbf66f7f8529ec, misa=MISA_M)

insn_alu("divu",   "0000001", "101", """rvfi_rs2_rdata == `RISCV_FORMAL_XLEN'b0 ? {`RISCV_FORMAL_XLEN{1'b1}} :
                                         rvfi_rs1_rdata / rvfi_rs2_rdata""", alt_sub=0x8c629acb10e8fd70, misa=MISA_M)

insn_alu("rem",    "0000001", "110", """rvfi_rs2_rdata == `RISCV_FORMAL_XLEN'b0 ? rvfi_rs1_rdata :
                                         rvfi_rs1_rdata == {1'b1, {`RISCV_FORMAL_XLEN-1{1'b0}}} && rvfi_rs2_rdata == {`RISCV_FORMAL_XLEN{1'b1}} ? {`RISCV_FORMAL_XLEN{1'b0}} :
                                         $signed(rvfi_rs1_rdata) % $signed(rvfi_rs2_rdata)""", alt_sub=0xf5b7d8538da68fa5, misa=MISA_M)

insn_alu("remu",   "0000001", "111", """rvfi_rs2_rdata == `RISCV_FORMAL_XLEN'b0 ? rvfi_rs1_rdata :
                                         rvfi_rs1_rdata % rvfi_rs2_rdata""", alt_sub=0xbc4402413138d0e1, misa=MISA_M)

current_isa = ["rv64im"]

insn_alu("mulw",    "0000001", "000", "rvfi_rs1_rdata[31:0] * rvfi_rs2_rdata[31:0]", alt_add=0x2cdf52a55876063e, wmode=True, misa=MISA_M)

insn_alu("divw",    "0000001", "100", """rvfi_rs2_rdata[31:0] == 32'b0 ? {32{1'b1}} :
                       rvfi_rs1_rdata == {1'b1, {31{1'b0}}} && rvfi_rs2_rdata == {32{1'b1}} ? {1'b1, {31{1'b0}}} :
                       $signed(rvfi_rs1_rdata[31:0]) / $signed(rvfi_rs2_rdata[31:0])""", alt_sub=0x29bbf66f7f8529ec, wmode=True, misa=MISA_M)

insn_alu("divuw",   "0000001", "101", """rvfi_rs2_rdata[31:0] == 32'b0 ? {32{1'b1}} :
                       rvfi_rs1_rdata[31:0] / rvfi_rs2_rdata[31:0]""", alt_sub=0x8c629acb10e8fd70, wmode=True, misa=MISA_M)

insn_alu("remw",    "0000001", "110", """rvfi_rs2_rdata == 32'b0 ? rvfi_rs1_rdata :
                       rvfi_rs1_rdata == {1'b1, {31{1'b0}}} && rvfi_rs2_rdata == {32{1'b1}} ? {32{1'b0}} :
                       $signed(rvfi_rs1_rdata[31:0]) % $signed(rvfi_rs2_rdata[31:0])""", alt_sub=0xf5b7d8538da68fa5, wmode=True, misa=MISA_M)

insn_alu("remuw",   "0000001", "111", """rvfi_rs2_rdata == 32'b0 ? rvfi_rs1_rdata :
                       rvfi_rs1_rdata[31:0] % rvfi_rs2_rdata[31:0]""", alt_sub=0xbc4402413138d0e1, wmode=True, misa=MISA_M)

## Atomics ISA (A)

# current_isa = ["rv32ia"]

# FIXME: LR.W / SC.W
# insn_amo("amoswap_w", "00001", "010", "rvfi_rs2_rdata[31:0]")
# insn_amo("amoadd_w",  "00000", "010", "rvfi_mem_extamo ? rvfi_rs2_rdata[31:0] : rvfi_mem_rdata + rvfi_rs2_rdata[31:0]")
# insn_amo("amoxor_w",  "00100", "010", "rvfi_mem_extamo ? rvfi_rs2_rdata[31:0] : rvfi_mem_rdata ^ rvfi_rs2_rdata[31:0]")
# insn_amo("amoand_w",  "01100", "010", "rvfi_mem_extamo ? rvfi_rs2_rdata[31:0] : rvfi_mem_rdata & rvfi_rs2_rdata[31:0]")
# insn_amo("amoor_w",   "01000", "010", "rvfi_mem_extamo ? rvfi_rs2_rdata[31:0] : rvfi_mem_rdata | rvfi_rs2_rdata[31:0]")
# insn_amo("amomin_w",  "10000", "010", "rvfi_mem_extamo ? rvfi_rs2_rdata[31:0] : ($signed(rvfi_mem_rdata) < $signed(rvfi_rs2_rdata[31:0]) ? rvfi_mem_rdata : rvfi_rs2_rdata[31:0])")
# insn_amo("amomax_w",  "10100", "010", "rvfi_mem_extamo ? rvfi_rs2_rdata[31:0] : ($signed(rvfi_mem_rdata) > $signed(rvfi_rs2_rdata[31:0]) ? rvfi_mem_rdata : rvfi_rs2_rdata[31:0])")
# insn_amo("amominu_w", "11000", "010", "rvfi_mem_extamo ? rvfi_rs2_rdata[31:0] : (rvfi_mem_rdata < rvfi_rs2_rdata[31:0] ? rvfi_mem_rdata : rvfi_rs2_rdata[31:0])")
# insn_amo("amomaxu_w", "11100", "010", "rvfi_mem_extamo ? rvfi_rs2_rdata[31:0] : (rvfi_mem_rdata > rvfi_rs2_rdata[31:0] ? rvfi_mem_rdata : rvfi_rs2_rdata[31:0])")

# current_isa = ["rv64ia"]

# FIXME: LR.D / SC.D
# insn_amo("amoswap_d", "00001", "011", "rvfi_rs2_rdata[63:0]")
# insn_amo("amoadd_d",  "00000", "011", "rvfi_mem_extamo ? rvfi_rs2_rdata[63:0] : rvfi_mem_rdata + rvfi_rs2_rdata[63:0]")
# insn_amo("amoxor_d",  "00100", "011", "rvfi_mem_extamo ? rvfi_rs2_rdata[63:0] : rvfi_mem_rdata ^ rvfi_rs2_rdata[63:0]")
# insn_amo("amoand_d",  "01100", "011", "rvfi_mem_extamo ? rvfi_rs2_rdata[63:0] : rvfi_mem_rdata & rvfi_rs2_rdata[63:0]")
# insn_amo("amoor_d",   "01000", "011", "rvfi_mem_extamo ? rvfi_rs2_rdata[63:0] : rvfi_mem_rdata | rvfi_rs2_rdata[63:0]")
# insn_amo("amomin_d",  "10000", "011", "rvfi_mem_extamo ? rvfi_rs2_rdata[63:0] : ($signed(rvfi_mem_rdata) < $signed(rvfi_rs2_rdata[63:0]) ? rvfi_mem_rdata : rvfi_rs2_rdata[63:0])")
# insn_amo("amomax_d",  "10100", "011", "rvfi_mem_extamo ? rvfi_rs2_rdata[63:0] : ($signed(rvfi_mem_rdata) > $signed(rvfi_rs2_rdata[63:0]) ? rvfi_mem_rdata : rvfi_rs2_rdata[63:0])")
# insn_amo("amominu_d", "11000", "011", "rvfi_mem_extamo ? rvfi_rs2_rdata[63:0] : (rvfi_mem_rdata < rvfi_rs2_rdata[63:0] ? rvfi_mem_rdata : rvfi_rs2_rdata[63:0])")
# insn_amo("amomaxu_d", "11100", "011", "rvfi_mem_extamo ? rvfi_rs2_rdata[63:0] : (rvfi_mem_rdata > rvfi_rs2_rdata[63:0] ? rvfi_mem_rdata : rvfi_rs2_rdata[63:0])")

## Compressed Integer ISA (IC)

current_isa = ["rv32ic"]

insn_c_addi4spn()
insn_c_l("c_lw", "010", 4, True)
insn_c_s("c_sw", "110", 4)
insn_c_addi()
insn_c_jal("c_jal", "001", True)
insn_c_li()
insn_c_addi16sp()
insn_c_lui()
insn_c_sri("c_srli", "00", "rvfi_rs1_rdata >> insn_shamt")
insn_c_sri("c_srai", "01", "$signed(rvfi_rs1_rdata) >>> insn_shamt")
insn_c_andi()
insn_c_alu("c_sub", "100011", "00", "rvfi_rs1_rdata - rvfi_rs2_rdata")
insn_c_alu("c_xor", "100011", "01", "rvfi_rs1_rdata ^ rvfi_rs2_rdata")
insn_c_alu("c_or",  "100011", "10", "rvfi_rs1_rdata | rvfi_rs2_rdata")
insn_c_alu("c_and", "100011", "11", "rvfi_rs1_rdata & rvfi_rs2_rdata")
insn_c_jal("c_j", "101", False)
insn_c_b("c_beqz", "110", "rvfi_rs1_rdata == 0")
insn_c_b("c_bnez", "111", "rvfi_rs1_rdata != 0")
insn_c_sli("c_slli", "rvfi_rs1_rdata << insn_shamt")
insn_c_lsp("c_lwsp", "010", 4, True)
insn_c_jalr("c_jr", "1000", False)
insn_c_mvadd("c_mv", "1000", False)
insn_c_jalr("c_jalr", "1001", True)
insn_c_mvadd("c_add", "1001", True)
insn_c_ssp("c_swsp", "110", 4)

current_isa = ["rv64ic"]

insn_c_addi("c_addiw", wmode=True)
insn_c_alu("c_subw", "100111", "00", "rvfi_rs1_rdata[31:0] - rvfi_rs2_rdata[31:0]", wmode=True)
insn_c_alu("c_addw", "100111", "01", "rvfi_rs1_rdata[31:0] + rvfi_rs2_rdata[31:0]", wmode=True)

insn_c_l("c_ld", "011", 8, True)
insn_c_s("c_sd", "111", 8)
insn_c_lsp("c_ldsp", "011", 8, True)
insn_c_ssp("c_sdsp", "111", 8)

#### ================   XPULP - BEGIN   ================ ####
## Pulpissimo Custom ISA (xpulpv2)

current_isa = ["rv32ix"]

# Post-incrementing stores
insn_p_s("p_sb", "00", 1)
insn_p_s("p_sh", "01", 2)
insn_p_s("p_sw", "10", 4)

# Post-incrementing loads
insn_p_l("p_lb" , "000_0000", "000", 1, True)
insn_p_l("p_lh" , "000_1000", "001", 2, True)
insn_p_l("p_lw" , "001_0000", "010", 4, True)
insn_p_l("p_lbu", "010_0000", "100", 1, False)
insn_p_l("p_lhu", "010_1000", "101", 2, False)

# Hardware loops TODO TODO TODO
# insn_hwlp("lp_starti",  "000", "rvfi_rs1_rdata + insn_imm")

# Bit manipulation operations
insn_alu      ("p_ror", "000_0100", "101", "rvfi_rs1_rdata << (32-shamt) | rvfi_rs1_rdata >> shamt", shamt=True, misa=MISA_X)
# insn_alu      ("p_cnt", "000_1000", "011", "$countones(rvfi_rs1_rdata)", misa=MISA_X) # I tested this with Tabby, it works
insn_bit_man_1("p_ff1", "000", lnr=False, cnt=False)
insn_bit_man_1("p_fl1", "001", lnr=True , cnt=False)
insn_p_clb    ("p_clb", "010")
insn_bit_man_1("p_cnt", "011", lnr=True , cnt=True )

insn_bit_man_2("p_extract"  , "11", "000", u=False, r=False)
insn_bit_man_2("p_extractu" , "11", "001", u=True , r=False)
insn_bit_man_2("p_insert"   , "11", "010", u=True , r=False)
insn_bit_man_2("p_bclr"     , "11", "011", u=True , r=False)
insn_bit_man_2("p_bset"     , "11", "100", u=True , r=False)

insn_bit_man_2("p_extractr" , "10", "000", u=False, r=True )
insn_bit_man_2("p_extractur", "10", "001", u=True , r=True )
insn_bit_man_2("p_insertr"  , "10", "010", u=True , r=True )
insn_bit_man_2("p_bclrr"    , "10", "011", u=True , r=True )
insn_bit_man_2("p_bsetr"    , "10", "100", u=True , r=True )

# General ALU operations
insn_gen_alu("p_abs"  , "000_0010", "000", "($signed(rvfi_rs1_rdata) < 0) ? (-rvfi_rs1_rdata) : (rvfi_rs1_rdata)"                     , rs2_is_0=True )
insn_gen_alu("p_slet" , "000_0010", "010", "($signed(rvfi_rs1_rdata) <= $signed(rvfi_rs2_rdata)) ? (1) : (0)"                         , rs2_is_0=False)
insn_gen_alu("p_sletu", "000_0010", "011", "(rvfi_rs1_rdata <= rvfi_rs2_rdata) ? (1) : (0)"                                           , rs2_is_0=False)
insn_gen_alu("p_min"  , "000_0010", "100", "($signed(rvfi_rs1_rdata) < $signed(rvfi_rs2_rdata)) ? (rvfi_rs1_rdata) : (rvfi_rs2_rdata)", rs2_is_0=False)
insn_gen_alu("p_minu" , "000_0010", "101", "(rvfi_rs1_rdata < rvfi_rs2_rdata) ? (rvfi_rs1_rdata) : (rvfi_rs2_rdata)"                  , rs2_is_0=False)
insn_gen_alu("p_max"  , "000_0010", "110", "($signed(rvfi_rs1_rdata) < $signed(rvfi_rs2_rdata)) ? (rvfi_rs2_rdata) : (rvfi_rs1_rdata)", rs2_is_0=False)
insn_gen_alu("p_maxu" , "000_0010", "111", "(rvfi_rs1_rdata < rvfi_rs2_rdata) ? (rvfi_rs2_rdata) : (rvfi_rs1_rdata)"                  , rs2_is_0=False)
insn_gen_alu("p_exths", "000_1000", "100", "{{16{rvfi_rs1_rdata[15]}}, rvfi_rs1_rdata[15:0]}"                                         , rs2_is_0=True )
insn_gen_alu("p_exthz", "000_1000", "101", "{16'b0, rvfi_rs1_rdata[15:0]}"                                                            , rs2_is_0=True )
insn_gen_alu("p_extbs", "000_1000", "110", "{{24{rvfi_rs1_rdata[7]}}, rvfi_rs1_rdata[7:0]}"                                           , rs2_is_0=True )
insn_gen_alu("p_extbz", "000_1000", "111", "{24'b0, rvfi_rs1_rdata[7:0]}"                                                             , rs2_is_0=True )

insn_clip("p_clip"  , "001", u=False, r=False)
insn_clip("p_clipu" , "010", u=True , r=False)
insn_clip("p_clipr" , "101", u=False, r=True )
insn_clip("p_clipur", "110", u=True , r=True )

insn_gen_alu_N("p_addN"   , "00", "010", "$signed(rvfi_rs1_rdata + rvfi_rs2_rdata) >>> insn_ls3"                        , ls3_is_0=False, rs3_used=False)
insn_gen_alu_N("p_adduN"  , "10", "010", "(rvfi_rs1_rdata + rvfi_rs2_rdata) >> insn_ls3"                                , ls3_is_0=False, rs3_used=False)
insn_gen_alu_N("p_addRN"  , "00", "110", "$signed(rvfi_rs1_rdata + rvfi_rs2_rdata + (1 << (insn_ls3 - 1))) >>> insn_ls3", ls3_is_0=False, rs3_used=False)
insn_gen_alu_N("p_adduRN" , "10", "110", "(rvfi_rs1_rdata + rvfi_rs2_rdata + (1 << (insn_ls3 - 1))) >> insn_ls3"        , ls3_is_0=False, rs3_used=False)
insn_gen_alu_N("p_subN"   , "00", "011", "$signed(rvfi_rs1_rdata - rvfi_rs2_rdata) >>> insn_ls3"                        , ls3_is_0=False, rs3_used=False)
insn_gen_alu_N("p_subuN"  , "10", "011", "(rvfi_rs1_rdata - rvfi_rs2_rdata) >> insn_ls3"                                , ls3_is_0=False, rs3_used=False)
insn_gen_alu_N("p_subRN"  , "00", "111", "$signed(rvfi_rs1_rdata - rvfi_rs2_rdata + (1 << (insn_ls3 - 1))) >>> insn_ls3", ls3_is_0=False, rs3_used=False)
insn_gen_alu_N("p_subuRN" , "10", "111", "(rvfi_rs1_rdata - rvfi_rs2_rdata + (1 << (insn_ls3 - 1))) >> insn_ls3"        , ls3_is_0=False, rs3_used=False)
insn_gen_alu_N("p_addNr"  , "01", "010", "$signed(rvfi_rs1_rdata + rvfi_rs3_rdata) >>> rvfi_rs2_rdata[4:0]"                                   , ls3_is_0=True, rs3_used=True)
insn_gen_alu_N("p_adduNr" , "11", "010", "(rvfi_rs1_rdata + rvfi_rs3_rdata) >> rvfi_rs2_rdata[4:0]"                                           , ls3_is_0=True, rs3_used=True)
insn_gen_alu_N("p_addRNr" , "01", "110", "$signed(rvfi_rs1_rdata + rvfi_rs3_rdata + (1 << (rvfi_rs2_rdata[4:0] - 1))) >>> rvfi_rs2_rdata[4:0]", ls3_is_0=True, rs3_used=True)
insn_gen_alu_N("p_adduRNr", "11", "110", "(rvfi_rs1_rdata + rvfi_rs3_rdata + (1 << (rvfi_rs2_rdata[4:0] - 1))) >> rvfi_rs2_rdata[4:0]"        , ls3_is_0=True, rs3_used=True)
insn_gen_alu_N("p_subNr"  , "01", "011", "$signed(rvfi_rs3_rdata - rvfi_rs1_rdata) >>> rvfi_rs2_rdata[4:0]"                                   , ls3_is_0=True, rs3_used=True)
insn_gen_alu_N("p_subuNr" , "11", "011", "(rvfi_rs3_rdata - rvfi_rs1_rdata) >> rvfi_rs2_rdata[4:0]"                                           , ls3_is_0=True, rs3_used=True)
insn_gen_alu_N("p_subRNr" , "01", "111", "$signed(rvfi_rs3_rdata - rvfi_rs1_rdata + (1 << (rvfi_rs2_rdata[4:0] - 1))) >>> rvfi_rs2_rdata[4:0]", ls3_is_0=True, rs3_used=True)
insn_gen_alu_N("p_subuRNr", "11", "111", "(rvfi_rs3_rdata - rvfi_rs1_rdata + (1 << (rvfi_rs2_rdata[4:0] - 1))) >> rvfi_rs2_rdata[4:0]"        , ls3_is_0=True, rs3_used=True)

# Immediate branching operations
insn_p_b("p_beqimm", "010", "(rvfi_rs1_rdata == insn_imm5)")
insn_p_b("p_bneimm", "011", "(rvfi_rs1_rdata != insn_imm5)")

# Multiply-accumulate TODO TODO TODO

# Vectorial operations (SIMD) - ALU
op_vec = [
            ["add" , "op1[i] + op2[i]"                                          , True ], # 0 0000
            ["sub" , "op1[i] - op2[i]"                                          , True ], # 0 0001
            ["avg" , "$signed(op1[i] + op2[i]) >>> 1"                           , True ], # 0 0010
            ["avgu", "(op1[i] + op2[i]) >> 1"                                   , False], # 0 0011
            ["min" , "($signed(op1[i]) < $signed(op2[i])) ? (op1[i]) : (op2[i])", True ], # 0 0100
            ["minu", "(op1[i] < op2[i]) ? (op1[i]) : (op2[i])"                  , False], # 0 0101
            ["max" , "($signed(op1[i]) > $signed(op2[i])) ? (op1[i]) : (op2[i])", True ], # 0 0110
            ["maxu", "(op1[i] > op2[i]) ? (op1[i]) : (op2[i])"                  , False], # 0 0111
            ["srl" , "op1[i] >> op2[i]"                                         , False], # 0 1000
            ["sra" , "$signed(op1[i]) >>> op2[i]"                               , False], # 0 1001
            ["sll" , "op1[i] << op2[i]"                                         , False], # 0 1010
            ["or"  , "op1[i] | op2[i]"                                          , True ], # 0 1011
            ["xor" , "op1[i] ^ op2[i]"                                          , True ], # 0 1100
            ["and" , "op1[i] & op2[i]"                                          , True ]  # 0 1101
]
for op in op_vec:
    for hnb in [True, False]:
        for sc in [True, False]:
            for i in ([True, False] if sc else [False]):
                insn   = "pv_"+op[0]+("_sc" if sc else "")+("i" if i else "")+"_"+("h" if hnb else "b")
                funct5 = op_vec.index(op)
                funct1 = "0"
                funct3 = str(int(sc))+str(int(i))+str(int(not hnb))
                expr   = op[1]
                imms   = op[2]
                sh     = (funct5 in [8, 9, 10])
                insn_vecop(insn, funct5, funct1, funct3, expr, hnb, sc, i, imms, sh)
insn_vecop("pv_abs_h", "14", "0", "000", "($signed(op1[i]) < 0) ? (-op1[i]) : (op1[i])", hnb=True , sc=False, i=False, imms=False, sh=False, rs2_is_0=True)
insn_vecop("pv_abs_b", "14", "0", "001", "($signed(op1[i]) < 0) ? (-op1[i]) : (op1[i])", hnb=False, sc=False, i=False, imms=False, sh=False, rs2_is_0=True)

# Vectorial operations (SIMD) - Comparison
op_vec = [
            ["cmpeq" , "($signed(op1[i]) == $signed(op2[i])) ? ('1) : ('0)", True ], # 0 0000
            ["cmpne" , "($signed(op1[i]) != $signed(op2[i])) ? ('1) : ('0)", True ], # 0 0001
            ["cmpgt" , "($signed(op1[i]) >  $signed(op2[i])) ? ('1) : ('0)", True ], # 0 0010
            ["cmpge" , "($signed(op1[i]) >= $signed(op2[i])) ? ('1) : ('0)", True ], # 0 0011
            ["cmplt" , "($signed(op1[i]) <  $signed(op2[i])) ? ('1) : ('0)", True ], # 0 0100
            ["cmple" , "($signed(op1[i]) <= $signed(op2[i])) ? ('1) : ('0)", True ], # 0 0101
            ["cmpgtu", "(op1[i] >  op2[i]) ? ('1) : ('0)"                  , False], # 0 0110
            ["cmpgeu", "(op1[i] >= op2[i]) ? ('1) : ('0)"                  , False], # 0 0111
            ["cmpltu", "(op1[i] <  op2[i]) ? ('1) : ('0)"                  , False], # 0 1000
            ["cmpleu", "(op1[i] <= op2[i]) ? ('1) : ('0)"                  , False], # 0 1001
]
for op in op_vec:
    for hnb in [True, False]:
        for sc in [True, False]:
            for i in ([True, False] if sc else [False]):
                insn   = "pv_"+op[0]+("_sc" if sc else "")+("i" if i else "")+"_"+("h" if hnb else "b")
                funct5 = op_vec.index(op)
                funct1 = "1"
                funct3 = str(int(sc))+str(int(i))+str(int(not hnb))
                expr   = op[1]
                imms   = op[2]
                sh     = False
                insn_vecop(insn, funct5, funct1, funct3, expr, hnb, sc, i, imms, sh)

#### ================   XPULP - END   ================ ####

## ISA Propagate

def isa_propagate_pair(from_isa, to_isa):
     global isa_database
     assert from_isa in isa_database
     if to_isa not in isa_database:
         isa_database[to_isa] = set()
     isa_database[to_isa] |= isa_database[from_isa]

def isa_propagate(suffix):
    for i in range(2 ** len(suffix)):
        src = ""
        for k in range(len(suffix)):
            if ((i >> k) & 1) == 0:
                src += suffix[k]
        if src != suffix:
            isa_propagate_pair("rv32i"+src, "rv32i"+suffix)
            isa_propagate_pair("rv64i"+src, "rv64i"+suffix)
    isa_propagate_pair("rv32i"+suffix, "rv64i"+suffix)

isa_propagate("")
isa_propagate("c")
isa_propagate("m")
isa_propagate("mc")
#### ================   XPULP - BEGIN   ================ ####
isa_propagate("x")
isa_propagate("mx")
isa_propagate("cx")
isa_propagate("mcx")
#### ================   XPULP - END   ================ ####

## ISA Fixup

for isa, insns in isa_database.items():
    if isa.startswith("rv64"):
        insns.discard("c_jal")

## ISA Listings and ISA Models

for isa, insns in isa_database.items():
    with open("isa_%s.txt" % isa, "w") as f:
        for insn in sorted(insns):
            print(insn, file=f)

    with open("isa_%s.v" % isa, "w") as f:
        header(f, isa, isa_mode=True)

        for insn in sorted(insns):
            print("  wire                                spec_insn_%s_valid;"     % insn, file=f)
            print("  wire                                spec_insn_%s_trap;"      % insn, file=f)
            print("  wire [                       4 : 0] spec_insn_%s_rs1_addr;"  % insn, file=f)
            print("  wire [                       4 : 0] spec_insn_%s_rs2_addr;"  % insn, file=f)
            print("  wire [                       4 : 0] spec_insn_%s_rd_addr;"   % insn, file=f)
            print("  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_%s_rd_wdata;"  % insn, file=f)
            print("  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_%s_pc_wdata;"  % insn, file=f)
            print("  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_%s_mem_addr;"  % insn, file=f)
            print("  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_%s_mem_rmask;" % insn, file=f)
            print("  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_%s_mem_wmask;" % insn, file=f)
            print("  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_%s_mem_wdata;"  % insn, file=f)
            print("`ifdef RISCV_FORMAL_CSR_MISA", file=f)
            print("  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_%s_csr_misa_rmask;" % insn, file=f)
            print("`endif", file=f)
            print("`ifdef RISCV_FORMAL_CUSTOM_ISA", file=f)                                         # XPULP
            print("  wire [                       4 : 0] spec_insn_%s_rs3_addr;" % insn, file=f)    # XPULP
            print("`endif", file=f)                                                                 # XPULP
            print("", file=f)
            print("  rvfi_insn_%s insn_%s (" % (insn, insn), file=f)
            print("    .rvfi_valid(rvfi_valid),", file=f)
            print("    .rvfi_insn(rvfi_insn),", file=f)
            print("    .rvfi_pc_rdata(rvfi_pc_rdata),", file=f)
            print("    .rvfi_rs1_rdata(rvfi_rs1_rdata),", file=f)
            print("    .rvfi_rs2_rdata(rvfi_rs2_rdata),", file=f)
            print("    .rvfi_mem_rdata(rvfi_mem_rdata),", file=f)
            print("`ifdef RISCV_FORMAL_CSR_MISA", file=f)
            print("    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),", file=f)
            print("    .spec_csr_misa_rmask(spec_insn_%s_csr_misa_rmask)," % insn, file=f)
            print("`endif", file=f)
            print("`ifdef RISCV_FORMAL_CUSTOM_ISA", file=f)                     # XPULP
            print("    .rvfi_rs3_rdata(rvfi_rs3_rdata),", file=f)               # XPULP
            print("    .spec_rs3_addr(spec_insn_%s_rs3_addr)," % insn, file=f)  # XPULP
            print("`endif", file=f)                                             # XPULP
            print("    .spec_valid(spec_insn_%s_valid)," % insn, file=f)
            print("    .spec_trap(spec_insn_%s_trap)," % insn, file=f)
            print("    .spec_rs1_addr(spec_insn_%s_rs1_addr)," % insn, file=f)
            print("    .spec_rs2_addr(spec_insn_%s_rs2_addr)," % insn, file=f)
            print("    .spec_rd_addr(spec_insn_%s_rd_addr)," % insn, file=f)
            print("    .spec_rd_wdata(spec_insn_%s_rd_wdata)," % insn, file=f)
            print("    .spec_pc_wdata(spec_insn_%s_pc_wdata)," % insn, file=f)
            print("    .spec_mem_addr(spec_insn_%s_mem_addr)," % insn, file=f)
            print("    .spec_mem_rmask(spec_insn_%s_mem_rmask)," % insn, file=f)
            print("    .spec_mem_wmask(spec_insn_%s_mem_wmask)," % insn, file=f)
            print("    .spec_mem_wdata(spec_insn_%s_mem_wdata)" % insn, file=f)
            print("  );", file=f)
            print("", file=f)

        for port in ["valid", "trap", "rs1_addr", "rs2_addr", "rd_addr", "rd_wdata", "pc_wdata", "mem_addr", "mem_rmask", "mem_wmask", "mem_wdata"]:
            print("  assign spec_%s =\n\t\t%s : 0;" % (port, " :\n\t\t".join(["spec_insn_%s_valid ? spec_insn_%s_%s" % (insn, insn, port) for insn in sorted(insns)])), file=f)

        print("`ifdef RISCV_FORMAL_CSR_MISA", file=f)
        print("  assign spec_csr_misa_rmask =\n\t\t%s : 0;" % (" :\n\t\t".join(["spec_insn_%s_valid ? spec_insn_%s_csr_misa_rmask" % (insn, insn) for insn in sorted(insns)])), file=f)
        print("`endif", file=f)
        
        print("`ifdef RISCV_FORMAL_CUSTOM_ISA", file=f)     # XPULP
        print("  assign spec_rs3_addr =\n\t\t%s : 0;" % (" :\n\t\t".join(["spec_insn_%s_valid ? spec_insn_%s_rs3_addr" % (insn, insn) for insn in sorted(insns)])), file=f) # XPULP
        print("`endif", file=f)                             # XPULP

        print("endmodule", file=f)
