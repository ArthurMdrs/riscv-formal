<?xml version="1.0" encoding="UTF-8"?>
<wavelist version="3">
  <insertion-point-position>21</insertion-point-position>
  <wave>
    <expr>clock</expr>
    <label/>
    <radix/>
  </wave>
  <wave>
    <expr>checker_inst.csr_illacc</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.rvfi.mode</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.csr_insn_rmask</expr>
    <label/>
    <radix/>
  </wave>
  <wave collapsed="true">
    <expr>checker_inst.csr_insn_rdata</expr>
    <label/>
    <radix>wrapper.rvfi_inst.rs1_or_fwd_id</radix>
  </wave>
  <group collapsed="false">
    <expr/>
    <label>rvfi_valid</label>
    <wave>
      <expr>wrapper.rvfi_inst.rvfi_valid_wb</expr>
      <label/>
      <radix/>
    </wave>
  </group>
  <group collapsed="false">
    <expr/>
    <label>Instr</label>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.instr_id</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.instr_ex</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.instr_mem</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.instr_wb</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rvfi_order</expr>
      <label/>
      <radix/>
    </wave>
  </group>
  <group collapsed="true">
    <expr/>
    <label>Trap</label>
    <wave>
      <expr>wrapper.rvfi_inst.illegal_instr_id</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.rvfi_inst.trap_ex</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.rvfi_inst.trap_mem</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.rvfi_inst.trap_wb</expr>
      <label/>
      <radix/>
    </wave>
  </group>
  <group collapsed="true">
    <expr/>
    <label>rs1</label>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rs1_addr_id</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rs1_addr_ex</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rs1_addr_mem</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rs1_addr_wb</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rs1_or_fwd_id</expr>
      <label/>
      <radix>wrapper.rvfi_inst.rs1_or_fwd_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rs1_rdata_ex</expr>
      <label/>
      <radix>wrapper.rvfi_inst.rs1_or_fwd_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rs1_rdata_mem</expr>
      <label/>
      <radix>wrapper.rvfi_inst.rs1_or_fwd_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rs1_rdata_wb</expr>
      <label/>
      <radix>wrapper.rvfi_inst.rs1_or_fwd_id</radix>
    </wave>
  </group>
  <group collapsed="true">
    <expr/>
    <label>rs2</label>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rs2_addr_id</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rs2_addr_ex</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rs2_addr_mem</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rs2_addr_wb</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rs2_or_fwd_id</expr>
      <label/>
      <radix>wrapper.rvfi_inst.rs1_or_fwd_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rs2_rdata_ex</expr>
      <label/>
      <radix>wrapper.rvfi_inst.rs1_or_fwd_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rs2_rdata_mem</expr>
      <label/>
      <radix>wrapper.rvfi_inst.rs1_or_fwd_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rs2_rdata_wb</expr>
      <label/>
      <radix>wrapper.rvfi_inst.rs1_or_fwd_id</radix>
    </wave>
  </group>
  <group collapsed="false">
    <expr/>
    <label>rd</label>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rd_addr_wb</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rvfi_rd_addr</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_inst.ex_stage_inst.csr_access_ex_o</expr>
      <label/>
      <radix/>
    </wave>
    <wave>
      <expr>wrapper.core_inst.ex_stage_inst.stall_ex_i</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_inst.ex_stage_inst.csr_rdata_q</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_inst.ex_stage_inst.csr_rdata_ex_i</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_inst.mem_stage_inst.alu_result_ex_i</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.core_inst.wb_stage_inst.alu_result_mem_i</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.reg_wdata_wb</expr>
      <label/>
      <radix>wrapper.rvfi_inst.rs1_or_fwd_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.rvfi_rd_wdata</expr>
      <label/>
      <radix>wrapper.rvfi_inst.rs1_or_fwd_id</radix>
    </wave>
  </group>
  <group collapsed="false">
    <expr/>
    <label>CSR</label>
    <wave collapsed="true">
      <expr>wrapper.core_inst.csr_inst.mscratch</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.csr_rdata_ex</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.csr_rdata_mem</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.csr_rdata_wb</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>checker_inst.csr_insn_rdata</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
  </group>
  <group collapsed="true">
    <expr/>
    <label>PC</label>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.pc_id</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.pc_ex</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.pc_mem</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.pc_wb</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.pc_if</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.pc_n_ex</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.pc_n_mem</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.pc_n_wb</expr>
      <label/>
      <radix/>
    </wave>
  </group>
  <group collapsed="true">
    <expr/>
    <label>Mem</label>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.mem_addr_wb</expr>
      <label/>
      <radix>wrapper.rvfi_inst.rs1_or_fwd_id</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.mem_rmask_wb</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.mem_rdata_wb</expr>
      <label/>
      <radix>checker_inst.csr_insn_rdata</radix>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.mem_wmask_wb</expr>
      <label/>
      <radix/>
    </wave>
    <wave collapsed="true">
      <expr>wrapper.rvfi_inst.mem_wdata_wb</expr>
      <label/>
      <radix>wrapper.rvfi_inst.rs1_or_fwd_id</radix>
    </wave>
  </group>
  <highlightlist>
    <!--Users can remove the highlightlist block if they want to load the signal save file into older version of Jasper-->
    <highlight>
      <expr>wrapper.rvfi_inst.instr_wb</expr>
      <color>#ff8787</color>
    </highlight>
    <highlight>
      <expr>wrapper.rvfi_inst.pc_id</expr>
      <color>#55ffff</color>
    </highlight>
    <highlight>
      <expr>wrapper.rvfi_inst.pc_if</expr>
      <color>#55ffff</color>
    </highlight>
    <highlight>
      <expr>wrapper.rvfi_inst.pc_n_wb</expr>
      <color>#ff8787</color>
    </highlight>
    <highlight>
      <expr>wrapper.rvfi_inst.pc_wb</expr>
      <color>#ff8787</color>
    </highlight>
    <highlight>
      <expr>wrapper.rvfi_inst.rs1_addr_wb</expr>
      <color>#ff8787</color>
    </highlight>
    <highlight>
      <expr>wrapper.rvfi_inst.rs1_rdata_wb</expr>
      <color>#ff8787</color>
    </highlight>
    <highlight>
      <expr>wrapper.rvfi_inst.rs2_addr_wb</expr>
      <color>#ff8787</color>
    </highlight>
    <highlight>
      <expr>wrapper.rvfi_inst.rs2_rdata_wb</expr>
      <color>#ff8787</color>
    </highlight>
    <highlight>
      <expr>wrapper.rvfi_inst.rvfi_rd_addr</expr>
      <color>#ff8787</color>
    </highlight>
    <highlight>
      <expr>wrapper.rvfi_inst.rvfi_rd_wdata</expr>
      <color>#ff8787</color>
    </highlight>
    <highlight>
      <expr>wrapper.rvfi_inst.rvfi_valid_wb</expr>
      <color>#ff8787</color>
    </highlight>
    <highlight>
      <expr>wrapper.rvfi_inst.trap_wb</expr>
      <color>#ff8787</color>
    </highlight>
  </highlightlist>
</wavelist>
