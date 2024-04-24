
RISC-V Formal Verification Framework - Pulpissimo Edition
=========================================================

**This is work in progress.**

This is a modified version of RISC-V Formal Verification Framework, adapted to work with Pulpissimo's custom ISA extension, xpulp. Specifically, the version used in Pulpissimo v7.0.0.

You will find the original README after this section.

To generate the macros and instruction checks for the xpulp extension, open the terminal in this directory and run:

```
RVFORMAL_ROOT=$(pwd)
cd $RVFORMAL_ROOT/checks
python3.11 rvfi_macros_xpulp.py > rvfi_macros.vh
cd $RVFORMAL_ROOT/insns
python3.11 generate_xpulp.py
```

Obs.: You don't need Python3.11, any version of Python from 3.7 and up should be fine.

To revert to original settings:

```
RVFORMAL_ROOT=$(pwd)
cd $RVFORMAL_ROOT/checks
python3.11 rvfi_macros.py > rvfi_macros.vh
cd $RVFORMAL_ROOT/insns
python3.11 generate.py
```

Adapted checkers: 

- rvfi_insn_check
- rvfi_reg_check
- rvfi_csrw_check

What has been adapted:

- Addition of rs3 (used in some xpulp instructions).
- Addition of rd for post-increments (used in post-incrementing stores/loads).
- Addition of is_hwlp to indicate the last instruction in a hardware loop. WIP DOES NOT WORK
- Addition of hwlp_start to indicate the PC of the first instruction in a hardware loop. WIP DOES NOT WORK
- Named all assumptions, assertions and covers for better debugging.

RISC-V Formal Verification Framework
====================================

**This is work in progress. The interfaces described here are likely to change as the project matures.**

About
-----

`riscv-formal` is a framework for formal verification of RISC-V processors.

It consists of the following components:
- A processor-independent formal description of the RISC-V ISA
- A set of formal testbenches for each processor supported by the framework
- The specification for the [RISC-V Formal Interface (RVFI)](docs/rvfi.md) that must be implemented by a processor core to interface with `riscv-formal`.
- Some auxiliary proofs and scripts, for example to prove correctness of the ISA spec agains riscv-isa-sim.

See [cores/picorv32/](cores/picorv32/) for example bindings for the PicoRV32 processor core.

A processor core usually will implement RVFI as an optional feature that is only enabled for verification. Sequential equivalence check can be used to prove equivalence of the processor versions with and without RVFI.

The current focus is on implementing formal models of all instructions from the RISC-V RV32I and RV64I ISAs, and formally verifying those models against the models used in the RISC-V "Spike" ISA simulator.

`riscv-formal` uses the FOSS SymbiYosys formal verification flow. All properties are expressed using immediate assertions/assumptions for maximal compatibility with other tools.

Table of contents
-----------------

- [Quickstart Guide](docs/quickstart.md)
- [The RVFI Interface Specification](docs/rvfi.md)
- [RISC-V Formal CSR Sematics](docs/csrs.md)
- [Configuration macros used by riscv-formal](docs/config.md)
- [The riscv-formal Verification Procedure](docs/procedure.md)
- [Examples of bugs found with riscv-formal](docs/examplebugs.md)
- [References and related work](docs/references.md)

Configuring a new RISC-V processor
----------------------------------

1. Create a `riscv-formal/cores/<core-name>/` directory
2. Write a wrapper module that instantiates the core under test and abstracts models of necessary
   peripherals (usually just memory)
   - Use the [RVFI helper macros](docs/config.md#rvfi_wires-rvfi_outputs-rvfi_inputs-rvfi_conn)
     `RVFI_OUTPUTS` and `RVFI_CONN` for quickly defining wrapper connections
   - See [picorv32/wrapper.sv](cores/picorv32/wrapper.sv) for a simple example wrapper
3. Write a `checks.cfg` config file for the new core
   - See [nerv/checks.cfg](cores/nerv/checks.cfg) for an example utilising most of the checks
   - Refer to [The riscv-formal Verification Procedure](docs/procedure.md) for a complete guide on
     available checks, and a more detailed view of using `genchecks.py`
4. Generate checks with `python3 ../../checks/genchecks.py` from the `<core-name>` directory
   - Checks are generated in `riscv-formal/cores/<core-name>/checks`
5. Run checks with `make -C checks j$(nproc)`

### Notes

- The [quickstart guide](docs/quickstart.md) goes through the process of running riscv-formal with
  some of the included cores.  It is recommended to follow this guide before adding a new core.
- See [picorv32/Makefile](cores/picorv32/Makefile) for an example makefile to manage generation and
  execution of checks.
- Out of tree generation with `genchecks.py` is not currently supported.
- Refer to [docs/config.md](docs/config.md) and [docs/procedure.md](docs/procedure.md) for a
  breakdown of how to use riscv-formal checks without using `genchecks.py`.
- The [cover check](docs/procedure.md#cover) can be used to help determine the depth needed for the
  core to reach certain states as needed for other checks.
