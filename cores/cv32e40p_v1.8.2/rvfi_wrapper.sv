module rvfi_wrapper (
    input logic clock,
    input logic reset
    ,
    `RVFI_OUTPUTS
);
    
    // Outputs:         (* keep *)               wire
    // Tied-off inputs: (* keep *)               wire
    // Random inputs:   (* keep *) `rvformal_rand_reg
    
    ////////////////////   PORT LIST - BEGIN   ////////////////////
    
    // Clock and Reset
    (* keep *) wire        clk_i;
    (* keep *) wire        rst_ni;

    (* keep *) wire        pulp_clock_en_i;  // PULP clock enable (only used if COREV_CLUSTER = 1)
    (* keep *) wire        scan_cg_en_i;     // Enable all clock gates for testing

    // Core ID, Cluster ID, debug mode halt address and boot address are considered more or less static
    (* keep *) wire [31:0] boot_addr_i;
    (* keep *) wire [31:0] mtvec_addr_i;
    (* keep *) wire [31:0] dm_halt_addr_i;
    (* keep *) wire [31:0] hart_id_i;
    (* keep *) wire [31:0] dm_exception_addr_i;

    // Instruction memory interface
    (* keep *)               wire        instr_req_o;
    (* keep *) `rvformal_rand_reg        instr_gnt_i;
    (* keep *) `rvformal_rand_reg        instr_rvalid_i;
    (* keep *)               wire [31:0] instr_addr_o;
    (* keep *) `rvformal_rand_reg [31:0] instr_rdata_i;

    // Data memory interface
    (* keep *)               wire        data_req_o;
    (* keep *) `rvformal_rand_reg        data_gnt_i;
    (* keep *) `rvformal_rand_reg        data_rvalid_i;
    (* keep *)               wire        data_we_o;
    (* keep *)               wire [3:0]  data_be_o;
    (* keep *)               wire [31:0] data_addr_o;
    (* keep *)               wire [31:0] data_wdata_o;
    (* keep *) `rvformal_rand_reg [31:0] data_rdata_i;

    // Interrupt inputs
    (* keep *)               wire [31:0] irq_i;  // CLINT interrupts + CLINT extension interrupts
    (* keep *)               wire        irq_ack_o;
    (* keep *)               wire [ 4:0] irq_id_o;

    // Debug Interface
    (* keep *) wire debug_req_i;
    (* keep *) wire debug_havereset_o;
    (* keep *) wire debug_running_o;
    (* keep *) wire debug_halted_o;

    // CPU Control Signals
    (* keep *) wire fetch_enable_i;
    (* keep *) wire core_sleep_o;
        
    ////////////////////    PORT LIST - END    ////////////////////
    
    // Tie-offs
    
    assign clk_i           = clock;
    assign rst_ni          = !reset;
    assign pulp_clock_en_i = 1'b0;
    assign scan_cg_en_i    = 1'b0;
    
    assign boot_addr_i         = 32'h1A00_0080; //32'h180
    assign mtvec_addr_i        = 32'h3A00_0080; //32'h0
    assign dm_halt_addr_i      = 32'h5A00_0080; //32'h1A110800
    assign dm_exception_addr_i = 32'h7A00_0080; //32'h0
    assign hart_id_i           = 32'h0000_000F; //32'h0
    
    assign irq_i = 32'h0;  // Disable interrupts for now
    
    assign debug_req_i = 1'b0;  // Disable halts requested by debug module for now
    
    assign fetch_enable_i = 1'b1;  // Fetches are always enabled
    
    
    
`ifdef RISCV_FORMAL_CUSTOM_ISA
    localparam COREV_PULP = 1;
`else
    localparam COREV_PULP = 0;
`endif
    
    `default_nettype none
    cv32e40p_top #(
        .FPU                      ( 0 ),
        .FPU_ADDMUL_LAT           ( 0 ),
        .FPU_OTHERS_LAT           ( 0 ),
        .ZFINX                    ( 0 ),
        .COREV_PULP               ( COREV_PULP ),
        .COREV_CLUSTER            ( 0 ),
        .NUM_MHPMCOUNTERS         ( 1 )
    ) core_top_i (
        // Clock and reset
        .rst_ni                   (rst_ni),
        .clk_i                    (clk_i),
        .scan_cg_en_i             (scan_cg_en_i),

        // Special control signals
        .fetch_enable_i           (fetch_enable_i),
        .pulp_clock_en_i          (pulp_clock_en_i),
        .core_sleep_o             (core_sleep_o),

        // Configuration
        .boot_addr_i              (boot_addr_i),
        .mtvec_addr_i             (mtvec_addr_i),
        .dm_halt_addr_i           (dm_halt_addr_i),
        .dm_exception_addr_i      (dm_exception_addr_i),
        .hart_id_i                (hart_id_i),

        // Instruction memory interface
        .instr_addr_o             (instr_addr_o),
        .instr_req_o              (instr_req_o),
        .instr_gnt_i              (instr_gnt_i),
        .instr_rvalid_i           (instr_rvalid_i),
        .instr_rdata_i            (instr_rdata_i),

        // Data memory interface
        .data_addr_o              (data_addr_o),
        .data_req_o               (data_req_o),
        .data_gnt_i               (data_gnt_i),
        .data_we_o                (data_we_o),
        .data_be_o                (data_be_o),
        .data_wdata_o             (data_wdata_o),
        .data_rvalid_i            (data_rvalid_i),
        .data_rdata_i             (data_rdata_i),

        // Interrupt interface
        .irq_i                    (irq_i),
        .irq_ack_o                (irq_ack_o),
        .irq_id_o                 (irq_id_o),

        // Debug interface
        .debug_req_i              (debug_req_i),
        .debug_havereset_o        (debug_havereset_o),
        .debug_running_o          (debug_running_o),
        .debug_halted_o           (debug_halted_o),
        
        `RVFI_CONN
    );
    
    
    
    // No valid response without pending transaction
    reg [1:0] instr_trans_pnd;
    reg [1:0] data_trans_pnd ;
    wire instr_cnt_up = instr_gnt_i && instr_req_o;
    wire instr_cnt_dn = instr_rvalid_i;
    wire data_cnt_up  = data_gnt_i  && data_req_o ;
    wire data_cnt_dn  = data_rvalid_i ;

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            instr_trans_pnd <= 2'b0;
            data_trans_pnd  <= 2'b0;
        end else begin
            unique case ({instr_cnt_up, instr_cnt_dn})
                2'b00: instr_trans_pnd <= instr_trans_pnd;
                2'b01: instr_trans_pnd <= instr_trans_pnd - 2'b1;
                2'b10: instr_trans_pnd <= instr_trans_pnd + 2'b1;
                2'b11: instr_trans_pnd <= instr_trans_pnd;
            endcase
            
            unique case ({data_cnt_up, data_cnt_dn})
                2'b00: data_trans_pnd <= data_trans_pnd;
                2'b01: data_trans_pnd <= data_trans_pnd - 2'b1;
                2'b10: data_trans_pnd <= data_trans_pnd + 2'b1;
                2'b11: data_trans_pnd <= data_trans_pnd;
            endcase
            
            ASM_max_2_pnd_trans_instr: assume (instr_trans_pnd != 2'b11);
            ASM_max_2_pnd_trans_data : assume (data_trans_pnd  != 2'b11);
            if (instr_trans_pnd == 2'b0)
                ASM_no_rvld_wo_pnd_instr: assume (!instr_rvalid_i);
            if (data_trans_pnd  == 2'b0)
                ASM_no_rvld_wo_pnd_data : assume (!data_rvalid_i );
        end
    end
    
    
    
    // always @(posedge clock) begin
    //     // Don't allow the Pulp custom hardware loop instructions
    //  ASM_no_hwloop_instr: assume (uut.if_stage_i.fetch_rdata[6:0] != OPCODE_HWLOOP);
    //     // Don't allow hwloop CSRs access in a CSR instruction 
    //     if (uut.if_stage_i.fetch_rdata[6:0] == OPCODE_SYSTEM && uut.if_stage_i.fetch_rdata[14:12] != 3'b0) // This is a CSR instruction
    //      ASM_no_hwloop_csr_instr: assume (uut.if_stage_i.fetch_rdata[31:20] != 12'h7C0 && 
    //                                          uut.if_stage_i.fetch_rdata[31:20] != 12'h7C1 && 
    //                                          uut.if_stage_i.fetch_rdata[31:20] != 12'h7C2 && 
    //                                          uut.if_stage_i.fetch_rdata[31:20] != 12'h7C4 && 
    //                                          uut.if_stage_i.fetch_rdata[31:20] != 12'h7C5 && 
    //                                          uut.if_stage_i.fetch_rdata[31:20] != 12'h7C6    );
    // end



// `ifdef CV32P_REG_CHECK
//     // Post-Incrementing Load instructions write to 2 registers
//     // This breaks the register consistency check, that assumes 1 write per instruction
//     always @(posedge clock) begin
//         // Don't allow the Pulp custom Post-Incrementing Load instructions
//         ASM_no_loadpost_instr: assume (uut.if_stage_i.fetch_rdata[6:0] != OPCODE_LOAD_POST);
//         // Data memory errors will prevent valid from being raised, but post-increments still happen
//         // Without valid, the reg check won't see the post-increment, causing an error
//         ASM_no_data_error: assume (uut.data_err_pmp == 1'b0);
//     end
// `endif

endmodule

