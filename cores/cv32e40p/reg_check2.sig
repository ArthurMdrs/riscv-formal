<?xml version="1.0" encoding="UTF-8"?>
<wavelist version="3">
  <insertion-point-position>26</insertion-point-position>
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
  <wave collapsed="true">
    <expr>checker_inst.register_index</expr>
    <label/>
    <radix>checker_inst.register_index</radix>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.register_shadow</expr>
    <label/>
    <radix>checker_inst.register_shadow</radix>
  </wave>
  <wave>
    <expr>checker_inst.register_written</expr>
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
  <spacer/>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_insn_wb</expr>
    <label/>
    <radix>checker_inst.register_index</radix>
  </wave>
  <wave>
    <expr>wrapper.uut.rvfi_valid_wb</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.id_stage_i.illegal_insn_dec</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_rd_wdata</expr>
    <label/>
    <radix>checker_inst.register_shadow</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_rd_addr</expr>
    <label/>
    <radix>checker_inst.register_index</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.id_stage_i.operand_a_fw_id</expr>
    <label/>
    <radix>checker_inst.register_shadow</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.id_stage_i.regfile_addr_ra_id[4:0]</expr>
    <label/>
    <radix/>
  </wave>
  <spacer/>
  <wave collapsed="true">
    <expr>wrapper.uut.id_stage_i.registers_i.waddr_a_i</expr>
    <label/>
    <radix>checker_inst.register_index</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.id_stage_i.registers_i.wdata_a_i</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>wrapper.uut.id_stage_i.registers_i.we_a_i</expr>
    <label/>
    <radix/>
  </wave>
  <spacer/>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_rs1_addr_id</expr>
    <label/>
    <radix>checker_inst.register_index</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_rs1_rdata_id</expr>
    <label/>
    <radix>checker_inst.register_shadow</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_rs1_addr_ex</expr>
    <label/>
    <radix>checker_inst.register_index</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.id_stage_i.operand_a_fw_id</expr>
    <label/>
    <radix>checker_inst.register_shadow</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_rs1_rdata_ex</expr>
    <label/>
    <radix>checker_inst.register_shadow</radix>
  </wave>
  <spacer/>
  <spacer/>
  <highlightlist>
    <!--Users can remove the highlightlist block if they want to load the signal save file into older version of Jasper-->
    <highlight>
      <expr>checker_inst.register_shadow</expr>
      <color>builtin_red</color>
    </highlight>
    <highlight>
      <expr>checker_inst.rvfi_rs1_rdata</expr>
      <color>builtin_red</color>
    </highlight>
  </highlightlist>
</wavelist>
