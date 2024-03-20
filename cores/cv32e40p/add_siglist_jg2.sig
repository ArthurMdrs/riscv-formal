<?xml version="1.0" encoding="UTF-8"?>
<wavelist version="3">
  <insertion-point-position>27</insertion-point-position>
  <wave>
    <expr>clock</expr>
    <label/>
    <radix/>
  </wave>
  <spacer/>
  <wave>
    <expr>wrapper.uut.if_stage_i.if_valid</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.if_stage_i.if_ready</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.id_stage_i.controller_i.is_decoding_o</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.id_stage_i.id_valid_o</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.id_stage_i.id_ready_o</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.ex_stage_i.ex_valid_o</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.ex_stage_i.ex_ready_o</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.wb_valid</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.load_store_unit_i.lsu_ready_wb_o</expr>
    <label/>
    <radix/>
  </wave>
  <spacer/>
  <wave>
    <expr>wrapper.uut.misaligned_stall</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.misaligned_stall_q</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.if_stage_i.instr_valid_id_o</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.rvfi_valid_if</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.rvfi_valid_id</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.rvfi_valid_ex</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>rvfi_valid</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>rvfi_insn</expr>
    <label/>
    <radix>checker_inst.rd_addr</radix>
  </wave>
  <wave>
    <expr>rvfi_trap</expr>
    <label/>
    <radix/>
  </wave>
  <spacer/>
  <wave collapsed="true">
    <expr>rvfi_pc_rdata</expr>
    <label/>
    <radix>rvfi_mem_wdata</radix>
  </wave>
  <wave collapsed="true">
    <expr>rvfi_pc_wdata</expr>
    <label/>
    <radix>rvfi_mem_wdata</radix>
  </wave>
  <spacer/>
  <wave collapsed="true">
    <expr>rvfi_rs2_addr</expr>
    <label/>
    <radix>checker_inst.rd_addr</radix>
  </wave>
  <wave collapsed="true">
    <expr>rvfi_rs2_rdata</expr>
    <label/>
    <radix>rvfi_mem_wdata</radix>
  </wave>
  <wave collapsed="true">
    <expr>rvfi_rs1_addr</expr>
    <label/>
    <radix>checker_inst.rd_addr</radix>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.spec_rs1_addr</expr>
    <label/>
    <radix>checker_inst.rd_addr</radix>
  </wave>
  <spacer/>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_rs1_rdata_id</expr>
    <label/>
    <radix>checker_inst.rs1_rdata</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_rs1_rdata_ex</expr>
    <label/>
    <radix>checker_inst.rs1_rdata</radix>
  </wave>
  <wave collapsed="true">
    <expr>rvfi_rs1_rdata</expr>
    <label/>
    <radix>rvfi_mem_wdata</radix>
  </wave>
  <spacer/>
  <wave collapsed="true">
    <expr>wrapper.uut.ex_stage_i.regfile_alu_waddr_fw_o</expr>
    <label/>
    <radix>checker_inst.rd_addr</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_rd_addr_ex</expr>
    <label/>
    <radix>checker_inst.rd_addr</radix>
  </wave>
  <wave collapsed="true">
    <expr>rvfi_rd_addr</expr>
    <label/>
    <radix>checker_inst.rd_addr</radix>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.spec_rd_addr</expr>
    <label/>
    <radix>checker_inst.rd_addr</radix>
  </wave>
  <spacer/>
  <spacer/>
  <wave collapsed="true">
    <expr>rvfi_rd_wdata</expr>
    <label/>
    <radix>rvfi_pc_rdata</radix>
  </wave>
  <spacer/>
  <wave collapsed="true">
    <expr>checker_inst.spec_pc_wdata</expr>
    <label/>
    <radix>rvfi_mem_wdata</radix>
  </wave>
  <spacer/>
  <wave collapsed="true">
    <expr>checker_inst.spec_rs2_addr</expr>
    <label/>
    <radix>checker_inst.rd_addr</radix>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.spec_rd_wdata</expr>
    <label/>
    <radix>rvfi_pc_rdata</radix>
  </wave>
  <spacer/>
  <wave collapsed="true">
    <expr>checker_inst.spec_mem_addr</expr>
    <label/>
    <radix>rvfi_mem_wdata</radix>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.spec_mem_rmask</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.spec_mem_wmask</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.spec_mem_wdata</expr>
    <label/>
    <radix/>
  </wave>
</wavelist>
