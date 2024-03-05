clear -all

analyze -sv12 \
    +define+SYNTHESIS=1 \
    +incdir+/home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/include \
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/ips/fpnew/src/fpnew_pkg.sv \
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
    /home/pedro.medeiros/Tools/riscv-formal-VeeR/cores/cv32e40p/design/rtl/riscv_tracer.sv

elaborate -top riscv_core

clock clk_i

reset rst_ni

prove -all
