module rvfi_wrapper 
 #(
`include "el2_param.vh"
) (
	input clock,
	input reset,
	`RVFI_OUTPUTS
);
	(* keep *) wire trap;
    
    
    
    // Outputs: (* keep *) wire
    // Inputs: (* keep *) `rvformal_rand_reg
    
    

    // VeeR constant inputs
    (* keep *) wire [31:0] rst_vec = 'h80000000;
    (* keep *) wire        nmi_int = 0;
    (* keep *) wire [31:0] nmi_vec = 32'hee000000;
    (* keep *) wire [31:1] jtag_id = {4'b1, 16'b0, 11'h45};
    (* keep *) wire        lsu_bus_clk_en = 1;
    (* keep *) wire        ifu_bus_clk_en = 1;

    // VeeR outputs
    (* keep *) wire [31:0] trace_rv_i_insn_ip;
    (* keep *) wire [31:0] trace_rv_i_address_ip;
    (* keep *) wire        trace_rv_i_valid_ip;

    // DCCM ports
    (* keep *) `rvformal_rand_reg [pt.DCCM_FDATA_WIDTH-1:0]  dccm_rd_data_lo;
    (* keep *) `rvformal_rand_reg [pt.DCCM_FDATA_WIDTH-1:0]  dccm_rd_data_hi;

	el2_veer #(.pt(pt)) uut (
		.clk      ( clock),
		.rst_l    (!reset),
		.dbg_rst_l(!reset),
        .rst_vec  (rst_vec[31:1]),
        .nmi_vec  (nmi_vec[31:1]),
        .*,

		`RVFI_CONN
	);

`ifdef EL2_VEER_FAIRNESS
	// reg  mem_wait = 0;
	// always @(posedge clock) begin
	// 	mem_wait <= {mem_wait, mem_valid && !mem_ready};
	// 	assume (~mem_wait || trap);
	// end
`endif

`ifdef PICORV32_CSR_RESTRICT
	// always @* begin
	// 	if (rvfi_valid && rvfi_insn== 7'b1110011) begin
	// 		if (rvfi_insn[14:12] == 3'b010) begin
	// 			assume (rvfi_insn[31:20] == 12'hC00 || rvfi_insn[31:20] == 12'hC01 || rvfi_insn[31:20] == 12'hC02 ||
	// 					rvfi_insn[31:20] == 12'hC80 || rvfi_insn[31:20] == 12'hC81 || rvfi_insn[31:20] == 12'hC82);
	// 			assume (rvfi_insn[19:15] == 0);
	// 		end
	// 		assume (rvfi_insn[14:12] != 3'b001);
	// 		assume (rvfi_insn[14:12] != 3'b011);
	// 		assume (rvfi_insn[14:12] != 3'b101);
	// 		assume (rvfi_insn[14:12] != 3'b110);
	// 		assume (rvfi_insn[14:12] != 3'b111);
	// 	end
	// end
`endif
endmodule

