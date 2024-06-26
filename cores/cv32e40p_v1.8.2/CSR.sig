<?xml version="1.0" encoding="UTF-8"?>
<wavelist version="3">
  <insertion-point-position>19</insertion-point-position>
  <wave>
    <expr>clock</expr>
    <label/>
    <radix/>
  </wave>
  <group collapsed="true">
    <expr/>
    <label>rs1</label>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.id_stage_i.regfile_addr_ra_id[4:0]</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_rs1_addr_id</expr>
      <label/>
      <radix>checker_inst.rs1_addr</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_rs1_addr_ex</expr>
      <label/>
      <radix>checker_inst.rs1_addr</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_rs1_addr_wb</expr>
      <label/>
      <radix>checker_inst.rs1_addr</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_rs1_rdata_id</expr>
      <label/>
      <radix>wrapper.core_top_i.core_i.rvfi_rs1_rdata_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_rs1_rdata_ex</expr>
      <label/>
      <radix>wrapper.core_top_i.core_i.rvfi_rs1_rdata_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_rs1_rdata_wb</expr>
      <label/>
      <radix>wrapper.core_top_i.core_i.rvfi_rs1_rdata_id</radix>
    </wave>
    <spacer/>
  </group>
  <group collapsed="false">
    <expr/>
    <label>rd</label>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_rd_addr_ex</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_rd_addr_wb</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_rd_wdata_ex</expr>
      <label/>
      <radix>wrapper.core_top_i.core_i.rvfi_rs1_rdata_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_rd_wdata_wb</expr>
      <label/>
      <radix>wrapper.core_top_i.core_i.rvfi_rs1_rdata_id</radix>
    </wave>
    <spacer/>
  </group>
  <group collapsed="false">
    <expr/>
    <label>Insn/Valid</label>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.if_stage_i.fetch_rdata</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.if_stage_i.instr_compressed_int</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.if_stage_i.compressed_decoder_i.instr_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.if_stage_i.instr_decompressed</expr>
      <label/>
      <radix>checker_inst.rs1_addr</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.id_stage_i.instr</expr>
      <label/>
      <radix>checker_inst.rs1_addr</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_insn_if</expr>
      <label/>
      <radix>checker_inst.rs1_addr</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_insn_id</expr>
      <label/>
      <radix>checker_inst.rs1_addr</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_insn_ex</expr>
      <label/>
      <radix>checker_inst.rs1_addr</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_insn_wb</expr>
      <label/>
      <radix>checker_inst.rs1_addr</radix>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.rvfi_valid</expr>
      <label/>
      <radix/>
    </wave>
    <spacer/>
  </group>
  <group collapsed="true">
    <expr/>
    <label>Valid</label>
    <wave>
      <expr>wrapper.core_top_i.core_i.rvfi_valid_mask</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.rvfi_valid_if</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.rvfi_valid_id</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.rvfi_valid_ex</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.rvfi_valid_wb</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.rvfi_valid</expr>
      <label/>
      <radix/>
    </wave>
    <spacer/>
  </group>
  <group collapsed="false">
    <expr/>
    <label>CSR</label>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_csr_rdata_ex</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_csr_rdata_wb</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_csr_wdata_ex</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_csr_wdata_wb</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.aux_csr_rd_wdata</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.aux_csr_rd_addr</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.cs_registers_i.csr_we_int</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.cs_registers_i.csr_op_i</expr>
      <label/>
      <radix>wrapper.core_top_i.core_i.cs_registers_i.csr_op_i</radix>
    </wave>
    <spacer/>
  </group>
  <group collapsed="false">
    <expr/>
    <label>Regfile Write Port</label>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.id_stage_i.register_file_i.waddr_a_i</expr>
      <label/>
      <radix>wrapper.core_top_i.core_i.rvfi_rs1_addr_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.id_stage_i.register_file_i.waddr_b_i</expr>
      <label/>
      <radix>wrapper.core_top_i.core_i.rvfi_rs1_addr_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.id_stage_i.register_file_i.wdata_a_i</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.id_stage_i.register_file_i.wdata_b_i</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.id_stage_i.register_file_i.we_a_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.id_stage_i.register_file_i.we_b_i</expr>
      <label/>
      <radix/>
    </wave>
    <spacer/>
  </group>
  <group collapsed="false">
    <expr/>
    <label>CSR spec</label>
    <wave>
      <expr>checker_inst.csr_illacc</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>checker_inst.csr_write</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.csr_insn_addr</expr>
      <label/>
      <radix>checker_inst.csr_insn_addr</radix>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.rvfi_insn[11:7]</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.csr_insn_rdata</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.csr_insn_rmask</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.csr_insn_rmask_full</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.csr_insn_smask</expr>
      <label/>
      <radix>checker_inst.csr_insn_smask</radix>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.csr_insn_cmask</expr>
      <label/>
      <radix>checker_inst.csr_insn_smask</radix>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.effective_csr_insn_wdata</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.effective_csr_insn_wmask</expr>
      <label/>
      <radix/>
    </wave>
    <spacer/>
  </group>
  <group collapsed="true">
    <expr/>
    <label>PC</label>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.pc_if</expr>
      <label/>
      <radix>checker_inst.pc_wdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.pc_id</expr>
      <label/>
      <radix>checker_inst.pc_wdata</radix>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.id_stage_i.branch_taken_ex</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.ex_stage_i.jump_target_o</expr>
      <label/>
      <radix>checker_inst.pc_wdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.if_stage_i.instr_addr_o</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.if_stage_i.pc_if_o</expr>
      <label/>
      <radix>checker_inst.pc_wdata</radix>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.if_stage_i.if_ready</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_pc_rdata_if</expr>
      <label/>
      <radix>checker_inst.pc_wdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_pc_rdata_id</expr>
      <label/>
      <radix>checker_inst.pc_wdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_pc_rdata_ex</expr>
      <label/>
      <radix>checker_inst.pc_wdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_pc_rdata_wb</expr>
      <label/>
      <radix>checker_inst.pc_wdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_pc_wdata_id</expr>
      <label/>
      <radix>checker_inst.pc_wdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_pc_wdata_ex</expr>
      <label/>
      <radix>checker_inst.pc_wdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_pc_wdata_wb</expr>
      <label/>
      <radix>checker_inst.pc_wdata</radix>
    </wave>
    <spacer/>
  </group>
  <group collapsed="true">
    <expr/>
    <label>Mem</label>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.id_stage_i.decoder_i.instr_rdata_i</expr>
      <label/>
      <radix>wrapper.core_top_i.core_i.rvfi_rs1_addr_id</radix>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.id_stage_i.decoder_i.data_req</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.load_store_unit_i.data_req_ex_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.load_store_unit_i.next_cnt</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.load_store_unit_i.cnt_q</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.load_store_unit_i.data_req_o</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.load_store_unit_i.data_gnt_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.load_store_unit_i.data_rvalid_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.load_store_unit_i.data_addr_o</expr>
      <label/>
      <radix>wrapper.core_top_i.core_i.rvfi_rs1_rdata_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.load_store_unit_i.data_be_o</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.load_store_unit_i.data_we_o</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.load_store_unit_i.data_misaligned_o</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.instr_trans_pnd</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.data_trans_pnd</expr>
      <label/>
      <radix/>
    </wave>
    <spacer/>
  </group>
  <group collapsed="false">
    <expr/>
    <label>Trap</label>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.id_stage_i.instr</expr>
      <label/>
      <radix>checker_inst.rs1_addr</radix>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.id_stage_i.illegal_insn_dec</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.rvfi_trap_id</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.rvfi_trap_ex</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.rvfi_trap_wb</expr>
      <label/>
      <radix/>
    </wave>
    <spacer/>
  </group>
  <group collapsed="true">
    <expr/>
    <label>rvfi mem</label>
    <wave>
      <expr>wrapper.core_top_i.core_i.misaligned_access</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_mem_addr_ex</expr>
      <label/>
      <radix>wrapper.core_top_i.core_i.rvfi_rs1_rdata_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_mem_addr_wb</expr>
      <label/>
      <radix>wrapper.core_top_i.core_i.rvfi_rs1_rdata_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_mem_rmask_wb</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_mem_rdata_wb</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_mem_wmask_ex</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_mem_wmask_wb</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_mem_wdata_ex</expr>
      <label/>
      <radix>wrapper.core_top_i.core_i.rvfi_rs1_rdata_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_mem_wdata_wb</expr>
      <label/>
      <radix>wrapper.core_top_i.core_i.rvfi_rs1_rdata_id</radix>
    </wave>
    <spacer/>
  </group>
  <group collapsed="true">
    <expr/>
    <label>Core ready/valid</label>
    <wave>
      <expr>wrapper.core_top_i.core_i.if_stage_i.instr_valid</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.if_stage_i.if_valid</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.id_valid</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.ex_valid</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.wb_valid</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.ex_stage_i.ex_ready_o</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.load_store_unit_i.lsu_ready_wb_o</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.id_ready</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.ex_ready</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.lsu_ready_ex</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.lsu_ready_wb</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.apu_ready_wb</expr>
      <label/>
      <radix/>
    </wave>
    <spacer/>
  </group>
  <highlightlist>
    <!--Users can remove the highlightlist block if they want to load the signal save file into older version of Jasper-->
    <highlight>
      <expr>checker_inst.insn_spec.spec_pc_wdata</expr>
      <color>builtin_green</color>
    </highlight>
    <highlight>
      <expr>checker_inst.insn_spec.spec_rd_addr</expr>
      <color>builtin_green</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.cs_registers_i.csr_op_i</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.cs_registers_i.csr_we_int</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.id_stage_i.instr</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.id_stage_i.instr[19:15]</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.id_stage_i.regfile_addr_ra_id[4:0]</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.if_stage_i.compressed_decoder_i.instr_i</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.if_stage_i.instr_decompressed</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.load_store_unit_i.data_gnt_i</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.load_store_unit_i.data_req_o</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.load_store_unit_i.data_rvalid_i</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.pc_id</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.pc_if</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_csr_rdata_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_csr_wdata_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_insn_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_mem_addr_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_mem_rdata_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_mem_rmask_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_mem_wdata_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_mem_wmask_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_pc_rdata_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_pc_wdata_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_rd_addr_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_rd_wdata_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_rs1_addr_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_rs1_rdata_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_valid_mask</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_valid_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.data_trans_pnd</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.instr_trans_pnd</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.if_stage_i.instr_compressed_int</expr>
      <color>#55ffff</color>
    </highlight>
  </highlightlist>
</wavelist>
