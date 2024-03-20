VCD = checks/reg_ch0/traces/violation.vcd

run: run_checks

run_checks: checks
	@make -C checks

checks: gen_jg

gen_sby:
	@python3 ../../checks/genchecks.py
	@python3 ../../checks/insert_incdirs.py

gen_jg:
	@python3 ../../checks/genchecks_jg.py

gtkw:
	gtkwave $(VCD) checks.gtkw

disasm:
	python3 disasm.py $(VCD)
	
clean:
	@echo "Removing checks folder."
	@rm -rf checks *.sig~ jgproject