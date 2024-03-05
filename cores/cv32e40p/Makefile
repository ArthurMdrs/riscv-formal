GTKW_CHK=insn_add_ch0

run: gen_jg

do_checks:
	@make -C checks

gen_sby:
	@python3 ../../checks/genchecks.py
	@python3 insert_inc_files.py

gen_jg:
	python3 ../../checks/gen_jg_checks.py

gtkw:
	gtkwave checks/$(GTKW_CHK)/engine_0/trace.vcd checks.gtkw
	
clean:
	rm -rf checks