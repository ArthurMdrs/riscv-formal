# ----------------------------------------
# Jasper Version Info
# tool      : Jasper 2023.09
# platform  : Linux 4.18.0-477.27.1.el8_8.x86_64
# version   : 2023.09p002 64 bits
# build date: 2023.11.21 13:10:30 UTC
# ----------------------------------------
# started   : 2024-02-25 17:07:05 -03
# hostname  : microeletronica.(none)
# pid       : 3675627
# arguments : '-label' 'session_0' '-console' '//127.0.0.1:45271' '-style' 'windows' '-data' 'AAAAwHicY2RgYLCp////PwMYMFcBCQEGHwZfhiAGVyDpzxAGpBkY1BhMGYwYLBgMGBwYDIFsAwY9IG0GZIFoQzAJkgUDxgcQmsGGkQEZMAY2oNAMDKwwhXAlYLsyGfIYioE4niGRIQUI4xmSGTKApsczZDGkA+0qAfJzwOoBX7YU/w==' '-proj' '/home/pedro.medeiros/riscv-formal/cores/el2_veer/checks/insn_add_ch0_jg/jgproject/sessionLogs/session_0' '-init' '-hidden' '/home/pedro.medeiros/riscv-formal/cores/el2_veer/checks/insn_add_ch0_jg/jgproject/.tmp/.initCmds.tcl' 'insn_add_ch0_jg.tcl'
clear -all

set design ../../design
set snapshots ../../snapshots/default

analyze -sv12 \
    +incdir+${snapshots} \
    insn_add_ch0.sv \
    ${snapshots}/common_defines.vh \
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

elaborate -top rvfi_testbench

clock clock

reset reset
prove -bg -all
visualize -property <embedded>::rvfi_testbench.checker_inst._cover_0 -new_window
visualize -property <embedded>::rvfi_testbench.checker_inst._cover_0_2 -new_window
visualize -property <embedded>::rvfi_testbench.checker_inst._cover_0_1 -new_window
