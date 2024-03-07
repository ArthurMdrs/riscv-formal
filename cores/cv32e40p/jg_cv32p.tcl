clear -all

analyze -sv12 \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/checks/insn_add_ch0_jg/insn_add_ch0.sv
    
analyze -sv12 \
    +define+SYNTHESIS=1 \
    +incdir+/home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/include \
    +incdir+/home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/include \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/binary_to_gray.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/cb_filter_pkg.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/cdc_2phase.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/cf_math_pkg.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/clk_div.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/delta_counter.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/ecc_pkg.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/edge_propagator_tx.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/exp_backoff.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/fifo_v3.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/gray_to_binary.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/isochronous_spill_register.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/lfsr.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/lfsr_16bit.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/lfsr_8bit.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/mv_filter.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/onehot_to_bin.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/plru_tree.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/popcount.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/rr_arb_tree.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/rstgen_bypass.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/serial_deglitch.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/shift_reg.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/spill_register.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/stream_demux.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/stream_filter.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/stream_fork.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/stream_intf.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/stream_join.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/stream_mux.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/sub_per_hash.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/sync.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/sync_wedge.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/unread.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/addr_decode.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/cb_filter.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/cdc_fifo_2phase.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/cdc_fifo_gray.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/counter.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/ecc_decode.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/ecc_encode.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/edge_detect.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/lzc.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/max_counter.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/rstgen.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/stream_delay.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/stream_fifo.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/stream_fork_dynamic.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/stream_xbar.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/fall_through_register.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/id_queue.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/stream_to_mem.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/stream_arbiter_flushable.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/stream_omega_net.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/stream_register.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/stream_arbiter.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/deprecated/clock_divider_counter.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/deprecated/find_first_one.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/deprecated/generic_LFSR_8bit.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/deprecated/generic_fifo.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/deprecated/generic_fifo_adv.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/deprecated/pulp_sync.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/deprecated/pulp_sync_wedge.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/deprecated/clock_divider.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/deprecated/fifo_v2.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/deprecated/prioarbiter.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/deprecated/rrarbiter.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/deprecated/fifo_v1.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/edge_propagator.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/common_cells/src/edge_propagator_rx.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpu_div_sqrt_mvp/hdl/defs_div_sqrt_mvp.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpu_div_sqrt_mvp/hdl/control_mvp.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpu_div_sqrt_mvp/hdl/div_sqrt_mvp_wrapper.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpu_div_sqrt_mvp/hdl/div_sqrt_top_mvp.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpu_div_sqrt_mvp/hdl/iteration_div_sqrt_mvp.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpu_div_sqrt_mvp/hdl/norm_div_sqrt_mvp.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpu_div_sqrt_mvp/hdl/nrbd_nrsc_mvp.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpu_div_sqrt_mvp/hdl/preprocess_mvp.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpnew/src/fpnew_pkg.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpnew/src/fpnew_cast_multi.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpnew/src/fpnew_classifier.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpnew/src/fpnew_divsqrt_multi.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpnew/src/fpnew_fma.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpnew/src/fpnew_fma_multi.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpnew/src/fpnew_noncomp.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpnew/src/fpnew_opgroup_block.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpnew/src/fpnew_opgroup_fmt_slice.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpnew/src/fpnew_opgroup_multifmt_slice.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpnew/src/fpnew_rounding.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpnew/src/fpnew_top.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/tech_cells_generic/src/deprecated/cluster_clk_cells.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/register_file_test_wrap.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_register_file_latch.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/include/apu_core_package.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/include/riscv_defines.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/include/riscv_tracer_defines.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_alu.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_alu_basic.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_alu_div.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_compressed_decoder.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_controller.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_cs_registers.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_decoder.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_int_controller.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_ex_stage.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_hwloop_controller.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_hwloop_regs.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_id_stage.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_if_stage.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_load_store_unit.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_mult.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_prefetch_buffer.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_prefetch_L0_buffer.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_core.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_apu_disp.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_fetch_fifo.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_L0_buffer.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_pmp.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_tracer.sv \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/rvfi_wrapper.sv

elaborate -top rvfi_wrapper -create_related_covers witness

#clock clk_i
clock clock

#reset !rst_ni
reset reset

#assume {clock_en_i == 1'b1}
#assume {test_en_i == 1'b1}
#assume {fregfile_disable_i == 1'b0}
#assume {fetch_enable_i == 1'b1}

#prove -all
