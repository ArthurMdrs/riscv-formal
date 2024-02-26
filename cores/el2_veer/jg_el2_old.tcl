clear -all

set design design

#analyze -sv12 \
#    ../../checks/rvfi_macros.vh \

analyze -sv12 \
    ../../checks/rvfi_macros.vh \
    +define+RISCV_FORMAL=1 \
    +define+RISCV_FORMAL_NRET=1 \
    +define+RISCV_FORMAL_XLEN=32 \
    +define+RISCV_FORMAL_ILEN=32 \
    +define+RISCV_FORMAL_RESET_CYCLES=1 \
    +define+RISCV_FORMAL_CHECK_CYCLE=20 \
    +define+RISCV_FORMAL_CHANNEL_IDX=0 \
    +define+RISCV_FORMAL_CHECKER=rvfi_insn_check \
    +define+RISCV_FORMAL_INSN_MODEL=rvfi_insn_add \
    +define+RISCV_FORMAL_COMPRESSED=1 \
    +define+RISCV_FORMAL_ALIGNED_MEM=1 \
    +incdir+snapshots/default \
    +incdir+${design}/lib \
    +incdir+${design}/include \
    +incdir+${design}/dmi \
    snapshots/default/common_defines.vh \
    ${design}/include/el2_def.sv \
    ${design}/lib/el2_mem_if.sv \
    ${design}/el2_veer_wrapper.sv \
    ${design}/el2_mem.sv \
    ${design}/el2_pic_ctrl.sv \
    ${design}/el2_veer.sv \
    ${design}/el2_dma_ctrl.sv \
    ${design}/el2_pmp.sv \
    ${design}/ifu/el2_ifu_aln_ctl.sv \
    ${design}/ifu/el2_ifu_compress_ctl.sv \
    ${design}/ifu/el2_ifu_ifc_ctl.sv \
    ${design}/ifu/el2_ifu_bp_ctl.sv \
    ${design}/ifu/el2_ifu_ic_mem.sv \
    ${design}/ifu/el2_ifu_mem_ctl.sv \
    ${design}/ifu/el2_ifu_iccm_mem.sv \
    ${design}/ifu/el2_ifu.sv \
    ${design}/dec/el2_dec_decode_ctl.sv \
    ${design}/dec/el2_dec_gpr_ctl.sv \
    ${design}/dec/el2_dec_ib_ctl.sv \
    ${design}/dec/el2_dec_pmp_ctl.sv \
    ${design}/dec/el2_dec_tlu_ctl.sv \
    ${design}/dec/el2_dec_trigger.sv \
    ${design}/dec/el2_dec.sv \
    ${design}/exu/el2_exu_alu_ctl.sv \
    ${design}/exu/el2_exu_mul_ctl.sv \
    ${design}/exu/el2_exu_div_ctl.sv \
    ${design}/exu/el2_exu.sv \
    ${design}/lsu/el2_lsu.sv \
    ${design}/lsu/el2_lsu_clkdomain.sv \
    ${design}/lsu/el2_lsu_addrcheck.sv \
    ${design}/lsu/el2_lsu_lsc_ctl.sv \
    ${design}/lsu/el2_lsu_stbuf.sv \
    ${design}/lsu/el2_lsu_bus_buffer.sv \
    ${design}/lsu/el2_lsu_bus_intf.sv \
    ${design}/lsu/el2_lsu_ecc.sv \
    ${design}/lsu/el2_lsu_dccm_mem.sv \
    ${design}/lsu/el2_lsu_dccm_ctl.sv \
    ${design}/lsu/el2_lsu_trigger.sv \
    ${design}/dbg/el2_dbg.sv \
    ${design}/dmi/dmi_mux.v \
    ${design}/dmi/dmi_wrapper.v \
    ${design}/dmi/dmi_jtag_to_core_sync.v \
    ${design}/dmi/rvjtag_tap.v \
    ${design}/lib/el2_lib.sv \
    ${design}/lib/beh_lib.sv \
    ${design}/lib/mem_lib.sv \
    ${design}/lib/ahb_to_axi4.sv \
    ${design}/lib/axi4_to_ahb.sv \
    ${design}/rvfi_wrapper.sv

#elaborate -top el2_veer_wrapper
elaborate -top rvfi_wrapper

#clock clk
clock clock

#reset !rst_l
reset reset
