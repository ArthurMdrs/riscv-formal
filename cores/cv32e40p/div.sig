<?xml version="1.0" encoding="UTF-8"?>
<wavelist version="3">
  <insertion-point-position>20</insertion-point-position>
  <wave>
    <expr>clock</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>&lt;embedded&gt;::rvfi_testbench.checker_inst._assert_1</expr>
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
  <spacer/>
  <wave collapsed="true">
    <expr>wrapper.uut.if_stage_i.pc_mux_i</expr>
    <label/>
    <radix>wrapper.uut.if_stage_i.pc_mux_i</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.id_stage_i.decoder_i.instr_rdata_i</expr>
    <label/>
    <radix>checker_inst.rs1_addr</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.id_stage_i.controller_i.ctrl_fsm_cs</expr>
    <label/>
    <radix>wrapper.uut.id_stage_i.controller_i.ctrl_fsm_cs</radix>
  </wave>
  <spacer/>
  <group collapsed="false">
    <expr/>
    <label>Insn</label>
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
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_insn_if</expr>
      <label/>
      <radix>rvfi_insn</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_insn_id</expr>
      <label/>
      <radix>rvfi_insn</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_insn_ex</expr>
      <label/>
      <radix>rvfi_insn</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_insn_wb</expr>
      <label/>
      <radix>rvfi_insn</radix>
    </wave>
  </group>
  <spacer/>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_rd_addr_wb</expr>
    <label/>
    <radix>checker_inst.register_index</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_rd_wdata_wb</expr>
    <label/>
    <radix>wrapper.uut.if_stage_i.pc_if_o</radix>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.insn_spec.spec_rd_addr</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.insn_spec.spec_rd_wdata</expr>
    <label/>
    <radix>checker_inst.rd_wdata</radix>
  </wave>
  <spacer/>
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
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_rs1_rdata_id</expr>
    <label/>
    <radix>checker_inst.register_shadow</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.id_stage_i.operand_a_fw_id</expr>
    <label/>
    <radix>checker_inst.register_shadow</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.id_stage_i.operand_b_fw_id</expr>
    <label/>
    <radix>checker_inst.register_shadow</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.id_stage_i.operand_c_fw_id</expr>
    <label/>
    <radix>checker_inst.register_shadow</radix>
  </wave>
  <group collapsed="false">
    <expr/>
    <label>Div unit</label>
    <wave collapsed="true">
      <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI</expr>
      <label/>
      <radix>checker_inst.rd_wdata</radix>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[31]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[30]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[29]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[28]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[27]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[26]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[25]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[24]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[23]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[22]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[21]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[20]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[19]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[18]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[17]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[16]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[15]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[14]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[13]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[12]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[11]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[10]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[9]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[8]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[7]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[6]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[5]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[4]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[3]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[2]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[1]</expr>
        <label/>
        <radix/>
      </wave>
      <wave>
        <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI[0]</expr>
        <label/>
        <radix/>
      </wave>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpB_DI</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.regfile_alu_waddr_fw_i</expr>
      <label/>
      <radix>wrapper.uut.id_stage_i.decoder_i.instr_rdata_i</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.regfile_alu_wdata_fw_i</expr>
      <label/>
      <radix>wrapper.uut.if_stage_i.pc_if_o</radix>
    </wave>
    <wave>
      <expr>wrapper.uut.id_stage_i.regfile_alu_we_fw_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.ex_stage_i.alu_i.div_valid</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.InVld_SI</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.State_SP</expr>
      <label/>
      <radix>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.State_SP</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.State_SN</expr>
      <label/>
      <radix>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.State_SP</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.Res_DO</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OutVld_SO</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.ex_stage_i.alu_i.div_ready</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OutRdy_SI</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.ex_stage_i.alu_i.ex_ready_i</expr>
      <label/>
      <radix/>
    </wave>
  </group>
  <spacer/>
  <group collapsed="false">
    <expr/>
    <label>Ready/Valid</label>
    <wave>
      <expr>wrapper.uut.if_stage_i.if_ready</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.id_ready</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.ex_ready</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.lsu_ready_wb</expr>
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
  </group>
  <spacer/>
  <group collapsed="false">
    <expr/>
    <label>LSU</label>
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
    <wave>
      <expr>wrapper.uut.load_store_unit_i.data_err_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.load_store_unit_i.CS</expr>
      <label/>
      <radix>wrapper.uut.load_store_unit_i.CS</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.load_store_unit_i.NS</expr>
      <label/>
      <radix>wrapper.uut.load_store_unit_i.CS</radix>
    </wave>
  </group>
  <highlightlist>
    <!--Users can remove the highlightlist block if they want to load the signal save file into older version of Jasper-->
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
      <expr>wrapper.uut.data_err_pmp</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.ex_stage_i.alu_i.div_ready</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.ex_stage_i.alu_i.div_valid</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.ex_stage_i.alu_i.ex_ready_i</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.InVld_SI</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpA_DI</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OpB_DI</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OutRdy_SI</expr>
      <color>builtin_orange</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.OutVld_SO</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.ex_stage_i.alu_i.int_div.div_i.Res_DO</expr>
      <color>builtin_yellow</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.id_stage_i.decoder_i.instr_rdata_i</expr>
      <color>builtin_green</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.fetch_rdata</expr>
      <color>builtin_green</color>
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
      <expr>wrapper.uut.rvfi_insn_wb</expr>
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
      <color>builtin_green</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.rvfi_rd_wdata_wb</expr>
      <color>builtin_green</color>
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
  </highlightlist>
</wavelist>
