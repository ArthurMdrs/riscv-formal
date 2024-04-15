// DO NOT EDIT -- auto-generated from riscv-formal/insns/generate.py

module rvfi_isa_rv32ix (
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
  wire                                spec_insn_add_valid;
  wire                                spec_insn_add_trap;
  wire [                       4 : 0] spec_insn_add_rs1_addr;
  wire [                       4 : 0] spec_insn_add_rs2_addr;
  wire [                       4 : 0] spec_insn_add_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_add_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_add_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_add_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_add_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_add_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_add_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_add_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_add_rs3_addr;
`endif

  rvfi_insn_add insn_add (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_add_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_add_rs3_addr),
`endif
    .spec_valid(spec_insn_add_valid),
    .spec_trap(spec_insn_add_trap),
    .spec_rs1_addr(spec_insn_add_rs1_addr),
    .spec_rs2_addr(spec_insn_add_rs2_addr),
    .spec_rd_addr(spec_insn_add_rd_addr),
    .spec_rd_wdata(spec_insn_add_rd_wdata),
    .spec_pc_wdata(spec_insn_add_pc_wdata),
    .spec_mem_addr(spec_insn_add_mem_addr),
    .spec_mem_rmask(spec_insn_add_mem_rmask),
    .spec_mem_wmask(spec_insn_add_mem_wmask),
    .spec_mem_wdata(spec_insn_add_mem_wdata)
  );

  wire                                spec_insn_addi_valid;
  wire                                spec_insn_addi_trap;
  wire [                       4 : 0] spec_insn_addi_rs1_addr;
  wire [                       4 : 0] spec_insn_addi_rs2_addr;
  wire [                       4 : 0] spec_insn_addi_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_addi_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_addi_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_addi_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_addi_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_addi_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_addi_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_addi_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_addi_rs3_addr;
`endif

  rvfi_insn_addi insn_addi (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_addi_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_addi_rs3_addr),
`endif
    .spec_valid(spec_insn_addi_valid),
    .spec_trap(spec_insn_addi_trap),
    .spec_rs1_addr(spec_insn_addi_rs1_addr),
    .spec_rs2_addr(spec_insn_addi_rs2_addr),
    .spec_rd_addr(spec_insn_addi_rd_addr),
    .spec_rd_wdata(spec_insn_addi_rd_wdata),
    .spec_pc_wdata(spec_insn_addi_pc_wdata),
    .spec_mem_addr(spec_insn_addi_mem_addr),
    .spec_mem_rmask(spec_insn_addi_mem_rmask),
    .spec_mem_wmask(spec_insn_addi_mem_wmask),
    .spec_mem_wdata(spec_insn_addi_mem_wdata)
  );

  wire                                spec_insn_and_valid;
  wire                                spec_insn_and_trap;
  wire [                       4 : 0] spec_insn_and_rs1_addr;
  wire [                       4 : 0] spec_insn_and_rs2_addr;
  wire [                       4 : 0] spec_insn_and_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_and_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_and_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_and_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_and_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_and_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_and_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_and_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_and_rs3_addr;
`endif

  rvfi_insn_and insn_and (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_and_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_and_rs3_addr),
`endif
    .spec_valid(spec_insn_and_valid),
    .spec_trap(spec_insn_and_trap),
    .spec_rs1_addr(spec_insn_and_rs1_addr),
    .spec_rs2_addr(spec_insn_and_rs2_addr),
    .spec_rd_addr(spec_insn_and_rd_addr),
    .spec_rd_wdata(spec_insn_and_rd_wdata),
    .spec_pc_wdata(spec_insn_and_pc_wdata),
    .spec_mem_addr(spec_insn_and_mem_addr),
    .spec_mem_rmask(spec_insn_and_mem_rmask),
    .spec_mem_wmask(spec_insn_and_mem_wmask),
    .spec_mem_wdata(spec_insn_and_mem_wdata)
  );

  wire                                spec_insn_andi_valid;
  wire                                spec_insn_andi_trap;
  wire [                       4 : 0] spec_insn_andi_rs1_addr;
  wire [                       4 : 0] spec_insn_andi_rs2_addr;
  wire [                       4 : 0] spec_insn_andi_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_andi_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_andi_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_andi_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_andi_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_andi_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_andi_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_andi_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_andi_rs3_addr;
`endif

  rvfi_insn_andi insn_andi (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_andi_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_andi_rs3_addr),
`endif
    .spec_valid(spec_insn_andi_valid),
    .spec_trap(spec_insn_andi_trap),
    .spec_rs1_addr(spec_insn_andi_rs1_addr),
    .spec_rs2_addr(spec_insn_andi_rs2_addr),
    .spec_rd_addr(spec_insn_andi_rd_addr),
    .spec_rd_wdata(spec_insn_andi_rd_wdata),
    .spec_pc_wdata(spec_insn_andi_pc_wdata),
    .spec_mem_addr(spec_insn_andi_mem_addr),
    .spec_mem_rmask(spec_insn_andi_mem_rmask),
    .spec_mem_wmask(spec_insn_andi_mem_wmask),
    .spec_mem_wdata(spec_insn_andi_mem_wdata)
  );

  wire                                spec_insn_auipc_valid;
  wire                                spec_insn_auipc_trap;
  wire [                       4 : 0] spec_insn_auipc_rs1_addr;
  wire [                       4 : 0] spec_insn_auipc_rs2_addr;
  wire [                       4 : 0] spec_insn_auipc_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_auipc_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_auipc_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_auipc_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_auipc_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_auipc_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_auipc_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_auipc_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_auipc_rs3_addr;
`endif

  rvfi_insn_auipc insn_auipc (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_auipc_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_auipc_rs3_addr),
`endif
    .spec_valid(spec_insn_auipc_valid),
    .spec_trap(spec_insn_auipc_trap),
    .spec_rs1_addr(spec_insn_auipc_rs1_addr),
    .spec_rs2_addr(spec_insn_auipc_rs2_addr),
    .spec_rd_addr(spec_insn_auipc_rd_addr),
    .spec_rd_wdata(spec_insn_auipc_rd_wdata),
    .spec_pc_wdata(spec_insn_auipc_pc_wdata),
    .spec_mem_addr(spec_insn_auipc_mem_addr),
    .spec_mem_rmask(spec_insn_auipc_mem_rmask),
    .spec_mem_wmask(spec_insn_auipc_mem_wmask),
    .spec_mem_wdata(spec_insn_auipc_mem_wdata)
  );

  wire                                spec_insn_beq_valid;
  wire                                spec_insn_beq_trap;
  wire [                       4 : 0] spec_insn_beq_rs1_addr;
  wire [                       4 : 0] spec_insn_beq_rs2_addr;
  wire [                       4 : 0] spec_insn_beq_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_beq_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_beq_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_beq_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_beq_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_beq_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_beq_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_beq_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_beq_rs3_addr;
`endif

  rvfi_insn_beq insn_beq (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_beq_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_beq_rs3_addr),
`endif
    .spec_valid(spec_insn_beq_valid),
    .spec_trap(spec_insn_beq_trap),
    .spec_rs1_addr(spec_insn_beq_rs1_addr),
    .spec_rs2_addr(spec_insn_beq_rs2_addr),
    .spec_rd_addr(spec_insn_beq_rd_addr),
    .spec_rd_wdata(spec_insn_beq_rd_wdata),
    .spec_pc_wdata(spec_insn_beq_pc_wdata),
    .spec_mem_addr(spec_insn_beq_mem_addr),
    .spec_mem_rmask(spec_insn_beq_mem_rmask),
    .spec_mem_wmask(spec_insn_beq_mem_wmask),
    .spec_mem_wdata(spec_insn_beq_mem_wdata)
  );

  wire                                spec_insn_bge_valid;
  wire                                spec_insn_bge_trap;
  wire [                       4 : 0] spec_insn_bge_rs1_addr;
  wire [                       4 : 0] spec_insn_bge_rs2_addr;
  wire [                       4 : 0] spec_insn_bge_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bge_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bge_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bge_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_bge_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_bge_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bge_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bge_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_bge_rs3_addr;
`endif

  rvfi_insn_bge insn_bge (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_bge_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_bge_rs3_addr),
`endif
    .spec_valid(spec_insn_bge_valid),
    .spec_trap(spec_insn_bge_trap),
    .spec_rs1_addr(spec_insn_bge_rs1_addr),
    .spec_rs2_addr(spec_insn_bge_rs2_addr),
    .spec_rd_addr(spec_insn_bge_rd_addr),
    .spec_rd_wdata(spec_insn_bge_rd_wdata),
    .spec_pc_wdata(spec_insn_bge_pc_wdata),
    .spec_mem_addr(spec_insn_bge_mem_addr),
    .spec_mem_rmask(spec_insn_bge_mem_rmask),
    .spec_mem_wmask(spec_insn_bge_mem_wmask),
    .spec_mem_wdata(spec_insn_bge_mem_wdata)
  );

  wire                                spec_insn_bgeu_valid;
  wire                                spec_insn_bgeu_trap;
  wire [                       4 : 0] spec_insn_bgeu_rs1_addr;
  wire [                       4 : 0] spec_insn_bgeu_rs2_addr;
  wire [                       4 : 0] spec_insn_bgeu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bgeu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bgeu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bgeu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_bgeu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_bgeu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bgeu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bgeu_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_bgeu_rs3_addr;
`endif

  rvfi_insn_bgeu insn_bgeu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_bgeu_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_bgeu_rs3_addr),
`endif
    .spec_valid(spec_insn_bgeu_valid),
    .spec_trap(spec_insn_bgeu_trap),
    .spec_rs1_addr(spec_insn_bgeu_rs1_addr),
    .spec_rs2_addr(spec_insn_bgeu_rs2_addr),
    .spec_rd_addr(spec_insn_bgeu_rd_addr),
    .spec_rd_wdata(spec_insn_bgeu_rd_wdata),
    .spec_pc_wdata(spec_insn_bgeu_pc_wdata),
    .spec_mem_addr(spec_insn_bgeu_mem_addr),
    .spec_mem_rmask(spec_insn_bgeu_mem_rmask),
    .spec_mem_wmask(spec_insn_bgeu_mem_wmask),
    .spec_mem_wdata(spec_insn_bgeu_mem_wdata)
  );

  wire                                spec_insn_blt_valid;
  wire                                spec_insn_blt_trap;
  wire [                       4 : 0] spec_insn_blt_rs1_addr;
  wire [                       4 : 0] spec_insn_blt_rs2_addr;
  wire [                       4 : 0] spec_insn_blt_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_blt_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_blt_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_blt_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_blt_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_blt_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_blt_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_blt_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_blt_rs3_addr;
`endif

  rvfi_insn_blt insn_blt (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_blt_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_blt_rs3_addr),
`endif
    .spec_valid(spec_insn_blt_valid),
    .spec_trap(spec_insn_blt_trap),
    .spec_rs1_addr(spec_insn_blt_rs1_addr),
    .spec_rs2_addr(spec_insn_blt_rs2_addr),
    .spec_rd_addr(spec_insn_blt_rd_addr),
    .spec_rd_wdata(spec_insn_blt_rd_wdata),
    .spec_pc_wdata(spec_insn_blt_pc_wdata),
    .spec_mem_addr(spec_insn_blt_mem_addr),
    .spec_mem_rmask(spec_insn_blt_mem_rmask),
    .spec_mem_wmask(spec_insn_blt_mem_wmask),
    .spec_mem_wdata(spec_insn_blt_mem_wdata)
  );

  wire                                spec_insn_bltu_valid;
  wire                                spec_insn_bltu_trap;
  wire [                       4 : 0] spec_insn_bltu_rs1_addr;
  wire [                       4 : 0] spec_insn_bltu_rs2_addr;
  wire [                       4 : 0] spec_insn_bltu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bltu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bltu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bltu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_bltu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_bltu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bltu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bltu_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_bltu_rs3_addr;
`endif

  rvfi_insn_bltu insn_bltu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_bltu_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_bltu_rs3_addr),
`endif
    .spec_valid(spec_insn_bltu_valid),
    .spec_trap(spec_insn_bltu_trap),
    .spec_rs1_addr(spec_insn_bltu_rs1_addr),
    .spec_rs2_addr(spec_insn_bltu_rs2_addr),
    .spec_rd_addr(spec_insn_bltu_rd_addr),
    .spec_rd_wdata(spec_insn_bltu_rd_wdata),
    .spec_pc_wdata(spec_insn_bltu_pc_wdata),
    .spec_mem_addr(spec_insn_bltu_mem_addr),
    .spec_mem_rmask(spec_insn_bltu_mem_rmask),
    .spec_mem_wmask(spec_insn_bltu_mem_wmask),
    .spec_mem_wdata(spec_insn_bltu_mem_wdata)
  );

  wire                                spec_insn_bne_valid;
  wire                                spec_insn_bne_trap;
  wire [                       4 : 0] spec_insn_bne_rs1_addr;
  wire [                       4 : 0] spec_insn_bne_rs2_addr;
  wire [                       4 : 0] spec_insn_bne_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bne_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bne_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bne_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_bne_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_bne_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bne_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_bne_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_bne_rs3_addr;
`endif

  rvfi_insn_bne insn_bne (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_bne_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_bne_rs3_addr),
`endif
    .spec_valid(spec_insn_bne_valid),
    .spec_trap(spec_insn_bne_trap),
    .spec_rs1_addr(spec_insn_bne_rs1_addr),
    .spec_rs2_addr(spec_insn_bne_rs2_addr),
    .spec_rd_addr(spec_insn_bne_rd_addr),
    .spec_rd_wdata(spec_insn_bne_rd_wdata),
    .spec_pc_wdata(spec_insn_bne_pc_wdata),
    .spec_mem_addr(spec_insn_bne_mem_addr),
    .spec_mem_rmask(spec_insn_bne_mem_rmask),
    .spec_mem_wmask(spec_insn_bne_mem_wmask),
    .spec_mem_wdata(spec_insn_bne_mem_wdata)
  );

  wire                                spec_insn_jal_valid;
  wire                                spec_insn_jal_trap;
  wire [                       4 : 0] spec_insn_jal_rs1_addr;
  wire [                       4 : 0] spec_insn_jal_rs2_addr;
  wire [                       4 : 0] spec_insn_jal_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_jal_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_jal_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_jal_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_jal_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_jal_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_jal_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_jal_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_jal_rs3_addr;
`endif

  rvfi_insn_jal insn_jal (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_jal_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_jal_rs3_addr),
`endif
    .spec_valid(spec_insn_jal_valid),
    .spec_trap(spec_insn_jal_trap),
    .spec_rs1_addr(spec_insn_jal_rs1_addr),
    .spec_rs2_addr(spec_insn_jal_rs2_addr),
    .spec_rd_addr(spec_insn_jal_rd_addr),
    .spec_rd_wdata(spec_insn_jal_rd_wdata),
    .spec_pc_wdata(spec_insn_jal_pc_wdata),
    .spec_mem_addr(spec_insn_jal_mem_addr),
    .spec_mem_rmask(spec_insn_jal_mem_rmask),
    .spec_mem_wmask(spec_insn_jal_mem_wmask),
    .spec_mem_wdata(spec_insn_jal_mem_wdata)
  );

  wire                                spec_insn_jalr_valid;
  wire                                spec_insn_jalr_trap;
  wire [                       4 : 0] spec_insn_jalr_rs1_addr;
  wire [                       4 : 0] spec_insn_jalr_rs2_addr;
  wire [                       4 : 0] spec_insn_jalr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_jalr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_jalr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_jalr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_jalr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_jalr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_jalr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_jalr_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_jalr_rs3_addr;
`endif

  rvfi_insn_jalr insn_jalr (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_jalr_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_jalr_rs3_addr),
`endif
    .spec_valid(spec_insn_jalr_valid),
    .spec_trap(spec_insn_jalr_trap),
    .spec_rs1_addr(spec_insn_jalr_rs1_addr),
    .spec_rs2_addr(spec_insn_jalr_rs2_addr),
    .spec_rd_addr(spec_insn_jalr_rd_addr),
    .spec_rd_wdata(spec_insn_jalr_rd_wdata),
    .spec_pc_wdata(spec_insn_jalr_pc_wdata),
    .spec_mem_addr(spec_insn_jalr_mem_addr),
    .spec_mem_rmask(spec_insn_jalr_mem_rmask),
    .spec_mem_wmask(spec_insn_jalr_mem_wmask),
    .spec_mem_wdata(spec_insn_jalr_mem_wdata)
  );

  wire                                spec_insn_lb_valid;
  wire                                spec_insn_lb_trap;
  wire [                       4 : 0] spec_insn_lb_rs1_addr;
  wire [                       4 : 0] spec_insn_lb_rs2_addr;
  wire [                       4 : 0] spec_insn_lb_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lb_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lb_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lb_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_lb_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_lb_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lb_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lb_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_lb_rs3_addr;
`endif

  rvfi_insn_lb insn_lb (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_lb_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_lb_rs3_addr),
`endif
    .spec_valid(spec_insn_lb_valid),
    .spec_trap(spec_insn_lb_trap),
    .spec_rs1_addr(spec_insn_lb_rs1_addr),
    .spec_rs2_addr(spec_insn_lb_rs2_addr),
    .spec_rd_addr(spec_insn_lb_rd_addr),
    .spec_rd_wdata(spec_insn_lb_rd_wdata),
    .spec_pc_wdata(spec_insn_lb_pc_wdata),
    .spec_mem_addr(spec_insn_lb_mem_addr),
    .spec_mem_rmask(spec_insn_lb_mem_rmask),
    .spec_mem_wmask(spec_insn_lb_mem_wmask),
    .spec_mem_wdata(spec_insn_lb_mem_wdata)
  );

  wire                                spec_insn_lbu_valid;
  wire                                spec_insn_lbu_trap;
  wire [                       4 : 0] spec_insn_lbu_rs1_addr;
  wire [                       4 : 0] spec_insn_lbu_rs2_addr;
  wire [                       4 : 0] spec_insn_lbu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lbu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lbu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lbu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_lbu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_lbu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lbu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lbu_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_lbu_rs3_addr;
`endif

  rvfi_insn_lbu insn_lbu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_lbu_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_lbu_rs3_addr),
`endif
    .spec_valid(spec_insn_lbu_valid),
    .spec_trap(spec_insn_lbu_trap),
    .spec_rs1_addr(spec_insn_lbu_rs1_addr),
    .spec_rs2_addr(spec_insn_lbu_rs2_addr),
    .spec_rd_addr(spec_insn_lbu_rd_addr),
    .spec_rd_wdata(spec_insn_lbu_rd_wdata),
    .spec_pc_wdata(spec_insn_lbu_pc_wdata),
    .spec_mem_addr(spec_insn_lbu_mem_addr),
    .spec_mem_rmask(spec_insn_lbu_mem_rmask),
    .spec_mem_wmask(spec_insn_lbu_mem_wmask),
    .spec_mem_wdata(spec_insn_lbu_mem_wdata)
  );

  wire                                spec_insn_lh_valid;
  wire                                spec_insn_lh_trap;
  wire [                       4 : 0] spec_insn_lh_rs1_addr;
  wire [                       4 : 0] spec_insn_lh_rs2_addr;
  wire [                       4 : 0] spec_insn_lh_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lh_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lh_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lh_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_lh_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_lh_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lh_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lh_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_lh_rs3_addr;
`endif

  rvfi_insn_lh insn_lh (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_lh_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_lh_rs3_addr),
`endif
    .spec_valid(spec_insn_lh_valid),
    .spec_trap(spec_insn_lh_trap),
    .spec_rs1_addr(spec_insn_lh_rs1_addr),
    .spec_rs2_addr(spec_insn_lh_rs2_addr),
    .spec_rd_addr(spec_insn_lh_rd_addr),
    .spec_rd_wdata(spec_insn_lh_rd_wdata),
    .spec_pc_wdata(spec_insn_lh_pc_wdata),
    .spec_mem_addr(spec_insn_lh_mem_addr),
    .spec_mem_rmask(spec_insn_lh_mem_rmask),
    .spec_mem_wmask(spec_insn_lh_mem_wmask),
    .spec_mem_wdata(spec_insn_lh_mem_wdata)
  );

  wire                                spec_insn_lhu_valid;
  wire                                spec_insn_lhu_trap;
  wire [                       4 : 0] spec_insn_lhu_rs1_addr;
  wire [                       4 : 0] spec_insn_lhu_rs2_addr;
  wire [                       4 : 0] spec_insn_lhu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lhu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lhu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lhu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_lhu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_lhu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lhu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lhu_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_lhu_rs3_addr;
`endif

  rvfi_insn_lhu insn_lhu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_lhu_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_lhu_rs3_addr),
`endif
    .spec_valid(spec_insn_lhu_valid),
    .spec_trap(spec_insn_lhu_trap),
    .spec_rs1_addr(spec_insn_lhu_rs1_addr),
    .spec_rs2_addr(spec_insn_lhu_rs2_addr),
    .spec_rd_addr(spec_insn_lhu_rd_addr),
    .spec_rd_wdata(spec_insn_lhu_rd_wdata),
    .spec_pc_wdata(spec_insn_lhu_pc_wdata),
    .spec_mem_addr(spec_insn_lhu_mem_addr),
    .spec_mem_rmask(spec_insn_lhu_mem_rmask),
    .spec_mem_wmask(spec_insn_lhu_mem_wmask),
    .spec_mem_wdata(spec_insn_lhu_mem_wdata)
  );

  wire                                spec_insn_lui_valid;
  wire                                spec_insn_lui_trap;
  wire [                       4 : 0] spec_insn_lui_rs1_addr;
  wire [                       4 : 0] spec_insn_lui_rs2_addr;
  wire [                       4 : 0] spec_insn_lui_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lui_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lui_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lui_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_lui_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_lui_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lui_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lui_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_lui_rs3_addr;
`endif

  rvfi_insn_lui insn_lui (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_lui_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_lui_rs3_addr),
`endif
    .spec_valid(spec_insn_lui_valid),
    .spec_trap(spec_insn_lui_trap),
    .spec_rs1_addr(spec_insn_lui_rs1_addr),
    .spec_rs2_addr(spec_insn_lui_rs2_addr),
    .spec_rd_addr(spec_insn_lui_rd_addr),
    .spec_rd_wdata(spec_insn_lui_rd_wdata),
    .spec_pc_wdata(spec_insn_lui_pc_wdata),
    .spec_mem_addr(spec_insn_lui_mem_addr),
    .spec_mem_rmask(spec_insn_lui_mem_rmask),
    .spec_mem_wmask(spec_insn_lui_mem_wmask),
    .spec_mem_wdata(spec_insn_lui_mem_wdata)
  );

  wire                                spec_insn_lw_valid;
  wire                                spec_insn_lw_trap;
  wire [                       4 : 0] spec_insn_lw_rs1_addr;
  wire [                       4 : 0] spec_insn_lw_rs2_addr;
  wire [                       4 : 0] spec_insn_lw_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lw_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lw_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lw_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_lw_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_lw_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lw_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_lw_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_lw_rs3_addr;
`endif

  rvfi_insn_lw insn_lw (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_lw_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_lw_rs3_addr),
`endif
    .spec_valid(spec_insn_lw_valid),
    .spec_trap(spec_insn_lw_trap),
    .spec_rs1_addr(spec_insn_lw_rs1_addr),
    .spec_rs2_addr(spec_insn_lw_rs2_addr),
    .spec_rd_addr(spec_insn_lw_rd_addr),
    .spec_rd_wdata(spec_insn_lw_rd_wdata),
    .spec_pc_wdata(spec_insn_lw_pc_wdata),
    .spec_mem_addr(spec_insn_lw_mem_addr),
    .spec_mem_rmask(spec_insn_lw_mem_rmask),
    .spec_mem_wmask(spec_insn_lw_mem_wmask),
    .spec_mem_wdata(spec_insn_lw_mem_wdata)
  );

  wire                                spec_insn_or_valid;
  wire                                spec_insn_or_trap;
  wire [                       4 : 0] spec_insn_or_rs1_addr;
  wire [                       4 : 0] spec_insn_or_rs2_addr;
  wire [                       4 : 0] spec_insn_or_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_or_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_or_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_or_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_or_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_or_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_or_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_or_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_or_rs3_addr;
`endif

  rvfi_insn_or insn_or (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_or_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_or_rs3_addr),
`endif
    .spec_valid(spec_insn_or_valid),
    .spec_trap(spec_insn_or_trap),
    .spec_rs1_addr(spec_insn_or_rs1_addr),
    .spec_rs2_addr(spec_insn_or_rs2_addr),
    .spec_rd_addr(spec_insn_or_rd_addr),
    .spec_rd_wdata(spec_insn_or_rd_wdata),
    .spec_pc_wdata(spec_insn_or_pc_wdata),
    .spec_mem_addr(spec_insn_or_mem_addr),
    .spec_mem_rmask(spec_insn_or_mem_rmask),
    .spec_mem_wmask(spec_insn_or_mem_wmask),
    .spec_mem_wdata(spec_insn_or_mem_wdata)
  );

  wire                                spec_insn_ori_valid;
  wire                                spec_insn_ori_trap;
  wire [                       4 : 0] spec_insn_ori_rs1_addr;
  wire [                       4 : 0] spec_insn_ori_rs2_addr;
  wire [                       4 : 0] spec_insn_ori_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_ori_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_ori_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_ori_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_ori_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_ori_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_ori_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_ori_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_ori_rs3_addr;
`endif

  rvfi_insn_ori insn_ori (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_ori_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_ori_rs3_addr),
`endif
    .spec_valid(spec_insn_ori_valid),
    .spec_trap(spec_insn_ori_trap),
    .spec_rs1_addr(spec_insn_ori_rs1_addr),
    .spec_rs2_addr(spec_insn_ori_rs2_addr),
    .spec_rd_addr(spec_insn_ori_rd_addr),
    .spec_rd_wdata(spec_insn_ori_rd_wdata),
    .spec_pc_wdata(spec_insn_ori_pc_wdata),
    .spec_mem_addr(spec_insn_ori_mem_addr),
    .spec_mem_rmask(spec_insn_ori_mem_rmask),
    .spec_mem_wmask(spec_insn_ori_mem_wmask),
    .spec_mem_wdata(spec_insn_ori_mem_wdata)
  );

  wire                                spec_insn_p_abs_valid;
  wire                                spec_insn_p_abs_trap;
  wire [                       4 : 0] spec_insn_p_abs_rs1_addr;
  wire [                       4 : 0] spec_insn_p_abs_rs2_addr;
  wire [                       4 : 0] spec_insn_p_abs_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_abs_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_abs_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_abs_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_abs_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_abs_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_abs_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_abs_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_abs_rs3_addr;
`endif

  rvfi_insn_p_abs insn_p_abs (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_abs_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_abs_rs3_addr),
`endif
    .spec_valid(spec_insn_p_abs_valid),
    .spec_trap(spec_insn_p_abs_trap),
    .spec_rs1_addr(spec_insn_p_abs_rs1_addr),
    .spec_rs2_addr(spec_insn_p_abs_rs2_addr),
    .spec_rd_addr(spec_insn_p_abs_rd_addr),
    .spec_rd_wdata(spec_insn_p_abs_rd_wdata),
    .spec_pc_wdata(spec_insn_p_abs_pc_wdata),
    .spec_mem_addr(spec_insn_p_abs_mem_addr),
    .spec_mem_rmask(spec_insn_p_abs_mem_rmask),
    .spec_mem_wmask(spec_insn_p_abs_mem_wmask),
    .spec_mem_wdata(spec_insn_p_abs_mem_wdata)
  );

  wire                                spec_insn_p_addN_valid;
  wire                                spec_insn_p_addN_trap;
  wire [                       4 : 0] spec_insn_p_addN_rs1_addr;
  wire [                       4 : 0] spec_insn_p_addN_rs2_addr;
  wire [                       4 : 0] spec_insn_p_addN_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addN_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addN_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addN_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_addN_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_addN_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addN_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addN_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_addN_rs3_addr;
`endif

  rvfi_insn_p_addN insn_p_addN (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_addN_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_addN_rs3_addr),
`endif
    .spec_valid(spec_insn_p_addN_valid),
    .spec_trap(spec_insn_p_addN_trap),
    .spec_rs1_addr(spec_insn_p_addN_rs1_addr),
    .spec_rs2_addr(spec_insn_p_addN_rs2_addr),
    .spec_rd_addr(spec_insn_p_addN_rd_addr),
    .spec_rd_wdata(spec_insn_p_addN_rd_wdata),
    .spec_pc_wdata(spec_insn_p_addN_pc_wdata),
    .spec_mem_addr(spec_insn_p_addN_mem_addr),
    .spec_mem_rmask(spec_insn_p_addN_mem_rmask),
    .spec_mem_wmask(spec_insn_p_addN_mem_wmask),
    .spec_mem_wdata(spec_insn_p_addN_mem_wdata)
  );

  wire                                spec_insn_p_addNr_valid;
  wire                                spec_insn_p_addNr_trap;
  wire [                       4 : 0] spec_insn_p_addNr_rs1_addr;
  wire [                       4 : 0] spec_insn_p_addNr_rs2_addr;
  wire [                       4 : 0] spec_insn_p_addNr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addNr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addNr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addNr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_addNr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_addNr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addNr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addNr_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_addNr_rs3_addr;
`endif

  rvfi_insn_p_addNr insn_p_addNr (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_addNr_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_addNr_rs3_addr),
`endif
    .spec_valid(spec_insn_p_addNr_valid),
    .spec_trap(spec_insn_p_addNr_trap),
    .spec_rs1_addr(spec_insn_p_addNr_rs1_addr),
    .spec_rs2_addr(spec_insn_p_addNr_rs2_addr),
    .spec_rd_addr(spec_insn_p_addNr_rd_addr),
    .spec_rd_wdata(spec_insn_p_addNr_rd_wdata),
    .spec_pc_wdata(spec_insn_p_addNr_pc_wdata),
    .spec_mem_addr(spec_insn_p_addNr_mem_addr),
    .spec_mem_rmask(spec_insn_p_addNr_mem_rmask),
    .spec_mem_wmask(spec_insn_p_addNr_mem_wmask),
    .spec_mem_wdata(spec_insn_p_addNr_mem_wdata)
  );

  wire                                spec_insn_p_addRN_valid;
  wire                                spec_insn_p_addRN_trap;
  wire [                       4 : 0] spec_insn_p_addRN_rs1_addr;
  wire [                       4 : 0] spec_insn_p_addRN_rs2_addr;
  wire [                       4 : 0] spec_insn_p_addRN_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addRN_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addRN_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addRN_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_addRN_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_addRN_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addRN_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addRN_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_addRN_rs3_addr;
`endif

  rvfi_insn_p_addRN insn_p_addRN (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_addRN_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_addRN_rs3_addr),
`endif
    .spec_valid(spec_insn_p_addRN_valid),
    .spec_trap(spec_insn_p_addRN_trap),
    .spec_rs1_addr(spec_insn_p_addRN_rs1_addr),
    .spec_rs2_addr(spec_insn_p_addRN_rs2_addr),
    .spec_rd_addr(spec_insn_p_addRN_rd_addr),
    .spec_rd_wdata(spec_insn_p_addRN_rd_wdata),
    .spec_pc_wdata(spec_insn_p_addRN_pc_wdata),
    .spec_mem_addr(spec_insn_p_addRN_mem_addr),
    .spec_mem_rmask(spec_insn_p_addRN_mem_rmask),
    .spec_mem_wmask(spec_insn_p_addRN_mem_wmask),
    .spec_mem_wdata(spec_insn_p_addRN_mem_wdata)
  );

  wire                                spec_insn_p_addRNr_valid;
  wire                                spec_insn_p_addRNr_trap;
  wire [                       4 : 0] spec_insn_p_addRNr_rs1_addr;
  wire [                       4 : 0] spec_insn_p_addRNr_rs2_addr;
  wire [                       4 : 0] spec_insn_p_addRNr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addRNr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addRNr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addRNr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_addRNr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_addRNr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addRNr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_addRNr_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_addRNr_rs3_addr;
`endif

  rvfi_insn_p_addRNr insn_p_addRNr (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_addRNr_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_addRNr_rs3_addr),
`endif
    .spec_valid(spec_insn_p_addRNr_valid),
    .spec_trap(spec_insn_p_addRNr_trap),
    .spec_rs1_addr(spec_insn_p_addRNr_rs1_addr),
    .spec_rs2_addr(spec_insn_p_addRNr_rs2_addr),
    .spec_rd_addr(spec_insn_p_addRNr_rd_addr),
    .spec_rd_wdata(spec_insn_p_addRNr_rd_wdata),
    .spec_pc_wdata(spec_insn_p_addRNr_pc_wdata),
    .spec_mem_addr(spec_insn_p_addRNr_mem_addr),
    .spec_mem_rmask(spec_insn_p_addRNr_mem_rmask),
    .spec_mem_wmask(spec_insn_p_addRNr_mem_wmask),
    .spec_mem_wdata(spec_insn_p_addRNr_mem_wdata)
  );

  wire                                spec_insn_p_adduN_valid;
  wire                                spec_insn_p_adduN_trap;
  wire [                       4 : 0] spec_insn_p_adduN_rs1_addr;
  wire [                       4 : 0] spec_insn_p_adduN_rs2_addr;
  wire [                       4 : 0] spec_insn_p_adduN_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduN_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduN_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduN_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_adduN_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_adduN_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduN_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduN_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_adduN_rs3_addr;
`endif

  rvfi_insn_p_adduN insn_p_adduN (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_adduN_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_adduN_rs3_addr),
`endif
    .spec_valid(spec_insn_p_adduN_valid),
    .spec_trap(spec_insn_p_adduN_trap),
    .spec_rs1_addr(spec_insn_p_adduN_rs1_addr),
    .spec_rs2_addr(spec_insn_p_adduN_rs2_addr),
    .spec_rd_addr(spec_insn_p_adduN_rd_addr),
    .spec_rd_wdata(spec_insn_p_adduN_rd_wdata),
    .spec_pc_wdata(spec_insn_p_adduN_pc_wdata),
    .spec_mem_addr(spec_insn_p_adduN_mem_addr),
    .spec_mem_rmask(spec_insn_p_adduN_mem_rmask),
    .spec_mem_wmask(spec_insn_p_adduN_mem_wmask),
    .spec_mem_wdata(spec_insn_p_adduN_mem_wdata)
  );

  wire                                spec_insn_p_adduNr_valid;
  wire                                spec_insn_p_adduNr_trap;
  wire [                       4 : 0] spec_insn_p_adduNr_rs1_addr;
  wire [                       4 : 0] spec_insn_p_adduNr_rs2_addr;
  wire [                       4 : 0] spec_insn_p_adduNr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduNr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduNr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduNr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_adduNr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_adduNr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduNr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduNr_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_adduNr_rs3_addr;
`endif

  rvfi_insn_p_adduNr insn_p_adduNr (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_adduNr_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_adduNr_rs3_addr),
`endif
    .spec_valid(spec_insn_p_adduNr_valid),
    .spec_trap(spec_insn_p_adduNr_trap),
    .spec_rs1_addr(spec_insn_p_adduNr_rs1_addr),
    .spec_rs2_addr(spec_insn_p_adduNr_rs2_addr),
    .spec_rd_addr(spec_insn_p_adduNr_rd_addr),
    .spec_rd_wdata(spec_insn_p_adduNr_rd_wdata),
    .spec_pc_wdata(spec_insn_p_adduNr_pc_wdata),
    .spec_mem_addr(spec_insn_p_adduNr_mem_addr),
    .spec_mem_rmask(spec_insn_p_adduNr_mem_rmask),
    .spec_mem_wmask(spec_insn_p_adduNr_mem_wmask),
    .spec_mem_wdata(spec_insn_p_adduNr_mem_wdata)
  );

  wire                                spec_insn_p_adduRN_valid;
  wire                                spec_insn_p_adduRN_trap;
  wire [                       4 : 0] spec_insn_p_adduRN_rs1_addr;
  wire [                       4 : 0] spec_insn_p_adduRN_rs2_addr;
  wire [                       4 : 0] spec_insn_p_adduRN_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduRN_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduRN_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduRN_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_adduRN_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_adduRN_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduRN_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduRN_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_adduRN_rs3_addr;
`endif

  rvfi_insn_p_adduRN insn_p_adduRN (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_adduRN_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_adduRN_rs3_addr),
`endif
    .spec_valid(spec_insn_p_adduRN_valid),
    .spec_trap(spec_insn_p_adduRN_trap),
    .spec_rs1_addr(spec_insn_p_adduRN_rs1_addr),
    .spec_rs2_addr(spec_insn_p_adduRN_rs2_addr),
    .spec_rd_addr(spec_insn_p_adduRN_rd_addr),
    .spec_rd_wdata(spec_insn_p_adduRN_rd_wdata),
    .spec_pc_wdata(spec_insn_p_adduRN_pc_wdata),
    .spec_mem_addr(spec_insn_p_adduRN_mem_addr),
    .spec_mem_rmask(spec_insn_p_adduRN_mem_rmask),
    .spec_mem_wmask(spec_insn_p_adduRN_mem_wmask),
    .spec_mem_wdata(spec_insn_p_adduRN_mem_wdata)
  );

  wire                                spec_insn_p_adduRNr_valid;
  wire                                spec_insn_p_adduRNr_trap;
  wire [                       4 : 0] spec_insn_p_adduRNr_rs1_addr;
  wire [                       4 : 0] spec_insn_p_adduRNr_rs2_addr;
  wire [                       4 : 0] spec_insn_p_adduRNr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduRNr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduRNr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduRNr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_adduRNr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_adduRNr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduRNr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_adduRNr_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_adduRNr_rs3_addr;
`endif

  rvfi_insn_p_adduRNr insn_p_adduRNr (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_adduRNr_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_adduRNr_rs3_addr),
`endif
    .spec_valid(spec_insn_p_adduRNr_valid),
    .spec_trap(spec_insn_p_adduRNr_trap),
    .spec_rs1_addr(spec_insn_p_adduRNr_rs1_addr),
    .spec_rs2_addr(spec_insn_p_adduRNr_rs2_addr),
    .spec_rd_addr(spec_insn_p_adduRNr_rd_addr),
    .spec_rd_wdata(spec_insn_p_adduRNr_rd_wdata),
    .spec_pc_wdata(spec_insn_p_adduRNr_pc_wdata),
    .spec_mem_addr(spec_insn_p_adduRNr_mem_addr),
    .spec_mem_rmask(spec_insn_p_adduRNr_mem_rmask),
    .spec_mem_wmask(spec_insn_p_adduRNr_mem_wmask),
    .spec_mem_wdata(spec_insn_p_adduRNr_mem_wdata)
  );

  wire                                spec_insn_p_bclr_valid;
  wire                                spec_insn_p_bclr_trap;
  wire [                       4 : 0] spec_insn_p_bclr_rs1_addr;
  wire [                       4 : 0] spec_insn_p_bclr_rs2_addr;
  wire [                       4 : 0] spec_insn_p_bclr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bclr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bclr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bclr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_bclr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_bclr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bclr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bclr_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_bclr_rs3_addr;
`endif

  rvfi_insn_p_bclr insn_p_bclr (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_bclr_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_bclr_rs3_addr),
`endif
    .spec_valid(spec_insn_p_bclr_valid),
    .spec_trap(spec_insn_p_bclr_trap),
    .spec_rs1_addr(spec_insn_p_bclr_rs1_addr),
    .spec_rs2_addr(spec_insn_p_bclr_rs2_addr),
    .spec_rd_addr(spec_insn_p_bclr_rd_addr),
    .spec_rd_wdata(spec_insn_p_bclr_rd_wdata),
    .spec_pc_wdata(spec_insn_p_bclr_pc_wdata),
    .spec_mem_addr(spec_insn_p_bclr_mem_addr),
    .spec_mem_rmask(spec_insn_p_bclr_mem_rmask),
    .spec_mem_wmask(spec_insn_p_bclr_mem_wmask),
    .spec_mem_wdata(spec_insn_p_bclr_mem_wdata)
  );

  wire                                spec_insn_p_bclrr_valid;
  wire                                spec_insn_p_bclrr_trap;
  wire [                       4 : 0] spec_insn_p_bclrr_rs1_addr;
  wire [                       4 : 0] spec_insn_p_bclrr_rs2_addr;
  wire [                       4 : 0] spec_insn_p_bclrr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bclrr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bclrr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bclrr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_bclrr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_bclrr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bclrr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bclrr_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_bclrr_rs3_addr;
`endif

  rvfi_insn_p_bclrr insn_p_bclrr (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_bclrr_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_bclrr_rs3_addr),
`endif
    .spec_valid(spec_insn_p_bclrr_valid),
    .spec_trap(spec_insn_p_bclrr_trap),
    .spec_rs1_addr(spec_insn_p_bclrr_rs1_addr),
    .spec_rs2_addr(spec_insn_p_bclrr_rs2_addr),
    .spec_rd_addr(spec_insn_p_bclrr_rd_addr),
    .spec_rd_wdata(spec_insn_p_bclrr_rd_wdata),
    .spec_pc_wdata(spec_insn_p_bclrr_pc_wdata),
    .spec_mem_addr(spec_insn_p_bclrr_mem_addr),
    .spec_mem_rmask(spec_insn_p_bclrr_mem_rmask),
    .spec_mem_wmask(spec_insn_p_bclrr_mem_wmask),
    .spec_mem_wdata(spec_insn_p_bclrr_mem_wdata)
  );

  wire                                spec_insn_p_beqimm_valid;
  wire                                spec_insn_p_beqimm_trap;
  wire [                       4 : 0] spec_insn_p_beqimm_rs1_addr;
  wire [                       4 : 0] spec_insn_p_beqimm_rs2_addr;
  wire [                       4 : 0] spec_insn_p_beqimm_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_beqimm_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_beqimm_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_beqimm_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_beqimm_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_beqimm_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_beqimm_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_beqimm_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_beqimm_rs3_addr;
`endif

  rvfi_insn_p_beqimm insn_p_beqimm (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_beqimm_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_beqimm_rs3_addr),
`endif
    .spec_valid(spec_insn_p_beqimm_valid),
    .spec_trap(spec_insn_p_beqimm_trap),
    .spec_rs1_addr(spec_insn_p_beqimm_rs1_addr),
    .spec_rs2_addr(spec_insn_p_beqimm_rs2_addr),
    .spec_rd_addr(spec_insn_p_beqimm_rd_addr),
    .spec_rd_wdata(spec_insn_p_beqimm_rd_wdata),
    .spec_pc_wdata(spec_insn_p_beqimm_pc_wdata),
    .spec_mem_addr(spec_insn_p_beqimm_mem_addr),
    .spec_mem_rmask(spec_insn_p_beqimm_mem_rmask),
    .spec_mem_wmask(spec_insn_p_beqimm_mem_wmask),
    .spec_mem_wdata(spec_insn_p_beqimm_mem_wdata)
  );

  wire                                spec_insn_p_bneimm_valid;
  wire                                spec_insn_p_bneimm_trap;
  wire [                       4 : 0] spec_insn_p_bneimm_rs1_addr;
  wire [                       4 : 0] spec_insn_p_bneimm_rs2_addr;
  wire [                       4 : 0] spec_insn_p_bneimm_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bneimm_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bneimm_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bneimm_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_bneimm_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_bneimm_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bneimm_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bneimm_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_bneimm_rs3_addr;
`endif

  rvfi_insn_p_bneimm insn_p_bneimm (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_bneimm_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_bneimm_rs3_addr),
`endif
    .spec_valid(spec_insn_p_bneimm_valid),
    .spec_trap(spec_insn_p_bneimm_trap),
    .spec_rs1_addr(spec_insn_p_bneimm_rs1_addr),
    .spec_rs2_addr(spec_insn_p_bneimm_rs2_addr),
    .spec_rd_addr(spec_insn_p_bneimm_rd_addr),
    .spec_rd_wdata(spec_insn_p_bneimm_rd_wdata),
    .spec_pc_wdata(spec_insn_p_bneimm_pc_wdata),
    .spec_mem_addr(spec_insn_p_bneimm_mem_addr),
    .spec_mem_rmask(spec_insn_p_bneimm_mem_rmask),
    .spec_mem_wmask(spec_insn_p_bneimm_mem_wmask),
    .spec_mem_wdata(spec_insn_p_bneimm_mem_wdata)
  );

  wire                                spec_insn_p_bset_valid;
  wire                                spec_insn_p_bset_trap;
  wire [                       4 : 0] spec_insn_p_bset_rs1_addr;
  wire [                       4 : 0] spec_insn_p_bset_rs2_addr;
  wire [                       4 : 0] spec_insn_p_bset_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bset_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bset_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bset_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_bset_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_bset_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bset_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bset_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_bset_rs3_addr;
`endif

  rvfi_insn_p_bset insn_p_bset (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_bset_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_bset_rs3_addr),
`endif
    .spec_valid(spec_insn_p_bset_valid),
    .spec_trap(spec_insn_p_bset_trap),
    .spec_rs1_addr(spec_insn_p_bset_rs1_addr),
    .spec_rs2_addr(spec_insn_p_bset_rs2_addr),
    .spec_rd_addr(spec_insn_p_bset_rd_addr),
    .spec_rd_wdata(spec_insn_p_bset_rd_wdata),
    .spec_pc_wdata(spec_insn_p_bset_pc_wdata),
    .spec_mem_addr(spec_insn_p_bset_mem_addr),
    .spec_mem_rmask(spec_insn_p_bset_mem_rmask),
    .spec_mem_wmask(spec_insn_p_bset_mem_wmask),
    .spec_mem_wdata(spec_insn_p_bset_mem_wdata)
  );

  wire                                spec_insn_p_bsetr_valid;
  wire                                spec_insn_p_bsetr_trap;
  wire [                       4 : 0] spec_insn_p_bsetr_rs1_addr;
  wire [                       4 : 0] spec_insn_p_bsetr_rs2_addr;
  wire [                       4 : 0] spec_insn_p_bsetr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bsetr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bsetr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bsetr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_bsetr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_bsetr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bsetr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_bsetr_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_bsetr_rs3_addr;
`endif

  rvfi_insn_p_bsetr insn_p_bsetr (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_bsetr_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_bsetr_rs3_addr),
`endif
    .spec_valid(spec_insn_p_bsetr_valid),
    .spec_trap(spec_insn_p_bsetr_trap),
    .spec_rs1_addr(spec_insn_p_bsetr_rs1_addr),
    .spec_rs2_addr(spec_insn_p_bsetr_rs2_addr),
    .spec_rd_addr(spec_insn_p_bsetr_rd_addr),
    .spec_rd_wdata(spec_insn_p_bsetr_rd_wdata),
    .spec_pc_wdata(spec_insn_p_bsetr_pc_wdata),
    .spec_mem_addr(spec_insn_p_bsetr_mem_addr),
    .spec_mem_rmask(spec_insn_p_bsetr_mem_rmask),
    .spec_mem_wmask(spec_insn_p_bsetr_mem_wmask),
    .spec_mem_wdata(spec_insn_p_bsetr_mem_wdata)
  );

  wire                                spec_insn_p_clb_valid;
  wire                                spec_insn_p_clb_trap;
  wire [                       4 : 0] spec_insn_p_clb_rs1_addr;
  wire [                       4 : 0] spec_insn_p_clb_rs2_addr;
  wire [                       4 : 0] spec_insn_p_clb_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clb_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clb_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clb_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_clb_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_clb_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clb_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clb_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_clb_rs3_addr;
`endif

  rvfi_insn_p_clb insn_p_clb (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_clb_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_clb_rs3_addr),
`endif
    .spec_valid(spec_insn_p_clb_valid),
    .spec_trap(spec_insn_p_clb_trap),
    .spec_rs1_addr(spec_insn_p_clb_rs1_addr),
    .spec_rs2_addr(spec_insn_p_clb_rs2_addr),
    .spec_rd_addr(spec_insn_p_clb_rd_addr),
    .spec_rd_wdata(spec_insn_p_clb_rd_wdata),
    .spec_pc_wdata(spec_insn_p_clb_pc_wdata),
    .spec_mem_addr(spec_insn_p_clb_mem_addr),
    .spec_mem_rmask(spec_insn_p_clb_mem_rmask),
    .spec_mem_wmask(spec_insn_p_clb_mem_wmask),
    .spec_mem_wdata(spec_insn_p_clb_mem_wdata)
  );

  wire                                spec_insn_p_clip_valid;
  wire                                spec_insn_p_clip_trap;
  wire [                       4 : 0] spec_insn_p_clip_rs1_addr;
  wire [                       4 : 0] spec_insn_p_clip_rs2_addr;
  wire [                       4 : 0] spec_insn_p_clip_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clip_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clip_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clip_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_clip_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_clip_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clip_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clip_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_clip_rs3_addr;
`endif

  rvfi_insn_p_clip insn_p_clip (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_clip_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_clip_rs3_addr),
`endif
    .spec_valid(spec_insn_p_clip_valid),
    .spec_trap(spec_insn_p_clip_trap),
    .spec_rs1_addr(spec_insn_p_clip_rs1_addr),
    .spec_rs2_addr(spec_insn_p_clip_rs2_addr),
    .spec_rd_addr(spec_insn_p_clip_rd_addr),
    .spec_rd_wdata(spec_insn_p_clip_rd_wdata),
    .spec_pc_wdata(spec_insn_p_clip_pc_wdata),
    .spec_mem_addr(spec_insn_p_clip_mem_addr),
    .spec_mem_rmask(spec_insn_p_clip_mem_rmask),
    .spec_mem_wmask(spec_insn_p_clip_mem_wmask),
    .spec_mem_wdata(spec_insn_p_clip_mem_wdata)
  );

  wire                                spec_insn_p_clipr_valid;
  wire                                spec_insn_p_clipr_trap;
  wire [                       4 : 0] spec_insn_p_clipr_rs1_addr;
  wire [                       4 : 0] spec_insn_p_clipr_rs2_addr;
  wire [                       4 : 0] spec_insn_p_clipr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clipr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clipr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clipr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_clipr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_clipr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clipr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clipr_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_clipr_rs3_addr;
`endif

  rvfi_insn_p_clipr insn_p_clipr (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_clipr_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_clipr_rs3_addr),
`endif
    .spec_valid(spec_insn_p_clipr_valid),
    .spec_trap(spec_insn_p_clipr_trap),
    .spec_rs1_addr(spec_insn_p_clipr_rs1_addr),
    .spec_rs2_addr(spec_insn_p_clipr_rs2_addr),
    .spec_rd_addr(spec_insn_p_clipr_rd_addr),
    .spec_rd_wdata(spec_insn_p_clipr_rd_wdata),
    .spec_pc_wdata(spec_insn_p_clipr_pc_wdata),
    .spec_mem_addr(spec_insn_p_clipr_mem_addr),
    .spec_mem_rmask(spec_insn_p_clipr_mem_rmask),
    .spec_mem_wmask(spec_insn_p_clipr_mem_wmask),
    .spec_mem_wdata(spec_insn_p_clipr_mem_wdata)
  );

  wire                                spec_insn_p_clipu_valid;
  wire                                spec_insn_p_clipu_trap;
  wire [                       4 : 0] spec_insn_p_clipu_rs1_addr;
  wire [                       4 : 0] spec_insn_p_clipu_rs2_addr;
  wire [                       4 : 0] spec_insn_p_clipu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clipu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clipu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clipu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_clipu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_clipu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clipu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clipu_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_clipu_rs3_addr;
`endif

  rvfi_insn_p_clipu insn_p_clipu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_clipu_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_clipu_rs3_addr),
`endif
    .spec_valid(spec_insn_p_clipu_valid),
    .spec_trap(spec_insn_p_clipu_trap),
    .spec_rs1_addr(spec_insn_p_clipu_rs1_addr),
    .spec_rs2_addr(spec_insn_p_clipu_rs2_addr),
    .spec_rd_addr(spec_insn_p_clipu_rd_addr),
    .spec_rd_wdata(spec_insn_p_clipu_rd_wdata),
    .spec_pc_wdata(spec_insn_p_clipu_pc_wdata),
    .spec_mem_addr(spec_insn_p_clipu_mem_addr),
    .spec_mem_rmask(spec_insn_p_clipu_mem_rmask),
    .spec_mem_wmask(spec_insn_p_clipu_mem_wmask),
    .spec_mem_wdata(spec_insn_p_clipu_mem_wdata)
  );

  wire                                spec_insn_p_clipur_valid;
  wire                                spec_insn_p_clipur_trap;
  wire [                       4 : 0] spec_insn_p_clipur_rs1_addr;
  wire [                       4 : 0] spec_insn_p_clipur_rs2_addr;
  wire [                       4 : 0] spec_insn_p_clipur_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clipur_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clipur_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clipur_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_clipur_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_clipur_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clipur_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_clipur_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_clipur_rs3_addr;
`endif

  rvfi_insn_p_clipur insn_p_clipur (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_clipur_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_clipur_rs3_addr),
`endif
    .spec_valid(spec_insn_p_clipur_valid),
    .spec_trap(spec_insn_p_clipur_trap),
    .spec_rs1_addr(spec_insn_p_clipur_rs1_addr),
    .spec_rs2_addr(spec_insn_p_clipur_rs2_addr),
    .spec_rd_addr(spec_insn_p_clipur_rd_addr),
    .spec_rd_wdata(spec_insn_p_clipur_rd_wdata),
    .spec_pc_wdata(spec_insn_p_clipur_pc_wdata),
    .spec_mem_addr(spec_insn_p_clipur_mem_addr),
    .spec_mem_rmask(spec_insn_p_clipur_mem_rmask),
    .spec_mem_wmask(spec_insn_p_clipur_mem_wmask),
    .spec_mem_wdata(spec_insn_p_clipur_mem_wdata)
  );

  wire                                spec_insn_p_cnt_valid;
  wire                                spec_insn_p_cnt_trap;
  wire [                       4 : 0] spec_insn_p_cnt_rs1_addr;
  wire [                       4 : 0] spec_insn_p_cnt_rs2_addr;
  wire [                       4 : 0] spec_insn_p_cnt_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_cnt_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_cnt_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_cnt_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_cnt_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_cnt_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_cnt_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_cnt_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_cnt_rs3_addr;
`endif

  rvfi_insn_p_cnt insn_p_cnt (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_cnt_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_cnt_rs3_addr),
`endif
    .spec_valid(spec_insn_p_cnt_valid),
    .spec_trap(spec_insn_p_cnt_trap),
    .spec_rs1_addr(spec_insn_p_cnt_rs1_addr),
    .spec_rs2_addr(spec_insn_p_cnt_rs2_addr),
    .spec_rd_addr(spec_insn_p_cnt_rd_addr),
    .spec_rd_wdata(spec_insn_p_cnt_rd_wdata),
    .spec_pc_wdata(spec_insn_p_cnt_pc_wdata),
    .spec_mem_addr(spec_insn_p_cnt_mem_addr),
    .spec_mem_rmask(spec_insn_p_cnt_mem_rmask),
    .spec_mem_wmask(spec_insn_p_cnt_mem_wmask),
    .spec_mem_wdata(spec_insn_p_cnt_mem_wdata)
  );

  wire                                spec_insn_p_extbs_valid;
  wire                                spec_insn_p_extbs_trap;
  wire [                       4 : 0] spec_insn_p_extbs_rs1_addr;
  wire [                       4 : 0] spec_insn_p_extbs_rs2_addr;
  wire [                       4 : 0] spec_insn_p_extbs_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extbs_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extbs_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extbs_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_extbs_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_extbs_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extbs_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extbs_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_extbs_rs3_addr;
`endif

  rvfi_insn_p_extbs insn_p_extbs (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_extbs_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_extbs_rs3_addr),
`endif
    .spec_valid(spec_insn_p_extbs_valid),
    .spec_trap(spec_insn_p_extbs_trap),
    .spec_rs1_addr(spec_insn_p_extbs_rs1_addr),
    .spec_rs2_addr(spec_insn_p_extbs_rs2_addr),
    .spec_rd_addr(spec_insn_p_extbs_rd_addr),
    .spec_rd_wdata(spec_insn_p_extbs_rd_wdata),
    .spec_pc_wdata(spec_insn_p_extbs_pc_wdata),
    .spec_mem_addr(spec_insn_p_extbs_mem_addr),
    .spec_mem_rmask(spec_insn_p_extbs_mem_rmask),
    .spec_mem_wmask(spec_insn_p_extbs_mem_wmask),
    .spec_mem_wdata(spec_insn_p_extbs_mem_wdata)
  );

  wire                                spec_insn_p_extbz_valid;
  wire                                spec_insn_p_extbz_trap;
  wire [                       4 : 0] spec_insn_p_extbz_rs1_addr;
  wire [                       4 : 0] spec_insn_p_extbz_rs2_addr;
  wire [                       4 : 0] spec_insn_p_extbz_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extbz_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extbz_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extbz_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_extbz_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_extbz_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extbz_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extbz_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_extbz_rs3_addr;
`endif

  rvfi_insn_p_extbz insn_p_extbz (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_extbz_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_extbz_rs3_addr),
`endif
    .spec_valid(spec_insn_p_extbz_valid),
    .spec_trap(spec_insn_p_extbz_trap),
    .spec_rs1_addr(spec_insn_p_extbz_rs1_addr),
    .spec_rs2_addr(spec_insn_p_extbz_rs2_addr),
    .spec_rd_addr(spec_insn_p_extbz_rd_addr),
    .spec_rd_wdata(spec_insn_p_extbz_rd_wdata),
    .spec_pc_wdata(spec_insn_p_extbz_pc_wdata),
    .spec_mem_addr(spec_insn_p_extbz_mem_addr),
    .spec_mem_rmask(spec_insn_p_extbz_mem_rmask),
    .spec_mem_wmask(spec_insn_p_extbz_mem_wmask),
    .spec_mem_wdata(spec_insn_p_extbz_mem_wdata)
  );

  wire                                spec_insn_p_exths_valid;
  wire                                spec_insn_p_exths_trap;
  wire [                       4 : 0] spec_insn_p_exths_rs1_addr;
  wire [                       4 : 0] spec_insn_p_exths_rs2_addr;
  wire [                       4 : 0] spec_insn_p_exths_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_exths_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_exths_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_exths_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_exths_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_exths_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_exths_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_exths_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_exths_rs3_addr;
`endif

  rvfi_insn_p_exths insn_p_exths (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_exths_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_exths_rs3_addr),
`endif
    .spec_valid(spec_insn_p_exths_valid),
    .spec_trap(spec_insn_p_exths_trap),
    .spec_rs1_addr(spec_insn_p_exths_rs1_addr),
    .spec_rs2_addr(spec_insn_p_exths_rs2_addr),
    .spec_rd_addr(spec_insn_p_exths_rd_addr),
    .spec_rd_wdata(spec_insn_p_exths_rd_wdata),
    .spec_pc_wdata(spec_insn_p_exths_pc_wdata),
    .spec_mem_addr(spec_insn_p_exths_mem_addr),
    .spec_mem_rmask(spec_insn_p_exths_mem_rmask),
    .spec_mem_wmask(spec_insn_p_exths_mem_wmask),
    .spec_mem_wdata(spec_insn_p_exths_mem_wdata)
  );

  wire                                spec_insn_p_exthz_valid;
  wire                                spec_insn_p_exthz_trap;
  wire [                       4 : 0] spec_insn_p_exthz_rs1_addr;
  wire [                       4 : 0] spec_insn_p_exthz_rs2_addr;
  wire [                       4 : 0] spec_insn_p_exthz_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_exthz_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_exthz_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_exthz_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_exthz_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_exthz_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_exthz_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_exthz_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_exthz_rs3_addr;
`endif

  rvfi_insn_p_exthz insn_p_exthz (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_exthz_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_exthz_rs3_addr),
`endif
    .spec_valid(spec_insn_p_exthz_valid),
    .spec_trap(spec_insn_p_exthz_trap),
    .spec_rs1_addr(spec_insn_p_exthz_rs1_addr),
    .spec_rs2_addr(spec_insn_p_exthz_rs2_addr),
    .spec_rd_addr(spec_insn_p_exthz_rd_addr),
    .spec_rd_wdata(spec_insn_p_exthz_rd_wdata),
    .spec_pc_wdata(spec_insn_p_exthz_pc_wdata),
    .spec_mem_addr(spec_insn_p_exthz_mem_addr),
    .spec_mem_rmask(spec_insn_p_exthz_mem_rmask),
    .spec_mem_wmask(spec_insn_p_exthz_mem_wmask),
    .spec_mem_wdata(spec_insn_p_exthz_mem_wdata)
  );

  wire                                spec_insn_p_extract_valid;
  wire                                spec_insn_p_extract_trap;
  wire [                       4 : 0] spec_insn_p_extract_rs1_addr;
  wire [                       4 : 0] spec_insn_p_extract_rs2_addr;
  wire [                       4 : 0] spec_insn_p_extract_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extract_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extract_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extract_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_extract_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_extract_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extract_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extract_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_extract_rs3_addr;
`endif

  rvfi_insn_p_extract insn_p_extract (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_extract_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_extract_rs3_addr),
`endif
    .spec_valid(spec_insn_p_extract_valid),
    .spec_trap(spec_insn_p_extract_trap),
    .spec_rs1_addr(spec_insn_p_extract_rs1_addr),
    .spec_rs2_addr(spec_insn_p_extract_rs2_addr),
    .spec_rd_addr(spec_insn_p_extract_rd_addr),
    .spec_rd_wdata(spec_insn_p_extract_rd_wdata),
    .spec_pc_wdata(spec_insn_p_extract_pc_wdata),
    .spec_mem_addr(spec_insn_p_extract_mem_addr),
    .spec_mem_rmask(spec_insn_p_extract_mem_rmask),
    .spec_mem_wmask(spec_insn_p_extract_mem_wmask),
    .spec_mem_wdata(spec_insn_p_extract_mem_wdata)
  );

  wire                                spec_insn_p_extractr_valid;
  wire                                spec_insn_p_extractr_trap;
  wire [                       4 : 0] spec_insn_p_extractr_rs1_addr;
  wire [                       4 : 0] spec_insn_p_extractr_rs2_addr;
  wire [                       4 : 0] spec_insn_p_extractr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extractr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extractr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extractr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_extractr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_extractr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extractr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extractr_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_extractr_rs3_addr;
`endif

  rvfi_insn_p_extractr insn_p_extractr (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_extractr_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_extractr_rs3_addr),
`endif
    .spec_valid(spec_insn_p_extractr_valid),
    .spec_trap(spec_insn_p_extractr_trap),
    .spec_rs1_addr(spec_insn_p_extractr_rs1_addr),
    .spec_rs2_addr(spec_insn_p_extractr_rs2_addr),
    .spec_rd_addr(spec_insn_p_extractr_rd_addr),
    .spec_rd_wdata(spec_insn_p_extractr_rd_wdata),
    .spec_pc_wdata(spec_insn_p_extractr_pc_wdata),
    .spec_mem_addr(spec_insn_p_extractr_mem_addr),
    .spec_mem_rmask(spec_insn_p_extractr_mem_rmask),
    .spec_mem_wmask(spec_insn_p_extractr_mem_wmask),
    .spec_mem_wdata(spec_insn_p_extractr_mem_wdata)
  );

  wire                                spec_insn_p_extractu_valid;
  wire                                spec_insn_p_extractu_trap;
  wire [                       4 : 0] spec_insn_p_extractu_rs1_addr;
  wire [                       4 : 0] spec_insn_p_extractu_rs2_addr;
  wire [                       4 : 0] spec_insn_p_extractu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extractu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extractu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extractu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_extractu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_extractu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extractu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extractu_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_extractu_rs3_addr;
`endif

  rvfi_insn_p_extractu insn_p_extractu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_extractu_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_extractu_rs3_addr),
`endif
    .spec_valid(spec_insn_p_extractu_valid),
    .spec_trap(spec_insn_p_extractu_trap),
    .spec_rs1_addr(spec_insn_p_extractu_rs1_addr),
    .spec_rs2_addr(spec_insn_p_extractu_rs2_addr),
    .spec_rd_addr(spec_insn_p_extractu_rd_addr),
    .spec_rd_wdata(spec_insn_p_extractu_rd_wdata),
    .spec_pc_wdata(spec_insn_p_extractu_pc_wdata),
    .spec_mem_addr(spec_insn_p_extractu_mem_addr),
    .spec_mem_rmask(spec_insn_p_extractu_mem_rmask),
    .spec_mem_wmask(spec_insn_p_extractu_mem_wmask),
    .spec_mem_wdata(spec_insn_p_extractu_mem_wdata)
  );

  wire                                spec_insn_p_extractur_valid;
  wire                                spec_insn_p_extractur_trap;
  wire [                       4 : 0] spec_insn_p_extractur_rs1_addr;
  wire [                       4 : 0] spec_insn_p_extractur_rs2_addr;
  wire [                       4 : 0] spec_insn_p_extractur_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extractur_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extractur_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extractur_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_extractur_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_extractur_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extractur_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_extractur_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_extractur_rs3_addr;
`endif

  rvfi_insn_p_extractur insn_p_extractur (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_extractur_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_extractur_rs3_addr),
`endif
    .spec_valid(spec_insn_p_extractur_valid),
    .spec_trap(spec_insn_p_extractur_trap),
    .spec_rs1_addr(spec_insn_p_extractur_rs1_addr),
    .spec_rs2_addr(spec_insn_p_extractur_rs2_addr),
    .spec_rd_addr(spec_insn_p_extractur_rd_addr),
    .spec_rd_wdata(spec_insn_p_extractur_rd_wdata),
    .spec_pc_wdata(spec_insn_p_extractur_pc_wdata),
    .spec_mem_addr(spec_insn_p_extractur_mem_addr),
    .spec_mem_rmask(spec_insn_p_extractur_mem_rmask),
    .spec_mem_wmask(spec_insn_p_extractur_mem_wmask),
    .spec_mem_wdata(spec_insn_p_extractur_mem_wdata)
  );

  wire                                spec_insn_p_ff1_valid;
  wire                                spec_insn_p_ff1_trap;
  wire [                       4 : 0] spec_insn_p_ff1_rs1_addr;
  wire [                       4 : 0] spec_insn_p_ff1_rs2_addr;
  wire [                       4 : 0] spec_insn_p_ff1_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_ff1_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_ff1_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_ff1_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_ff1_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_ff1_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_ff1_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_ff1_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_ff1_rs3_addr;
`endif

  rvfi_insn_p_ff1 insn_p_ff1 (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_ff1_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_ff1_rs3_addr),
`endif
    .spec_valid(spec_insn_p_ff1_valid),
    .spec_trap(spec_insn_p_ff1_trap),
    .spec_rs1_addr(spec_insn_p_ff1_rs1_addr),
    .spec_rs2_addr(spec_insn_p_ff1_rs2_addr),
    .spec_rd_addr(spec_insn_p_ff1_rd_addr),
    .spec_rd_wdata(spec_insn_p_ff1_rd_wdata),
    .spec_pc_wdata(spec_insn_p_ff1_pc_wdata),
    .spec_mem_addr(spec_insn_p_ff1_mem_addr),
    .spec_mem_rmask(spec_insn_p_ff1_mem_rmask),
    .spec_mem_wmask(spec_insn_p_ff1_mem_wmask),
    .spec_mem_wdata(spec_insn_p_ff1_mem_wdata)
  );

  wire                                spec_insn_p_fl1_valid;
  wire                                spec_insn_p_fl1_trap;
  wire [                       4 : 0] spec_insn_p_fl1_rs1_addr;
  wire [                       4 : 0] spec_insn_p_fl1_rs2_addr;
  wire [                       4 : 0] spec_insn_p_fl1_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_fl1_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_fl1_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_fl1_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_fl1_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_fl1_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_fl1_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_fl1_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_fl1_rs3_addr;
`endif

  rvfi_insn_p_fl1 insn_p_fl1 (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_fl1_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_fl1_rs3_addr),
`endif
    .spec_valid(spec_insn_p_fl1_valid),
    .spec_trap(spec_insn_p_fl1_trap),
    .spec_rs1_addr(spec_insn_p_fl1_rs1_addr),
    .spec_rs2_addr(spec_insn_p_fl1_rs2_addr),
    .spec_rd_addr(spec_insn_p_fl1_rd_addr),
    .spec_rd_wdata(spec_insn_p_fl1_rd_wdata),
    .spec_pc_wdata(spec_insn_p_fl1_pc_wdata),
    .spec_mem_addr(spec_insn_p_fl1_mem_addr),
    .spec_mem_rmask(spec_insn_p_fl1_mem_rmask),
    .spec_mem_wmask(spec_insn_p_fl1_mem_wmask),
    .spec_mem_wdata(spec_insn_p_fl1_mem_wdata)
  );

  wire                                spec_insn_p_insert_valid;
  wire                                spec_insn_p_insert_trap;
  wire [                       4 : 0] spec_insn_p_insert_rs1_addr;
  wire [                       4 : 0] spec_insn_p_insert_rs2_addr;
  wire [                       4 : 0] spec_insn_p_insert_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_insert_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_insert_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_insert_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_insert_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_insert_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_insert_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_insert_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_insert_rs3_addr;
`endif

  rvfi_insn_p_insert insn_p_insert (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_insert_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_insert_rs3_addr),
`endif
    .spec_valid(spec_insn_p_insert_valid),
    .spec_trap(spec_insn_p_insert_trap),
    .spec_rs1_addr(spec_insn_p_insert_rs1_addr),
    .spec_rs2_addr(spec_insn_p_insert_rs2_addr),
    .spec_rd_addr(spec_insn_p_insert_rd_addr),
    .spec_rd_wdata(spec_insn_p_insert_rd_wdata),
    .spec_pc_wdata(spec_insn_p_insert_pc_wdata),
    .spec_mem_addr(spec_insn_p_insert_mem_addr),
    .spec_mem_rmask(spec_insn_p_insert_mem_rmask),
    .spec_mem_wmask(spec_insn_p_insert_mem_wmask),
    .spec_mem_wdata(spec_insn_p_insert_mem_wdata)
  );

  wire                                spec_insn_p_insertr_valid;
  wire                                spec_insn_p_insertr_trap;
  wire [                       4 : 0] spec_insn_p_insertr_rs1_addr;
  wire [                       4 : 0] spec_insn_p_insertr_rs2_addr;
  wire [                       4 : 0] spec_insn_p_insertr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_insertr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_insertr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_insertr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_insertr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_insertr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_insertr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_insertr_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_insertr_rs3_addr;
`endif

  rvfi_insn_p_insertr insn_p_insertr (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_insertr_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_insertr_rs3_addr),
`endif
    .spec_valid(spec_insn_p_insertr_valid),
    .spec_trap(spec_insn_p_insertr_trap),
    .spec_rs1_addr(spec_insn_p_insertr_rs1_addr),
    .spec_rs2_addr(spec_insn_p_insertr_rs2_addr),
    .spec_rd_addr(spec_insn_p_insertr_rd_addr),
    .spec_rd_wdata(spec_insn_p_insertr_rd_wdata),
    .spec_pc_wdata(spec_insn_p_insertr_pc_wdata),
    .spec_mem_addr(spec_insn_p_insertr_mem_addr),
    .spec_mem_rmask(spec_insn_p_insertr_mem_rmask),
    .spec_mem_wmask(spec_insn_p_insertr_mem_wmask),
    .spec_mem_wdata(spec_insn_p_insertr_mem_wdata)
  );

  wire                                spec_insn_p_lb_valid;
  wire                                spec_insn_p_lb_trap;
  wire [                       4 : 0] spec_insn_p_lb_rs1_addr;
  wire [                       4 : 0] spec_insn_p_lb_rs2_addr;
  wire [                       4 : 0] spec_insn_p_lb_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lb_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lb_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lb_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_lb_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_lb_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lb_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lb_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_lb_rs3_addr;
`endif

  rvfi_insn_p_lb insn_p_lb (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_lb_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_lb_rs3_addr),
`endif
    .spec_valid(spec_insn_p_lb_valid),
    .spec_trap(spec_insn_p_lb_trap),
    .spec_rs1_addr(spec_insn_p_lb_rs1_addr),
    .spec_rs2_addr(spec_insn_p_lb_rs2_addr),
    .spec_rd_addr(spec_insn_p_lb_rd_addr),
    .spec_rd_wdata(spec_insn_p_lb_rd_wdata),
    .spec_pc_wdata(spec_insn_p_lb_pc_wdata),
    .spec_mem_addr(spec_insn_p_lb_mem_addr),
    .spec_mem_rmask(spec_insn_p_lb_mem_rmask),
    .spec_mem_wmask(spec_insn_p_lb_mem_wmask),
    .spec_mem_wdata(spec_insn_p_lb_mem_wdata)
  );

  wire                                spec_insn_p_lbu_valid;
  wire                                spec_insn_p_lbu_trap;
  wire [                       4 : 0] spec_insn_p_lbu_rs1_addr;
  wire [                       4 : 0] spec_insn_p_lbu_rs2_addr;
  wire [                       4 : 0] spec_insn_p_lbu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lbu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lbu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lbu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_lbu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_lbu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lbu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lbu_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_lbu_rs3_addr;
`endif

  rvfi_insn_p_lbu insn_p_lbu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_lbu_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_lbu_rs3_addr),
`endif
    .spec_valid(spec_insn_p_lbu_valid),
    .spec_trap(spec_insn_p_lbu_trap),
    .spec_rs1_addr(spec_insn_p_lbu_rs1_addr),
    .spec_rs2_addr(spec_insn_p_lbu_rs2_addr),
    .spec_rd_addr(spec_insn_p_lbu_rd_addr),
    .spec_rd_wdata(spec_insn_p_lbu_rd_wdata),
    .spec_pc_wdata(spec_insn_p_lbu_pc_wdata),
    .spec_mem_addr(spec_insn_p_lbu_mem_addr),
    .spec_mem_rmask(spec_insn_p_lbu_mem_rmask),
    .spec_mem_wmask(spec_insn_p_lbu_mem_wmask),
    .spec_mem_wdata(spec_insn_p_lbu_mem_wdata)
  );

  wire                                spec_insn_p_lh_valid;
  wire                                spec_insn_p_lh_trap;
  wire [                       4 : 0] spec_insn_p_lh_rs1_addr;
  wire [                       4 : 0] spec_insn_p_lh_rs2_addr;
  wire [                       4 : 0] spec_insn_p_lh_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lh_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lh_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lh_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_lh_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_lh_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lh_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lh_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_lh_rs3_addr;
`endif

  rvfi_insn_p_lh insn_p_lh (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_lh_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_lh_rs3_addr),
`endif
    .spec_valid(spec_insn_p_lh_valid),
    .spec_trap(spec_insn_p_lh_trap),
    .spec_rs1_addr(spec_insn_p_lh_rs1_addr),
    .spec_rs2_addr(spec_insn_p_lh_rs2_addr),
    .spec_rd_addr(spec_insn_p_lh_rd_addr),
    .spec_rd_wdata(spec_insn_p_lh_rd_wdata),
    .spec_pc_wdata(spec_insn_p_lh_pc_wdata),
    .spec_mem_addr(spec_insn_p_lh_mem_addr),
    .spec_mem_rmask(spec_insn_p_lh_mem_rmask),
    .spec_mem_wmask(spec_insn_p_lh_mem_wmask),
    .spec_mem_wdata(spec_insn_p_lh_mem_wdata)
  );

  wire                                spec_insn_p_lhu_valid;
  wire                                spec_insn_p_lhu_trap;
  wire [                       4 : 0] spec_insn_p_lhu_rs1_addr;
  wire [                       4 : 0] spec_insn_p_lhu_rs2_addr;
  wire [                       4 : 0] spec_insn_p_lhu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lhu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lhu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lhu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_lhu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_lhu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lhu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lhu_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_lhu_rs3_addr;
`endif

  rvfi_insn_p_lhu insn_p_lhu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_lhu_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_lhu_rs3_addr),
`endif
    .spec_valid(spec_insn_p_lhu_valid),
    .spec_trap(spec_insn_p_lhu_trap),
    .spec_rs1_addr(spec_insn_p_lhu_rs1_addr),
    .spec_rs2_addr(spec_insn_p_lhu_rs2_addr),
    .spec_rd_addr(spec_insn_p_lhu_rd_addr),
    .spec_rd_wdata(spec_insn_p_lhu_rd_wdata),
    .spec_pc_wdata(spec_insn_p_lhu_pc_wdata),
    .spec_mem_addr(spec_insn_p_lhu_mem_addr),
    .spec_mem_rmask(spec_insn_p_lhu_mem_rmask),
    .spec_mem_wmask(spec_insn_p_lhu_mem_wmask),
    .spec_mem_wdata(spec_insn_p_lhu_mem_wdata)
  );

  wire                                spec_insn_p_lw_valid;
  wire                                spec_insn_p_lw_trap;
  wire [                       4 : 0] spec_insn_p_lw_rs1_addr;
  wire [                       4 : 0] spec_insn_p_lw_rs2_addr;
  wire [                       4 : 0] spec_insn_p_lw_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lw_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lw_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lw_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_lw_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_lw_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lw_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_lw_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_lw_rs3_addr;
`endif

  rvfi_insn_p_lw insn_p_lw (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_lw_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_lw_rs3_addr),
`endif
    .spec_valid(spec_insn_p_lw_valid),
    .spec_trap(spec_insn_p_lw_trap),
    .spec_rs1_addr(spec_insn_p_lw_rs1_addr),
    .spec_rs2_addr(spec_insn_p_lw_rs2_addr),
    .spec_rd_addr(spec_insn_p_lw_rd_addr),
    .spec_rd_wdata(spec_insn_p_lw_rd_wdata),
    .spec_pc_wdata(spec_insn_p_lw_pc_wdata),
    .spec_mem_addr(spec_insn_p_lw_mem_addr),
    .spec_mem_rmask(spec_insn_p_lw_mem_rmask),
    .spec_mem_wmask(spec_insn_p_lw_mem_wmask),
    .spec_mem_wdata(spec_insn_p_lw_mem_wdata)
  );

  wire                                spec_insn_p_max_valid;
  wire                                spec_insn_p_max_trap;
  wire [                       4 : 0] spec_insn_p_max_rs1_addr;
  wire [                       4 : 0] spec_insn_p_max_rs2_addr;
  wire [                       4 : 0] spec_insn_p_max_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_max_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_max_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_max_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_max_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_max_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_max_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_max_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_max_rs3_addr;
`endif

  rvfi_insn_p_max insn_p_max (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_max_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_max_rs3_addr),
`endif
    .spec_valid(spec_insn_p_max_valid),
    .spec_trap(spec_insn_p_max_trap),
    .spec_rs1_addr(spec_insn_p_max_rs1_addr),
    .spec_rs2_addr(spec_insn_p_max_rs2_addr),
    .spec_rd_addr(spec_insn_p_max_rd_addr),
    .spec_rd_wdata(spec_insn_p_max_rd_wdata),
    .spec_pc_wdata(spec_insn_p_max_pc_wdata),
    .spec_mem_addr(spec_insn_p_max_mem_addr),
    .spec_mem_rmask(spec_insn_p_max_mem_rmask),
    .spec_mem_wmask(spec_insn_p_max_mem_wmask),
    .spec_mem_wdata(spec_insn_p_max_mem_wdata)
  );

  wire                                spec_insn_p_maxu_valid;
  wire                                spec_insn_p_maxu_trap;
  wire [                       4 : 0] spec_insn_p_maxu_rs1_addr;
  wire [                       4 : 0] spec_insn_p_maxu_rs2_addr;
  wire [                       4 : 0] spec_insn_p_maxu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_maxu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_maxu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_maxu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_maxu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_maxu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_maxu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_maxu_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_maxu_rs3_addr;
`endif

  rvfi_insn_p_maxu insn_p_maxu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_maxu_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_maxu_rs3_addr),
`endif
    .spec_valid(spec_insn_p_maxu_valid),
    .spec_trap(spec_insn_p_maxu_trap),
    .spec_rs1_addr(spec_insn_p_maxu_rs1_addr),
    .spec_rs2_addr(spec_insn_p_maxu_rs2_addr),
    .spec_rd_addr(spec_insn_p_maxu_rd_addr),
    .spec_rd_wdata(spec_insn_p_maxu_rd_wdata),
    .spec_pc_wdata(spec_insn_p_maxu_pc_wdata),
    .spec_mem_addr(spec_insn_p_maxu_mem_addr),
    .spec_mem_rmask(spec_insn_p_maxu_mem_rmask),
    .spec_mem_wmask(spec_insn_p_maxu_mem_wmask),
    .spec_mem_wdata(spec_insn_p_maxu_mem_wdata)
  );

  wire                                spec_insn_p_min_valid;
  wire                                spec_insn_p_min_trap;
  wire [                       4 : 0] spec_insn_p_min_rs1_addr;
  wire [                       4 : 0] spec_insn_p_min_rs2_addr;
  wire [                       4 : 0] spec_insn_p_min_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_min_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_min_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_min_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_min_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_min_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_min_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_min_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_min_rs3_addr;
`endif

  rvfi_insn_p_min insn_p_min (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_min_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_min_rs3_addr),
`endif
    .spec_valid(spec_insn_p_min_valid),
    .spec_trap(spec_insn_p_min_trap),
    .spec_rs1_addr(spec_insn_p_min_rs1_addr),
    .spec_rs2_addr(spec_insn_p_min_rs2_addr),
    .spec_rd_addr(spec_insn_p_min_rd_addr),
    .spec_rd_wdata(spec_insn_p_min_rd_wdata),
    .spec_pc_wdata(spec_insn_p_min_pc_wdata),
    .spec_mem_addr(spec_insn_p_min_mem_addr),
    .spec_mem_rmask(spec_insn_p_min_mem_rmask),
    .spec_mem_wmask(spec_insn_p_min_mem_wmask),
    .spec_mem_wdata(spec_insn_p_min_mem_wdata)
  );

  wire                                spec_insn_p_minu_valid;
  wire                                spec_insn_p_minu_trap;
  wire [                       4 : 0] spec_insn_p_minu_rs1_addr;
  wire [                       4 : 0] spec_insn_p_minu_rs2_addr;
  wire [                       4 : 0] spec_insn_p_minu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_minu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_minu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_minu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_minu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_minu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_minu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_minu_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_minu_rs3_addr;
`endif

  rvfi_insn_p_minu insn_p_minu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_minu_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_minu_rs3_addr),
`endif
    .spec_valid(spec_insn_p_minu_valid),
    .spec_trap(spec_insn_p_minu_trap),
    .spec_rs1_addr(spec_insn_p_minu_rs1_addr),
    .spec_rs2_addr(spec_insn_p_minu_rs2_addr),
    .spec_rd_addr(spec_insn_p_minu_rd_addr),
    .spec_rd_wdata(spec_insn_p_minu_rd_wdata),
    .spec_pc_wdata(spec_insn_p_minu_pc_wdata),
    .spec_mem_addr(spec_insn_p_minu_mem_addr),
    .spec_mem_rmask(spec_insn_p_minu_mem_rmask),
    .spec_mem_wmask(spec_insn_p_minu_mem_wmask),
    .spec_mem_wdata(spec_insn_p_minu_mem_wdata)
  );

  wire                                spec_insn_p_ror_valid;
  wire                                spec_insn_p_ror_trap;
  wire [                       4 : 0] spec_insn_p_ror_rs1_addr;
  wire [                       4 : 0] spec_insn_p_ror_rs2_addr;
  wire [                       4 : 0] spec_insn_p_ror_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_ror_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_ror_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_ror_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_ror_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_ror_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_ror_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_ror_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_ror_rs3_addr;
`endif

  rvfi_insn_p_ror insn_p_ror (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_ror_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_ror_rs3_addr),
`endif
    .spec_valid(spec_insn_p_ror_valid),
    .spec_trap(spec_insn_p_ror_trap),
    .spec_rs1_addr(spec_insn_p_ror_rs1_addr),
    .spec_rs2_addr(spec_insn_p_ror_rs2_addr),
    .spec_rd_addr(spec_insn_p_ror_rd_addr),
    .spec_rd_wdata(spec_insn_p_ror_rd_wdata),
    .spec_pc_wdata(spec_insn_p_ror_pc_wdata),
    .spec_mem_addr(spec_insn_p_ror_mem_addr),
    .spec_mem_rmask(spec_insn_p_ror_mem_rmask),
    .spec_mem_wmask(spec_insn_p_ror_mem_wmask),
    .spec_mem_wdata(spec_insn_p_ror_mem_wdata)
  );

  wire                                spec_insn_p_sb_valid;
  wire                                spec_insn_p_sb_trap;
  wire [                       4 : 0] spec_insn_p_sb_rs1_addr;
  wire [                       4 : 0] spec_insn_p_sb_rs2_addr;
  wire [                       4 : 0] spec_insn_p_sb_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sb_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sb_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sb_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_sb_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_sb_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sb_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sb_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_sb_rs3_addr;
`endif

  rvfi_insn_p_sb insn_p_sb (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_sb_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_sb_rs3_addr),
`endif
    .spec_valid(spec_insn_p_sb_valid),
    .spec_trap(spec_insn_p_sb_trap),
    .spec_rs1_addr(spec_insn_p_sb_rs1_addr),
    .spec_rs2_addr(spec_insn_p_sb_rs2_addr),
    .spec_rd_addr(spec_insn_p_sb_rd_addr),
    .spec_rd_wdata(spec_insn_p_sb_rd_wdata),
    .spec_pc_wdata(spec_insn_p_sb_pc_wdata),
    .spec_mem_addr(spec_insn_p_sb_mem_addr),
    .spec_mem_rmask(spec_insn_p_sb_mem_rmask),
    .spec_mem_wmask(spec_insn_p_sb_mem_wmask),
    .spec_mem_wdata(spec_insn_p_sb_mem_wdata)
  );

  wire                                spec_insn_p_sh_valid;
  wire                                spec_insn_p_sh_trap;
  wire [                       4 : 0] spec_insn_p_sh_rs1_addr;
  wire [                       4 : 0] spec_insn_p_sh_rs2_addr;
  wire [                       4 : 0] spec_insn_p_sh_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sh_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sh_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sh_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_sh_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_sh_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sh_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sh_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_sh_rs3_addr;
`endif

  rvfi_insn_p_sh insn_p_sh (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_sh_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_sh_rs3_addr),
`endif
    .spec_valid(spec_insn_p_sh_valid),
    .spec_trap(spec_insn_p_sh_trap),
    .spec_rs1_addr(spec_insn_p_sh_rs1_addr),
    .spec_rs2_addr(spec_insn_p_sh_rs2_addr),
    .spec_rd_addr(spec_insn_p_sh_rd_addr),
    .spec_rd_wdata(spec_insn_p_sh_rd_wdata),
    .spec_pc_wdata(spec_insn_p_sh_pc_wdata),
    .spec_mem_addr(spec_insn_p_sh_mem_addr),
    .spec_mem_rmask(spec_insn_p_sh_mem_rmask),
    .spec_mem_wmask(spec_insn_p_sh_mem_wmask),
    .spec_mem_wdata(spec_insn_p_sh_mem_wdata)
  );

  wire                                spec_insn_p_slet_valid;
  wire                                spec_insn_p_slet_trap;
  wire [                       4 : 0] spec_insn_p_slet_rs1_addr;
  wire [                       4 : 0] spec_insn_p_slet_rs2_addr;
  wire [                       4 : 0] spec_insn_p_slet_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_slet_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_slet_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_slet_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_slet_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_slet_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_slet_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_slet_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_slet_rs3_addr;
`endif

  rvfi_insn_p_slet insn_p_slet (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_slet_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_slet_rs3_addr),
`endif
    .spec_valid(spec_insn_p_slet_valid),
    .spec_trap(spec_insn_p_slet_trap),
    .spec_rs1_addr(spec_insn_p_slet_rs1_addr),
    .spec_rs2_addr(spec_insn_p_slet_rs2_addr),
    .spec_rd_addr(spec_insn_p_slet_rd_addr),
    .spec_rd_wdata(spec_insn_p_slet_rd_wdata),
    .spec_pc_wdata(spec_insn_p_slet_pc_wdata),
    .spec_mem_addr(spec_insn_p_slet_mem_addr),
    .spec_mem_rmask(spec_insn_p_slet_mem_rmask),
    .spec_mem_wmask(spec_insn_p_slet_mem_wmask),
    .spec_mem_wdata(spec_insn_p_slet_mem_wdata)
  );

  wire                                spec_insn_p_sletu_valid;
  wire                                spec_insn_p_sletu_trap;
  wire [                       4 : 0] spec_insn_p_sletu_rs1_addr;
  wire [                       4 : 0] spec_insn_p_sletu_rs2_addr;
  wire [                       4 : 0] spec_insn_p_sletu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sletu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sletu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sletu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_sletu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_sletu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sletu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sletu_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_sletu_rs3_addr;
`endif

  rvfi_insn_p_sletu insn_p_sletu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_sletu_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_sletu_rs3_addr),
`endif
    .spec_valid(spec_insn_p_sletu_valid),
    .spec_trap(spec_insn_p_sletu_trap),
    .spec_rs1_addr(spec_insn_p_sletu_rs1_addr),
    .spec_rs2_addr(spec_insn_p_sletu_rs2_addr),
    .spec_rd_addr(spec_insn_p_sletu_rd_addr),
    .spec_rd_wdata(spec_insn_p_sletu_rd_wdata),
    .spec_pc_wdata(spec_insn_p_sletu_pc_wdata),
    .spec_mem_addr(spec_insn_p_sletu_mem_addr),
    .spec_mem_rmask(spec_insn_p_sletu_mem_rmask),
    .spec_mem_wmask(spec_insn_p_sletu_mem_wmask),
    .spec_mem_wdata(spec_insn_p_sletu_mem_wdata)
  );

  wire                                spec_insn_p_subN_valid;
  wire                                spec_insn_p_subN_trap;
  wire [                       4 : 0] spec_insn_p_subN_rs1_addr;
  wire [                       4 : 0] spec_insn_p_subN_rs2_addr;
  wire [                       4 : 0] spec_insn_p_subN_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subN_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subN_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subN_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_subN_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_subN_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subN_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subN_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_subN_rs3_addr;
`endif

  rvfi_insn_p_subN insn_p_subN (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_subN_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_subN_rs3_addr),
`endif
    .spec_valid(spec_insn_p_subN_valid),
    .spec_trap(spec_insn_p_subN_trap),
    .spec_rs1_addr(spec_insn_p_subN_rs1_addr),
    .spec_rs2_addr(spec_insn_p_subN_rs2_addr),
    .spec_rd_addr(spec_insn_p_subN_rd_addr),
    .spec_rd_wdata(spec_insn_p_subN_rd_wdata),
    .spec_pc_wdata(spec_insn_p_subN_pc_wdata),
    .spec_mem_addr(spec_insn_p_subN_mem_addr),
    .spec_mem_rmask(spec_insn_p_subN_mem_rmask),
    .spec_mem_wmask(spec_insn_p_subN_mem_wmask),
    .spec_mem_wdata(spec_insn_p_subN_mem_wdata)
  );

  wire                                spec_insn_p_subNr_valid;
  wire                                spec_insn_p_subNr_trap;
  wire [                       4 : 0] spec_insn_p_subNr_rs1_addr;
  wire [                       4 : 0] spec_insn_p_subNr_rs2_addr;
  wire [                       4 : 0] spec_insn_p_subNr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subNr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subNr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subNr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_subNr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_subNr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subNr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subNr_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_subNr_rs3_addr;
`endif

  rvfi_insn_p_subNr insn_p_subNr (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_subNr_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_subNr_rs3_addr),
`endif
    .spec_valid(spec_insn_p_subNr_valid),
    .spec_trap(spec_insn_p_subNr_trap),
    .spec_rs1_addr(spec_insn_p_subNr_rs1_addr),
    .spec_rs2_addr(spec_insn_p_subNr_rs2_addr),
    .spec_rd_addr(spec_insn_p_subNr_rd_addr),
    .spec_rd_wdata(spec_insn_p_subNr_rd_wdata),
    .spec_pc_wdata(spec_insn_p_subNr_pc_wdata),
    .spec_mem_addr(spec_insn_p_subNr_mem_addr),
    .spec_mem_rmask(spec_insn_p_subNr_mem_rmask),
    .spec_mem_wmask(spec_insn_p_subNr_mem_wmask),
    .spec_mem_wdata(spec_insn_p_subNr_mem_wdata)
  );

  wire                                spec_insn_p_subRN_valid;
  wire                                spec_insn_p_subRN_trap;
  wire [                       4 : 0] spec_insn_p_subRN_rs1_addr;
  wire [                       4 : 0] spec_insn_p_subRN_rs2_addr;
  wire [                       4 : 0] spec_insn_p_subRN_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subRN_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subRN_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subRN_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_subRN_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_subRN_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subRN_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subRN_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_subRN_rs3_addr;
`endif

  rvfi_insn_p_subRN insn_p_subRN (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_subRN_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_subRN_rs3_addr),
`endif
    .spec_valid(spec_insn_p_subRN_valid),
    .spec_trap(spec_insn_p_subRN_trap),
    .spec_rs1_addr(spec_insn_p_subRN_rs1_addr),
    .spec_rs2_addr(spec_insn_p_subRN_rs2_addr),
    .spec_rd_addr(spec_insn_p_subRN_rd_addr),
    .spec_rd_wdata(spec_insn_p_subRN_rd_wdata),
    .spec_pc_wdata(spec_insn_p_subRN_pc_wdata),
    .spec_mem_addr(spec_insn_p_subRN_mem_addr),
    .spec_mem_rmask(spec_insn_p_subRN_mem_rmask),
    .spec_mem_wmask(spec_insn_p_subRN_mem_wmask),
    .spec_mem_wdata(spec_insn_p_subRN_mem_wdata)
  );

  wire                                spec_insn_p_subRNr_valid;
  wire                                spec_insn_p_subRNr_trap;
  wire [                       4 : 0] spec_insn_p_subRNr_rs1_addr;
  wire [                       4 : 0] spec_insn_p_subRNr_rs2_addr;
  wire [                       4 : 0] spec_insn_p_subRNr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subRNr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subRNr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subRNr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_subRNr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_subRNr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subRNr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subRNr_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_subRNr_rs3_addr;
`endif

  rvfi_insn_p_subRNr insn_p_subRNr (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_subRNr_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_subRNr_rs3_addr),
`endif
    .spec_valid(spec_insn_p_subRNr_valid),
    .spec_trap(spec_insn_p_subRNr_trap),
    .spec_rs1_addr(spec_insn_p_subRNr_rs1_addr),
    .spec_rs2_addr(spec_insn_p_subRNr_rs2_addr),
    .spec_rd_addr(spec_insn_p_subRNr_rd_addr),
    .spec_rd_wdata(spec_insn_p_subRNr_rd_wdata),
    .spec_pc_wdata(spec_insn_p_subRNr_pc_wdata),
    .spec_mem_addr(spec_insn_p_subRNr_mem_addr),
    .spec_mem_rmask(spec_insn_p_subRNr_mem_rmask),
    .spec_mem_wmask(spec_insn_p_subRNr_mem_wmask),
    .spec_mem_wdata(spec_insn_p_subRNr_mem_wdata)
  );

  wire                                spec_insn_p_subuN_valid;
  wire                                spec_insn_p_subuN_trap;
  wire [                       4 : 0] spec_insn_p_subuN_rs1_addr;
  wire [                       4 : 0] spec_insn_p_subuN_rs2_addr;
  wire [                       4 : 0] spec_insn_p_subuN_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuN_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuN_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuN_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_subuN_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_subuN_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuN_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuN_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_subuN_rs3_addr;
`endif

  rvfi_insn_p_subuN insn_p_subuN (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_subuN_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_subuN_rs3_addr),
`endif
    .spec_valid(spec_insn_p_subuN_valid),
    .spec_trap(spec_insn_p_subuN_trap),
    .spec_rs1_addr(spec_insn_p_subuN_rs1_addr),
    .spec_rs2_addr(spec_insn_p_subuN_rs2_addr),
    .spec_rd_addr(spec_insn_p_subuN_rd_addr),
    .spec_rd_wdata(spec_insn_p_subuN_rd_wdata),
    .spec_pc_wdata(spec_insn_p_subuN_pc_wdata),
    .spec_mem_addr(spec_insn_p_subuN_mem_addr),
    .spec_mem_rmask(spec_insn_p_subuN_mem_rmask),
    .spec_mem_wmask(spec_insn_p_subuN_mem_wmask),
    .spec_mem_wdata(spec_insn_p_subuN_mem_wdata)
  );

  wire                                spec_insn_p_subuNr_valid;
  wire                                spec_insn_p_subuNr_trap;
  wire [                       4 : 0] spec_insn_p_subuNr_rs1_addr;
  wire [                       4 : 0] spec_insn_p_subuNr_rs2_addr;
  wire [                       4 : 0] spec_insn_p_subuNr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuNr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuNr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuNr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_subuNr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_subuNr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuNr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuNr_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_subuNr_rs3_addr;
`endif

  rvfi_insn_p_subuNr insn_p_subuNr (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_subuNr_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_subuNr_rs3_addr),
`endif
    .spec_valid(spec_insn_p_subuNr_valid),
    .spec_trap(spec_insn_p_subuNr_trap),
    .spec_rs1_addr(spec_insn_p_subuNr_rs1_addr),
    .spec_rs2_addr(spec_insn_p_subuNr_rs2_addr),
    .spec_rd_addr(spec_insn_p_subuNr_rd_addr),
    .spec_rd_wdata(spec_insn_p_subuNr_rd_wdata),
    .spec_pc_wdata(spec_insn_p_subuNr_pc_wdata),
    .spec_mem_addr(spec_insn_p_subuNr_mem_addr),
    .spec_mem_rmask(spec_insn_p_subuNr_mem_rmask),
    .spec_mem_wmask(spec_insn_p_subuNr_mem_wmask),
    .spec_mem_wdata(spec_insn_p_subuNr_mem_wdata)
  );

  wire                                spec_insn_p_subuRN_valid;
  wire                                spec_insn_p_subuRN_trap;
  wire [                       4 : 0] spec_insn_p_subuRN_rs1_addr;
  wire [                       4 : 0] spec_insn_p_subuRN_rs2_addr;
  wire [                       4 : 0] spec_insn_p_subuRN_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuRN_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuRN_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuRN_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_subuRN_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_subuRN_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuRN_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuRN_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_subuRN_rs3_addr;
`endif

  rvfi_insn_p_subuRN insn_p_subuRN (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_subuRN_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_subuRN_rs3_addr),
`endif
    .spec_valid(spec_insn_p_subuRN_valid),
    .spec_trap(spec_insn_p_subuRN_trap),
    .spec_rs1_addr(spec_insn_p_subuRN_rs1_addr),
    .spec_rs2_addr(spec_insn_p_subuRN_rs2_addr),
    .spec_rd_addr(spec_insn_p_subuRN_rd_addr),
    .spec_rd_wdata(spec_insn_p_subuRN_rd_wdata),
    .spec_pc_wdata(spec_insn_p_subuRN_pc_wdata),
    .spec_mem_addr(spec_insn_p_subuRN_mem_addr),
    .spec_mem_rmask(spec_insn_p_subuRN_mem_rmask),
    .spec_mem_wmask(spec_insn_p_subuRN_mem_wmask),
    .spec_mem_wdata(spec_insn_p_subuRN_mem_wdata)
  );

  wire                                spec_insn_p_subuRNr_valid;
  wire                                spec_insn_p_subuRNr_trap;
  wire [                       4 : 0] spec_insn_p_subuRNr_rs1_addr;
  wire [                       4 : 0] spec_insn_p_subuRNr_rs2_addr;
  wire [                       4 : 0] spec_insn_p_subuRNr_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuRNr_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuRNr_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuRNr_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_subuRNr_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_subuRNr_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuRNr_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_subuRNr_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_subuRNr_rs3_addr;
`endif

  rvfi_insn_p_subuRNr insn_p_subuRNr (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_subuRNr_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_subuRNr_rs3_addr),
`endif
    .spec_valid(spec_insn_p_subuRNr_valid),
    .spec_trap(spec_insn_p_subuRNr_trap),
    .spec_rs1_addr(spec_insn_p_subuRNr_rs1_addr),
    .spec_rs2_addr(spec_insn_p_subuRNr_rs2_addr),
    .spec_rd_addr(spec_insn_p_subuRNr_rd_addr),
    .spec_rd_wdata(spec_insn_p_subuRNr_rd_wdata),
    .spec_pc_wdata(spec_insn_p_subuRNr_pc_wdata),
    .spec_mem_addr(spec_insn_p_subuRNr_mem_addr),
    .spec_mem_rmask(spec_insn_p_subuRNr_mem_rmask),
    .spec_mem_wmask(spec_insn_p_subuRNr_mem_wmask),
    .spec_mem_wdata(spec_insn_p_subuRNr_mem_wdata)
  );

  wire                                spec_insn_p_sw_valid;
  wire                                spec_insn_p_sw_trap;
  wire [                       4 : 0] spec_insn_p_sw_rs1_addr;
  wire [                       4 : 0] spec_insn_p_sw_rs2_addr;
  wire [                       4 : 0] spec_insn_p_sw_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sw_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sw_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sw_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_sw_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_p_sw_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sw_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_p_sw_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_p_sw_rs3_addr;
`endif

  rvfi_insn_p_sw insn_p_sw (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_p_sw_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_p_sw_rs3_addr),
`endif
    .spec_valid(spec_insn_p_sw_valid),
    .spec_trap(spec_insn_p_sw_trap),
    .spec_rs1_addr(spec_insn_p_sw_rs1_addr),
    .spec_rs2_addr(spec_insn_p_sw_rs2_addr),
    .spec_rd_addr(spec_insn_p_sw_rd_addr),
    .spec_rd_wdata(spec_insn_p_sw_rd_wdata),
    .spec_pc_wdata(spec_insn_p_sw_pc_wdata),
    .spec_mem_addr(spec_insn_p_sw_mem_addr),
    .spec_mem_rmask(spec_insn_p_sw_mem_rmask),
    .spec_mem_wmask(spec_insn_p_sw_mem_wmask),
    .spec_mem_wdata(spec_insn_p_sw_mem_wdata)
  );

  wire                                spec_insn_sb_valid;
  wire                                spec_insn_sb_trap;
  wire [                       4 : 0] spec_insn_sb_rs1_addr;
  wire [                       4 : 0] spec_insn_sb_rs2_addr;
  wire [                       4 : 0] spec_insn_sb_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sb_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sb_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sb_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_sb_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_sb_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sb_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sb_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_sb_rs3_addr;
`endif

  rvfi_insn_sb insn_sb (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_sb_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_sb_rs3_addr),
`endif
    .spec_valid(spec_insn_sb_valid),
    .spec_trap(spec_insn_sb_trap),
    .spec_rs1_addr(spec_insn_sb_rs1_addr),
    .spec_rs2_addr(spec_insn_sb_rs2_addr),
    .spec_rd_addr(spec_insn_sb_rd_addr),
    .spec_rd_wdata(spec_insn_sb_rd_wdata),
    .spec_pc_wdata(spec_insn_sb_pc_wdata),
    .spec_mem_addr(spec_insn_sb_mem_addr),
    .spec_mem_rmask(spec_insn_sb_mem_rmask),
    .spec_mem_wmask(spec_insn_sb_mem_wmask),
    .spec_mem_wdata(spec_insn_sb_mem_wdata)
  );

  wire                                spec_insn_sh_valid;
  wire                                spec_insn_sh_trap;
  wire [                       4 : 0] spec_insn_sh_rs1_addr;
  wire [                       4 : 0] spec_insn_sh_rs2_addr;
  wire [                       4 : 0] spec_insn_sh_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sh_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sh_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sh_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_sh_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_sh_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sh_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sh_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_sh_rs3_addr;
`endif

  rvfi_insn_sh insn_sh (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_sh_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_sh_rs3_addr),
`endif
    .spec_valid(spec_insn_sh_valid),
    .spec_trap(spec_insn_sh_trap),
    .spec_rs1_addr(spec_insn_sh_rs1_addr),
    .spec_rs2_addr(spec_insn_sh_rs2_addr),
    .spec_rd_addr(spec_insn_sh_rd_addr),
    .spec_rd_wdata(spec_insn_sh_rd_wdata),
    .spec_pc_wdata(spec_insn_sh_pc_wdata),
    .spec_mem_addr(spec_insn_sh_mem_addr),
    .spec_mem_rmask(spec_insn_sh_mem_rmask),
    .spec_mem_wmask(spec_insn_sh_mem_wmask),
    .spec_mem_wdata(spec_insn_sh_mem_wdata)
  );

  wire                                spec_insn_sll_valid;
  wire                                spec_insn_sll_trap;
  wire [                       4 : 0] spec_insn_sll_rs1_addr;
  wire [                       4 : 0] spec_insn_sll_rs2_addr;
  wire [                       4 : 0] spec_insn_sll_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sll_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sll_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sll_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_sll_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_sll_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sll_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sll_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_sll_rs3_addr;
`endif

  rvfi_insn_sll insn_sll (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_sll_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_sll_rs3_addr),
`endif
    .spec_valid(spec_insn_sll_valid),
    .spec_trap(spec_insn_sll_trap),
    .spec_rs1_addr(spec_insn_sll_rs1_addr),
    .spec_rs2_addr(spec_insn_sll_rs2_addr),
    .spec_rd_addr(spec_insn_sll_rd_addr),
    .spec_rd_wdata(spec_insn_sll_rd_wdata),
    .spec_pc_wdata(spec_insn_sll_pc_wdata),
    .spec_mem_addr(spec_insn_sll_mem_addr),
    .spec_mem_rmask(spec_insn_sll_mem_rmask),
    .spec_mem_wmask(spec_insn_sll_mem_wmask),
    .spec_mem_wdata(spec_insn_sll_mem_wdata)
  );

  wire                                spec_insn_slli_valid;
  wire                                spec_insn_slli_trap;
  wire [                       4 : 0] spec_insn_slli_rs1_addr;
  wire [                       4 : 0] spec_insn_slli_rs2_addr;
  wire [                       4 : 0] spec_insn_slli_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_slli_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_slli_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_slli_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_slli_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_slli_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_slli_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_slli_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_slli_rs3_addr;
`endif

  rvfi_insn_slli insn_slli (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_slli_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_slli_rs3_addr),
`endif
    .spec_valid(spec_insn_slli_valid),
    .spec_trap(spec_insn_slli_trap),
    .spec_rs1_addr(spec_insn_slli_rs1_addr),
    .spec_rs2_addr(spec_insn_slli_rs2_addr),
    .spec_rd_addr(spec_insn_slli_rd_addr),
    .spec_rd_wdata(spec_insn_slli_rd_wdata),
    .spec_pc_wdata(spec_insn_slli_pc_wdata),
    .spec_mem_addr(spec_insn_slli_mem_addr),
    .spec_mem_rmask(spec_insn_slli_mem_rmask),
    .spec_mem_wmask(spec_insn_slli_mem_wmask),
    .spec_mem_wdata(spec_insn_slli_mem_wdata)
  );

  wire                                spec_insn_slt_valid;
  wire                                spec_insn_slt_trap;
  wire [                       4 : 0] spec_insn_slt_rs1_addr;
  wire [                       4 : 0] spec_insn_slt_rs2_addr;
  wire [                       4 : 0] spec_insn_slt_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_slt_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_slt_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_slt_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_slt_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_slt_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_slt_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_slt_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_slt_rs3_addr;
`endif

  rvfi_insn_slt insn_slt (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_slt_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_slt_rs3_addr),
`endif
    .spec_valid(spec_insn_slt_valid),
    .spec_trap(spec_insn_slt_trap),
    .spec_rs1_addr(spec_insn_slt_rs1_addr),
    .spec_rs2_addr(spec_insn_slt_rs2_addr),
    .spec_rd_addr(spec_insn_slt_rd_addr),
    .spec_rd_wdata(spec_insn_slt_rd_wdata),
    .spec_pc_wdata(spec_insn_slt_pc_wdata),
    .spec_mem_addr(spec_insn_slt_mem_addr),
    .spec_mem_rmask(spec_insn_slt_mem_rmask),
    .spec_mem_wmask(spec_insn_slt_mem_wmask),
    .spec_mem_wdata(spec_insn_slt_mem_wdata)
  );

  wire                                spec_insn_slti_valid;
  wire                                spec_insn_slti_trap;
  wire [                       4 : 0] spec_insn_slti_rs1_addr;
  wire [                       4 : 0] spec_insn_slti_rs2_addr;
  wire [                       4 : 0] spec_insn_slti_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_slti_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_slti_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_slti_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_slti_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_slti_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_slti_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_slti_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_slti_rs3_addr;
`endif

  rvfi_insn_slti insn_slti (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_slti_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_slti_rs3_addr),
`endif
    .spec_valid(spec_insn_slti_valid),
    .spec_trap(spec_insn_slti_trap),
    .spec_rs1_addr(spec_insn_slti_rs1_addr),
    .spec_rs2_addr(spec_insn_slti_rs2_addr),
    .spec_rd_addr(spec_insn_slti_rd_addr),
    .spec_rd_wdata(spec_insn_slti_rd_wdata),
    .spec_pc_wdata(spec_insn_slti_pc_wdata),
    .spec_mem_addr(spec_insn_slti_mem_addr),
    .spec_mem_rmask(spec_insn_slti_mem_rmask),
    .spec_mem_wmask(spec_insn_slti_mem_wmask),
    .spec_mem_wdata(spec_insn_slti_mem_wdata)
  );

  wire                                spec_insn_sltiu_valid;
  wire                                spec_insn_sltiu_trap;
  wire [                       4 : 0] spec_insn_sltiu_rs1_addr;
  wire [                       4 : 0] spec_insn_sltiu_rs2_addr;
  wire [                       4 : 0] spec_insn_sltiu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sltiu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sltiu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sltiu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_sltiu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_sltiu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sltiu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sltiu_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_sltiu_rs3_addr;
`endif

  rvfi_insn_sltiu insn_sltiu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_sltiu_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_sltiu_rs3_addr),
`endif
    .spec_valid(spec_insn_sltiu_valid),
    .spec_trap(spec_insn_sltiu_trap),
    .spec_rs1_addr(spec_insn_sltiu_rs1_addr),
    .spec_rs2_addr(spec_insn_sltiu_rs2_addr),
    .spec_rd_addr(spec_insn_sltiu_rd_addr),
    .spec_rd_wdata(spec_insn_sltiu_rd_wdata),
    .spec_pc_wdata(spec_insn_sltiu_pc_wdata),
    .spec_mem_addr(spec_insn_sltiu_mem_addr),
    .spec_mem_rmask(spec_insn_sltiu_mem_rmask),
    .spec_mem_wmask(spec_insn_sltiu_mem_wmask),
    .spec_mem_wdata(spec_insn_sltiu_mem_wdata)
  );

  wire                                spec_insn_sltu_valid;
  wire                                spec_insn_sltu_trap;
  wire [                       4 : 0] spec_insn_sltu_rs1_addr;
  wire [                       4 : 0] spec_insn_sltu_rs2_addr;
  wire [                       4 : 0] spec_insn_sltu_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sltu_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sltu_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sltu_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_sltu_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_sltu_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sltu_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sltu_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_sltu_rs3_addr;
`endif

  rvfi_insn_sltu insn_sltu (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_sltu_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_sltu_rs3_addr),
`endif
    .spec_valid(spec_insn_sltu_valid),
    .spec_trap(spec_insn_sltu_trap),
    .spec_rs1_addr(spec_insn_sltu_rs1_addr),
    .spec_rs2_addr(spec_insn_sltu_rs2_addr),
    .spec_rd_addr(spec_insn_sltu_rd_addr),
    .spec_rd_wdata(spec_insn_sltu_rd_wdata),
    .spec_pc_wdata(spec_insn_sltu_pc_wdata),
    .spec_mem_addr(spec_insn_sltu_mem_addr),
    .spec_mem_rmask(spec_insn_sltu_mem_rmask),
    .spec_mem_wmask(spec_insn_sltu_mem_wmask),
    .spec_mem_wdata(spec_insn_sltu_mem_wdata)
  );

  wire                                spec_insn_sra_valid;
  wire                                spec_insn_sra_trap;
  wire [                       4 : 0] spec_insn_sra_rs1_addr;
  wire [                       4 : 0] spec_insn_sra_rs2_addr;
  wire [                       4 : 0] spec_insn_sra_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sra_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sra_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sra_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_sra_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_sra_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sra_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sra_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_sra_rs3_addr;
`endif

  rvfi_insn_sra insn_sra (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_sra_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_sra_rs3_addr),
`endif
    .spec_valid(spec_insn_sra_valid),
    .spec_trap(spec_insn_sra_trap),
    .spec_rs1_addr(spec_insn_sra_rs1_addr),
    .spec_rs2_addr(spec_insn_sra_rs2_addr),
    .spec_rd_addr(spec_insn_sra_rd_addr),
    .spec_rd_wdata(spec_insn_sra_rd_wdata),
    .spec_pc_wdata(spec_insn_sra_pc_wdata),
    .spec_mem_addr(spec_insn_sra_mem_addr),
    .spec_mem_rmask(spec_insn_sra_mem_rmask),
    .spec_mem_wmask(spec_insn_sra_mem_wmask),
    .spec_mem_wdata(spec_insn_sra_mem_wdata)
  );

  wire                                spec_insn_srai_valid;
  wire                                spec_insn_srai_trap;
  wire [                       4 : 0] spec_insn_srai_rs1_addr;
  wire [                       4 : 0] spec_insn_srai_rs2_addr;
  wire [                       4 : 0] spec_insn_srai_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_srai_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_srai_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_srai_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_srai_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_srai_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_srai_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_srai_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_srai_rs3_addr;
`endif

  rvfi_insn_srai insn_srai (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_srai_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_srai_rs3_addr),
`endif
    .spec_valid(spec_insn_srai_valid),
    .spec_trap(spec_insn_srai_trap),
    .spec_rs1_addr(spec_insn_srai_rs1_addr),
    .spec_rs2_addr(spec_insn_srai_rs2_addr),
    .spec_rd_addr(spec_insn_srai_rd_addr),
    .spec_rd_wdata(spec_insn_srai_rd_wdata),
    .spec_pc_wdata(spec_insn_srai_pc_wdata),
    .spec_mem_addr(spec_insn_srai_mem_addr),
    .spec_mem_rmask(spec_insn_srai_mem_rmask),
    .spec_mem_wmask(spec_insn_srai_mem_wmask),
    .spec_mem_wdata(spec_insn_srai_mem_wdata)
  );

  wire                                spec_insn_srl_valid;
  wire                                spec_insn_srl_trap;
  wire [                       4 : 0] spec_insn_srl_rs1_addr;
  wire [                       4 : 0] spec_insn_srl_rs2_addr;
  wire [                       4 : 0] spec_insn_srl_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_srl_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_srl_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_srl_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_srl_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_srl_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_srl_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_srl_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_srl_rs3_addr;
`endif

  rvfi_insn_srl insn_srl (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_srl_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_srl_rs3_addr),
`endif
    .spec_valid(spec_insn_srl_valid),
    .spec_trap(spec_insn_srl_trap),
    .spec_rs1_addr(spec_insn_srl_rs1_addr),
    .spec_rs2_addr(spec_insn_srl_rs2_addr),
    .spec_rd_addr(spec_insn_srl_rd_addr),
    .spec_rd_wdata(spec_insn_srl_rd_wdata),
    .spec_pc_wdata(spec_insn_srl_pc_wdata),
    .spec_mem_addr(spec_insn_srl_mem_addr),
    .spec_mem_rmask(spec_insn_srl_mem_rmask),
    .spec_mem_wmask(spec_insn_srl_mem_wmask),
    .spec_mem_wdata(spec_insn_srl_mem_wdata)
  );

  wire                                spec_insn_srli_valid;
  wire                                spec_insn_srli_trap;
  wire [                       4 : 0] spec_insn_srli_rs1_addr;
  wire [                       4 : 0] spec_insn_srli_rs2_addr;
  wire [                       4 : 0] spec_insn_srli_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_srli_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_srli_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_srli_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_srli_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_srli_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_srli_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_srli_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_srli_rs3_addr;
`endif

  rvfi_insn_srli insn_srli (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_srli_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_srli_rs3_addr),
`endif
    .spec_valid(spec_insn_srli_valid),
    .spec_trap(spec_insn_srli_trap),
    .spec_rs1_addr(spec_insn_srli_rs1_addr),
    .spec_rs2_addr(spec_insn_srli_rs2_addr),
    .spec_rd_addr(spec_insn_srli_rd_addr),
    .spec_rd_wdata(spec_insn_srli_rd_wdata),
    .spec_pc_wdata(spec_insn_srli_pc_wdata),
    .spec_mem_addr(spec_insn_srli_mem_addr),
    .spec_mem_rmask(spec_insn_srli_mem_rmask),
    .spec_mem_wmask(spec_insn_srli_mem_wmask),
    .spec_mem_wdata(spec_insn_srli_mem_wdata)
  );

  wire                                spec_insn_sub_valid;
  wire                                spec_insn_sub_trap;
  wire [                       4 : 0] spec_insn_sub_rs1_addr;
  wire [                       4 : 0] spec_insn_sub_rs2_addr;
  wire [                       4 : 0] spec_insn_sub_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sub_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sub_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sub_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_sub_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_sub_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sub_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sub_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_sub_rs3_addr;
`endif

  rvfi_insn_sub insn_sub (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_sub_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_sub_rs3_addr),
`endif
    .spec_valid(spec_insn_sub_valid),
    .spec_trap(spec_insn_sub_trap),
    .spec_rs1_addr(spec_insn_sub_rs1_addr),
    .spec_rs2_addr(spec_insn_sub_rs2_addr),
    .spec_rd_addr(spec_insn_sub_rd_addr),
    .spec_rd_wdata(spec_insn_sub_rd_wdata),
    .spec_pc_wdata(spec_insn_sub_pc_wdata),
    .spec_mem_addr(spec_insn_sub_mem_addr),
    .spec_mem_rmask(spec_insn_sub_mem_rmask),
    .spec_mem_wmask(spec_insn_sub_mem_wmask),
    .spec_mem_wdata(spec_insn_sub_mem_wdata)
  );

  wire                                spec_insn_sw_valid;
  wire                                spec_insn_sw_trap;
  wire [                       4 : 0] spec_insn_sw_rs1_addr;
  wire [                       4 : 0] spec_insn_sw_rs2_addr;
  wire [                       4 : 0] spec_insn_sw_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sw_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sw_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sw_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_sw_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_sw_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sw_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_sw_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_sw_rs3_addr;
`endif

  rvfi_insn_sw insn_sw (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_sw_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_sw_rs3_addr),
`endif
    .spec_valid(spec_insn_sw_valid),
    .spec_trap(spec_insn_sw_trap),
    .spec_rs1_addr(spec_insn_sw_rs1_addr),
    .spec_rs2_addr(spec_insn_sw_rs2_addr),
    .spec_rd_addr(spec_insn_sw_rd_addr),
    .spec_rd_wdata(spec_insn_sw_rd_wdata),
    .spec_pc_wdata(spec_insn_sw_pc_wdata),
    .spec_mem_addr(spec_insn_sw_mem_addr),
    .spec_mem_rmask(spec_insn_sw_mem_rmask),
    .spec_mem_wmask(spec_insn_sw_mem_wmask),
    .spec_mem_wdata(spec_insn_sw_mem_wdata)
  );

  wire                                spec_insn_xor_valid;
  wire                                spec_insn_xor_trap;
  wire [                       4 : 0] spec_insn_xor_rs1_addr;
  wire [                       4 : 0] spec_insn_xor_rs2_addr;
  wire [                       4 : 0] spec_insn_xor_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_xor_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_xor_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_xor_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_xor_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_xor_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_xor_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_xor_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_xor_rs3_addr;
`endif

  rvfi_insn_xor insn_xor (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_xor_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_xor_rs3_addr),
`endif
    .spec_valid(spec_insn_xor_valid),
    .spec_trap(spec_insn_xor_trap),
    .spec_rs1_addr(spec_insn_xor_rs1_addr),
    .spec_rs2_addr(spec_insn_xor_rs2_addr),
    .spec_rd_addr(spec_insn_xor_rd_addr),
    .spec_rd_wdata(spec_insn_xor_rd_wdata),
    .spec_pc_wdata(spec_insn_xor_pc_wdata),
    .spec_mem_addr(spec_insn_xor_mem_addr),
    .spec_mem_rmask(spec_insn_xor_mem_rmask),
    .spec_mem_wmask(spec_insn_xor_mem_wmask),
    .spec_mem_wdata(spec_insn_xor_mem_wdata)
  );

  wire                                spec_insn_xori_valid;
  wire                                spec_insn_xori_trap;
  wire [                       4 : 0] spec_insn_xori_rs1_addr;
  wire [                       4 : 0] spec_insn_xori_rs2_addr;
  wire [                       4 : 0] spec_insn_xori_rd_addr;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_xori_rd_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_xori_pc_wdata;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_xori_mem_addr;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_xori_mem_rmask;
  wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_insn_xori_mem_wmask;
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_xori_mem_wdata;
`ifdef RISCV_FORMAL_CSR_MISA
  wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_insn_xori_csr_misa_rmask;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  wire [                       4 : 0] spec_insn_xori_rs3_addr;
`endif

  rvfi_insn_xori insn_xori (
    .rvfi_valid(rvfi_valid),
    .rvfi_insn(rvfi_insn),
    .rvfi_pc_rdata(rvfi_pc_rdata),
    .rvfi_rs1_rdata(rvfi_rs1_rdata),
    .rvfi_rs2_rdata(rvfi_rs2_rdata),
    .rvfi_mem_rdata(rvfi_mem_rdata),
`ifdef RISCV_FORMAL_CSR_MISA
    .rvfi_csr_misa_rdata(rvfi_csr_misa_rdata),
    .spec_csr_misa_rmask(spec_insn_xori_csr_misa_rmask),
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
    .rvfi_rs3_rdata(rvfi_rs3_rdata),
    .spec_rs3_addr(spec_insn_xori_rs3_addr),
`endif
    .spec_valid(spec_insn_xori_valid),
    .spec_trap(spec_insn_xori_trap),
    .spec_rs1_addr(spec_insn_xori_rs1_addr),
    .spec_rs2_addr(spec_insn_xori_rs2_addr),
    .spec_rd_addr(spec_insn_xori_rd_addr),
    .spec_rd_wdata(spec_insn_xori_rd_wdata),
    .spec_pc_wdata(spec_insn_xori_pc_wdata),
    .spec_mem_addr(spec_insn_xori_mem_addr),
    .spec_mem_rmask(spec_insn_xori_mem_rmask),
    .spec_mem_wmask(spec_insn_xori_mem_wmask),
    .spec_mem_wdata(spec_insn_xori_mem_wdata)
  );

  assign spec_valid =
		spec_insn_add_valid ? spec_insn_add_valid :
		spec_insn_addi_valid ? spec_insn_addi_valid :
		spec_insn_and_valid ? spec_insn_and_valid :
		spec_insn_andi_valid ? spec_insn_andi_valid :
		spec_insn_auipc_valid ? spec_insn_auipc_valid :
		spec_insn_beq_valid ? spec_insn_beq_valid :
		spec_insn_bge_valid ? spec_insn_bge_valid :
		spec_insn_bgeu_valid ? spec_insn_bgeu_valid :
		spec_insn_blt_valid ? spec_insn_blt_valid :
		spec_insn_bltu_valid ? spec_insn_bltu_valid :
		spec_insn_bne_valid ? spec_insn_bne_valid :
		spec_insn_jal_valid ? spec_insn_jal_valid :
		spec_insn_jalr_valid ? spec_insn_jalr_valid :
		spec_insn_lb_valid ? spec_insn_lb_valid :
		spec_insn_lbu_valid ? spec_insn_lbu_valid :
		spec_insn_lh_valid ? spec_insn_lh_valid :
		spec_insn_lhu_valid ? spec_insn_lhu_valid :
		spec_insn_lui_valid ? spec_insn_lui_valid :
		spec_insn_lw_valid ? spec_insn_lw_valid :
		spec_insn_or_valid ? spec_insn_or_valid :
		spec_insn_ori_valid ? spec_insn_ori_valid :
		spec_insn_p_abs_valid ? spec_insn_p_abs_valid :
		spec_insn_p_addN_valid ? spec_insn_p_addN_valid :
		spec_insn_p_addNr_valid ? spec_insn_p_addNr_valid :
		spec_insn_p_addRN_valid ? spec_insn_p_addRN_valid :
		spec_insn_p_addRNr_valid ? spec_insn_p_addRNr_valid :
		spec_insn_p_adduN_valid ? spec_insn_p_adduN_valid :
		spec_insn_p_adduNr_valid ? spec_insn_p_adduNr_valid :
		spec_insn_p_adduRN_valid ? spec_insn_p_adduRN_valid :
		spec_insn_p_adduRNr_valid ? spec_insn_p_adduRNr_valid :
		spec_insn_p_bclr_valid ? spec_insn_p_bclr_valid :
		spec_insn_p_bclrr_valid ? spec_insn_p_bclrr_valid :
		spec_insn_p_beqimm_valid ? spec_insn_p_beqimm_valid :
		spec_insn_p_bneimm_valid ? spec_insn_p_bneimm_valid :
		spec_insn_p_bset_valid ? spec_insn_p_bset_valid :
		spec_insn_p_bsetr_valid ? spec_insn_p_bsetr_valid :
		spec_insn_p_clb_valid ? spec_insn_p_clb_valid :
		spec_insn_p_clip_valid ? spec_insn_p_clip_valid :
		spec_insn_p_clipr_valid ? spec_insn_p_clipr_valid :
		spec_insn_p_clipu_valid ? spec_insn_p_clipu_valid :
		spec_insn_p_clipur_valid ? spec_insn_p_clipur_valid :
		spec_insn_p_cnt_valid ? spec_insn_p_cnt_valid :
		spec_insn_p_extbs_valid ? spec_insn_p_extbs_valid :
		spec_insn_p_extbz_valid ? spec_insn_p_extbz_valid :
		spec_insn_p_exths_valid ? spec_insn_p_exths_valid :
		spec_insn_p_exthz_valid ? spec_insn_p_exthz_valid :
		spec_insn_p_extract_valid ? spec_insn_p_extract_valid :
		spec_insn_p_extractr_valid ? spec_insn_p_extractr_valid :
		spec_insn_p_extractu_valid ? spec_insn_p_extractu_valid :
		spec_insn_p_extractur_valid ? spec_insn_p_extractur_valid :
		spec_insn_p_ff1_valid ? spec_insn_p_ff1_valid :
		spec_insn_p_fl1_valid ? spec_insn_p_fl1_valid :
		spec_insn_p_insert_valid ? spec_insn_p_insert_valid :
		spec_insn_p_insertr_valid ? spec_insn_p_insertr_valid :
		spec_insn_p_lb_valid ? spec_insn_p_lb_valid :
		spec_insn_p_lbu_valid ? spec_insn_p_lbu_valid :
		spec_insn_p_lh_valid ? spec_insn_p_lh_valid :
		spec_insn_p_lhu_valid ? spec_insn_p_lhu_valid :
		spec_insn_p_lw_valid ? spec_insn_p_lw_valid :
		spec_insn_p_max_valid ? spec_insn_p_max_valid :
		spec_insn_p_maxu_valid ? spec_insn_p_maxu_valid :
		spec_insn_p_min_valid ? spec_insn_p_min_valid :
		spec_insn_p_minu_valid ? spec_insn_p_minu_valid :
		spec_insn_p_ror_valid ? spec_insn_p_ror_valid :
		spec_insn_p_sb_valid ? spec_insn_p_sb_valid :
		spec_insn_p_sh_valid ? spec_insn_p_sh_valid :
		spec_insn_p_slet_valid ? spec_insn_p_slet_valid :
		spec_insn_p_sletu_valid ? spec_insn_p_sletu_valid :
		spec_insn_p_subN_valid ? spec_insn_p_subN_valid :
		spec_insn_p_subNr_valid ? spec_insn_p_subNr_valid :
		spec_insn_p_subRN_valid ? spec_insn_p_subRN_valid :
		spec_insn_p_subRNr_valid ? spec_insn_p_subRNr_valid :
		spec_insn_p_subuN_valid ? spec_insn_p_subuN_valid :
		spec_insn_p_subuNr_valid ? spec_insn_p_subuNr_valid :
		spec_insn_p_subuRN_valid ? spec_insn_p_subuRN_valid :
		spec_insn_p_subuRNr_valid ? spec_insn_p_subuRNr_valid :
		spec_insn_p_sw_valid ? spec_insn_p_sw_valid :
		spec_insn_sb_valid ? spec_insn_sb_valid :
		spec_insn_sh_valid ? spec_insn_sh_valid :
		spec_insn_sll_valid ? spec_insn_sll_valid :
		spec_insn_slli_valid ? spec_insn_slli_valid :
		spec_insn_slt_valid ? spec_insn_slt_valid :
		spec_insn_slti_valid ? spec_insn_slti_valid :
		spec_insn_sltiu_valid ? spec_insn_sltiu_valid :
		spec_insn_sltu_valid ? spec_insn_sltu_valid :
		spec_insn_sra_valid ? spec_insn_sra_valid :
		spec_insn_srai_valid ? spec_insn_srai_valid :
		spec_insn_srl_valid ? spec_insn_srl_valid :
		spec_insn_srli_valid ? spec_insn_srli_valid :
		spec_insn_sub_valid ? spec_insn_sub_valid :
		spec_insn_sw_valid ? spec_insn_sw_valid :
		spec_insn_xor_valid ? spec_insn_xor_valid :
		spec_insn_xori_valid ? spec_insn_xori_valid : 0;
  assign spec_trap =
		spec_insn_add_valid ? spec_insn_add_trap :
		spec_insn_addi_valid ? spec_insn_addi_trap :
		spec_insn_and_valid ? spec_insn_and_trap :
		spec_insn_andi_valid ? spec_insn_andi_trap :
		spec_insn_auipc_valid ? spec_insn_auipc_trap :
		spec_insn_beq_valid ? spec_insn_beq_trap :
		spec_insn_bge_valid ? spec_insn_bge_trap :
		spec_insn_bgeu_valid ? spec_insn_bgeu_trap :
		spec_insn_blt_valid ? spec_insn_blt_trap :
		spec_insn_bltu_valid ? spec_insn_bltu_trap :
		spec_insn_bne_valid ? spec_insn_bne_trap :
		spec_insn_jal_valid ? spec_insn_jal_trap :
		spec_insn_jalr_valid ? spec_insn_jalr_trap :
		spec_insn_lb_valid ? spec_insn_lb_trap :
		spec_insn_lbu_valid ? spec_insn_lbu_trap :
		spec_insn_lh_valid ? spec_insn_lh_trap :
		spec_insn_lhu_valid ? spec_insn_lhu_trap :
		spec_insn_lui_valid ? spec_insn_lui_trap :
		spec_insn_lw_valid ? spec_insn_lw_trap :
		spec_insn_or_valid ? spec_insn_or_trap :
		spec_insn_ori_valid ? spec_insn_ori_trap :
		spec_insn_p_abs_valid ? spec_insn_p_abs_trap :
		spec_insn_p_addN_valid ? spec_insn_p_addN_trap :
		spec_insn_p_addNr_valid ? spec_insn_p_addNr_trap :
		spec_insn_p_addRN_valid ? spec_insn_p_addRN_trap :
		spec_insn_p_addRNr_valid ? spec_insn_p_addRNr_trap :
		spec_insn_p_adduN_valid ? spec_insn_p_adduN_trap :
		spec_insn_p_adduNr_valid ? spec_insn_p_adduNr_trap :
		spec_insn_p_adduRN_valid ? spec_insn_p_adduRN_trap :
		spec_insn_p_adduRNr_valid ? spec_insn_p_adduRNr_trap :
		spec_insn_p_bclr_valid ? spec_insn_p_bclr_trap :
		spec_insn_p_bclrr_valid ? spec_insn_p_bclrr_trap :
		spec_insn_p_beqimm_valid ? spec_insn_p_beqimm_trap :
		spec_insn_p_bneimm_valid ? spec_insn_p_bneimm_trap :
		spec_insn_p_bset_valid ? spec_insn_p_bset_trap :
		spec_insn_p_bsetr_valid ? spec_insn_p_bsetr_trap :
		spec_insn_p_clb_valid ? spec_insn_p_clb_trap :
		spec_insn_p_clip_valid ? spec_insn_p_clip_trap :
		spec_insn_p_clipr_valid ? spec_insn_p_clipr_trap :
		spec_insn_p_clipu_valid ? spec_insn_p_clipu_trap :
		spec_insn_p_clipur_valid ? spec_insn_p_clipur_trap :
		spec_insn_p_cnt_valid ? spec_insn_p_cnt_trap :
		spec_insn_p_extbs_valid ? spec_insn_p_extbs_trap :
		spec_insn_p_extbz_valid ? spec_insn_p_extbz_trap :
		spec_insn_p_exths_valid ? spec_insn_p_exths_trap :
		spec_insn_p_exthz_valid ? spec_insn_p_exthz_trap :
		spec_insn_p_extract_valid ? spec_insn_p_extract_trap :
		spec_insn_p_extractr_valid ? spec_insn_p_extractr_trap :
		spec_insn_p_extractu_valid ? spec_insn_p_extractu_trap :
		spec_insn_p_extractur_valid ? spec_insn_p_extractur_trap :
		spec_insn_p_ff1_valid ? spec_insn_p_ff1_trap :
		spec_insn_p_fl1_valid ? spec_insn_p_fl1_trap :
		spec_insn_p_insert_valid ? spec_insn_p_insert_trap :
		spec_insn_p_insertr_valid ? spec_insn_p_insertr_trap :
		spec_insn_p_lb_valid ? spec_insn_p_lb_trap :
		spec_insn_p_lbu_valid ? spec_insn_p_lbu_trap :
		spec_insn_p_lh_valid ? spec_insn_p_lh_trap :
		spec_insn_p_lhu_valid ? spec_insn_p_lhu_trap :
		spec_insn_p_lw_valid ? spec_insn_p_lw_trap :
		spec_insn_p_max_valid ? spec_insn_p_max_trap :
		spec_insn_p_maxu_valid ? spec_insn_p_maxu_trap :
		spec_insn_p_min_valid ? spec_insn_p_min_trap :
		spec_insn_p_minu_valid ? spec_insn_p_minu_trap :
		spec_insn_p_ror_valid ? spec_insn_p_ror_trap :
		spec_insn_p_sb_valid ? spec_insn_p_sb_trap :
		spec_insn_p_sh_valid ? spec_insn_p_sh_trap :
		spec_insn_p_slet_valid ? spec_insn_p_slet_trap :
		spec_insn_p_sletu_valid ? spec_insn_p_sletu_trap :
		spec_insn_p_subN_valid ? spec_insn_p_subN_trap :
		spec_insn_p_subNr_valid ? spec_insn_p_subNr_trap :
		spec_insn_p_subRN_valid ? spec_insn_p_subRN_trap :
		spec_insn_p_subRNr_valid ? spec_insn_p_subRNr_trap :
		spec_insn_p_subuN_valid ? spec_insn_p_subuN_trap :
		spec_insn_p_subuNr_valid ? spec_insn_p_subuNr_trap :
		spec_insn_p_subuRN_valid ? spec_insn_p_subuRN_trap :
		spec_insn_p_subuRNr_valid ? spec_insn_p_subuRNr_trap :
		spec_insn_p_sw_valid ? spec_insn_p_sw_trap :
		spec_insn_sb_valid ? spec_insn_sb_trap :
		spec_insn_sh_valid ? spec_insn_sh_trap :
		spec_insn_sll_valid ? spec_insn_sll_trap :
		spec_insn_slli_valid ? spec_insn_slli_trap :
		spec_insn_slt_valid ? spec_insn_slt_trap :
		spec_insn_slti_valid ? spec_insn_slti_trap :
		spec_insn_sltiu_valid ? spec_insn_sltiu_trap :
		spec_insn_sltu_valid ? spec_insn_sltu_trap :
		spec_insn_sra_valid ? spec_insn_sra_trap :
		spec_insn_srai_valid ? spec_insn_srai_trap :
		spec_insn_srl_valid ? spec_insn_srl_trap :
		spec_insn_srli_valid ? spec_insn_srli_trap :
		spec_insn_sub_valid ? spec_insn_sub_trap :
		spec_insn_sw_valid ? spec_insn_sw_trap :
		spec_insn_xor_valid ? spec_insn_xor_trap :
		spec_insn_xori_valid ? spec_insn_xori_trap : 0;
  assign spec_rs1_addr =
		spec_insn_add_valid ? spec_insn_add_rs1_addr :
		spec_insn_addi_valid ? spec_insn_addi_rs1_addr :
		spec_insn_and_valid ? spec_insn_and_rs1_addr :
		spec_insn_andi_valid ? spec_insn_andi_rs1_addr :
		spec_insn_auipc_valid ? spec_insn_auipc_rs1_addr :
		spec_insn_beq_valid ? spec_insn_beq_rs1_addr :
		spec_insn_bge_valid ? spec_insn_bge_rs1_addr :
		spec_insn_bgeu_valid ? spec_insn_bgeu_rs1_addr :
		spec_insn_blt_valid ? spec_insn_blt_rs1_addr :
		spec_insn_bltu_valid ? spec_insn_bltu_rs1_addr :
		spec_insn_bne_valid ? spec_insn_bne_rs1_addr :
		spec_insn_jal_valid ? spec_insn_jal_rs1_addr :
		spec_insn_jalr_valid ? spec_insn_jalr_rs1_addr :
		spec_insn_lb_valid ? spec_insn_lb_rs1_addr :
		spec_insn_lbu_valid ? spec_insn_lbu_rs1_addr :
		spec_insn_lh_valid ? spec_insn_lh_rs1_addr :
		spec_insn_lhu_valid ? spec_insn_lhu_rs1_addr :
		spec_insn_lui_valid ? spec_insn_lui_rs1_addr :
		spec_insn_lw_valid ? spec_insn_lw_rs1_addr :
		spec_insn_or_valid ? spec_insn_or_rs1_addr :
		spec_insn_ori_valid ? spec_insn_ori_rs1_addr :
		spec_insn_p_abs_valid ? spec_insn_p_abs_rs1_addr :
		spec_insn_p_addN_valid ? spec_insn_p_addN_rs1_addr :
		spec_insn_p_addNr_valid ? spec_insn_p_addNr_rs1_addr :
		spec_insn_p_addRN_valid ? spec_insn_p_addRN_rs1_addr :
		spec_insn_p_addRNr_valid ? spec_insn_p_addRNr_rs1_addr :
		spec_insn_p_adduN_valid ? spec_insn_p_adduN_rs1_addr :
		spec_insn_p_adduNr_valid ? spec_insn_p_adduNr_rs1_addr :
		spec_insn_p_adduRN_valid ? spec_insn_p_adduRN_rs1_addr :
		spec_insn_p_adduRNr_valid ? spec_insn_p_adduRNr_rs1_addr :
		spec_insn_p_bclr_valid ? spec_insn_p_bclr_rs1_addr :
		spec_insn_p_bclrr_valid ? spec_insn_p_bclrr_rs1_addr :
		spec_insn_p_beqimm_valid ? spec_insn_p_beqimm_rs1_addr :
		spec_insn_p_bneimm_valid ? spec_insn_p_bneimm_rs1_addr :
		spec_insn_p_bset_valid ? spec_insn_p_bset_rs1_addr :
		spec_insn_p_bsetr_valid ? spec_insn_p_bsetr_rs1_addr :
		spec_insn_p_clb_valid ? spec_insn_p_clb_rs1_addr :
		spec_insn_p_clip_valid ? spec_insn_p_clip_rs1_addr :
		spec_insn_p_clipr_valid ? spec_insn_p_clipr_rs1_addr :
		spec_insn_p_clipu_valid ? spec_insn_p_clipu_rs1_addr :
		spec_insn_p_clipur_valid ? spec_insn_p_clipur_rs1_addr :
		spec_insn_p_cnt_valid ? spec_insn_p_cnt_rs1_addr :
		spec_insn_p_extbs_valid ? spec_insn_p_extbs_rs1_addr :
		spec_insn_p_extbz_valid ? spec_insn_p_extbz_rs1_addr :
		spec_insn_p_exths_valid ? spec_insn_p_exths_rs1_addr :
		spec_insn_p_exthz_valid ? spec_insn_p_exthz_rs1_addr :
		spec_insn_p_extract_valid ? spec_insn_p_extract_rs1_addr :
		spec_insn_p_extractr_valid ? spec_insn_p_extractr_rs1_addr :
		spec_insn_p_extractu_valid ? spec_insn_p_extractu_rs1_addr :
		spec_insn_p_extractur_valid ? spec_insn_p_extractur_rs1_addr :
		spec_insn_p_ff1_valid ? spec_insn_p_ff1_rs1_addr :
		spec_insn_p_fl1_valid ? spec_insn_p_fl1_rs1_addr :
		spec_insn_p_insert_valid ? spec_insn_p_insert_rs1_addr :
		spec_insn_p_insertr_valid ? spec_insn_p_insertr_rs1_addr :
		spec_insn_p_lb_valid ? spec_insn_p_lb_rs1_addr :
		spec_insn_p_lbu_valid ? spec_insn_p_lbu_rs1_addr :
		spec_insn_p_lh_valid ? spec_insn_p_lh_rs1_addr :
		spec_insn_p_lhu_valid ? spec_insn_p_lhu_rs1_addr :
		spec_insn_p_lw_valid ? spec_insn_p_lw_rs1_addr :
		spec_insn_p_max_valid ? spec_insn_p_max_rs1_addr :
		spec_insn_p_maxu_valid ? spec_insn_p_maxu_rs1_addr :
		spec_insn_p_min_valid ? spec_insn_p_min_rs1_addr :
		spec_insn_p_minu_valid ? spec_insn_p_minu_rs1_addr :
		spec_insn_p_ror_valid ? spec_insn_p_ror_rs1_addr :
		spec_insn_p_sb_valid ? spec_insn_p_sb_rs1_addr :
		spec_insn_p_sh_valid ? spec_insn_p_sh_rs1_addr :
		spec_insn_p_slet_valid ? spec_insn_p_slet_rs1_addr :
		spec_insn_p_sletu_valid ? spec_insn_p_sletu_rs1_addr :
		spec_insn_p_subN_valid ? spec_insn_p_subN_rs1_addr :
		spec_insn_p_subNr_valid ? spec_insn_p_subNr_rs1_addr :
		spec_insn_p_subRN_valid ? spec_insn_p_subRN_rs1_addr :
		spec_insn_p_subRNr_valid ? spec_insn_p_subRNr_rs1_addr :
		spec_insn_p_subuN_valid ? spec_insn_p_subuN_rs1_addr :
		spec_insn_p_subuNr_valid ? spec_insn_p_subuNr_rs1_addr :
		spec_insn_p_subuRN_valid ? spec_insn_p_subuRN_rs1_addr :
		spec_insn_p_subuRNr_valid ? spec_insn_p_subuRNr_rs1_addr :
		spec_insn_p_sw_valid ? spec_insn_p_sw_rs1_addr :
		spec_insn_sb_valid ? spec_insn_sb_rs1_addr :
		spec_insn_sh_valid ? spec_insn_sh_rs1_addr :
		spec_insn_sll_valid ? spec_insn_sll_rs1_addr :
		spec_insn_slli_valid ? spec_insn_slli_rs1_addr :
		spec_insn_slt_valid ? spec_insn_slt_rs1_addr :
		spec_insn_slti_valid ? spec_insn_slti_rs1_addr :
		spec_insn_sltiu_valid ? spec_insn_sltiu_rs1_addr :
		spec_insn_sltu_valid ? spec_insn_sltu_rs1_addr :
		spec_insn_sra_valid ? spec_insn_sra_rs1_addr :
		spec_insn_srai_valid ? spec_insn_srai_rs1_addr :
		spec_insn_srl_valid ? spec_insn_srl_rs1_addr :
		spec_insn_srli_valid ? spec_insn_srli_rs1_addr :
		spec_insn_sub_valid ? spec_insn_sub_rs1_addr :
		spec_insn_sw_valid ? spec_insn_sw_rs1_addr :
		spec_insn_xor_valid ? spec_insn_xor_rs1_addr :
		spec_insn_xori_valid ? spec_insn_xori_rs1_addr : 0;
  assign spec_rs2_addr =
		spec_insn_add_valid ? spec_insn_add_rs2_addr :
		spec_insn_addi_valid ? spec_insn_addi_rs2_addr :
		spec_insn_and_valid ? spec_insn_and_rs2_addr :
		spec_insn_andi_valid ? spec_insn_andi_rs2_addr :
		spec_insn_auipc_valid ? spec_insn_auipc_rs2_addr :
		spec_insn_beq_valid ? spec_insn_beq_rs2_addr :
		spec_insn_bge_valid ? spec_insn_bge_rs2_addr :
		spec_insn_bgeu_valid ? spec_insn_bgeu_rs2_addr :
		spec_insn_blt_valid ? spec_insn_blt_rs2_addr :
		spec_insn_bltu_valid ? spec_insn_bltu_rs2_addr :
		spec_insn_bne_valid ? spec_insn_bne_rs2_addr :
		spec_insn_jal_valid ? spec_insn_jal_rs2_addr :
		spec_insn_jalr_valid ? spec_insn_jalr_rs2_addr :
		spec_insn_lb_valid ? spec_insn_lb_rs2_addr :
		spec_insn_lbu_valid ? spec_insn_lbu_rs2_addr :
		spec_insn_lh_valid ? spec_insn_lh_rs2_addr :
		spec_insn_lhu_valid ? spec_insn_lhu_rs2_addr :
		spec_insn_lui_valid ? spec_insn_lui_rs2_addr :
		spec_insn_lw_valid ? spec_insn_lw_rs2_addr :
		spec_insn_or_valid ? spec_insn_or_rs2_addr :
		spec_insn_ori_valid ? spec_insn_ori_rs2_addr :
		spec_insn_p_abs_valid ? spec_insn_p_abs_rs2_addr :
		spec_insn_p_addN_valid ? spec_insn_p_addN_rs2_addr :
		spec_insn_p_addNr_valid ? spec_insn_p_addNr_rs2_addr :
		spec_insn_p_addRN_valid ? spec_insn_p_addRN_rs2_addr :
		spec_insn_p_addRNr_valid ? spec_insn_p_addRNr_rs2_addr :
		spec_insn_p_adduN_valid ? spec_insn_p_adduN_rs2_addr :
		spec_insn_p_adduNr_valid ? spec_insn_p_adduNr_rs2_addr :
		spec_insn_p_adduRN_valid ? spec_insn_p_adduRN_rs2_addr :
		spec_insn_p_adduRNr_valid ? spec_insn_p_adduRNr_rs2_addr :
		spec_insn_p_bclr_valid ? spec_insn_p_bclr_rs2_addr :
		spec_insn_p_bclrr_valid ? spec_insn_p_bclrr_rs2_addr :
		spec_insn_p_beqimm_valid ? spec_insn_p_beqimm_rs2_addr :
		spec_insn_p_bneimm_valid ? spec_insn_p_bneimm_rs2_addr :
		spec_insn_p_bset_valid ? spec_insn_p_bset_rs2_addr :
		spec_insn_p_bsetr_valid ? spec_insn_p_bsetr_rs2_addr :
		spec_insn_p_clb_valid ? spec_insn_p_clb_rs2_addr :
		spec_insn_p_clip_valid ? spec_insn_p_clip_rs2_addr :
		spec_insn_p_clipr_valid ? spec_insn_p_clipr_rs2_addr :
		spec_insn_p_clipu_valid ? spec_insn_p_clipu_rs2_addr :
		spec_insn_p_clipur_valid ? spec_insn_p_clipur_rs2_addr :
		spec_insn_p_cnt_valid ? spec_insn_p_cnt_rs2_addr :
		spec_insn_p_extbs_valid ? spec_insn_p_extbs_rs2_addr :
		spec_insn_p_extbz_valid ? spec_insn_p_extbz_rs2_addr :
		spec_insn_p_exths_valid ? spec_insn_p_exths_rs2_addr :
		spec_insn_p_exthz_valid ? spec_insn_p_exthz_rs2_addr :
		spec_insn_p_extract_valid ? spec_insn_p_extract_rs2_addr :
		spec_insn_p_extractr_valid ? spec_insn_p_extractr_rs2_addr :
		spec_insn_p_extractu_valid ? spec_insn_p_extractu_rs2_addr :
		spec_insn_p_extractur_valid ? spec_insn_p_extractur_rs2_addr :
		spec_insn_p_ff1_valid ? spec_insn_p_ff1_rs2_addr :
		spec_insn_p_fl1_valid ? spec_insn_p_fl1_rs2_addr :
		spec_insn_p_insert_valid ? spec_insn_p_insert_rs2_addr :
		spec_insn_p_insertr_valid ? spec_insn_p_insertr_rs2_addr :
		spec_insn_p_lb_valid ? spec_insn_p_lb_rs2_addr :
		spec_insn_p_lbu_valid ? spec_insn_p_lbu_rs2_addr :
		spec_insn_p_lh_valid ? spec_insn_p_lh_rs2_addr :
		spec_insn_p_lhu_valid ? spec_insn_p_lhu_rs2_addr :
		spec_insn_p_lw_valid ? spec_insn_p_lw_rs2_addr :
		spec_insn_p_max_valid ? spec_insn_p_max_rs2_addr :
		spec_insn_p_maxu_valid ? spec_insn_p_maxu_rs2_addr :
		spec_insn_p_min_valid ? spec_insn_p_min_rs2_addr :
		spec_insn_p_minu_valid ? spec_insn_p_minu_rs2_addr :
		spec_insn_p_ror_valid ? spec_insn_p_ror_rs2_addr :
		spec_insn_p_sb_valid ? spec_insn_p_sb_rs2_addr :
		spec_insn_p_sh_valid ? spec_insn_p_sh_rs2_addr :
		spec_insn_p_slet_valid ? spec_insn_p_slet_rs2_addr :
		spec_insn_p_sletu_valid ? spec_insn_p_sletu_rs2_addr :
		spec_insn_p_subN_valid ? spec_insn_p_subN_rs2_addr :
		spec_insn_p_subNr_valid ? spec_insn_p_subNr_rs2_addr :
		spec_insn_p_subRN_valid ? spec_insn_p_subRN_rs2_addr :
		spec_insn_p_subRNr_valid ? spec_insn_p_subRNr_rs2_addr :
		spec_insn_p_subuN_valid ? spec_insn_p_subuN_rs2_addr :
		spec_insn_p_subuNr_valid ? spec_insn_p_subuNr_rs2_addr :
		spec_insn_p_subuRN_valid ? spec_insn_p_subuRN_rs2_addr :
		spec_insn_p_subuRNr_valid ? spec_insn_p_subuRNr_rs2_addr :
		spec_insn_p_sw_valid ? spec_insn_p_sw_rs2_addr :
		spec_insn_sb_valid ? spec_insn_sb_rs2_addr :
		spec_insn_sh_valid ? spec_insn_sh_rs2_addr :
		spec_insn_sll_valid ? spec_insn_sll_rs2_addr :
		spec_insn_slli_valid ? spec_insn_slli_rs2_addr :
		spec_insn_slt_valid ? spec_insn_slt_rs2_addr :
		spec_insn_slti_valid ? spec_insn_slti_rs2_addr :
		spec_insn_sltiu_valid ? spec_insn_sltiu_rs2_addr :
		spec_insn_sltu_valid ? spec_insn_sltu_rs2_addr :
		spec_insn_sra_valid ? spec_insn_sra_rs2_addr :
		spec_insn_srai_valid ? spec_insn_srai_rs2_addr :
		spec_insn_srl_valid ? spec_insn_srl_rs2_addr :
		spec_insn_srli_valid ? spec_insn_srli_rs2_addr :
		spec_insn_sub_valid ? spec_insn_sub_rs2_addr :
		spec_insn_sw_valid ? spec_insn_sw_rs2_addr :
		spec_insn_xor_valid ? spec_insn_xor_rs2_addr :
		spec_insn_xori_valid ? spec_insn_xori_rs2_addr : 0;
  assign spec_rd_addr =
		spec_insn_add_valid ? spec_insn_add_rd_addr :
		spec_insn_addi_valid ? spec_insn_addi_rd_addr :
		spec_insn_and_valid ? spec_insn_and_rd_addr :
		spec_insn_andi_valid ? spec_insn_andi_rd_addr :
		spec_insn_auipc_valid ? spec_insn_auipc_rd_addr :
		spec_insn_beq_valid ? spec_insn_beq_rd_addr :
		spec_insn_bge_valid ? spec_insn_bge_rd_addr :
		spec_insn_bgeu_valid ? spec_insn_bgeu_rd_addr :
		spec_insn_blt_valid ? spec_insn_blt_rd_addr :
		spec_insn_bltu_valid ? spec_insn_bltu_rd_addr :
		spec_insn_bne_valid ? spec_insn_bne_rd_addr :
		spec_insn_jal_valid ? spec_insn_jal_rd_addr :
		spec_insn_jalr_valid ? spec_insn_jalr_rd_addr :
		spec_insn_lb_valid ? spec_insn_lb_rd_addr :
		spec_insn_lbu_valid ? spec_insn_lbu_rd_addr :
		spec_insn_lh_valid ? spec_insn_lh_rd_addr :
		spec_insn_lhu_valid ? spec_insn_lhu_rd_addr :
		spec_insn_lui_valid ? spec_insn_lui_rd_addr :
		spec_insn_lw_valid ? spec_insn_lw_rd_addr :
		spec_insn_or_valid ? spec_insn_or_rd_addr :
		spec_insn_ori_valid ? spec_insn_ori_rd_addr :
		spec_insn_p_abs_valid ? spec_insn_p_abs_rd_addr :
		spec_insn_p_addN_valid ? spec_insn_p_addN_rd_addr :
		spec_insn_p_addNr_valid ? spec_insn_p_addNr_rd_addr :
		spec_insn_p_addRN_valid ? spec_insn_p_addRN_rd_addr :
		spec_insn_p_addRNr_valid ? spec_insn_p_addRNr_rd_addr :
		spec_insn_p_adduN_valid ? spec_insn_p_adduN_rd_addr :
		spec_insn_p_adduNr_valid ? spec_insn_p_adduNr_rd_addr :
		spec_insn_p_adduRN_valid ? spec_insn_p_adduRN_rd_addr :
		spec_insn_p_adduRNr_valid ? spec_insn_p_adduRNr_rd_addr :
		spec_insn_p_bclr_valid ? spec_insn_p_bclr_rd_addr :
		spec_insn_p_bclrr_valid ? spec_insn_p_bclrr_rd_addr :
		spec_insn_p_beqimm_valid ? spec_insn_p_beqimm_rd_addr :
		spec_insn_p_bneimm_valid ? spec_insn_p_bneimm_rd_addr :
		spec_insn_p_bset_valid ? spec_insn_p_bset_rd_addr :
		spec_insn_p_bsetr_valid ? spec_insn_p_bsetr_rd_addr :
		spec_insn_p_clb_valid ? spec_insn_p_clb_rd_addr :
		spec_insn_p_clip_valid ? spec_insn_p_clip_rd_addr :
		spec_insn_p_clipr_valid ? spec_insn_p_clipr_rd_addr :
		spec_insn_p_clipu_valid ? spec_insn_p_clipu_rd_addr :
		spec_insn_p_clipur_valid ? spec_insn_p_clipur_rd_addr :
		spec_insn_p_cnt_valid ? spec_insn_p_cnt_rd_addr :
		spec_insn_p_extbs_valid ? spec_insn_p_extbs_rd_addr :
		spec_insn_p_extbz_valid ? spec_insn_p_extbz_rd_addr :
		spec_insn_p_exths_valid ? spec_insn_p_exths_rd_addr :
		spec_insn_p_exthz_valid ? spec_insn_p_exthz_rd_addr :
		spec_insn_p_extract_valid ? spec_insn_p_extract_rd_addr :
		spec_insn_p_extractr_valid ? spec_insn_p_extractr_rd_addr :
		spec_insn_p_extractu_valid ? spec_insn_p_extractu_rd_addr :
		spec_insn_p_extractur_valid ? spec_insn_p_extractur_rd_addr :
		spec_insn_p_ff1_valid ? spec_insn_p_ff1_rd_addr :
		spec_insn_p_fl1_valid ? spec_insn_p_fl1_rd_addr :
		spec_insn_p_insert_valid ? spec_insn_p_insert_rd_addr :
		spec_insn_p_insertr_valid ? spec_insn_p_insertr_rd_addr :
		spec_insn_p_lb_valid ? spec_insn_p_lb_rd_addr :
		spec_insn_p_lbu_valid ? spec_insn_p_lbu_rd_addr :
		spec_insn_p_lh_valid ? spec_insn_p_lh_rd_addr :
		spec_insn_p_lhu_valid ? spec_insn_p_lhu_rd_addr :
		spec_insn_p_lw_valid ? spec_insn_p_lw_rd_addr :
		spec_insn_p_max_valid ? spec_insn_p_max_rd_addr :
		spec_insn_p_maxu_valid ? spec_insn_p_maxu_rd_addr :
		spec_insn_p_min_valid ? spec_insn_p_min_rd_addr :
		spec_insn_p_minu_valid ? spec_insn_p_minu_rd_addr :
		spec_insn_p_ror_valid ? spec_insn_p_ror_rd_addr :
		spec_insn_p_sb_valid ? spec_insn_p_sb_rd_addr :
		spec_insn_p_sh_valid ? spec_insn_p_sh_rd_addr :
		spec_insn_p_slet_valid ? spec_insn_p_slet_rd_addr :
		spec_insn_p_sletu_valid ? spec_insn_p_sletu_rd_addr :
		spec_insn_p_subN_valid ? spec_insn_p_subN_rd_addr :
		spec_insn_p_subNr_valid ? spec_insn_p_subNr_rd_addr :
		spec_insn_p_subRN_valid ? spec_insn_p_subRN_rd_addr :
		spec_insn_p_subRNr_valid ? spec_insn_p_subRNr_rd_addr :
		spec_insn_p_subuN_valid ? spec_insn_p_subuN_rd_addr :
		spec_insn_p_subuNr_valid ? spec_insn_p_subuNr_rd_addr :
		spec_insn_p_subuRN_valid ? spec_insn_p_subuRN_rd_addr :
		spec_insn_p_subuRNr_valid ? spec_insn_p_subuRNr_rd_addr :
		spec_insn_p_sw_valid ? spec_insn_p_sw_rd_addr :
		spec_insn_sb_valid ? spec_insn_sb_rd_addr :
		spec_insn_sh_valid ? spec_insn_sh_rd_addr :
		spec_insn_sll_valid ? spec_insn_sll_rd_addr :
		spec_insn_slli_valid ? spec_insn_slli_rd_addr :
		spec_insn_slt_valid ? spec_insn_slt_rd_addr :
		spec_insn_slti_valid ? spec_insn_slti_rd_addr :
		spec_insn_sltiu_valid ? spec_insn_sltiu_rd_addr :
		spec_insn_sltu_valid ? spec_insn_sltu_rd_addr :
		spec_insn_sra_valid ? spec_insn_sra_rd_addr :
		spec_insn_srai_valid ? spec_insn_srai_rd_addr :
		spec_insn_srl_valid ? spec_insn_srl_rd_addr :
		spec_insn_srli_valid ? spec_insn_srli_rd_addr :
		spec_insn_sub_valid ? spec_insn_sub_rd_addr :
		spec_insn_sw_valid ? spec_insn_sw_rd_addr :
		spec_insn_xor_valid ? spec_insn_xor_rd_addr :
		spec_insn_xori_valid ? spec_insn_xori_rd_addr : 0;
  assign spec_rd_wdata =
		spec_insn_add_valid ? spec_insn_add_rd_wdata :
		spec_insn_addi_valid ? spec_insn_addi_rd_wdata :
		spec_insn_and_valid ? spec_insn_and_rd_wdata :
		spec_insn_andi_valid ? spec_insn_andi_rd_wdata :
		spec_insn_auipc_valid ? spec_insn_auipc_rd_wdata :
		spec_insn_beq_valid ? spec_insn_beq_rd_wdata :
		spec_insn_bge_valid ? spec_insn_bge_rd_wdata :
		spec_insn_bgeu_valid ? spec_insn_bgeu_rd_wdata :
		spec_insn_blt_valid ? spec_insn_blt_rd_wdata :
		spec_insn_bltu_valid ? spec_insn_bltu_rd_wdata :
		spec_insn_bne_valid ? spec_insn_bne_rd_wdata :
		spec_insn_jal_valid ? spec_insn_jal_rd_wdata :
		spec_insn_jalr_valid ? spec_insn_jalr_rd_wdata :
		spec_insn_lb_valid ? spec_insn_lb_rd_wdata :
		spec_insn_lbu_valid ? spec_insn_lbu_rd_wdata :
		spec_insn_lh_valid ? spec_insn_lh_rd_wdata :
		spec_insn_lhu_valid ? spec_insn_lhu_rd_wdata :
		spec_insn_lui_valid ? spec_insn_lui_rd_wdata :
		spec_insn_lw_valid ? spec_insn_lw_rd_wdata :
		spec_insn_or_valid ? spec_insn_or_rd_wdata :
		spec_insn_ori_valid ? spec_insn_ori_rd_wdata :
		spec_insn_p_abs_valid ? spec_insn_p_abs_rd_wdata :
		spec_insn_p_addN_valid ? spec_insn_p_addN_rd_wdata :
		spec_insn_p_addNr_valid ? spec_insn_p_addNr_rd_wdata :
		spec_insn_p_addRN_valid ? spec_insn_p_addRN_rd_wdata :
		spec_insn_p_addRNr_valid ? spec_insn_p_addRNr_rd_wdata :
		spec_insn_p_adduN_valid ? spec_insn_p_adduN_rd_wdata :
		spec_insn_p_adduNr_valid ? spec_insn_p_adduNr_rd_wdata :
		spec_insn_p_adduRN_valid ? spec_insn_p_adduRN_rd_wdata :
		spec_insn_p_adduRNr_valid ? spec_insn_p_adduRNr_rd_wdata :
		spec_insn_p_bclr_valid ? spec_insn_p_bclr_rd_wdata :
		spec_insn_p_bclrr_valid ? spec_insn_p_bclrr_rd_wdata :
		spec_insn_p_beqimm_valid ? spec_insn_p_beqimm_rd_wdata :
		spec_insn_p_bneimm_valid ? spec_insn_p_bneimm_rd_wdata :
		spec_insn_p_bset_valid ? spec_insn_p_bset_rd_wdata :
		spec_insn_p_bsetr_valid ? spec_insn_p_bsetr_rd_wdata :
		spec_insn_p_clb_valid ? spec_insn_p_clb_rd_wdata :
		spec_insn_p_clip_valid ? spec_insn_p_clip_rd_wdata :
		spec_insn_p_clipr_valid ? spec_insn_p_clipr_rd_wdata :
		spec_insn_p_clipu_valid ? spec_insn_p_clipu_rd_wdata :
		spec_insn_p_clipur_valid ? spec_insn_p_clipur_rd_wdata :
		spec_insn_p_cnt_valid ? spec_insn_p_cnt_rd_wdata :
		spec_insn_p_extbs_valid ? spec_insn_p_extbs_rd_wdata :
		spec_insn_p_extbz_valid ? spec_insn_p_extbz_rd_wdata :
		spec_insn_p_exths_valid ? spec_insn_p_exths_rd_wdata :
		spec_insn_p_exthz_valid ? spec_insn_p_exthz_rd_wdata :
		spec_insn_p_extract_valid ? spec_insn_p_extract_rd_wdata :
		spec_insn_p_extractr_valid ? spec_insn_p_extractr_rd_wdata :
		spec_insn_p_extractu_valid ? spec_insn_p_extractu_rd_wdata :
		spec_insn_p_extractur_valid ? spec_insn_p_extractur_rd_wdata :
		spec_insn_p_ff1_valid ? spec_insn_p_ff1_rd_wdata :
		spec_insn_p_fl1_valid ? spec_insn_p_fl1_rd_wdata :
		spec_insn_p_insert_valid ? spec_insn_p_insert_rd_wdata :
		spec_insn_p_insertr_valid ? spec_insn_p_insertr_rd_wdata :
		spec_insn_p_lb_valid ? spec_insn_p_lb_rd_wdata :
		spec_insn_p_lbu_valid ? spec_insn_p_lbu_rd_wdata :
		spec_insn_p_lh_valid ? spec_insn_p_lh_rd_wdata :
		spec_insn_p_lhu_valid ? spec_insn_p_lhu_rd_wdata :
		spec_insn_p_lw_valid ? spec_insn_p_lw_rd_wdata :
		spec_insn_p_max_valid ? spec_insn_p_max_rd_wdata :
		spec_insn_p_maxu_valid ? spec_insn_p_maxu_rd_wdata :
		spec_insn_p_min_valid ? spec_insn_p_min_rd_wdata :
		spec_insn_p_minu_valid ? spec_insn_p_minu_rd_wdata :
		spec_insn_p_ror_valid ? spec_insn_p_ror_rd_wdata :
		spec_insn_p_sb_valid ? spec_insn_p_sb_rd_wdata :
		spec_insn_p_sh_valid ? spec_insn_p_sh_rd_wdata :
		spec_insn_p_slet_valid ? spec_insn_p_slet_rd_wdata :
		spec_insn_p_sletu_valid ? spec_insn_p_sletu_rd_wdata :
		spec_insn_p_subN_valid ? spec_insn_p_subN_rd_wdata :
		spec_insn_p_subNr_valid ? spec_insn_p_subNr_rd_wdata :
		spec_insn_p_subRN_valid ? spec_insn_p_subRN_rd_wdata :
		spec_insn_p_subRNr_valid ? spec_insn_p_subRNr_rd_wdata :
		spec_insn_p_subuN_valid ? spec_insn_p_subuN_rd_wdata :
		spec_insn_p_subuNr_valid ? spec_insn_p_subuNr_rd_wdata :
		spec_insn_p_subuRN_valid ? spec_insn_p_subuRN_rd_wdata :
		spec_insn_p_subuRNr_valid ? spec_insn_p_subuRNr_rd_wdata :
		spec_insn_p_sw_valid ? spec_insn_p_sw_rd_wdata :
		spec_insn_sb_valid ? spec_insn_sb_rd_wdata :
		spec_insn_sh_valid ? spec_insn_sh_rd_wdata :
		spec_insn_sll_valid ? spec_insn_sll_rd_wdata :
		spec_insn_slli_valid ? spec_insn_slli_rd_wdata :
		spec_insn_slt_valid ? spec_insn_slt_rd_wdata :
		spec_insn_slti_valid ? spec_insn_slti_rd_wdata :
		spec_insn_sltiu_valid ? spec_insn_sltiu_rd_wdata :
		spec_insn_sltu_valid ? spec_insn_sltu_rd_wdata :
		spec_insn_sra_valid ? spec_insn_sra_rd_wdata :
		spec_insn_srai_valid ? spec_insn_srai_rd_wdata :
		spec_insn_srl_valid ? spec_insn_srl_rd_wdata :
		spec_insn_srli_valid ? spec_insn_srli_rd_wdata :
		spec_insn_sub_valid ? spec_insn_sub_rd_wdata :
		spec_insn_sw_valid ? spec_insn_sw_rd_wdata :
		spec_insn_xor_valid ? spec_insn_xor_rd_wdata :
		spec_insn_xori_valid ? spec_insn_xori_rd_wdata : 0;
  assign spec_pc_wdata =
		spec_insn_add_valid ? spec_insn_add_pc_wdata :
		spec_insn_addi_valid ? spec_insn_addi_pc_wdata :
		spec_insn_and_valid ? spec_insn_and_pc_wdata :
		spec_insn_andi_valid ? spec_insn_andi_pc_wdata :
		spec_insn_auipc_valid ? spec_insn_auipc_pc_wdata :
		spec_insn_beq_valid ? spec_insn_beq_pc_wdata :
		spec_insn_bge_valid ? spec_insn_bge_pc_wdata :
		spec_insn_bgeu_valid ? spec_insn_bgeu_pc_wdata :
		spec_insn_blt_valid ? spec_insn_blt_pc_wdata :
		spec_insn_bltu_valid ? spec_insn_bltu_pc_wdata :
		spec_insn_bne_valid ? spec_insn_bne_pc_wdata :
		spec_insn_jal_valid ? spec_insn_jal_pc_wdata :
		spec_insn_jalr_valid ? spec_insn_jalr_pc_wdata :
		spec_insn_lb_valid ? spec_insn_lb_pc_wdata :
		spec_insn_lbu_valid ? spec_insn_lbu_pc_wdata :
		spec_insn_lh_valid ? spec_insn_lh_pc_wdata :
		spec_insn_lhu_valid ? spec_insn_lhu_pc_wdata :
		spec_insn_lui_valid ? spec_insn_lui_pc_wdata :
		spec_insn_lw_valid ? spec_insn_lw_pc_wdata :
		spec_insn_or_valid ? spec_insn_or_pc_wdata :
		spec_insn_ori_valid ? spec_insn_ori_pc_wdata :
		spec_insn_p_abs_valid ? spec_insn_p_abs_pc_wdata :
		spec_insn_p_addN_valid ? spec_insn_p_addN_pc_wdata :
		spec_insn_p_addNr_valid ? spec_insn_p_addNr_pc_wdata :
		spec_insn_p_addRN_valid ? spec_insn_p_addRN_pc_wdata :
		spec_insn_p_addRNr_valid ? spec_insn_p_addRNr_pc_wdata :
		spec_insn_p_adduN_valid ? spec_insn_p_adduN_pc_wdata :
		spec_insn_p_adduNr_valid ? spec_insn_p_adduNr_pc_wdata :
		spec_insn_p_adduRN_valid ? spec_insn_p_adduRN_pc_wdata :
		spec_insn_p_adduRNr_valid ? spec_insn_p_adduRNr_pc_wdata :
		spec_insn_p_bclr_valid ? spec_insn_p_bclr_pc_wdata :
		spec_insn_p_bclrr_valid ? spec_insn_p_bclrr_pc_wdata :
		spec_insn_p_beqimm_valid ? spec_insn_p_beqimm_pc_wdata :
		spec_insn_p_bneimm_valid ? spec_insn_p_bneimm_pc_wdata :
		spec_insn_p_bset_valid ? spec_insn_p_bset_pc_wdata :
		spec_insn_p_bsetr_valid ? spec_insn_p_bsetr_pc_wdata :
		spec_insn_p_clb_valid ? spec_insn_p_clb_pc_wdata :
		spec_insn_p_clip_valid ? spec_insn_p_clip_pc_wdata :
		spec_insn_p_clipr_valid ? spec_insn_p_clipr_pc_wdata :
		spec_insn_p_clipu_valid ? spec_insn_p_clipu_pc_wdata :
		spec_insn_p_clipur_valid ? spec_insn_p_clipur_pc_wdata :
		spec_insn_p_cnt_valid ? spec_insn_p_cnt_pc_wdata :
		spec_insn_p_extbs_valid ? spec_insn_p_extbs_pc_wdata :
		spec_insn_p_extbz_valid ? spec_insn_p_extbz_pc_wdata :
		spec_insn_p_exths_valid ? spec_insn_p_exths_pc_wdata :
		spec_insn_p_exthz_valid ? spec_insn_p_exthz_pc_wdata :
		spec_insn_p_extract_valid ? spec_insn_p_extract_pc_wdata :
		spec_insn_p_extractr_valid ? spec_insn_p_extractr_pc_wdata :
		spec_insn_p_extractu_valid ? spec_insn_p_extractu_pc_wdata :
		spec_insn_p_extractur_valid ? spec_insn_p_extractur_pc_wdata :
		spec_insn_p_ff1_valid ? spec_insn_p_ff1_pc_wdata :
		spec_insn_p_fl1_valid ? spec_insn_p_fl1_pc_wdata :
		spec_insn_p_insert_valid ? spec_insn_p_insert_pc_wdata :
		spec_insn_p_insertr_valid ? spec_insn_p_insertr_pc_wdata :
		spec_insn_p_lb_valid ? spec_insn_p_lb_pc_wdata :
		spec_insn_p_lbu_valid ? spec_insn_p_lbu_pc_wdata :
		spec_insn_p_lh_valid ? spec_insn_p_lh_pc_wdata :
		spec_insn_p_lhu_valid ? spec_insn_p_lhu_pc_wdata :
		spec_insn_p_lw_valid ? spec_insn_p_lw_pc_wdata :
		spec_insn_p_max_valid ? spec_insn_p_max_pc_wdata :
		spec_insn_p_maxu_valid ? spec_insn_p_maxu_pc_wdata :
		spec_insn_p_min_valid ? spec_insn_p_min_pc_wdata :
		spec_insn_p_minu_valid ? spec_insn_p_minu_pc_wdata :
		spec_insn_p_ror_valid ? spec_insn_p_ror_pc_wdata :
		spec_insn_p_sb_valid ? spec_insn_p_sb_pc_wdata :
		spec_insn_p_sh_valid ? spec_insn_p_sh_pc_wdata :
		spec_insn_p_slet_valid ? spec_insn_p_slet_pc_wdata :
		spec_insn_p_sletu_valid ? spec_insn_p_sletu_pc_wdata :
		spec_insn_p_subN_valid ? spec_insn_p_subN_pc_wdata :
		spec_insn_p_subNr_valid ? spec_insn_p_subNr_pc_wdata :
		spec_insn_p_subRN_valid ? spec_insn_p_subRN_pc_wdata :
		spec_insn_p_subRNr_valid ? spec_insn_p_subRNr_pc_wdata :
		spec_insn_p_subuN_valid ? spec_insn_p_subuN_pc_wdata :
		spec_insn_p_subuNr_valid ? spec_insn_p_subuNr_pc_wdata :
		spec_insn_p_subuRN_valid ? spec_insn_p_subuRN_pc_wdata :
		spec_insn_p_subuRNr_valid ? spec_insn_p_subuRNr_pc_wdata :
		spec_insn_p_sw_valid ? spec_insn_p_sw_pc_wdata :
		spec_insn_sb_valid ? spec_insn_sb_pc_wdata :
		spec_insn_sh_valid ? spec_insn_sh_pc_wdata :
		spec_insn_sll_valid ? spec_insn_sll_pc_wdata :
		spec_insn_slli_valid ? spec_insn_slli_pc_wdata :
		spec_insn_slt_valid ? spec_insn_slt_pc_wdata :
		spec_insn_slti_valid ? spec_insn_slti_pc_wdata :
		spec_insn_sltiu_valid ? spec_insn_sltiu_pc_wdata :
		spec_insn_sltu_valid ? spec_insn_sltu_pc_wdata :
		spec_insn_sra_valid ? spec_insn_sra_pc_wdata :
		spec_insn_srai_valid ? spec_insn_srai_pc_wdata :
		spec_insn_srl_valid ? spec_insn_srl_pc_wdata :
		spec_insn_srli_valid ? spec_insn_srli_pc_wdata :
		spec_insn_sub_valid ? spec_insn_sub_pc_wdata :
		spec_insn_sw_valid ? spec_insn_sw_pc_wdata :
		spec_insn_xor_valid ? spec_insn_xor_pc_wdata :
		spec_insn_xori_valid ? spec_insn_xori_pc_wdata : 0;
  assign spec_mem_addr =
		spec_insn_add_valid ? spec_insn_add_mem_addr :
		spec_insn_addi_valid ? spec_insn_addi_mem_addr :
		spec_insn_and_valid ? spec_insn_and_mem_addr :
		spec_insn_andi_valid ? spec_insn_andi_mem_addr :
		spec_insn_auipc_valid ? spec_insn_auipc_mem_addr :
		spec_insn_beq_valid ? spec_insn_beq_mem_addr :
		spec_insn_bge_valid ? spec_insn_bge_mem_addr :
		spec_insn_bgeu_valid ? spec_insn_bgeu_mem_addr :
		spec_insn_blt_valid ? spec_insn_blt_mem_addr :
		spec_insn_bltu_valid ? spec_insn_bltu_mem_addr :
		spec_insn_bne_valid ? spec_insn_bne_mem_addr :
		spec_insn_jal_valid ? spec_insn_jal_mem_addr :
		spec_insn_jalr_valid ? spec_insn_jalr_mem_addr :
		spec_insn_lb_valid ? spec_insn_lb_mem_addr :
		spec_insn_lbu_valid ? spec_insn_lbu_mem_addr :
		spec_insn_lh_valid ? spec_insn_lh_mem_addr :
		spec_insn_lhu_valid ? spec_insn_lhu_mem_addr :
		spec_insn_lui_valid ? spec_insn_lui_mem_addr :
		spec_insn_lw_valid ? spec_insn_lw_mem_addr :
		spec_insn_or_valid ? spec_insn_or_mem_addr :
		spec_insn_ori_valid ? spec_insn_ori_mem_addr :
		spec_insn_p_abs_valid ? spec_insn_p_abs_mem_addr :
		spec_insn_p_addN_valid ? spec_insn_p_addN_mem_addr :
		spec_insn_p_addNr_valid ? spec_insn_p_addNr_mem_addr :
		spec_insn_p_addRN_valid ? spec_insn_p_addRN_mem_addr :
		spec_insn_p_addRNr_valid ? spec_insn_p_addRNr_mem_addr :
		spec_insn_p_adduN_valid ? spec_insn_p_adduN_mem_addr :
		spec_insn_p_adduNr_valid ? spec_insn_p_adduNr_mem_addr :
		spec_insn_p_adduRN_valid ? spec_insn_p_adduRN_mem_addr :
		spec_insn_p_adduRNr_valid ? spec_insn_p_adduRNr_mem_addr :
		spec_insn_p_bclr_valid ? spec_insn_p_bclr_mem_addr :
		spec_insn_p_bclrr_valid ? spec_insn_p_bclrr_mem_addr :
		spec_insn_p_beqimm_valid ? spec_insn_p_beqimm_mem_addr :
		spec_insn_p_bneimm_valid ? spec_insn_p_bneimm_mem_addr :
		spec_insn_p_bset_valid ? spec_insn_p_bset_mem_addr :
		spec_insn_p_bsetr_valid ? spec_insn_p_bsetr_mem_addr :
		spec_insn_p_clb_valid ? spec_insn_p_clb_mem_addr :
		spec_insn_p_clip_valid ? spec_insn_p_clip_mem_addr :
		spec_insn_p_clipr_valid ? spec_insn_p_clipr_mem_addr :
		spec_insn_p_clipu_valid ? spec_insn_p_clipu_mem_addr :
		spec_insn_p_clipur_valid ? spec_insn_p_clipur_mem_addr :
		spec_insn_p_cnt_valid ? spec_insn_p_cnt_mem_addr :
		spec_insn_p_extbs_valid ? spec_insn_p_extbs_mem_addr :
		spec_insn_p_extbz_valid ? spec_insn_p_extbz_mem_addr :
		spec_insn_p_exths_valid ? spec_insn_p_exths_mem_addr :
		spec_insn_p_exthz_valid ? spec_insn_p_exthz_mem_addr :
		spec_insn_p_extract_valid ? spec_insn_p_extract_mem_addr :
		spec_insn_p_extractr_valid ? spec_insn_p_extractr_mem_addr :
		spec_insn_p_extractu_valid ? spec_insn_p_extractu_mem_addr :
		spec_insn_p_extractur_valid ? spec_insn_p_extractur_mem_addr :
		spec_insn_p_ff1_valid ? spec_insn_p_ff1_mem_addr :
		spec_insn_p_fl1_valid ? spec_insn_p_fl1_mem_addr :
		spec_insn_p_insert_valid ? spec_insn_p_insert_mem_addr :
		spec_insn_p_insertr_valid ? spec_insn_p_insertr_mem_addr :
		spec_insn_p_lb_valid ? spec_insn_p_lb_mem_addr :
		spec_insn_p_lbu_valid ? spec_insn_p_lbu_mem_addr :
		spec_insn_p_lh_valid ? spec_insn_p_lh_mem_addr :
		spec_insn_p_lhu_valid ? spec_insn_p_lhu_mem_addr :
		spec_insn_p_lw_valid ? spec_insn_p_lw_mem_addr :
		spec_insn_p_max_valid ? spec_insn_p_max_mem_addr :
		spec_insn_p_maxu_valid ? spec_insn_p_maxu_mem_addr :
		spec_insn_p_min_valid ? spec_insn_p_min_mem_addr :
		spec_insn_p_minu_valid ? spec_insn_p_minu_mem_addr :
		spec_insn_p_ror_valid ? spec_insn_p_ror_mem_addr :
		spec_insn_p_sb_valid ? spec_insn_p_sb_mem_addr :
		spec_insn_p_sh_valid ? spec_insn_p_sh_mem_addr :
		spec_insn_p_slet_valid ? spec_insn_p_slet_mem_addr :
		spec_insn_p_sletu_valid ? spec_insn_p_sletu_mem_addr :
		spec_insn_p_subN_valid ? spec_insn_p_subN_mem_addr :
		spec_insn_p_subNr_valid ? spec_insn_p_subNr_mem_addr :
		spec_insn_p_subRN_valid ? spec_insn_p_subRN_mem_addr :
		spec_insn_p_subRNr_valid ? spec_insn_p_subRNr_mem_addr :
		spec_insn_p_subuN_valid ? spec_insn_p_subuN_mem_addr :
		spec_insn_p_subuNr_valid ? spec_insn_p_subuNr_mem_addr :
		spec_insn_p_subuRN_valid ? spec_insn_p_subuRN_mem_addr :
		spec_insn_p_subuRNr_valid ? spec_insn_p_subuRNr_mem_addr :
		spec_insn_p_sw_valid ? spec_insn_p_sw_mem_addr :
		spec_insn_sb_valid ? spec_insn_sb_mem_addr :
		spec_insn_sh_valid ? spec_insn_sh_mem_addr :
		spec_insn_sll_valid ? spec_insn_sll_mem_addr :
		spec_insn_slli_valid ? spec_insn_slli_mem_addr :
		spec_insn_slt_valid ? spec_insn_slt_mem_addr :
		spec_insn_slti_valid ? spec_insn_slti_mem_addr :
		spec_insn_sltiu_valid ? spec_insn_sltiu_mem_addr :
		spec_insn_sltu_valid ? spec_insn_sltu_mem_addr :
		spec_insn_sra_valid ? spec_insn_sra_mem_addr :
		spec_insn_srai_valid ? spec_insn_srai_mem_addr :
		spec_insn_srl_valid ? spec_insn_srl_mem_addr :
		spec_insn_srli_valid ? spec_insn_srli_mem_addr :
		spec_insn_sub_valid ? spec_insn_sub_mem_addr :
		spec_insn_sw_valid ? spec_insn_sw_mem_addr :
		spec_insn_xor_valid ? spec_insn_xor_mem_addr :
		spec_insn_xori_valid ? spec_insn_xori_mem_addr : 0;
  assign spec_mem_rmask =
		spec_insn_add_valid ? spec_insn_add_mem_rmask :
		spec_insn_addi_valid ? spec_insn_addi_mem_rmask :
		spec_insn_and_valid ? spec_insn_and_mem_rmask :
		spec_insn_andi_valid ? spec_insn_andi_mem_rmask :
		spec_insn_auipc_valid ? spec_insn_auipc_mem_rmask :
		spec_insn_beq_valid ? spec_insn_beq_mem_rmask :
		spec_insn_bge_valid ? spec_insn_bge_mem_rmask :
		spec_insn_bgeu_valid ? spec_insn_bgeu_mem_rmask :
		spec_insn_blt_valid ? spec_insn_blt_mem_rmask :
		spec_insn_bltu_valid ? spec_insn_bltu_mem_rmask :
		spec_insn_bne_valid ? spec_insn_bne_mem_rmask :
		spec_insn_jal_valid ? spec_insn_jal_mem_rmask :
		spec_insn_jalr_valid ? spec_insn_jalr_mem_rmask :
		spec_insn_lb_valid ? spec_insn_lb_mem_rmask :
		spec_insn_lbu_valid ? spec_insn_lbu_mem_rmask :
		spec_insn_lh_valid ? spec_insn_lh_mem_rmask :
		spec_insn_lhu_valid ? spec_insn_lhu_mem_rmask :
		spec_insn_lui_valid ? spec_insn_lui_mem_rmask :
		spec_insn_lw_valid ? spec_insn_lw_mem_rmask :
		spec_insn_or_valid ? spec_insn_or_mem_rmask :
		spec_insn_ori_valid ? spec_insn_ori_mem_rmask :
		spec_insn_p_abs_valid ? spec_insn_p_abs_mem_rmask :
		spec_insn_p_addN_valid ? spec_insn_p_addN_mem_rmask :
		spec_insn_p_addNr_valid ? spec_insn_p_addNr_mem_rmask :
		spec_insn_p_addRN_valid ? spec_insn_p_addRN_mem_rmask :
		spec_insn_p_addRNr_valid ? spec_insn_p_addRNr_mem_rmask :
		spec_insn_p_adduN_valid ? spec_insn_p_adduN_mem_rmask :
		spec_insn_p_adduNr_valid ? spec_insn_p_adduNr_mem_rmask :
		spec_insn_p_adduRN_valid ? spec_insn_p_adduRN_mem_rmask :
		spec_insn_p_adduRNr_valid ? spec_insn_p_adduRNr_mem_rmask :
		spec_insn_p_bclr_valid ? spec_insn_p_bclr_mem_rmask :
		spec_insn_p_bclrr_valid ? spec_insn_p_bclrr_mem_rmask :
		spec_insn_p_beqimm_valid ? spec_insn_p_beqimm_mem_rmask :
		spec_insn_p_bneimm_valid ? spec_insn_p_bneimm_mem_rmask :
		spec_insn_p_bset_valid ? spec_insn_p_bset_mem_rmask :
		spec_insn_p_bsetr_valid ? spec_insn_p_bsetr_mem_rmask :
		spec_insn_p_clb_valid ? spec_insn_p_clb_mem_rmask :
		spec_insn_p_clip_valid ? spec_insn_p_clip_mem_rmask :
		spec_insn_p_clipr_valid ? spec_insn_p_clipr_mem_rmask :
		spec_insn_p_clipu_valid ? spec_insn_p_clipu_mem_rmask :
		spec_insn_p_clipur_valid ? spec_insn_p_clipur_mem_rmask :
		spec_insn_p_cnt_valid ? spec_insn_p_cnt_mem_rmask :
		spec_insn_p_extbs_valid ? spec_insn_p_extbs_mem_rmask :
		spec_insn_p_extbz_valid ? spec_insn_p_extbz_mem_rmask :
		spec_insn_p_exths_valid ? spec_insn_p_exths_mem_rmask :
		spec_insn_p_exthz_valid ? spec_insn_p_exthz_mem_rmask :
		spec_insn_p_extract_valid ? spec_insn_p_extract_mem_rmask :
		spec_insn_p_extractr_valid ? spec_insn_p_extractr_mem_rmask :
		spec_insn_p_extractu_valid ? spec_insn_p_extractu_mem_rmask :
		spec_insn_p_extractur_valid ? spec_insn_p_extractur_mem_rmask :
		spec_insn_p_ff1_valid ? spec_insn_p_ff1_mem_rmask :
		spec_insn_p_fl1_valid ? spec_insn_p_fl1_mem_rmask :
		spec_insn_p_insert_valid ? spec_insn_p_insert_mem_rmask :
		spec_insn_p_insertr_valid ? spec_insn_p_insertr_mem_rmask :
		spec_insn_p_lb_valid ? spec_insn_p_lb_mem_rmask :
		spec_insn_p_lbu_valid ? spec_insn_p_lbu_mem_rmask :
		spec_insn_p_lh_valid ? spec_insn_p_lh_mem_rmask :
		spec_insn_p_lhu_valid ? spec_insn_p_lhu_mem_rmask :
		spec_insn_p_lw_valid ? spec_insn_p_lw_mem_rmask :
		spec_insn_p_max_valid ? spec_insn_p_max_mem_rmask :
		spec_insn_p_maxu_valid ? spec_insn_p_maxu_mem_rmask :
		spec_insn_p_min_valid ? spec_insn_p_min_mem_rmask :
		spec_insn_p_minu_valid ? spec_insn_p_minu_mem_rmask :
		spec_insn_p_ror_valid ? spec_insn_p_ror_mem_rmask :
		spec_insn_p_sb_valid ? spec_insn_p_sb_mem_rmask :
		spec_insn_p_sh_valid ? spec_insn_p_sh_mem_rmask :
		spec_insn_p_slet_valid ? spec_insn_p_slet_mem_rmask :
		spec_insn_p_sletu_valid ? spec_insn_p_sletu_mem_rmask :
		spec_insn_p_subN_valid ? spec_insn_p_subN_mem_rmask :
		spec_insn_p_subNr_valid ? spec_insn_p_subNr_mem_rmask :
		spec_insn_p_subRN_valid ? spec_insn_p_subRN_mem_rmask :
		spec_insn_p_subRNr_valid ? spec_insn_p_subRNr_mem_rmask :
		spec_insn_p_subuN_valid ? spec_insn_p_subuN_mem_rmask :
		spec_insn_p_subuNr_valid ? spec_insn_p_subuNr_mem_rmask :
		spec_insn_p_subuRN_valid ? spec_insn_p_subuRN_mem_rmask :
		spec_insn_p_subuRNr_valid ? spec_insn_p_subuRNr_mem_rmask :
		spec_insn_p_sw_valid ? spec_insn_p_sw_mem_rmask :
		spec_insn_sb_valid ? spec_insn_sb_mem_rmask :
		spec_insn_sh_valid ? spec_insn_sh_mem_rmask :
		spec_insn_sll_valid ? spec_insn_sll_mem_rmask :
		spec_insn_slli_valid ? spec_insn_slli_mem_rmask :
		spec_insn_slt_valid ? spec_insn_slt_mem_rmask :
		spec_insn_slti_valid ? spec_insn_slti_mem_rmask :
		spec_insn_sltiu_valid ? spec_insn_sltiu_mem_rmask :
		spec_insn_sltu_valid ? spec_insn_sltu_mem_rmask :
		spec_insn_sra_valid ? spec_insn_sra_mem_rmask :
		spec_insn_srai_valid ? spec_insn_srai_mem_rmask :
		spec_insn_srl_valid ? spec_insn_srl_mem_rmask :
		spec_insn_srli_valid ? spec_insn_srli_mem_rmask :
		spec_insn_sub_valid ? spec_insn_sub_mem_rmask :
		spec_insn_sw_valid ? spec_insn_sw_mem_rmask :
		spec_insn_xor_valid ? spec_insn_xor_mem_rmask :
		spec_insn_xori_valid ? spec_insn_xori_mem_rmask : 0;
  assign spec_mem_wmask =
		spec_insn_add_valid ? spec_insn_add_mem_wmask :
		spec_insn_addi_valid ? spec_insn_addi_mem_wmask :
		spec_insn_and_valid ? spec_insn_and_mem_wmask :
		spec_insn_andi_valid ? spec_insn_andi_mem_wmask :
		spec_insn_auipc_valid ? spec_insn_auipc_mem_wmask :
		spec_insn_beq_valid ? spec_insn_beq_mem_wmask :
		spec_insn_bge_valid ? spec_insn_bge_mem_wmask :
		spec_insn_bgeu_valid ? spec_insn_bgeu_mem_wmask :
		spec_insn_blt_valid ? spec_insn_blt_mem_wmask :
		spec_insn_bltu_valid ? spec_insn_bltu_mem_wmask :
		spec_insn_bne_valid ? spec_insn_bne_mem_wmask :
		spec_insn_jal_valid ? spec_insn_jal_mem_wmask :
		spec_insn_jalr_valid ? spec_insn_jalr_mem_wmask :
		spec_insn_lb_valid ? spec_insn_lb_mem_wmask :
		spec_insn_lbu_valid ? spec_insn_lbu_mem_wmask :
		spec_insn_lh_valid ? spec_insn_lh_mem_wmask :
		spec_insn_lhu_valid ? spec_insn_lhu_mem_wmask :
		spec_insn_lui_valid ? spec_insn_lui_mem_wmask :
		spec_insn_lw_valid ? spec_insn_lw_mem_wmask :
		spec_insn_or_valid ? spec_insn_or_mem_wmask :
		spec_insn_ori_valid ? spec_insn_ori_mem_wmask :
		spec_insn_p_abs_valid ? spec_insn_p_abs_mem_wmask :
		spec_insn_p_addN_valid ? spec_insn_p_addN_mem_wmask :
		spec_insn_p_addNr_valid ? spec_insn_p_addNr_mem_wmask :
		spec_insn_p_addRN_valid ? spec_insn_p_addRN_mem_wmask :
		spec_insn_p_addRNr_valid ? spec_insn_p_addRNr_mem_wmask :
		spec_insn_p_adduN_valid ? spec_insn_p_adduN_mem_wmask :
		spec_insn_p_adduNr_valid ? spec_insn_p_adduNr_mem_wmask :
		spec_insn_p_adduRN_valid ? spec_insn_p_adduRN_mem_wmask :
		spec_insn_p_adduRNr_valid ? spec_insn_p_adduRNr_mem_wmask :
		spec_insn_p_bclr_valid ? spec_insn_p_bclr_mem_wmask :
		spec_insn_p_bclrr_valid ? spec_insn_p_bclrr_mem_wmask :
		spec_insn_p_beqimm_valid ? spec_insn_p_beqimm_mem_wmask :
		spec_insn_p_bneimm_valid ? spec_insn_p_bneimm_mem_wmask :
		spec_insn_p_bset_valid ? spec_insn_p_bset_mem_wmask :
		spec_insn_p_bsetr_valid ? spec_insn_p_bsetr_mem_wmask :
		spec_insn_p_clb_valid ? spec_insn_p_clb_mem_wmask :
		spec_insn_p_clip_valid ? spec_insn_p_clip_mem_wmask :
		spec_insn_p_clipr_valid ? spec_insn_p_clipr_mem_wmask :
		spec_insn_p_clipu_valid ? spec_insn_p_clipu_mem_wmask :
		spec_insn_p_clipur_valid ? spec_insn_p_clipur_mem_wmask :
		spec_insn_p_cnt_valid ? spec_insn_p_cnt_mem_wmask :
		spec_insn_p_extbs_valid ? spec_insn_p_extbs_mem_wmask :
		spec_insn_p_extbz_valid ? spec_insn_p_extbz_mem_wmask :
		spec_insn_p_exths_valid ? spec_insn_p_exths_mem_wmask :
		spec_insn_p_exthz_valid ? spec_insn_p_exthz_mem_wmask :
		spec_insn_p_extract_valid ? spec_insn_p_extract_mem_wmask :
		spec_insn_p_extractr_valid ? spec_insn_p_extractr_mem_wmask :
		spec_insn_p_extractu_valid ? spec_insn_p_extractu_mem_wmask :
		spec_insn_p_extractur_valid ? spec_insn_p_extractur_mem_wmask :
		spec_insn_p_ff1_valid ? spec_insn_p_ff1_mem_wmask :
		spec_insn_p_fl1_valid ? spec_insn_p_fl1_mem_wmask :
		spec_insn_p_insert_valid ? spec_insn_p_insert_mem_wmask :
		spec_insn_p_insertr_valid ? spec_insn_p_insertr_mem_wmask :
		spec_insn_p_lb_valid ? spec_insn_p_lb_mem_wmask :
		spec_insn_p_lbu_valid ? spec_insn_p_lbu_mem_wmask :
		spec_insn_p_lh_valid ? spec_insn_p_lh_mem_wmask :
		spec_insn_p_lhu_valid ? spec_insn_p_lhu_mem_wmask :
		spec_insn_p_lw_valid ? spec_insn_p_lw_mem_wmask :
		spec_insn_p_max_valid ? spec_insn_p_max_mem_wmask :
		spec_insn_p_maxu_valid ? spec_insn_p_maxu_mem_wmask :
		spec_insn_p_min_valid ? spec_insn_p_min_mem_wmask :
		spec_insn_p_minu_valid ? spec_insn_p_minu_mem_wmask :
		spec_insn_p_ror_valid ? spec_insn_p_ror_mem_wmask :
		spec_insn_p_sb_valid ? spec_insn_p_sb_mem_wmask :
		spec_insn_p_sh_valid ? spec_insn_p_sh_mem_wmask :
		spec_insn_p_slet_valid ? spec_insn_p_slet_mem_wmask :
		spec_insn_p_sletu_valid ? spec_insn_p_sletu_mem_wmask :
		spec_insn_p_subN_valid ? spec_insn_p_subN_mem_wmask :
		spec_insn_p_subNr_valid ? spec_insn_p_subNr_mem_wmask :
		spec_insn_p_subRN_valid ? spec_insn_p_subRN_mem_wmask :
		spec_insn_p_subRNr_valid ? spec_insn_p_subRNr_mem_wmask :
		spec_insn_p_subuN_valid ? spec_insn_p_subuN_mem_wmask :
		spec_insn_p_subuNr_valid ? spec_insn_p_subuNr_mem_wmask :
		spec_insn_p_subuRN_valid ? spec_insn_p_subuRN_mem_wmask :
		spec_insn_p_subuRNr_valid ? spec_insn_p_subuRNr_mem_wmask :
		spec_insn_p_sw_valid ? spec_insn_p_sw_mem_wmask :
		spec_insn_sb_valid ? spec_insn_sb_mem_wmask :
		spec_insn_sh_valid ? spec_insn_sh_mem_wmask :
		spec_insn_sll_valid ? spec_insn_sll_mem_wmask :
		spec_insn_slli_valid ? spec_insn_slli_mem_wmask :
		spec_insn_slt_valid ? spec_insn_slt_mem_wmask :
		spec_insn_slti_valid ? spec_insn_slti_mem_wmask :
		spec_insn_sltiu_valid ? spec_insn_sltiu_mem_wmask :
		spec_insn_sltu_valid ? spec_insn_sltu_mem_wmask :
		spec_insn_sra_valid ? spec_insn_sra_mem_wmask :
		spec_insn_srai_valid ? spec_insn_srai_mem_wmask :
		spec_insn_srl_valid ? spec_insn_srl_mem_wmask :
		spec_insn_srli_valid ? spec_insn_srli_mem_wmask :
		spec_insn_sub_valid ? spec_insn_sub_mem_wmask :
		spec_insn_sw_valid ? spec_insn_sw_mem_wmask :
		spec_insn_xor_valid ? spec_insn_xor_mem_wmask :
		spec_insn_xori_valid ? spec_insn_xori_mem_wmask : 0;
  assign spec_mem_wdata =
		spec_insn_add_valid ? spec_insn_add_mem_wdata :
		spec_insn_addi_valid ? spec_insn_addi_mem_wdata :
		spec_insn_and_valid ? spec_insn_and_mem_wdata :
		spec_insn_andi_valid ? spec_insn_andi_mem_wdata :
		spec_insn_auipc_valid ? spec_insn_auipc_mem_wdata :
		spec_insn_beq_valid ? spec_insn_beq_mem_wdata :
		spec_insn_bge_valid ? spec_insn_bge_mem_wdata :
		spec_insn_bgeu_valid ? spec_insn_bgeu_mem_wdata :
		spec_insn_blt_valid ? spec_insn_blt_mem_wdata :
		spec_insn_bltu_valid ? spec_insn_bltu_mem_wdata :
		spec_insn_bne_valid ? spec_insn_bne_mem_wdata :
		spec_insn_jal_valid ? spec_insn_jal_mem_wdata :
		spec_insn_jalr_valid ? spec_insn_jalr_mem_wdata :
		spec_insn_lb_valid ? spec_insn_lb_mem_wdata :
		spec_insn_lbu_valid ? spec_insn_lbu_mem_wdata :
		spec_insn_lh_valid ? spec_insn_lh_mem_wdata :
		spec_insn_lhu_valid ? spec_insn_lhu_mem_wdata :
		spec_insn_lui_valid ? spec_insn_lui_mem_wdata :
		spec_insn_lw_valid ? spec_insn_lw_mem_wdata :
		spec_insn_or_valid ? spec_insn_or_mem_wdata :
		spec_insn_ori_valid ? spec_insn_ori_mem_wdata :
		spec_insn_p_abs_valid ? spec_insn_p_abs_mem_wdata :
		spec_insn_p_addN_valid ? spec_insn_p_addN_mem_wdata :
		spec_insn_p_addNr_valid ? spec_insn_p_addNr_mem_wdata :
		spec_insn_p_addRN_valid ? spec_insn_p_addRN_mem_wdata :
		spec_insn_p_addRNr_valid ? spec_insn_p_addRNr_mem_wdata :
		spec_insn_p_adduN_valid ? spec_insn_p_adduN_mem_wdata :
		spec_insn_p_adduNr_valid ? spec_insn_p_adduNr_mem_wdata :
		spec_insn_p_adduRN_valid ? spec_insn_p_adduRN_mem_wdata :
		spec_insn_p_adduRNr_valid ? spec_insn_p_adduRNr_mem_wdata :
		spec_insn_p_bclr_valid ? spec_insn_p_bclr_mem_wdata :
		spec_insn_p_bclrr_valid ? spec_insn_p_bclrr_mem_wdata :
		spec_insn_p_beqimm_valid ? spec_insn_p_beqimm_mem_wdata :
		spec_insn_p_bneimm_valid ? spec_insn_p_bneimm_mem_wdata :
		spec_insn_p_bset_valid ? spec_insn_p_bset_mem_wdata :
		spec_insn_p_bsetr_valid ? spec_insn_p_bsetr_mem_wdata :
		spec_insn_p_clb_valid ? spec_insn_p_clb_mem_wdata :
		spec_insn_p_clip_valid ? spec_insn_p_clip_mem_wdata :
		spec_insn_p_clipr_valid ? spec_insn_p_clipr_mem_wdata :
		spec_insn_p_clipu_valid ? spec_insn_p_clipu_mem_wdata :
		spec_insn_p_clipur_valid ? spec_insn_p_clipur_mem_wdata :
		spec_insn_p_cnt_valid ? spec_insn_p_cnt_mem_wdata :
		spec_insn_p_extbs_valid ? spec_insn_p_extbs_mem_wdata :
		spec_insn_p_extbz_valid ? spec_insn_p_extbz_mem_wdata :
		spec_insn_p_exths_valid ? spec_insn_p_exths_mem_wdata :
		spec_insn_p_exthz_valid ? spec_insn_p_exthz_mem_wdata :
		spec_insn_p_extract_valid ? spec_insn_p_extract_mem_wdata :
		spec_insn_p_extractr_valid ? spec_insn_p_extractr_mem_wdata :
		spec_insn_p_extractu_valid ? spec_insn_p_extractu_mem_wdata :
		spec_insn_p_extractur_valid ? spec_insn_p_extractur_mem_wdata :
		spec_insn_p_ff1_valid ? spec_insn_p_ff1_mem_wdata :
		spec_insn_p_fl1_valid ? spec_insn_p_fl1_mem_wdata :
		spec_insn_p_insert_valid ? spec_insn_p_insert_mem_wdata :
		spec_insn_p_insertr_valid ? spec_insn_p_insertr_mem_wdata :
		spec_insn_p_lb_valid ? spec_insn_p_lb_mem_wdata :
		spec_insn_p_lbu_valid ? spec_insn_p_lbu_mem_wdata :
		spec_insn_p_lh_valid ? spec_insn_p_lh_mem_wdata :
		spec_insn_p_lhu_valid ? spec_insn_p_lhu_mem_wdata :
		spec_insn_p_lw_valid ? spec_insn_p_lw_mem_wdata :
		spec_insn_p_max_valid ? spec_insn_p_max_mem_wdata :
		spec_insn_p_maxu_valid ? spec_insn_p_maxu_mem_wdata :
		spec_insn_p_min_valid ? spec_insn_p_min_mem_wdata :
		spec_insn_p_minu_valid ? spec_insn_p_minu_mem_wdata :
		spec_insn_p_ror_valid ? spec_insn_p_ror_mem_wdata :
		spec_insn_p_sb_valid ? spec_insn_p_sb_mem_wdata :
		spec_insn_p_sh_valid ? spec_insn_p_sh_mem_wdata :
		spec_insn_p_slet_valid ? spec_insn_p_slet_mem_wdata :
		spec_insn_p_sletu_valid ? spec_insn_p_sletu_mem_wdata :
		spec_insn_p_subN_valid ? spec_insn_p_subN_mem_wdata :
		spec_insn_p_subNr_valid ? spec_insn_p_subNr_mem_wdata :
		spec_insn_p_subRN_valid ? spec_insn_p_subRN_mem_wdata :
		spec_insn_p_subRNr_valid ? spec_insn_p_subRNr_mem_wdata :
		spec_insn_p_subuN_valid ? spec_insn_p_subuN_mem_wdata :
		spec_insn_p_subuNr_valid ? spec_insn_p_subuNr_mem_wdata :
		spec_insn_p_subuRN_valid ? spec_insn_p_subuRN_mem_wdata :
		spec_insn_p_subuRNr_valid ? spec_insn_p_subuRNr_mem_wdata :
		spec_insn_p_sw_valid ? spec_insn_p_sw_mem_wdata :
		spec_insn_sb_valid ? spec_insn_sb_mem_wdata :
		spec_insn_sh_valid ? spec_insn_sh_mem_wdata :
		spec_insn_sll_valid ? spec_insn_sll_mem_wdata :
		spec_insn_slli_valid ? spec_insn_slli_mem_wdata :
		spec_insn_slt_valid ? spec_insn_slt_mem_wdata :
		spec_insn_slti_valid ? spec_insn_slti_mem_wdata :
		spec_insn_sltiu_valid ? spec_insn_sltiu_mem_wdata :
		spec_insn_sltu_valid ? spec_insn_sltu_mem_wdata :
		spec_insn_sra_valid ? spec_insn_sra_mem_wdata :
		spec_insn_srai_valid ? spec_insn_srai_mem_wdata :
		spec_insn_srl_valid ? spec_insn_srl_mem_wdata :
		spec_insn_srli_valid ? spec_insn_srli_mem_wdata :
		spec_insn_sub_valid ? spec_insn_sub_mem_wdata :
		spec_insn_sw_valid ? spec_insn_sw_mem_wdata :
		spec_insn_xor_valid ? spec_insn_xor_mem_wdata :
		spec_insn_xori_valid ? spec_insn_xori_mem_wdata : 0;
`ifdef RISCV_FORMAL_CSR_MISA
  assign spec_csr_misa_rmask =
		spec_insn_add_valid ? spec_insn_add_csr_misa_rmask :
		spec_insn_addi_valid ? spec_insn_addi_csr_misa_rmask :
		spec_insn_and_valid ? spec_insn_and_csr_misa_rmask :
		spec_insn_andi_valid ? spec_insn_andi_csr_misa_rmask :
		spec_insn_auipc_valid ? spec_insn_auipc_csr_misa_rmask :
		spec_insn_beq_valid ? spec_insn_beq_csr_misa_rmask :
		spec_insn_bge_valid ? spec_insn_bge_csr_misa_rmask :
		spec_insn_bgeu_valid ? spec_insn_bgeu_csr_misa_rmask :
		spec_insn_blt_valid ? spec_insn_blt_csr_misa_rmask :
		spec_insn_bltu_valid ? spec_insn_bltu_csr_misa_rmask :
		spec_insn_bne_valid ? spec_insn_bne_csr_misa_rmask :
		spec_insn_jal_valid ? spec_insn_jal_csr_misa_rmask :
		spec_insn_jalr_valid ? spec_insn_jalr_csr_misa_rmask :
		spec_insn_lb_valid ? spec_insn_lb_csr_misa_rmask :
		spec_insn_lbu_valid ? spec_insn_lbu_csr_misa_rmask :
		spec_insn_lh_valid ? spec_insn_lh_csr_misa_rmask :
		spec_insn_lhu_valid ? spec_insn_lhu_csr_misa_rmask :
		spec_insn_lui_valid ? spec_insn_lui_csr_misa_rmask :
		spec_insn_lw_valid ? spec_insn_lw_csr_misa_rmask :
		spec_insn_or_valid ? spec_insn_or_csr_misa_rmask :
		spec_insn_ori_valid ? spec_insn_ori_csr_misa_rmask :
		spec_insn_p_abs_valid ? spec_insn_p_abs_csr_misa_rmask :
		spec_insn_p_addN_valid ? spec_insn_p_addN_csr_misa_rmask :
		spec_insn_p_addNr_valid ? spec_insn_p_addNr_csr_misa_rmask :
		spec_insn_p_addRN_valid ? spec_insn_p_addRN_csr_misa_rmask :
		spec_insn_p_addRNr_valid ? spec_insn_p_addRNr_csr_misa_rmask :
		spec_insn_p_adduN_valid ? spec_insn_p_adduN_csr_misa_rmask :
		spec_insn_p_adduNr_valid ? spec_insn_p_adduNr_csr_misa_rmask :
		spec_insn_p_adduRN_valid ? spec_insn_p_adduRN_csr_misa_rmask :
		spec_insn_p_adduRNr_valid ? spec_insn_p_adduRNr_csr_misa_rmask :
		spec_insn_p_bclr_valid ? spec_insn_p_bclr_csr_misa_rmask :
		spec_insn_p_bclrr_valid ? spec_insn_p_bclrr_csr_misa_rmask :
		spec_insn_p_beqimm_valid ? spec_insn_p_beqimm_csr_misa_rmask :
		spec_insn_p_bneimm_valid ? spec_insn_p_bneimm_csr_misa_rmask :
		spec_insn_p_bset_valid ? spec_insn_p_bset_csr_misa_rmask :
		spec_insn_p_bsetr_valid ? spec_insn_p_bsetr_csr_misa_rmask :
		spec_insn_p_clb_valid ? spec_insn_p_clb_csr_misa_rmask :
		spec_insn_p_clip_valid ? spec_insn_p_clip_csr_misa_rmask :
		spec_insn_p_clipr_valid ? spec_insn_p_clipr_csr_misa_rmask :
		spec_insn_p_clipu_valid ? spec_insn_p_clipu_csr_misa_rmask :
		spec_insn_p_clipur_valid ? spec_insn_p_clipur_csr_misa_rmask :
		spec_insn_p_cnt_valid ? spec_insn_p_cnt_csr_misa_rmask :
		spec_insn_p_extbs_valid ? spec_insn_p_extbs_csr_misa_rmask :
		spec_insn_p_extbz_valid ? spec_insn_p_extbz_csr_misa_rmask :
		spec_insn_p_exths_valid ? spec_insn_p_exths_csr_misa_rmask :
		spec_insn_p_exthz_valid ? spec_insn_p_exthz_csr_misa_rmask :
		spec_insn_p_extract_valid ? spec_insn_p_extract_csr_misa_rmask :
		spec_insn_p_extractr_valid ? spec_insn_p_extractr_csr_misa_rmask :
		spec_insn_p_extractu_valid ? spec_insn_p_extractu_csr_misa_rmask :
		spec_insn_p_extractur_valid ? spec_insn_p_extractur_csr_misa_rmask :
		spec_insn_p_ff1_valid ? spec_insn_p_ff1_csr_misa_rmask :
		spec_insn_p_fl1_valid ? spec_insn_p_fl1_csr_misa_rmask :
		spec_insn_p_insert_valid ? spec_insn_p_insert_csr_misa_rmask :
		spec_insn_p_insertr_valid ? spec_insn_p_insertr_csr_misa_rmask :
		spec_insn_p_lb_valid ? spec_insn_p_lb_csr_misa_rmask :
		spec_insn_p_lbu_valid ? spec_insn_p_lbu_csr_misa_rmask :
		spec_insn_p_lh_valid ? spec_insn_p_lh_csr_misa_rmask :
		spec_insn_p_lhu_valid ? spec_insn_p_lhu_csr_misa_rmask :
		spec_insn_p_lw_valid ? spec_insn_p_lw_csr_misa_rmask :
		spec_insn_p_max_valid ? spec_insn_p_max_csr_misa_rmask :
		spec_insn_p_maxu_valid ? spec_insn_p_maxu_csr_misa_rmask :
		spec_insn_p_min_valid ? spec_insn_p_min_csr_misa_rmask :
		spec_insn_p_minu_valid ? spec_insn_p_minu_csr_misa_rmask :
		spec_insn_p_ror_valid ? spec_insn_p_ror_csr_misa_rmask :
		spec_insn_p_sb_valid ? spec_insn_p_sb_csr_misa_rmask :
		spec_insn_p_sh_valid ? spec_insn_p_sh_csr_misa_rmask :
		spec_insn_p_slet_valid ? spec_insn_p_slet_csr_misa_rmask :
		spec_insn_p_sletu_valid ? spec_insn_p_sletu_csr_misa_rmask :
		spec_insn_p_subN_valid ? spec_insn_p_subN_csr_misa_rmask :
		spec_insn_p_subNr_valid ? spec_insn_p_subNr_csr_misa_rmask :
		spec_insn_p_subRN_valid ? spec_insn_p_subRN_csr_misa_rmask :
		spec_insn_p_subRNr_valid ? spec_insn_p_subRNr_csr_misa_rmask :
		spec_insn_p_subuN_valid ? spec_insn_p_subuN_csr_misa_rmask :
		spec_insn_p_subuNr_valid ? spec_insn_p_subuNr_csr_misa_rmask :
		spec_insn_p_subuRN_valid ? spec_insn_p_subuRN_csr_misa_rmask :
		spec_insn_p_subuRNr_valid ? spec_insn_p_subuRNr_csr_misa_rmask :
		spec_insn_p_sw_valid ? spec_insn_p_sw_csr_misa_rmask :
		spec_insn_sb_valid ? spec_insn_sb_csr_misa_rmask :
		spec_insn_sh_valid ? spec_insn_sh_csr_misa_rmask :
		spec_insn_sll_valid ? spec_insn_sll_csr_misa_rmask :
		spec_insn_slli_valid ? spec_insn_slli_csr_misa_rmask :
		spec_insn_slt_valid ? spec_insn_slt_csr_misa_rmask :
		spec_insn_slti_valid ? spec_insn_slti_csr_misa_rmask :
		spec_insn_sltiu_valid ? spec_insn_sltiu_csr_misa_rmask :
		spec_insn_sltu_valid ? spec_insn_sltu_csr_misa_rmask :
		spec_insn_sra_valid ? spec_insn_sra_csr_misa_rmask :
		spec_insn_srai_valid ? spec_insn_srai_csr_misa_rmask :
		spec_insn_srl_valid ? spec_insn_srl_csr_misa_rmask :
		spec_insn_srli_valid ? spec_insn_srli_csr_misa_rmask :
		spec_insn_sub_valid ? spec_insn_sub_csr_misa_rmask :
		spec_insn_sw_valid ? spec_insn_sw_csr_misa_rmask :
		spec_insn_xor_valid ? spec_insn_xor_csr_misa_rmask :
		spec_insn_xori_valid ? spec_insn_xori_csr_misa_rmask : 0;
`endif
`ifdef RISCV_FORMAL_CUSTOM_ISA
  assign spec_rs3_addr =
		spec_insn_add_valid ? spec_insn_add_rs3_addr :
		spec_insn_addi_valid ? spec_insn_addi_rs3_addr :
		spec_insn_and_valid ? spec_insn_and_rs3_addr :
		spec_insn_andi_valid ? spec_insn_andi_rs3_addr :
		spec_insn_auipc_valid ? spec_insn_auipc_rs3_addr :
		spec_insn_beq_valid ? spec_insn_beq_rs3_addr :
		spec_insn_bge_valid ? spec_insn_bge_rs3_addr :
		spec_insn_bgeu_valid ? spec_insn_bgeu_rs3_addr :
		spec_insn_blt_valid ? spec_insn_blt_rs3_addr :
		spec_insn_bltu_valid ? spec_insn_bltu_rs3_addr :
		spec_insn_bne_valid ? spec_insn_bne_rs3_addr :
		spec_insn_jal_valid ? spec_insn_jal_rs3_addr :
		spec_insn_jalr_valid ? spec_insn_jalr_rs3_addr :
		spec_insn_lb_valid ? spec_insn_lb_rs3_addr :
		spec_insn_lbu_valid ? spec_insn_lbu_rs3_addr :
		spec_insn_lh_valid ? spec_insn_lh_rs3_addr :
		spec_insn_lhu_valid ? spec_insn_lhu_rs3_addr :
		spec_insn_lui_valid ? spec_insn_lui_rs3_addr :
		spec_insn_lw_valid ? spec_insn_lw_rs3_addr :
		spec_insn_or_valid ? spec_insn_or_rs3_addr :
		spec_insn_ori_valid ? spec_insn_ori_rs3_addr :
		spec_insn_p_abs_valid ? spec_insn_p_abs_rs3_addr :
		spec_insn_p_addN_valid ? spec_insn_p_addN_rs3_addr :
		spec_insn_p_addNr_valid ? spec_insn_p_addNr_rs3_addr :
		spec_insn_p_addRN_valid ? spec_insn_p_addRN_rs3_addr :
		spec_insn_p_addRNr_valid ? spec_insn_p_addRNr_rs3_addr :
		spec_insn_p_adduN_valid ? spec_insn_p_adduN_rs3_addr :
		spec_insn_p_adduNr_valid ? spec_insn_p_adduNr_rs3_addr :
		spec_insn_p_adduRN_valid ? spec_insn_p_adduRN_rs3_addr :
		spec_insn_p_adduRNr_valid ? spec_insn_p_adduRNr_rs3_addr :
		spec_insn_p_bclr_valid ? spec_insn_p_bclr_rs3_addr :
		spec_insn_p_bclrr_valid ? spec_insn_p_bclrr_rs3_addr :
		spec_insn_p_beqimm_valid ? spec_insn_p_beqimm_rs3_addr :
		spec_insn_p_bneimm_valid ? spec_insn_p_bneimm_rs3_addr :
		spec_insn_p_bset_valid ? spec_insn_p_bset_rs3_addr :
		spec_insn_p_bsetr_valid ? spec_insn_p_bsetr_rs3_addr :
		spec_insn_p_clb_valid ? spec_insn_p_clb_rs3_addr :
		spec_insn_p_clip_valid ? spec_insn_p_clip_rs3_addr :
		spec_insn_p_clipr_valid ? spec_insn_p_clipr_rs3_addr :
		spec_insn_p_clipu_valid ? spec_insn_p_clipu_rs3_addr :
		spec_insn_p_clipur_valid ? spec_insn_p_clipur_rs3_addr :
		spec_insn_p_cnt_valid ? spec_insn_p_cnt_rs3_addr :
		spec_insn_p_extbs_valid ? spec_insn_p_extbs_rs3_addr :
		spec_insn_p_extbz_valid ? spec_insn_p_extbz_rs3_addr :
		spec_insn_p_exths_valid ? spec_insn_p_exths_rs3_addr :
		spec_insn_p_exthz_valid ? spec_insn_p_exthz_rs3_addr :
		spec_insn_p_extract_valid ? spec_insn_p_extract_rs3_addr :
		spec_insn_p_extractr_valid ? spec_insn_p_extractr_rs3_addr :
		spec_insn_p_extractu_valid ? spec_insn_p_extractu_rs3_addr :
		spec_insn_p_extractur_valid ? spec_insn_p_extractur_rs3_addr :
		spec_insn_p_ff1_valid ? spec_insn_p_ff1_rs3_addr :
		spec_insn_p_fl1_valid ? spec_insn_p_fl1_rs3_addr :
		spec_insn_p_insert_valid ? spec_insn_p_insert_rs3_addr :
		spec_insn_p_insertr_valid ? spec_insn_p_insertr_rs3_addr :
		spec_insn_p_lb_valid ? spec_insn_p_lb_rs3_addr :
		spec_insn_p_lbu_valid ? spec_insn_p_lbu_rs3_addr :
		spec_insn_p_lh_valid ? spec_insn_p_lh_rs3_addr :
		spec_insn_p_lhu_valid ? spec_insn_p_lhu_rs3_addr :
		spec_insn_p_lw_valid ? spec_insn_p_lw_rs3_addr :
		spec_insn_p_max_valid ? spec_insn_p_max_rs3_addr :
		spec_insn_p_maxu_valid ? spec_insn_p_maxu_rs3_addr :
		spec_insn_p_min_valid ? spec_insn_p_min_rs3_addr :
		spec_insn_p_minu_valid ? spec_insn_p_minu_rs3_addr :
		spec_insn_p_ror_valid ? spec_insn_p_ror_rs3_addr :
		spec_insn_p_sb_valid ? spec_insn_p_sb_rs3_addr :
		spec_insn_p_sh_valid ? spec_insn_p_sh_rs3_addr :
		spec_insn_p_slet_valid ? spec_insn_p_slet_rs3_addr :
		spec_insn_p_sletu_valid ? spec_insn_p_sletu_rs3_addr :
		spec_insn_p_subN_valid ? spec_insn_p_subN_rs3_addr :
		spec_insn_p_subNr_valid ? spec_insn_p_subNr_rs3_addr :
		spec_insn_p_subRN_valid ? spec_insn_p_subRN_rs3_addr :
		spec_insn_p_subRNr_valid ? spec_insn_p_subRNr_rs3_addr :
		spec_insn_p_subuN_valid ? spec_insn_p_subuN_rs3_addr :
		spec_insn_p_subuNr_valid ? spec_insn_p_subuNr_rs3_addr :
		spec_insn_p_subuRN_valid ? spec_insn_p_subuRN_rs3_addr :
		spec_insn_p_subuRNr_valid ? spec_insn_p_subuRNr_rs3_addr :
		spec_insn_p_sw_valid ? spec_insn_p_sw_rs3_addr :
		spec_insn_sb_valid ? spec_insn_sb_rs3_addr :
		spec_insn_sh_valid ? spec_insn_sh_rs3_addr :
		spec_insn_sll_valid ? spec_insn_sll_rs3_addr :
		spec_insn_slli_valid ? spec_insn_slli_rs3_addr :
		spec_insn_slt_valid ? spec_insn_slt_rs3_addr :
		spec_insn_slti_valid ? spec_insn_slti_rs3_addr :
		spec_insn_sltiu_valid ? spec_insn_sltiu_rs3_addr :
		spec_insn_sltu_valid ? spec_insn_sltu_rs3_addr :
		spec_insn_sra_valid ? spec_insn_sra_rs3_addr :
		spec_insn_srai_valid ? spec_insn_srai_rs3_addr :
		spec_insn_srl_valid ? spec_insn_srl_rs3_addr :
		spec_insn_srli_valid ? spec_insn_srli_rs3_addr :
		spec_insn_sub_valid ? spec_insn_sub_rs3_addr :
		spec_insn_sw_valid ? spec_insn_sw_rs3_addr :
		spec_insn_xor_valid ? spec_insn_xor_rs3_addr :
		spec_insn_xori_valid ? spec_insn_xori_rs3_addr : 0;
`endif
endmodule
