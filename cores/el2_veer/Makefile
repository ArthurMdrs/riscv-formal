run: do_checks

do_checks:
	@make -C checks

gen_checks:
	@python3 ../../checks/genchecks.py
	@python3 insert_inc_files.py