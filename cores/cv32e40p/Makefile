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

summary:
	@FOLDERS=$$(find checks -mindepth 1 -maxdepth 1 -type d); \
	for folder in $$FOLDERS; do \
		cd $$folder; \
		rm PASS FAIL ERROR 2> /dev/null; \
		python3 ../../../../checks/get_jg_summary.py; \
		cd ../..;\
    done
	@python3 gen_summary.py
	