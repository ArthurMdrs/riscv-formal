// Copyright (C) 2017  Claire Xenia Wolf <claire@yosyshq.com>
//
// Permission to use, copy, modify, and/or distribute this software for any
// purpose with or without fee is hereby granted, provided that the above
// copyright notice and this permission notice appear in all copies.
//
// THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
// WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
// ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
// WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
// ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
// OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

module rvfi_insn_check (
	input clock, reset, check,
	`RVFI_INPUTS
);
`ifdef RISCV_FORMAL_CHANNEL_IDX
	localparam integer channel_idx = `RISCV_FORMAL_CHANNEL_IDX;
`else
	genvar channel_idx;
	generate for (channel_idx = 0; channel_idx < `RISCV_FORMAL_NRET; channel_idx=channel_idx+1) begin:channel
`endif
		(* keep *) wire valid = !reset && rvfi_valid[channel_idx];
		(* keep *) wire [`RISCV_FORMAL_ILEN   - 1 : 0] insn      = rvfi_insn     [channel_idx*`RISCV_FORMAL_ILEN   +: `RISCV_FORMAL_ILEN];
		(* keep *) wire                                trap      = rvfi_trap     [channel_idx];
		(* keep *) wire                                halt      = rvfi_halt     [channel_idx];
		(* keep *) wire                                intr      = rvfi_intr     [channel_idx];
		(* keep *) wire [                       4 : 0] rs1_addr  = rvfi_rs1_addr [channel_idx*5  +:  5];
		(* keep *) wire [                       4 : 0] rs2_addr  = rvfi_rs2_addr [channel_idx*5  +:  5];
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] rs1_rdata = rvfi_rs1_rdata[channel_idx*`RISCV_FORMAL_XLEN   +: `RISCV_FORMAL_XLEN];
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] rs2_rdata = rvfi_rs2_rdata[channel_idx*`RISCV_FORMAL_XLEN   +: `RISCV_FORMAL_XLEN];
		(* keep *) wire [                       4 : 0] rd_addr   = rvfi_rd_addr  [channel_idx*5  +:  5];
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] rd_wdata  = rvfi_rd_wdata [channel_idx*`RISCV_FORMAL_XLEN   +: `RISCV_FORMAL_XLEN];
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] pc_rdata  = rvfi_pc_rdata [channel_idx*`RISCV_FORMAL_XLEN   +: `RISCV_FORMAL_XLEN];
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] pc_wdata  = rvfi_pc_wdata [channel_idx*`RISCV_FORMAL_XLEN   +: `RISCV_FORMAL_XLEN];

		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] mem_addr  = rvfi_mem_addr [channel_idx*`RISCV_FORMAL_XLEN   +: `RISCV_FORMAL_XLEN];
		(* keep *) wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] mem_rmask = rvfi_mem_rmask[channel_idx*`RISCV_FORMAL_XLEN/8 +: `RISCV_FORMAL_XLEN/8];
		(* keep *) wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] mem_wmask = rvfi_mem_wmask[channel_idx*`RISCV_FORMAL_XLEN/8 +: `RISCV_FORMAL_XLEN/8];
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] mem_rdata = rvfi_mem_rdata[channel_idx*`RISCV_FORMAL_XLEN   +: `RISCV_FORMAL_XLEN];
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] mem_wdata = rvfi_mem_wdata[channel_idx*`RISCV_FORMAL_XLEN   +: `RISCV_FORMAL_XLEN];
`ifdef RISCV_FORMAL_MEM_FAULT
		(* keep *) wire                                mem_fault = rvfi_mem_fault[channel_idx];
		(* keep *) wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] mem_fault_rmask = rvfi_mem_fault_rmask[channel_idx*`RISCV_FORMAL_XLEN/8 +: `RISCV_FORMAL_XLEN/8];
		(* keep *) wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] mem_fault_wmask = rvfi_mem_fault_wmask[channel_idx*`RISCV_FORMAL_XLEN/8 +: `RISCV_FORMAL_XLEN/8];
`endif

`ifdef RISCV_FORMAL_CSR_MISA
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] csr_misa_rdata = rvfi_csr_misa_rdata[channel_idx*`RISCV_FORMAL_XLEN   +: `RISCV_FORMAL_XLEN];
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] csr_misa_rmask = rvfi_csr_misa_rmask[channel_idx*`RISCV_FORMAL_XLEN   +: `RISCV_FORMAL_XLEN];
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_csr_misa_rmask;
`endif

		(* keep *) wire                                spec_valid;
		(* keep *) wire                                spec_trap;
		(* keep *) wire [                       4 : 0] spec_rs1_addr;
		(* keep *) wire [                       4 : 0] spec_rs2_addr;
		(* keep *) wire [                       4 : 0] spec_rd_addr;
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_rd_wdata;
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_pc_wdata;
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_mem_addr;
		(* keep *) wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_mem_rmask;
		(* keep *) wire [`RISCV_FORMAL_XLEN/8 - 1 : 0] spec_mem_wmask;
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_mem_wdata;

		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] rs1_rdata_or_zero = spec_rs1_addr != 0 ? rs1_rdata : 0;
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] rs2_rdata_or_zero = spec_rs2_addr != 0 ? rs2_rdata : 0;

`ifdef RISCV_FORMAL_CUSTOM_ISA
		(* keep *) wire [                       4 : 0] rs3_addr      = rvfi_rs3_addr      [channel_idx*5  +:  5];
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] rs3_rdata     = rvfi_rs3_rdata     [channel_idx*`RISCV_FORMAL_XLEN   +: `RISCV_FORMAL_XLEN];
		(* keep *) wire [                       4 : 0] post_rd_addr  = rvfi_post_rd_addr  [channel_idx*5  +:  5];
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] post_rd_wdata = rvfi_post_rd_wdata [channel_idx*`RISCV_FORMAL_XLEN   +: `RISCV_FORMAL_XLEN];
		(* keep *) wire                                is_hwlp       = rvfi_is_hwlp       [channel_idx];
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] hwlp_start    = rvfi_hwlp_start    [channel_idx*`RISCV_FORMAL_XLEN   +: `RISCV_FORMAL_XLEN];
        
		(* keep *) wire [                       4 : 0] spec_rs3_addr;
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] rs3_rdata_or_zero = spec_rs3_addr != 0 ? rs3_rdata : 0;
		(* keep *) wire [                       4 : 0] spec_post_rd_addr;
		(* keep *) wire [`RISCV_FORMAL_XLEN   - 1 : 0] spec_post_rd_wdata;
`endif

		`RISCV_FORMAL_INSN_MODEL insn_spec (
			.rvfi_valid          (valid              ),
			.rvfi_insn           (insn               ),
			.rvfi_pc_rdata       (pc_rdata           ),
			.rvfi_rs1_rdata      (rs1_rdata_or_zero  ),
			.rvfi_rs2_rdata      (rs2_rdata_or_zero  ),
			.rvfi_mem_rdata      (mem_rdata          ),

`ifdef RISCV_FORMAL_CSR_MISA
			.rvfi_csr_misa_rdata (csr_misa_rdata     ),
			.spec_csr_misa_rmask (spec_csr_misa_rmask),
`endif

			.spec_valid          (spec_valid         ),
			.spec_trap           (spec_trap          ),
			.spec_rs1_addr       (spec_rs1_addr      ),
			.spec_rs2_addr       (spec_rs2_addr      ),
			.spec_rd_addr        (spec_rd_addr       ),
			.spec_rd_wdata       (spec_rd_wdata      ),
			.spec_pc_wdata       (spec_pc_wdata      ),
			.spec_mem_addr       (spec_mem_addr      ),
			.spec_mem_rmask      (spec_mem_rmask     ),
			.spec_mem_wmask      (spec_mem_wmask     ),
			.spec_mem_wdata      (spec_mem_wdata     )

`ifdef RISCV_FORMAL_CUSTOM_ISA
			, .rvfi_rs3_rdata      (rs3_rdata_or_zero  )
			, .rvfi_is_hwlp        (is_hwlp            )
			, .rvfi_hwlp_start     (hwlp_start         )
            
			, .spec_rs3_addr       (spec_rs3_addr      )
			, .spec_post_rd_addr   (spec_post_rd_addr  )
			, .spec_post_rd_wdata  (spec_post_rd_wdata )
`endif
		);

		wire insn_pma_x, mem_pma_r, mem_pma_w;

		wire [1:0] mem_log2len =
			((spec_mem_rmask | spec_mem_wmask) & 8'b 1111_0000) ? 3 :
			((spec_mem_rmask | spec_mem_wmask) & 8'b 0000_1100) ? 2 :
			((spec_mem_rmask | spec_mem_wmask) & 8'b 0000_0010) ? 1 : 0;

`ifdef RISCV_FORMAL_PMA_MAP
		`RISCV_FORMAL_PMA_MAP insn_pma (
			.address(pc_rdata),
			.log2len(insn[1:0] == 2'b11 ? 2'd2 : 2'd1),
			.X(insn_pma_x)
		);

		`RISCV_FORMAL_PMA_MAP mem_pma (
			.address(spec_mem_addr),
			.log2len(mem_log2len),
			.R(mem_pma_r),
			.W(mem_pma_w)
		);
`else
		assign insn_pma_x = 1;
		assign mem_pma_r = 1;
		assign mem_pma_w = 1;
`endif

`ifdef RISCV_FORMAL_MEM_FAULT
		wire mem_access_fault = mem_fault ||
`else
		wire mem_access_fault =
`endif
				(spec_mem_rmask && !mem_pma_r) || (spec_mem_wmask && !mem_pma_w) ||
				((spec_mem_rmask || spec_mem_wmask) && !`rvformal_addr_valid(spec_mem_addr));

		integer i;

		always @* begin
			if (!reset) begin
				COV_spec_valid: cover(spec_valid);
				COV_spec_valid_not_trap: cover(spec_valid && !trap);
				COV_spec_valid_check: cover(check && spec_valid);
				COV_spec_valid_check_not_trap: cover(check && spec_valid && !trap);
			end
			if (!reset && check) begin
				ASM_spec_valid: assume(spec_valid);

				if (!`rvformal_addr_valid(pc_rdata) || !insn_pma_x || mem_access_fault) begin
					AST_error_trap     : assert(trap);
					AST_error_rd_addr  : assert(rd_addr == 0);
					AST_error_rd_wdata : assert(rd_wdata == 0);
					AST_error_mem_wmask: assert(mem_wmask == 0);
`ifdef RISCV_FORMAL_MEM_FAULT
					if (mem_fault) begin
						AST_mem_fault_spec_rmask: assert(mem_rmask == 0);
						AST_mem_fault_w_or_rmask: assert(spec_mem_wmask || spec_mem_rmask);
						AST_mem_fault_spec_addr : assert(`rvformal_addr_eq(spec_mem_addr, mem_addr));

						AST_mem_fault_spec_wmask: assert(mem_fault_wmask == spec_mem_wmask);
						AST_mem_fault_rmask     : assert((mem_fault_rmask & spec_mem_rmask) == spec_mem_rmask);
					end
`endif
				end else begin
`ifdef RISCV_FORMAL_CSR_MISA
					AST_spec_misa_rmask: assert((spec_csr_misa_rmask & csr_misa_rmask) == spec_csr_misa_rmask);
`endif

					if (rs1_addr == 0)
						AST_rs1_addr_is_0: assert(rs1_rdata == 0);

					if (rs2_addr == 0)
						AST_rs2_addr_is_0: assert(rs2_rdata == 0);

`ifdef RISCV_FORMAL_CUSTOM_ISA
					if (rs3_addr == 0)
						AST_rs3_addr_is_0: assert(rs3_rdata == 0);
`endif

					if (!spec_trap) begin
						if (spec_rs1_addr != 0)
							AST_spec_rs1_addr: assert(spec_rs1_addr == rs1_addr);

						if (spec_rs2_addr != 0)
							AST_spec_rs2_addr: assert(spec_rs2_addr == rs2_addr);

`ifdef RISCV_FORMAL_CUSTOM_ISA
						if (spec_rs3_addr != 0)
							AST_spec_rs3_addr: assert(spec_rs3_addr == rs3_addr);
                        
						AST_spec_post_rd_addr : assert(spec_post_rd_addr == post_rd_addr);
						AST_spec_post_rd_wdata: assert(spec_post_rd_wdata == post_rd_wdata);
`endif

						AST_spec_rd_addr : assert(spec_rd_addr == rd_addr);
						AST_spec_rd_wdata: assert(spec_rd_wdata == rd_wdata);
						AST_spec_pc_wdata: assert(`rvformal_addr_eq(spec_pc_wdata, pc_wdata));

						if (spec_mem_wmask || spec_mem_rmask) begin
							AST_spec_mem_addr: assert(`rvformal_addr_eq(spec_mem_addr, mem_addr));
						end

						for (i = 0; i < `RISCV_FORMAL_XLEN/8; i = i+1) begin
							if (spec_mem_wmask[i]) begin
								AST_spec_mem_wmask: assert(mem_wmask[i]);
								AST_spec_mem_wdata: assert(spec_mem_wdata[i*8 +: 8] == mem_wdata[i*8 +: 8]);
							end else if (mem_wmask[i]) begin
								AST_mem_w_and_rmask: assert(mem_rmask[i]);
								AST_mem_w_and_rdata: assert(mem_rdata[i*8 +: 8] == mem_wdata[i*8 +: 8]);
							end
							if (spec_mem_rmask[i]) begin
								AST_spec_mem_rmask: assert(mem_rmask[i]);
							end
						end
					end

					AST_spec_trap: assert(spec_trap == trap);
				end
			end
		end
`ifndef RISCV_FORMAL_CHANNEL_IDX
	end endgenerate
`endif
endmodule
