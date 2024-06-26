<?xml version="1.0" encoding="UTF-8"?>
<wavelist version="3">
  <insertion-point-position>30</insertion-point-position>
  <wave>
    <expr>clock</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>checker_inst.check</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>checker_inst.reset</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.rvfi_rs1_addr</expr>
    <label/>
    <radix>checker_inst.register_index</radix>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.rvfi_rs1_rdata</expr>
    <label/>
    <radix>checker_inst.register_shadow</radix>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.rvfi_rs2_addr</expr>
    <label/>
    <radix>checker_inst.rvfi_rs1_addr</radix>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.rvfi_rs2_rdata</expr>
    <label/>
    <radix>checker_inst.rvfi_rs1_rdata</radix>
  </wave>
  <spacer/>
  <wave collapsed="true">
    <expr>wrapper.uut.if_stage_i.instr_decompressed</expr>
    <label/>
    <radix>checker_inst.rs1_addr</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.if_stage_i.fetch_rdata</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.if_stage_i.if_valid</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.id_valid</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.ex_valid</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.wb_valid</expr>
    <label/>
    <radix/>
  </wave>
  <spacer/>
  <group collapsed="false">
    <expr/>
    <label>Bit Manipulation</label>
    <wave collapsed="true">
      <expr>checker_inst.insn_spec.rvfi_rs1_rdata</expr>
      <label/>
      <radix>checker_inst.rd_wdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.insn_spec.insn_ls2</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.insn_spec.insn_ls3</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.insn_spec.mask</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.insn_spec.mask_sh</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.insn_spec.rs1_masked</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.insn_spec.res_u</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>checker_inst.insn_spec.sig</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.insn_spec.sext</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.insn_spec.doc_res</expr>
      <label/>
      <radix/>
    </wave>
    <spacer/>
  </group>
  <wave collapsed="true">
    <expr>wrapper.uut.ex_stage_i.alu_operand_a_i</expr>
    <label/>
    <radix>checker_inst.rd_wdata</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.ex_stage_i.alu_operand_b_i</expr>
    <label/>
    <radix>checker_inst.rd_wdata</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.ex_stage_i.alu_operand_c_i</expr>
    <label/>
    <radix>checker_inst.rd_wdata</radix>
  </wave>
  <group collapsed="false">
    <expr/>
    <label>Rd</label>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_rd_addr_ex</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_rd_addr_wb</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.spec_rd_addr</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_rd_wdata_ex</expr>
      <label/>
      <radix>checker_inst.rd_wdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_rd_wdata_wb</expr>
      <label/>
      <radix>checker_inst.register_shadow</radix>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.spec_rd_wdata</expr>
      <label/>
      <radix>checker_inst.rvfi_rs1_rdata</radix>
    </wave>
    <spacer/>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_post_rd_wdata_ex</expr>
      <label/>
      <radix>checker_inst.rvfi_rs1_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_post_rd_wdata_wb</expr>
      <label/>
      <radix>checker_inst.rvfi_rs1_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.spec_post_rd_wdata</expr>
      <label/>
      <radix>checker_inst.rvfi_rs1_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_post_rd_addr_ex</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_post_rd_addr_wb</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.spec_post_rd_addr</expr>
      <label/>
      <radix/>
    </wave>
    <spacer/>
  </group>
  <group collapsed="false">
    <expr/>
    <label>Regfile EX port</label>
    <wave>
      <expr>wrapper.uut.ex_stage_i.regfile_alu_we_fw_o</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.ex_stage_i.regfile_alu_waddr_fw_o</expr>
      <label/>
      <radix>rvfi_insn</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.regfile_alu_wdata_fw_i</expr>
      <label/>
      <radix>checker_inst.rd_wdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.instr</expr>
      <label/>
      <radix>checker_inst.rvfi_rs1_addr</radix>
    </wave>
    <spacer/>
  </group>
  <group collapsed="true">
    <expr/>
    <label>Regfile WB port</label>
    <wave>
      <expr>wrapper.uut.id_stage_i.regfile_we_wb_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.regfile_waddr_wb_i</expr>
      <label/>
      <radix>rvfi_insn</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.regfile_wdata_wb_i</expr>
      <label/>
      <radix>checker_inst.rvfi_rs1_rdata</radix>
    </wave>
  </group>
  <spacer/>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_insn_id</expr>
    <label/>
    <radix>checker_inst.register_index</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_insn_ex</expr>
    <label/>
    <radix>checker_inst.register_index</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_insn_wb</expr>
    <label/>
    <radix>checker_inst.register_index</radix>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[31]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[30]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[29]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[28]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[27]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[26]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[25]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[24]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[23]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[22]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[21]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[20]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[19]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[18]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[17]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[16]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[15]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[14]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[13]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[12]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[11]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[10]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[9]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[8]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[7]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[6]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[5]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[4]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[3]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[2]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[1]</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.rvfi_insn_wb[0]</expr>
      <label/>
      <radix/>
    </wave>
  </wave>
  <wave>
    <expr>wrapper.uut.rvfi_valid_wb</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>rvfi_trap</expr>
    <label/>
    <radix/>
  </wave>
  <spacer/>
  <group collapsed="false">
    <expr/>
    <label>Data mem access</label>
    <wave>
      <expr>wrapper.uut.load_store_unit_i.data_req_o</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.load_store_unit_i.data_gnt_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.load_store_unit_i.data_rvalid_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.load_store_unit_i.CS</expr>
      <label/>
      <radix>wrapper.uut.load_store_unit_i.CS</radix>
    </wave>
    <wave>
      <expr>wrapper.uut.misaligned_access</expr>
      <label/>
      <radix/>
    </wave>
  </group>
  <spacer/>
  <highlightlist>
    <!--Users can remove the highlightlist block if they want to load the signal save file into older version of Jasper-->
    <highlight>
      <expr>checker_inst.insn_spec.RS1sh</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>checker_inst.insn_spec.insn_ls2</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>checker_inst.insn_spec.insn_ls3</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>checker_inst.insn_spec.sext</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>checker_inst.insn_spec.sext2</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>checker_inst.insn_spec.sig</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>checker_inst.register_shadow</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>checker_inst.rvfi_rs1_addr</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>checker_inst.rvfi_rs1_rdata</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>checker_inst.rvfi_rs2_addr</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>checker_inst.rvfi_rs2_rdata</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>checker_inst.spec_pc_wdata</expr>
      <color>builtin_green</color>
    </highlight>
    <highlight>
      <expr>checker_inst.spec_rd_addr</expr>
      <color>builtin_green</color>
    </highlight>
    <highlight>
      <expr>checker_inst.spec_rd_wdata</expr>
      <color>builtin_green</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.data_err_pmp</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.id_stage_i.decoder_i.instr_rdata_i</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.fetch_rdata</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.hwlp_cnt_i[0]</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.hwlp_cnt_i[1]</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.hwlp_dec_cnt_id_o</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.hwlp_end_i[0]</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.hwlp_end_i[1]</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.hwlp_start_i[0]</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.hwlp_start_i[1]</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.instr_decompressed</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.is_hwlp_id_o</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.pc_if_o</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.load_store_unit_i.data_addr_o</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.load_store_unit_i.data_gnt_i</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.load_store_unit_i.data_req_o</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.load_store_unit_i.data_rvalid_i</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.load_store_unit_i.data_we_o</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.rvfi_hwlp_start_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.rvfi_insn_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.rvfi_is_hwlp_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.rvfi_pc_rdata_wb</expr>
      <color>builtin_green</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.rvfi_pc_wdata_wb</expr>
      <color>builtin_green</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.rvfi_rd_addr_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.rvfi_rd_wdata_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.rvfi_rs1_addr_wb</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.rvfi_rs1_rdata_wb</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.rvfi_rs2_addr_wb</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.rvfi_rs2_rdata_wb</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.rvfi_valid_wb</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.store_post_rd_addr</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.store_post_rd_data</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>checker_inst.insn_spec.BSR</expr>
      <color>#beffc0</color>
    </highlight>
    <highlight>
      <expr>checker_inst.insn_spec.BSRsh</expr>
      <color>#beffc0</color>
    </highlight>
    <highlight>
      <expr>checker_inst.insn_spec.RS1m</expr>
      <color>#beffc0</color>
    </highlight>
    <highlight>
      <expr>checker_inst.insn_spec.mask</expr>
      <color>#beffc0</color>
    </highlight>
    <highlight>
      <expr>checker_inst.insn_spec.mask_sh</expr>
      <color>#beffc0</color>
    </highlight>
    <highlight>
      <expr>checker_inst.insn_spec.res</expr>
      <color>#beffc0</color>
    </highlight>
    <highlight>
      <expr>checker_inst.insn_spec.res_u</expr>
      <color>#beffc0</color>
    </highlight>
    <highlight>
      <expr>checker_inst.insn_spec.resu</expr>
      <color>#beffc0</color>
    </highlight>
    <highlight>
      <expr>checker_inst.insn_spec.rs1_masked</expr>
      <color>#beffc0</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.id_stage_i.instr</expr>
      <color>#aaffff</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.id_stage_i.is_hwlp_i</expr>
      <color>#aaffff</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.hwlp_jump</expr>
      <color>#aaffff</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.hwlp_target</expr>
      <color>#aaffff</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.prefetch_32.prefetch_buffer_i.hwlp_CS</expr>
      <color>#aaffff</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.prefetch_32.prefetch_buffer_i.hwlp_NS</expr>
      <color>#aaffff</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.rvfi_post_rd_addr_wb</expr>
      <color>#aaffff</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.rvfi_post_rd_wdata_wb</expr>
      <color>#aaffff</color>
    </highlight>
  </highlightlist>
</wavelist>
