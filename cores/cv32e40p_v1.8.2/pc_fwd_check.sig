<?xml version="1.0" encoding="UTF-8"?>
<wavelist version="3">
  <insertion-point-position>20</insertion-point-position>
  <wave>
    <expr>clock</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.expect_pc</expr>
    <label/>
    <radix>checker_inst.expect_pc</radix>
  </wave>
  <wave>
    <expr>checker_inst.expect_pc_valid</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.pc_rdata</expr>
    <label/>
    <radix>checker_inst.expect_pc</radix>
  </wave>
  <wave>
    <expr>checker_inst.rvfi_intr</expr>
    <label/>
    <radix/>
  </wave>
  <group collapsed="false">
    <expr/>
    <label>PC</label>
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
    <wave>
      <expr>wrapper.core_top_i.core_i.if_stage_i.instr_valid</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.if_stage_i.pc_if_o</expr>
      <label/>
      <radix>checker_inst.pc_wdata</radix>
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
  <group collapsed="false">
    <expr/>
    <label>group 1</label>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.if_stage_i.pc_mux_i</expr>
      <label/>
      <radix>wrapper.core_top_i.core_i.if_stage_i.pc_mux_i</radix>
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
      <expr>wrapper.core_top_i.core_i.pc_if</expr>
      <label/>
      <radix>checker_inst.pc_wdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.id_stage_i.instr</expr>
      <label/>
      <radix>checker_inst.rs1_addr</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.pc_id</expr>
      <label/>
      <radix>checker_inst.pc_wdata</radix>
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
  <group collapsed="false">
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
  <wave>
    <expr>wrapper.core_top_i.core_i.id_stage_i.branch_in_ex_o</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.core_top_i.core_i.id_stage_i.instr_rdata_i</expr>
    <label/>
    <radix>checker_inst.rvfi_rs1_addr</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.core_top_i.core_i.id_stage_i.alu_operator</expr>
    <label/>
    <radix>wrapper.core_top_i.core_i.ex_stage_i.alu_i.operator_i</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.core_top_i.core_i.ex_stage_i.alu_i.operator_i</expr>
    <label/>
    <radix>wrapper.core_top_i.core_i.ex_stage_i.alu_i.operator_i</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.core_top_i.core_i.ex_stage_i.alu_i.result_o</expr>
    <label/>
    <radix>checker_inst.expect_pc</radix>
  </wave>
  <spacer/>
  <wave collapsed="true">
    <expr>wrapper.core_top_i.core_i.id_stage_i.ctrl_transfer_insn_in_id</expr>
    <label/>
    <radix>wrapper.core_top_i.core_i.id_stage_i.ctrl_transfer_insn_in_id</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.core_top_i.core_i.id_stage_i.jump_target</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.core_top_i.core_i.if_stage_i.pc_mux_i</expr>
    <label/>
    <radix>wrapper.core_top_i.core_i.if_stage_i.pc_mux_i</radix>
    <wave>
      <expr>wrapper.core_top_i.core_i.if_stage_i.pc_mux_i[3]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.if_stage_i.pc_mux_i[2]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.if_stage_i.pc_mux_i[1]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.if_stage_i.pc_mux_i[0]</expr>
      <label/>
      <radix/>
    </wave>
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
  <group collapsed="true">
    <expr/>
    <label>rs2</label>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.id_stage_i.regfile_addr_rb_id[4:0]</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_rs2_addr_id</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_rs2_addr_ex</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_rs2_addr_wb</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_rs2_rdata_id</expr>
      <label/>
      <radix>checker_inst.register_shadow</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_rs2_rdata_ex</expr>
      <label/>
      <radix>checker_inst.register_shadow</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.rvfi_rs2_rdata_wb</expr>
      <label/>
      <radix>checker_inst.register_shadow</radix>
    </wave>
    <spacer/>
  </group>
  <group collapsed="true">
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
      <radix>checker_inst.register_index</radix>
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
  <group collapsed="true">
    <expr/>
    <label>Regfile write port</label>
    <wave>
      <expr>wrapper.core_top_i.core_i.id_stage_i.regfile_we_id</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.ex_stage_i.regfile_we_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.ex_stage_i.regfile_we_lsu</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.id_stage_i.decoder_i.instr_rdata_i</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.id_stage_i.register_file_i.we_a_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.id_stage_i.register_file_i.waddr_a_i</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.id_stage_i.register_file_i.wdata_a_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.id_stage_i.register_file_i.we_b_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.id_stage_i.register_file_i.waddr_b_i</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.id_stage_i.register_file_i.wdata_b_i</expr>
      <label/>
      <radix>checker_inst.register_shadow</radix>
    </wave>
    <spacer/>
  </group>
  <group collapsed="false">
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
    <wave collapsed="true">
      <expr>wrapper.core_top_i.core_i.load_store_unit_i.data_rdata_i</expr>
      <label/>
      <radix/>
    </wave>
    <spacer/>
  </group>
  <group collapsed="false">
    <expr/>
    <label>Trap</label>
    <wave>
      <expr>wrapper.core_top_i.core_i.id_stage_i.is_decoding_o</expr>
      <label/>
      <radix/>
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
    <wave>
      <expr>wrapper.core_top_i.core_i.id_stage_i.controller_i.illegal_insn_n</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.id_stage_i.controller_i.illegal_insn_q</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.rvfi_intr_if</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.rvfi_intr_id</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.rvfi_intr_ex</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_top_i.core_i.rvfi_intr_wb</expr>
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
      <radix/>
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
  <group collapsed="false">
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
      <expr>wrapper.core_top_i.core_i.id_stage_i.controller_i.illegal_insn_n</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.id_stage_i.controller_i.illegal_insn_q</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.id_stage_i.decoder_i.instr_rdata_i</expr>
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
      <expr>wrapper.core_top_i.core_i.id_stage_i.regfile_addr_rb_id[4:0]</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.if_stage_i.pc_if_o</expr>
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
      <expr>wrapper.core_top_i.core_i.rvfi_insn_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_intr_wb</expr>
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
      <expr>wrapper.core_top_i.core_i.rvfi_rs2_addr_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_rs2_rdata_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.rvfi_trap_wb</expr>
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
      <expr>wrapper.core_top_i.core_i.id_stage_i.instr</expr>
      <color>#beffc0</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.if_stage_i.compressed_decoder_i.instr_i</expr>
      <color>#aaffff</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.if_stage_i.instr_compressed_int</expr>
      <color>#55ffff</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.if_stage_i.instr_decompressed</expr>
      <color>#aaffff</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.if_stage_i.instr_valid</expr>
      <color>#beffc0</color>
    </highlight>
    <highlight>
      <expr>wrapper.core_top_i.core_i.if_stage_i.pc_mux_i</expr>
      <color>#beffc0</color>
    </highlight>
  </highlightlist>
</wavelist>
