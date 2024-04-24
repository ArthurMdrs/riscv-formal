<?xml version="1.0" encoding="UTF-8"?>
<wavelist version="3">
  <insertion-point-position>22</insertion-point-position>
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
  <spacer/>
  <wave collapsed="true">
    <expr>wrapper.uut.id_stage_i.decoder_i.instr_rdata_i</expr>
    <label/>
    <radix>wrapper.uut.id_stage_i.decoder_i.instr_rdata_i</radix>
  </wave>
  <wave>
    <expr>wrapper.uut.id_stage_i.illegal_insn_dec</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.rvfi_trap_id</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.rvfi_trap_ex</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.rvfi_trap_wb</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>checker_inst.spec_trap</expr>
    <label/>
    <radix/>
  </wave>
  <spacer/>
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
  <spacer/>
  <wave>
    <expr>wrapper.uut.id_stage_i.data_req_id</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.load_store_unit_i.data_req_ex_i</expr>
    <label/>
    <radix/>
  </wave>
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
  <spacer/>
  <highlightlist>
    <!--Users can remove the highlightlist block if they want to load the signal save file into older version of Jasper-->
    <highlight>
      <expr>checker_inst.register_shadow</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>checker_inst.rvfi_rs1_rdata</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>checker_inst.rvfi_rs2_rdata</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.id_stage_i.decoder_i.instr_rdata_i</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.fetch_rdata</expr>
      <color>builtin_green</color>
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
      <expr>wrapper.uut.rvfi_trap_wb</expr>
      <color>builtin_green</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.rvfi_valid_wb</expr>
      <color>builtin_red</color>
    </highlight>
  </highlightlist>
</wavelist>