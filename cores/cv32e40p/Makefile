VCD = ./violation.vcd

# .SILENT:

run: run_checks

run_checks:
	@if [ ! -d checks ]; then $(MAKE) gen_jg; fi
	@make -C checks

gen_sby:
	@if [ -d checks ]; then $(MAKE) clean; fi
	@python3 ../../checks/genchecks.py
	@python3 ../../checks/insert_incdirs.py

gen_jg:
	@if [ -d checks ]; then $(MAKE) clean; fi
	@python3 ../../checks/genchecks_jg.py

gtkw:
	gtkwave $(VCD) checks.gtkw

disasm:
	python3 disasm.py $(VCD)
	
clean:
	@echo "Removing checks folder."
	@rm -rf checks *.sig~ jgproject