VCD = ./violation.vcd
BATCH = -batch
TOOL = jg
CORE = RISC-X

run: checks.cfg run_checks

run_checks:
	@if [ ! -d checks ]; then \
		$(MAKE) gen_jg; \
	else \
		$(MAKE) clean; \
		$(MAKE) gen_jg; \
	fi
	@$(eval TIME_START = $(shell date))
	@make -C checks
	@echo Proccess start: $(TIME_START)
	@echo Proccess end  : $$(date)

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
	@rm -rf checks *.sig~ jgproject 2> /dev/null || true

summary:
	@python3 gen_summary.py $(TOOL)
	@if [ -e summary.txt ]; then echo Created file \"summary.txt\".; fi

core:
	@echo "Updating submodules (the only submodule is the core)."
	@git submodule update --init --recursive

isa:
	@echo Generating instruction files in /path/to/riscv-formal/insns.
	@cd ../../insns && rm -f *.v *.txt
	@cd ../../insns && python3 generate.py

checks.cfg: 
	@if [ ! -d $(CORE) ]; then $(MAKE) core; fi
	@cp $(CORE)/fv/checks.cfg ./checks.cfg

cp_to_fv:
	@if [ ! -d $(CORE) ]; then $(MAKE) core; fi
	@cp *.sig checks.cfg disasm.py gen_summary.py $(CORE)/fv/

cp_from_fv:
	@if [ ! -d $(CORE) ]; then $(MAKE) core; fi
	@cp $(CORE)/fv/*.sig $(CORE)/fv/checks.cfg $(CORE)/fv/disasm.py $(CORE)/fv/gen_summary.py ./