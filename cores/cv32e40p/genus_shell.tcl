# genus -f genus_shell.tcl
if ![info exists env(GENUSHOME)] {puts "PLEASE SET \"GENUSHOME\" VARIABLE!"; exit 1}

set_db library $env(GENUSHOME)/share/synth/tutorials/tech/tutorial.lib

read_hdl -sv -f genus_files.f

elaborate rvfi_wrapper
write_hdl > syn.vs
check_design
define_clock -period 67000 -name 15MHz [get_db ports *clock]
external_delay -clock 15MHz -input  27000 -name delay_in  [all_inputs]
external_delay -clock 15MHz -output 40000 -name delay_out [all_outputs]

#synthesize -to_mapped
syn_generic
syn_map
syn_opt
write_hdl > syn.vg
exit
