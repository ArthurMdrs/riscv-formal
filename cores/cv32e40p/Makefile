GTKW_CHK=insn_add_ch0

VCD = checks/reg_ch0/traces/violation.vcd

run: checks

.PHONY: checks
checks:
	@make -C checks

gen_sby:
	@python3 ../../checks/genchecks.py checks_sby
	@python3 ../../checks/insert_incdirs.py checks_sby
	@mv checks_sby checks

gen_jg:
	@python3 ../../checks/genchecks_jg.py

gtkw:
	gtkwave checks/$(GTKW_CHK)/engine_0/trace.vcd checks.gtkw

disasm:
	python3 disasm.py $(VCD)
	
clean:
	@echo "Removing checks folder."
	@rm -rf checks *.sig~