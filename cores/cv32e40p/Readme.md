# CV32E40P RISC-V Core - Formal Verification

THIS REPO IS A WIP
THIS REPO IS A WIP
THIS REPO IS A WIP

This repository contains the CV32E40P RISC-V Core design RTL and a script to generate formal checks using the RISC-V Formal Verification Framework. The directory containing this Readme (cv32e40p) should be in `$(riscv-formal-root)/cores`, where `riscv-formal-root` is the root directory for the RISC-V Formal repository.

ATTENTION: this is NOT the most recent version of the core. It is the version used in the Pulpissimo v7.0.0 microcontroller, as our intent is to verify the core used in this microcontroller. Following the dependecies we have: Pulpissimo v7.0.0 uses pulp_soc version 3.0.0, which uses cv32e40p rev "pulpissimo-v3.4.0-rev3". You will find these in the respective repository tags on GitHub.

# License

The licenses for the core and the IPs it uses are listed below.

Click [here](design/LICENSE) for the CV32E40P license.

Click [here](ips/common_cells/LICENSE) for the common_cells license.

Click [here](ips/fpnew/LICENSE) for the fpnew license.

Click [here](ips/fpu_div_sqrt_mvp/LICENSE) for the fpu_div_sqrt_mvp license.

Click [here](ips/tech_cells_generic/LICENSE) for the tech_cells_generic license.




Genus and Jasper complain about elaboration errors! The errors are related to the register file when the F and Zfinx extensions are enabled. For now, we disabled them.

Correction: Pulpissimo does not enable the Zfinx extension, although it is a valid configuration for the CV32E40P core.

Quick fix suggestion: change line 211 of [this file](./design/rtl/riscv_register_file_latch.sv) to the following:

   if (FPU == 1 && Zfinx==0) begin