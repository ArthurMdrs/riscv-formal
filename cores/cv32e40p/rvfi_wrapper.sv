module rvfi_wrapper (
	input logic clock,
	input logic reset,
	`RVFI_OUTPUTS
);

    // localparams for the CV32E40P core
    localparam N_EXT_PERF_COUNTERS =   1;
    localparam INSTR_RDATA_WIDTH   =  32;
    localparam PULP_SECURE         =   1;
    // localparam N_PMP_ENTRIES       =  16;
    // localparam USE_PMP             =   1; 
    localparam PULP_CLUSTER        =   0;
    localparam FPU                 =   0; // Original value is 1
    localparam Zfinx               =   0; // Original value is 1
    localparam FP_DIVSQRT          =   0; // Original value is 1
    localparam SHARED_FP           =   0;
    // localparam SHARED_DSP_MULT     =   0;
    // localparam SHARED_INT_MULT     =   0;
    // localparam SHARED_INT_DIV      =   0;
    localparam SHARED_FP_DIVSQRT   =   2;
    localparam WAPUTYPE            =   0;
    localparam APU_NARGS_CPU       =   3;
    localparam APU_WOP_CPU         =   6;
    localparam APU_NDSFLAGS_CPU    =  15;
    localparam APU_NUSFLAGS_CPU    =   5;
    // localparam DM_HaltAddress      = 32'h1A110800;
    
    localparam BOOT_ADDR         = 32'h1A00_0080;
    localparam CORE_ID           =  4'd0;
    localparam CLUSTER_ID        =  6'd31;


	// (* keep *) wire trap;
    
    
    
    // Outputs:         (* keep *)               wire
    // Tied-off inputs: (* keep *)               wire
    // Random inputs:   (* keep *) `rvformal_rand_reg
    
    ////////////////////   PORT LIST - BEGIN   ////////////////////
    
    // Clock and Reset
    (* keep *) wire        clk_i;
    (* keep *) wire        rst_ni;

    (* keep *) wire        clock_en_i;    // enable clock, otherwise it is gated
    (* keep *) wire        test_en_i;     // enable all clock gates for testing

    (* keep *) wire        fregfile_disable_i;  // disable the fp regfile, using int regfile instead

    // Core ID, Cluster ID and boot address are considered more or less static
    (* keep *) wire [31:0] boot_addr_i;
    (* keep *) wire [ 3:0] core_id_i;
    (* keep *) wire [ 5:0] cluster_id_i;

    // Instruction memory interface
    (* keep *)               wire                         instr_req_o;
    (* keep *) `rvformal_rand_reg                         instr_gnt_i;
    (* keep *) `rvformal_rand_reg                         instr_rvalid_i;
    (* keep *)               wire                  [31:0] instr_addr_o;
    (* keep *) `rvformal_rand_reg [INSTR_RDATA_WIDTH-1:0] instr_rdata_i;

    // Data memory interface
    (* keep *)               wire        data_req_o;
    (* keep *) `rvformal_rand_reg        data_gnt_i;
    (* keep *) `rvformal_rand_reg        data_rvalid_i;
    (* keep *)               wire        data_we_o;
    (* keep *)               wire [3:0]  data_be_o;
    (* keep *)               wire [31:0] data_addr_o;
    (* keep *)               wire [31:0] data_wdata_o;
    (* keep *) `rvformal_rand_reg [31:0] data_rdata_i;

    // apu-interconnect
    // handshake signals
    (* keep *) wire                       apu_master_req_o;
    (* keep *) wire                       apu_master_ready_o;
    (* keep *) wire                       apu_master_gnt_i;
    // request channel
    (* keep *) wire [APU_NARGS_CPU-1:0][31:0] apu_master_operands_o;
    (* keep *) wire [APU_WOP_CPU-1:0]         apu_master_op_o;
    (* keep *) wire [WAPUTYPE-1:0]            apu_master_type_o;
    (* keep *) wire [APU_NDSFLAGS_CPU-1:0]    apu_master_flags_o;
    // response channel
    (* keep *) wire                        apu_master_valid_i;
    (* keep *) wire [31:0]                 apu_master_result_i;
    (* keep *) wire [APU_NUSFLAGS_CPU-1:0] apu_master_flags_i;

    // Interrupt inputs
    (* keep *) wire        irq_i;                 // level sensitive IR lines
    (* keep *) wire [4:0]  irq_id_i;
    (* keep *) wire        irq_ack_o;
    (* keep *) wire [4:0]  irq_id_o;
    (* keep *) wire        irq_sec_i;

    (* keep *) wire        sec_lvl_o;

    // Debug Interface
    (* keep *) wire        debug_req_i;

    // CPU Control Signals
    (* keep *) wire        fetch_enable_i;
    (* keep *) wire        core_busy_o;

    (* keep *) wire [N_EXT_PERF_COUNTERS-1:0] ext_perf_counters_i;
        
    ////////////////////    PORT LIST - END    ////////////////////
    
    
    
    
    
    // Tie-offs
    assign clk_i                = clock;
    assign rst_ni               = !reset;
    assign clock_en_i           = 1'b1;
    assign test_en_i            = 1'b0;
    assign fregfile_disable_i   = 1'b0;
    assign boot_addr_i          = BOOT_ADDR;
    assign core_id_i            = CORE_ID;
    assign cluster_id_i         = CLUSTER_ID;
    
    // Pulpissimo does not use the apu interconnect
    // This is used when there is an external FPU
    assign apu_master_gnt_i     =  1'b1;
    assign apu_master_valid_i   =  1'b0;
    assign apu_master_result_i  = 32'b0;
    assign apu_master_flags_i   =    '0;    
    
    // Disable interrupts for now (they are asynchronous)
    assign irq_i     = 1'b0;
    assign irq_id_i  = 5'b0;
    assign irq_sec_i = 1'b0;
    
    // Disable halts requested by debug module (for now)
    assign debug_req_i = 1'b0;
    
    // Fetches are always enabled
    // Obs.: maybe we'll need to disable this for the 1st cycle after reset
    assign fetch_enable_i = 1'b1;
    
    // Disable external performance counters
    assign ext_perf_counters_i = '0;
    
    
    
    `default_nettype none
    riscv_core
    #(
        .N_EXT_PERF_COUNTERS            ( N_EXT_PERF_COUNTERS      ),
        .INSTR_RDATA_WIDTH              ( INSTR_RDATA_WIDTH        ),
        .PULP_SECURE                    ( PULP_SECURE              ),
        // .N_PMP_ENTRIES                  ( N_PMP_ENTRIES            ),
        // .USE_PMP                        ( USE_PMP                  ),
        .PULP_CLUSTER                   ( PULP_CLUSTER             ),
        .FPU                            ( FPU                      ),
        .Zfinx                          ( Zfinx                    ),
        .FP_DIVSQRT                     ( FP_DIVSQRT               ),
        .SHARED_FP                      ( SHARED_FP                ),
        // .SHARED_DSP_MULT                ( SHARED_DSP_MULT          ),
        // .SHARED_INT_MULT                ( SHARED_INT_MULT          ),
        // .SHARED_INT_DIV                 ( SHARED_INT_DIV           ),
        .SHARED_FP_DIVSQRT              ( SHARED_FP_DIVSQRT        ),
        .WAPUTYPE                       ( WAPUTYPE                 ),
        .APU_NARGS_CPU                  ( APU_NARGS_CPU            ),
        .APU_WOP_CPU                    ( APU_WOP_CPU              ),
        .APU_NDSFLAGS_CPU               ( APU_NDSFLAGS_CPU         ),
        .APU_NUSFLAGS_CPU               ( APU_NUSFLAGS_CPU         )
        // .DM_HaltAddress                 ( DM_HaltAddress           ),
    )
    uut
    (
        .clk_i                          ( clk_i                   ),
        .rst_ni                         ( rst_ni                  ),

        .clock_en_i                     ( clock_en_i              ),
        .test_en_i                      ( test_en_i               ),

        .fregfile_disable_i             ( fregfile_disable_i      ),

        .boot_addr_i                    ( boot_addr_i             ),
        .core_id_i                      ( core_id_i               ),
        .cluster_id_i                   ( cluster_id_i            ),

        .instr_req_o                    ( instr_req_o             ),
        .instr_gnt_i                    ( instr_gnt_i             ),
        .instr_rvalid_i                 ( instr_rvalid_i          ),
        .instr_addr_o                   ( instr_addr_o            ),
        .instr_rdata_i                  ( instr_rdata_i           ),

        .data_req_o                     ( data_req_o              ),
        .data_gnt_i                     ( data_gnt_i              ),
        .data_rvalid_i                  ( data_rvalid_i           ),
        .data_we_o                      ( data_we_o               ),
        .data_be_o                      ( data_be_o               ),
        .data_addr_o                    ( data_addr_o             ),
        .data_wdata_o                   ( data_wdata_o            ),
        .data_rdata_i                   ( data_rdata_i            ),

        .apu_master_req_o               ( apu_master_req_o        ),
        .apu_master_ready_o             ( apu_master_ready_o      ),
        .apu_master_gnt_i               ( apu_master_gnt_i        ),
        .apu_master_operands_o          ( apu_master_operands_o   ),
        .apu_master_op_o                ( apu_master_op_o         ),
        .apu_master_type_o              ( apu_master_type_o       ),
        .apu_master_flags_o             ( apu_master_flags_o      ),

        .apu_master_valid_i             ( apu_master_valid_i      ),
        .apu_master_result_i            ( apu_master_result_i     ),
        .apu_master_flags_i             ( apu_master_flags_i      ),

        .irq_i                          ( irq_i                   ),
        .irq_id_i                       ( irq_id_i                ),
        .irq_ack_o                      ( irq_ack_o               ),
        .irq_id_o                       ( irq_id_o                ),
        .irq_sec_i                      ( irq_sec_i               ),

        .sec_lvl_o                      ( sec_lvl_o               ),

        .debug_req_i                    ( debug_req_i             ),

        .fetch_enable_i                 ( fetch_enable_i          ),
        .core_busy_o                    ( core_busy_o             ),

        .ext_perf_counters_i            ( ext_perf_counters_i     ),
        
	   	`RVFI_CONN
    );   
    
    
    
    
    
    // No grant without request
    reg instr_gnt_wo_req = 0;
    reg data_gnt_wo_req = 0;
	always @(posedge clock) begin
        instr_gnt_wo_req = instr_gnt_i && !instr_req_o;
        data_gnt_wo_req  = data_gnt_i  && !data_req_o ;
		ASM_no_gnt_wo_req_instr: assume (!instr_gnt_wo_req);
		ASM_no_gnt_wo_req_data:  assume (!data_gnt_wo_req );
	end
    // assume property (@(posedge clock) instr_gnt_i |-> instr_req_o);
    // To do: change concurrent covers below to immediate so SymbiYosys can compile them
    instr_req_can_happen: cover property (@(posedge clock) instr_req_o);
    data_req_can_happen:  cover property (@(posedge clock) data_req_o );
    
    // Build aux code and assumptions for data_rvalid_i???

`ifdef CV32P_FAIRNESS    
	// reg  mem_wait = 0;
	// always @(posedge clock) begin
	// 	mem_wait <= {mem_wait, mem_valid && !mem_ready};
	// 	assume (~mem_wait || trap);
	// end
`endif

`ifdef CV32P_CSR_RESTRICT
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

