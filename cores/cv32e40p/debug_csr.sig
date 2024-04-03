<?xml version="1.0" encoding="UTF-8"?>
<wavelist version="3">
  <insertion-point-position>12</insertion-point-position>
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
  <group collapsed="false">
    <expr/>
    <label>Spec</label>
    <wave collapsed="true">
      <expr>checker_inst.rvfi.insn[11:7]</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.csr_insn_smask</expr>
      <label/>
      <radix>checker_inst.rvfi.pc_wdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.csr_insn_cmask</expr>
      <label/>
      <radix>checker_inst.rvfi.pc_wdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.effective_csr_insn_wdata</expr>
      <label/>
      <radix/>
    </wave>
    <group collapsed="true">
      <expr>(checker_inst.csr_insn_smask &amp; ~checker_inst.effective_csr_insn_wdata)</expr>
      <label>(checker_inst.csr_insn_smask &amp; ~checker_inst.effective_csr_insn_wdata)</label>
      <radix/>
      <wave collapsed="true">
        <expr>checker_inst.csr_insn_smask</expr>
        <label/>
        <radix>checker_inst.rvfi.pc_wdata</radix>
      </wave>
      <wave collapsed="true">
        <expr>checker_inst.effective_csr_insn_wdata</expr>
        <label/>
        <radix/>
      </wave>
    </group>
    <group collapsed="true">
      <expr>(checker_inst.csr_insn_cmask &amp; checker_inst.effective_csr_insn_wdata)</expr>
      <label>(checker_inst.csr_insn_cmask &amp; checker_inst.effective_csr_insn_wdata)</label>
      <radix/>
      <wave collapsed="true">
        <expr>checker_inst.csr_insn_cmask</expr>
        <label/>
        <radix>checker_inst.csr_insn_cmask</radix>
      </wave>
      <wave collapsed="true">
        <expr>checker_inst.effective_csr_insn_wdata</expr>
        <label/>
        <radix/>
      </wave>
    </group>
  </group>
  <spacer/>
  <group collapsed="false">
    <expr/>
    <label>rvfi regs</label>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_rs1_addr_wb</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_rs1_rdata_wb</expr>
      <label/>
      <radix>checker_inst.register_shadow</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_rs2_addr_wb</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_rs2_rdata_wb</expr>
      <label/>
      <radix>checker_inst.register_shadow</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_rd_addr_wb</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_rd_wdata_wb</expr>
      <label/>
      <radix>checker_inst.register_shadow</radix>
    </wave>
  </group>
  <spacer/>
  <group collapsed="false">
    <expr/>
    <label>CSR</label>
    <wave>
      <expr>wrapper.uut.csr_access_ex</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.csr_op_ex</expr>
      <label/>
      <radix>wrapper.uut.csr_op_ex</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.csr_wdata</expr>
      <label/>
      <radix>checker_inst.register_shadow</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.csr_rdata</expr>
      <label/>
      <radix>checker_inst.register_shadow</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.cs_registers_i.csr_addr_i</expr>
      <label/>
      <radix>wrapper.uut.cs_registers_i.csr_addr_i</radix>
    </wave>
  </group>
  <spacer/>
  <group collapsed="true">
    <expr/>
    <label>Regfile read ports</label>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.registers_i.raddr_a_i</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.registers_i.rdata_a_o</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.registers_i.raddr_b_i</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.registers_i.rdata_b_o</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.registers_i.raddr_c_i</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.registers_i.rdata_c_o</expr>
      <label/>
      <radix/>
    </wave>
  </group>
  <spacer/>
  <group collapsed="false">
    <expr/>
    <label>Regfile EX write port</label>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.regfile_alu_waddr_fw_i</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.regfile_alu_wdata_fw_i</expr>
      <label/>
      <radix>checker_inst.register_shadow</radix>
    </wave>
    <wave>
      <expr>wrapper.uut.id_stage_i.regfile_alu_we_fw_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.instr_rdata_i</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
  </group>
  <spacer/>
  <group collapsed="true">
    <expr/>
    <label>Regfile WB write port</label>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.regfile_waddr_wb_i</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.regfile_wdata_wb_i</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
    <wave>
      <expr>wrapper.uut.id_stage_i.regfile_we_wb_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.id_stage_i.instr_rdata_i</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
  </group>
  <spacer/>
  <group collapsed="false">
    <expr/>
    <label>Metadata</label>
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
      <expr>wrapper.uut.load_store_unit_i.data_misaligned_ex_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.uut.load_store_unit_i.data_misaligned_o</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.uut.rvfi_insn_if</expr>
      <label/>
      <radix>checker_inst.register_index</radix>
    </wave>
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
    <wave>
      <expr>wrapper.uut.id_stage_i.illegal_insn_dec</expr>
      <label/>
      <radix/>
    </wave>
  </group>
  <spacer/>
  <group collapsed="true">
    <expr/>
    <label>Mem Access</label>
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
  </group>
  <spacer/>
  <wave collapsed="true">
    <expr>wrapper.uut.id_stage_i.instr_rdata_i</expr>
    <label/>
    <radix>checker_inst.register_index</radix>
  </wave>
  <wave>
    <expr>wrapper.uut.id_stage_i.load_stall</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_rs1_addr_id</expr>
    <label/>
    <radix>checker_inst.register_index</radix>
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
    <expr>wrapper.uut.rvfi_rs1_rdata_id</expr>
    <label/>
    <radix>checker_inst.register_shadow</radix>
  </wave>
  <wave collapsed="true">
    <expr>wrapper.uut.rvfi_rs1_rdata_ex</expr>
    <label/>
    <radix>checker_inst.register_shadow</radix>
  </wave>
  <spacer/>
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
      <expr>wrapper.uut.id_stage_i.decoder_i.instr_rdata_i</expr>
      <color>builtin_blue</color>
    </highlight>
    <highlight>
      <expr>wrapper.uut.if_stage_i.fetch_rdata</expr>
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
