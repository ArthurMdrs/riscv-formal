// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module rvfi_insn_c_jal (
  input                                 rvfi_valid,
  input  [`RISCV_FORMAL_ILEN   - 1 : 0] rvfi_insn,
  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_pc_rdata,
  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs1_rdata,
  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs2_rdata,
  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_mem_rdata,
`ifdef RISCV_FORMAL_CSR_MISA
  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_csr_misa_rdata,
  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_csr_misa_rmask,
`endif

`ifdef RISCV_FORMAL_CUSTOM_ISA
  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_rs3_rdata,
  input                                 rvfi_is_hwlp,
  input  [`RISCV_FORMAL_XLEN   - 1 : 0] rvfi_hwlp_start,

  output [                       4 : 0] spec_rs3_addr,
  output [                       4 : 0] spec_post_rd_addr,
  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_post_rd_wdata,
`endif

  output                                spec_valid,
  output                                spec_trap,
  output [                       4 : 0] spec_rs1_addr,
  output [                       4 : 0] spec_rs2_addr,
  output [                       4 : 0] spec_rd_addr,
  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_rd_wdata,
  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_pc_wdata,
  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_mem_addr,
  output [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_mem_rmask,
  output [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_mem_wmask,
  output [`RISCV_FORMAL_XLEN   - 1 : 0] spec_mem_wdata
);

  // CJ-type instruction format
  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16;
  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = $signed({rvfi_insn[12], rvfi_insn[8], rvfi_insn[10], rvfi_insn[9],
      rvfi_insn[6], rvfi_insn[7], rvfi_insn[2], rvfi_insn[11], rvfi_insn[5], rvfi_insn[4], rvfi_insn[3], 1'b0});
  wire [2:0] insn_funct3 = rvfi_insn[15:13];
  wire [1:0] insn_opcode = rvfi_insn[1:0];

`ifdef RISCV_FORMAL_CSR_MISA
  wire misa_ok = (rvfi_csr_misa_rdata & `RISCV_FORMAL_XLEN'h 4) == `RISCV_FORMAL_XLEN'h 4;
  assign spec_csr_misa_rmask = `RISCV_FORMAL_XLEN'h 4;
`else
  wire misa_ok = 1;
`endif

  // C_JAL instruction
  wire [`RISCV_FORMAL_XLEN-1:0] next_pc = rvfi_pc_rdata + insn_imm;
  assign spec_valid = rvfi_valid && !insn_padding && insn_funct3 == 3'b 001 && insn_opcode == 2'b 01;
  assign spec_rd_addr = 5'd 1;
  assign spec_rd_wdata = rvfi_pc_rdata + 2;
  assign spec_pc_wdata = next_pc;

  // default assignments
  assign spec_rs1_addr = 0;
  assign spec_rs2_addr = 0;
  assign spec_trap = !misa_ok;
  assign spec_mem_addr = 0;
  assign spec_mem_rmask = 0;
  assign spec_mem_wmask = 0;
  assign spec_mem_wdata = 0;
`ifdef RISCV_FORMAL_CUSTOM_ISA
  assign spec_rs3_addr = 0;
  assign spec_post_rd_addr = 0;
  assign spec_post_rd_wdata = 0;
`endif
endmodule
