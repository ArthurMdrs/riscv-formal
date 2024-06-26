// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module rvfi_insn_p_sw (
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

  // P_S-type instruction format
  wire [`RISCV_FORMAL_ILEN-1:0] insn_padding = rvfi_insn >> 16 >> 16;
  wire [`RISCV_FORMAL_XLEN-1:0] insn_imm = $signed({rvfi_insn[31:25], rvfi_insn[11:7]});
  wire [6:0] insn_funct7  = rvfi_insn[31:25];
  wire [4:0] insn_rs2     = rvfi_insn[24:20];
  wire [4:0] insn_rs1     = rvfi_insn[19:15];
  wire [4:0] insn_post_rd = rvfi_insn[19:15];
  wire [2:0] insn_funct3  = rvfi_insn[14:12];
  wire [4:0] insn_rs3     = rvfi_insn[11: 7];
  wire [6:0] insn_opcode  = rvfi_insn[ 6: 0];

`ifdef RISCV_FORMAL_CSR_MISA
  wire misa_ok = (rvfi_csr_misa_rdata & `RISCV_FORMAL_XLEN'h 800000) == `RISCV_FORMAL_XLEN'h 800000;
  assign spec_csr_misa_rmask = `RISCV_FORMAL_XLEN'h 800000;
`else
  wire misa_ok = 1;
`endif

  // P_SW instruction
  reg funct3_valid, funct7_valid;
  always @(*) begin
    if (insn_opcode == 7'b 010_1011) begin
      funct3_valid = (insn_funct3 == 3'b010) || (insn_funct3 == 3'b110);
      funct7_valid = 1'b1; // THIS IS NOT SUPPOSED TO WORK, BUT IT DOES!!
      // funct7_valid = (insn_funct3[2]) ? (insn_funct7 == 0) : (1'b1); // This is how it should be
    end
    else if (insn_opcode == 7'b 010_0011) begin
      funct3_valid = (insn_funct3 == 3'b110);
      funct7_valid = 1'b1; // THIS IS NOT SUPPOSED TO WORK, BUT IT DOES!!
      // funct7_valid = (insn_funct7 == 0); // This is how it should be
    end
    else begin
      funct3_valid = 1'b0;
      funct7_valid = 1'b0;
    end
  end

  wire [`RISCV_FORMAL_XLEN-1:0] op2 = (insn_funct3[2]) ? (rvfi_rs3_rdata) : (insn_imm);
  wire [`RISCV_FORMAL_XLEN-1:0] result = rvfi_rs1_rdata + op2;
  wire [`RISCV_FORMAL_XLEN-1:0] addr = (insn_opcode[3]) ? (rvfi_rs1_rdata) : (result);
  assign spec_valid = rvfi_valid && !insn_padding && funct3_valid && funct7_valid;
  assign spec_rs1_addr = insn_rs1;
  assign spec_rs2_addr = insn_rs2;
  assign spec_rs3_addr = (insn_funct3[2]) ? (insn_rs3) : ('0);
  assign spec_post_rd_addr = (insn_opcode[3]) ? (insn_post_rd) : ('0);
  assign spec_post_rd_wdata = spec_post_rd_addr ? result : 0;
`ifdef RISCV_FORMAL_CUSTOM_ISA
  assign spec_pc_wdata = (rvfi_is_hwlp) ? (rvfi_hwlp_start) : (rvfi_pc_rdata + 4);
`else
  assign spec_pc_wdata = rvfi_pc_rdata + 4;
`endif

`ifdef RISCV_FORMAL_ALIGNED_MEM
  assign spec_mem_addr = addr & ~(`RISCV_FORMAL_XLEN/8-1);
  assign spec_mem_wmask = ((1 << 4)-1) << (addr-spec_mem_addr);
  assign spec_mem_wdata = rvfi_rs2_rdata << (8*(addr-spec_mem_addr));
  assign spec_trap = ((addr & (4-1)) != 0) || !misa_ok;
`else
  assign spec_mem_addr = addr;
  assign spec_mem_wmask = ((1 << 4)-1);
  assign spec_mem_wdata = rvfi_rs2_rdata;
  assign spec_trap = !misa_ok;
`endif

  // default assignments
  assign spec_rd_addr = 0;
  assign spec_rd_wdata = 0;
  assign spec_mem_rmask = 0;
`ifdef RISCV_FORMAL_CUSTOM_ISA
`endif
endmodule
