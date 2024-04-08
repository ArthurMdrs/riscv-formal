
// Copyright 2018 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the "License"); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

////////////////////////////////////////////////////////////////////////////////
// Engineer:       Matthias Baer - baermatt@student.ethz.ch                   //
//                                                                            //
// Additional contributions by:                                               //
//                 Igor Loi - igor.loi@unibo.it                               //
//                 Andreas Traber - atraber@student.ethz.ch                   //
//                 Sven Stucki - svstucki@student.ethz.ch                     //
//                 Michael Gautschi - gautschi@iis.ee.ethz.ch                 //
//                 Davide Schiavone - pschiavo@iis.ee.ethz.ch                 //
//                                                                            //
// Design Name:    Top level module                                           //
// Project Name:   RI5CY                                                      //
// Language:       SystemVerilog                                              //
//                                                                            //
// Description:    Top level module of the RISC-V core.                       //
//                 added APU, FPU parameter to include the APU_dispatcher     //
//                 and the FPU                                                //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

import apu_core_package::*;

`include "riscv_config.sv"

import riscv_defines::*;

module riscv_core
#(
  parameter N_EXT_PERF_COUNTERS =  0,
  parameter INSTR_RDATA_WIDTH   = 32,
  parameter PULP_SECURE         =  0,
  parameter N_PMP_ENTRIES       = 16,
  parameter USE_PMP             =  1, //if PULP_SECURE is 1, you can still not use the PMP
  parameter PULP_CLUSTER        =  1,
  parameter FPU                 =  0,
  parameter Zfinx               =  0,
  parameter FP_DIVSQRT          =  0,
  parameter SHARED_FP           =  0,
  parameter SHARED_DSP_MULT     =  0,
  parameter SHARED_INT_MULT     =  0,
  parameter SHARED_INT_DIV      =  0,
  parameter SHARED_FP_DIVSQRT   =  0,
  parameter WAPUTYPE            =  0,
  parameter APU_NARGS_CPU       =  3,
  parameter APU_WOP_CPU         =  6,
  parameter APU_NDSFLAGS_CPU    = 15,
  parameter APU_NUSFLAGS_CPU    =  5,
  parameter DM_HaltAddress      = 32'h1A110800
)
(
  // Clock and Reset
  input  logic        clk_i,
  input  logic        rst_ni,

  input  logic        clock_en_i,    // enable clock, otherwise it is gated
  input  logic        test_en_i,     // enable all clock gates for testing

  input  logic        fregfile_disable_i,  // disable the fp regfile, using int regfile instead

  // Core ID, Cluster ID and boot address are considered more or less static
  input  logic [31:0] boot_addr_i,
  input  logic [ 3:0] core_id_i,
  input  logic [ 5:0] cluster_id_i,

  // Instruction memory interface
  output logic                         instr_req_o,
  input  logic                         instr_gnt_i,
  input  logic                         instr_rvalid_i,
  output logic                  [31:0] instr_addr_o,
  input  logic [INSTR_RDATA_WIDTH-1:0] instr_rdata_i,

  // Data memory interface
  output logic        data_req_o,
  input  logic        data_gnt_i,
  input  logic        data_rvalid_i,
  output logic        data_we_o,
  output logic [3:0]  data_be_o,
  output logic [31:0] data_addr_o,
  output logic [31:0] data_wdata_o,
  input  logic [31:0] data_rdata_i,

  // apu-interconnect
  // handshake signals
  output logic                           apu_master_req_o,
  output logic                           apu_master_ready_o,
  input logic                            apu_master_gnt_i,
  // request channel
  output logic [APU_NARGS_CPU-1:0][31:0] apu_master_operands_o,
  output logic [APU_WOP_CPU-1:0]         apu_master_op_o,
  output logic [WAPUTYPE-1:0]            apu_master_type_o,
  output logic [APU_NDSFLAGS_CPU-1:0]    apu_master_flags_o,
  // response channel
  input logic                            apu_master_valid_i,
  input logic [31:0]                     apu_master_result_i,
  input logic [APU_NUSFLAGS_CPU-1:0]     apu_master_flags_i,

  // Interrupt inputs
  input  logic        irq_i,                 // level sensitive IR lines
  input  logic [4:0]  irq_id_i,
  output logic        irq_ack_o,
  output logic [4:0]  irq_id_o,
  input  logic        irq_sec_i,

  output logic        sec_lvl_o,

  // Debug Interface
  input  logic        debug_req_i,


  // CPU Control Signals
  input  logic        fetch_enable_i,
  output logic        core_busy_o,

  input  logic [N_EXT_PERF_COUNTERS-1:0] ext_perf_counters_i

`ifdef RISCV_FORMAL
    // // Instruction Metadata
    // output reg        rvfi_valid,
    // output reg [63:0] rvfi_order,
    // output reg [31:0] rvfi_insn,
    // output reg        rvfi_trap,
    // output reg        rvfi_halt,
    // output reg        rvfi_intr,
    // output reg [ 1:0] rvfi_mode,
    // output reg [ 1:0] rvfi_ixl,
    // // Integer Register Read/Write
    // output reg [ 4:0] rvfi_rs1_addr,
    // output reg [ 4:0] rvfi_rs2_addr,
    // output reg [31:0] rvfi_rs1_rdata,
    // output reg [31:0] rvfi_rs2_rdata,
    // output reg [ 4:0] rvfi_rd_addr,
    // output reg [31:0] rvfi_rd_wdata,
    // // Program Counter
    // output reg [31:0] rvfi_pc_rdata,
    // output reg [31:0] rvfi_pc_wdata,
    // // Memory Access
    // output reg [31:0] rvfi_mem_addr,
    // output reg [ 3:0] rvfi_mem_rmask,
    // output reg [ 3:0] rvfi_mem_wmask,
    // output reg [31:0] rvfi_mem_rdata,
    // output reg [31:0] rvfi_mem_wdata,
    ,
    `RVFI_OUTPUTS
`endif
);

  localparam N_HWLP      = 2;
  localparam N_HWLP_BITS = $clog2(N_HWLP);
  localparam APU         = ((SHARED_DSP_MULT==1) | (SHARED_INT_DIV==1) | (FPU==1)) ? 1 : 0;

  // IF/ID signals
  logic              is_hwlp_id;
  logic [N_HWLP-1:0] hwlp_dec_cnt_id;
  logic              instr_valid_id;
  logic [31:0]       instr_rdata_id;    // Instruction sampled inside IF stage
  logic              is_compressed_id;
  logic              is_fetch_failed_id;
  logic              illegal_c_insn_id; // Illegal compressed instruction sent to ID stage
  logic [31:0]       pc_if;             // Program counter in IF stage
  logic [31:0]       pc_id;             // Program counter in ID stage

  logic              clear_instr_valid;
  logic              pc_set;
  logic [2:0]        pc_mux_id;     // Mux selector for next PC
  logic [2:0]        exc_pc_mux_id; // Mux selector for exception PC
  logic [5:0]        exc_cause;
  logic              trap_addr_mux;
  logic              lsu_load_err;
  logic              lsu_store_err;

  // ID performance counter signals
  logic        is_decoding;

  logic        useincr_addr_ex;   // Active when post increment
  logic        data_misaligned;

  logic        mult_multicycle;

  // Jump and branch target and decision (EX->IF)
  logic [31:0] jump_target_id, jump_target_ex;
  logic        branch_in_ex;
  logic        branch_decision;

  logic        ctrl_busy;
  logic        if_busy;
  logic        lsu_busy;
  logic        apu_busy;

  logic [31:0] pc_ex; // PC of last executed branch or p.elw

  // ALU Control
  logic        alu_en_ex;
  logic [ALU_OP_WIDTH-1:0] alu_operator_ex;
  logic [31:0] alu_operand_a_ex;
  logic [31:0] alu_operand_b_ex;
  logic [31:0] alu_operand_c_ex;
  logic [ 4:0] bmask_a_ex;
  logic [ 4:0] bmask_b_ex;
  logic [ 1:0] imm_vec_ext_ex;
  logic [ 1:0] alu_vec_mode_ex;
  logic        alu_is_clpx_ex, alu_is_subrot_ex;
  logic [ 1:0] alu_clpx_shift_ex;

  // Multiplier Control
  logic [ 2:0] mult_operator_ex;
  logic [31:0] mult_operand_a_ex;
  logic [31:0] mult_operand_b_ex;
  logic [31:0] mult_operand_c_ex;
  logic        mult_en_ex;
  logic        mult_sel_subword_ex;
  logic [ 1:0] mult_signed_mode_ex;
  logic [ 4:0] mult_imm_ex;
  logic [31:0] mult_dot_op_a_ex;
  logic [31:0] mult_dot_op_b_ex;
  logic [31:0] mult_dot_op_c_ex;
  logic [ 1:0] mult_dot_signed_ex;
  logic        mult_is_clpx_ex_o;
  logic [ 1:0] mult_clpx_shift_ex;
  logic        mult_clpx_img_ex;

  // FPU
  logic [C_PC-1:0]            fprec_csr;
  logic [C_RM-1:0]            frm_csr;
  logic [C_FFLAG-1:0]         fflags;
  logic [C_FFLAG-1:0]         fflags_csr;
  logic                       fflags_we;


  // APU
  logic                        apu_en_ex;
  logic [WAPUTYPE-1:0]         apu_type_ex;
  logic [APU_NDSFLAGS_CPU-1:0] apu_flags_ex;
  logic [APU_WOP_CPU-1:0]      apu_op_ex;
  logic [1:0]                  apu_lat_ex;
  logic [APU_NARGS_CPU-1:0][31:0]                 apu_operands_ex;
  logic [5:0]                  apu_waddr_ex;

  logic [2:0][5:0]             apu_read_regs;
  logic [2:0]                  apu_read_regs_valid;
  logic                        apu_read_dep;
  logic [1:0][5:0]             apu_write_regs;
  logic [1:0]                  apu_write_regs_valid;
  logic                        apu_write_dep;

  logic                        perf_apu_type;
  logic                        perf_apu_cont;
  logic                        perf_apu_dep;
  logic                        perf_apu_wb;

  // Register Write Control
  logic [5:0]  regfile_waddr_ex;
  logic        regfile_we_ex;
  logic [5:0]  regfile_waddr_fw_wb_o;        // From WB to ID
  logic        regfile_we_wb;
  logic [31:0] regfile_wdata;

  logic [5:0]  regfile_alu_waddr_ex;
  logic        regfile_alu_we_ex;

  logic [5:0]  regfile_alu_waddr_fw;
  logic        regfile_alu_we_fw;
  logic [31:0] regfile_alu_wdata_fw;

  // CSR control
  logic        csr_access_ex;
  logic  [1:0] csr_op_ex;
  logic [23:0] mtvec, utvec;

  logic        csr_access;
  logic  [1:0] csr_op;
  logic [11:0] csr_addr;
  logic [11:0] csr_addr_int;
  logic [31:0] csr_rdata;
  logic [31:0] csr_wdata;
  PrivLvl_t    current_priv_lvl;

  // Data Memory Control:  From ID stage (id-ex pipe) <--> load store unit
  logic        data_we_ex;
  logic [1:0]  data_type_ex;
  logic [1:0]  data_sign_ext_ex;
  logic [1:0]  data_reg_offset_ex;
  logic        data_req_ex;
  logic        data_load_event_ex;
  logic        data_misaligned_ex;

  logic [31:0] lsu_rdata;

  // stall control
  logic        halt_if;
  logic        id_ready;
  logic        ex_ready;

  logic        id_valid;
  logic        ex_valid;
  logic        wb_valid;

  logic        lsu_ready_ex;
  logic        lsu_ready_wb;

  logic        apu_ready_wb;

  // Signals between instruction core interface and pipe (if and id stages)
  logic        instr_req_int;    // Id stage asserts a req to instruction core interface

  // Interrupts
  logic        m_irq_enable, u_irq_enable;
  logic        csr_irq_sec;
  logic [31:0] mepc, uepc, depc;

  logic        csr_save_cause;
  logic        csr_save_if;
  logic        csr_save_id;
  logic        csr_save_ex;
  logic [5:0]  csr_cause;
  logic        csr_restore_mret_id;
  logic        csr_restore_uret_id;

  logic        csr_restore_dret_id;

  // debug mode and dcsr configuration
  logic        debug_mode;
  logic [2:0]  debug_cause;
  logic        debug_csr_save;
  logic        debug_single_step;
  logic        debug_ebreakm;
  logic        debug_ebreaku;

  // Hardware loop controller signals
  logic [N_HWLP-1:0] [31:0] hwlp_start;
  logic [N_HWLP-1:0] [31:0] hwlp_end;
  logic [N_HWLP-1:0] [31:0] hwlp_cnt;

  // used to write from CS registers to hardware loop registers
  logic   [N_HWLP_BITS-1:0] csr_hwlp_regid;
  logic               [2:0] csr_hwlp_we;
  logic              [31:0] csr_hwlp_data;


  // Performance Counters
  logic        perf_imiss;
  logic        perf_jump;
  logic        perf_jr_stall;
  logic        perf_ld_stall;
  logic        perf_pipeline_stall;

  //core busy signals
  logic        core_ctrl_firstfetch, core_busy_int, core_busy_q;


  //pmp signals
  logic  [N_PMP_ENTRIES-1:0] [31:0] pmp_addr;
  logic  [N_PMP_ENTRIES-1:0] [7:0]  pmp_cfg;

  logic                             data_req_pmp;
  logic [31:0]                      data_addr_pmp;
  logic                             data_we_pmp;
  logic                             data_gnt_pmp;
  logic                             data_err_pmp;
  logic                             data_err_ack;
  logic                             instr_req_pmp;
  logic                             instr_gnt_pmp;
  logic [31:0]                      instr_addr_pmp;
  logic                             instr_err_pmp;


  //Simchecker signal
  logic is_interrupt;
  assign is_interrupt = (pc_mux_id == PC_EXCEPTION) && (exc_pc_mux_id == EXC_PC_IRQ);

  // APU master signals
   generate
      if ( SHARED_FP ) begin
         assign apu_master_type_o  = apu_type_ex;
         assign apu_master_flags_o = apu_flags_ex;
         assign fflags_csr         = apu_master_flags_i;
      end
      else begin
         assign apu_master_type_o  = '0;
         assign apu_master_flags_o = '0;
         assign fflags_csr         = fflags;
      end
   endgenerate

`ifdef APU_TRACE

   int         apu_trace;
   string      fn;
   string      apu_waddr_trace;


   // open/close output file for writing
   initial
     begin
        wait(rst_ni == 1'b1);
        $sformat(fn, "apu_trace_core_%h_%h.log", cluster_id_i, core_id_i);
        $display("[APU_TRACER] Output filename is: %s", fn);
        apu_trace = $fopen(fn, "w");
        $fwrite(apu_trace, "time       register \tresult\n");

        while(1) begin

           @(negedge clk_i);
           if (ex_stage_i.apu_valid == 1'b1) begin
              if (ex_stage_i.apu_waddr>31)
                $sformat(apu_waddr_trace, "f%d",ex_stage_i.apu_waddr[4:0]);
              else
                $sformat(apu_waddr_trace, "x%d",ex_stage_i.apu_waddr[4:0]);
              $fwrite(apu_trace, "%t %s \t\t%h\n", $time, apu_waddr_trace, ex_stage_i.apu_result);
           end
        end

   end

   final
     begin
        $fclose(apu_trace);
     end
`endif

  //////////////////////////////////////////////////////////////////////////////////////////////
  //   ____ _            _      __  __                                                   _    //
  //  / ___| | ___   ___| | __ |  \/  | __ _ _ __   __ _  __ _  ___ _ __ ___   ___ _ __ | |_  //
  // | |   | |/ _ \ / __| |/ / | |\/| |/ _` | '_ \ / _` |/ _` |/ _ \ '_ ` _ \ / _ \ '_ \| __| //
  // | |___| | (_) | (__|   <  | |  | | (_| | | | | (_| | (_| |  __/ | | | | |  __/ | | | |_  //
  //  \____|_|\___/ \___|_|\_\ |_|  |_|\__,_|_| |_|\__,_|\__, |\___|_| |_| |_|\___|_| |_|\__| //
  //                                                     |___/                                //
  //////////////////////////////////////////////////////////////////////////////////////////////

  logic        clk;

  logic        clock_en;


  logic        sleeping;


  assign core_busy_o = core_ctrl_firstfetch ? 1'b1 : core_busy_q;

  // if we are sleeping on a barrier let's just wait on the instruction
  // interface to finish loading instructions
  assign core_busy_int = (PULP_CLUSTER & data_load_event_ex & data_req_o) ? (if_busy | apu_busy) : (if_busy | ctrl_busy | lsu_busy | apu_busy);

  assign clock_en      = PULP_CLUSTER ? clock_en_i | core_busy_o : irq_i | debug_req_i | core_busy_o;

  assign sleeping      = ~core_busy_o;


  always_ff @(posedge clk_i, negedge rst_ni)
  begin
    if (rst_ni == 1'b0) begin
      core_busy_q <= 1'b0;
    end else begin
      core_busy_q <= core_busy_int;
    end
  end

  // main clock gate of the core
  // generates all clocks except the one for the debug unit which is
  // independent
  cluster_clock_gating core_clock_gate_i
  (
    .clk_i     ( clk_i           ),
    .en_i      ( clock_en        ),
    .test_en_i ( test_en_i       ),
    .clk_o     ( clk             )
  );

  //////////////////////////////////////////////////
  //   ___ _____   ____ _____  _    ____ _____    //
  //  |_ _|  ___| / ___|_   _|/ \  / ___| ____|   //
  //   | || |_    \___ \ | | / _ \| |  _|  _|     //
  //   | ||  _|    ___) || |/ ___ \ |_| | |___    //
  //  |___|_|     |____/ |_/_/   \_\____|_____|   //
  //                                              //
  //////////////////////////////////////////////////
  riscv_if_stage
  #(
    .N_HWLP              ( N_HWLP            ),
    .RDATA_WIDTH         ( INSTR_RDATA_WIDTH ),
    .FPU                 ( FPU               ),
    .DM_HaltAddress      ( DM_HaltAddress    )
  )
  if_stage_i
  (
    .clk                 ( clk               ),
    .rst_n               ( rst_ni            ),

    // boot address
    .boot_addr_i         ( boot_addr_i[31:1] ),

    // trap vector location
    .m_trap_base_addr_i  ( mtvec             ),
    .u_trap_base_addr_i  ( utvec             ),
    .trap_addr_mux_i     ( trap_addr_mux     ),

    // instruction request control
    .req_i               ( instr_req_int     ),

    // instruction cache interface
    .instr_req_o         ( instr_req_pmp     ),
    .instr_addr_o        ( instr_addr_pmp    ),
    .instr_gnt_i         ( instr_gnt_pmp     ),
    .instr_rvalid_i      ( instr_rvalid_i    ),
    .instr_rdata_i       ( instr_rdata_i     ),
    .instr_err_pmp_i     ( instr_err_pmp     ),

    // outputs to ID stage
    .hwlp_dec_cnt_id_o   ( hwlp_dec_cnt_id   ),
    .is_hwlp_id_o        ( is_hwlp_id        ),
    .instr_valid_id_o    ( instr_valid_id    ),
    .instr_rdata_id_o    ( instr_rdata_id    ),
    .is_compressed_id_o  ( is_compressed_id  ),
    .illegal_c_insn_id_o ( illegal_c_insn_id ),
    .pc_if_o             ( pc_if             ),
    .pc_id_o             ( pc_id             ),
    .is_fetch_failed_o   ( is_fetch_failed_id ),

    // control signals
    .clear_instr_valid_i ( clear_instr_valid ),
    .pc_set_i            ( pc_set            ),

    .mepc_i              ( mepc              ), // exception return address
    .uepc_i              ( uepc              ), // exception return address

    .depc_i              ( depc              ), // debug return address

    .pc_mux_i            ( pc_mux_id         ), // sel for pc multiplexer
    .exc_pc_mux_i        ( exc_pc_mux_id     ),
    .exc_vec_pc_mux_i    ( exc_cause[4:0]    ),

    // from hwloop registers
    .hwlp_start_i        ( hwlp_start        ),
    .hwlp_end_i          ( hwlp_end          ),
    .hwlp_cnt_i          ( hwlp_cnt          ),


    // Jump targets
    .jump_target_id_i    ( jump_target_id    ),
    .jump_target_ex_i    ( jump_target_ex    ),

    // pipeline stalls
    .halt_if_i           ( halt_if           ),
    .id_ready_i          ( id_ready          ),

    .if_busy_o           ( if_busy           ),
    .perf_imiss_o        ( perf_imiss        )
  );


  /////////////////////////////////////////////////
  //   ___ ____    ____ _____  _    ____ _____   //
  //  |_ _|  _ \  / ___|_   _|/ \  / ___| ____|  //
  //   | || | | | \___ \ | | / _ \| |  _|  _|    //
  //   | || |_| |  ___) || |/ ___ \ |_| | |___   //
  //  |___|____/  |____/ |_/_/   \_\____|_____|  //
  //                                             //
  /////////////////////////////////////////////////
  riscv_id_stage
  #(
    .N_HWLP                       ( N_HWLP               ),
    .PULP_SECURE                  ( PULP_SECURE          ),
    .APU                          ( APU                  ),
    .FPU                          ( FPU                  ),
    .Zfinx                        ( Zfinx                ),
    .FP_DIVSQRT                   ( FP_DIVSQRT           ),
    .SHARED_FP                    ( SHARED_FP            ),
    .SHARED_DSP_MULT              ( SHARED_DSP_MULT      ),
    .SHARED_INT_MULT              ( SHARED_INT_MULT      ),
    .SHARED_INT_DIV               ( SHARED_INT_DIV       ),
    .SHARED_FP_DIVSQRT            ( SHARED_FP_DIVSQRT    ),
    .WAPUTYPE                     ( WAPUTYPE             ),
    .APU_NARGS_CPU                ( APU_NARGS_CPU        ),
    .APU_WOP_CPU                  ( APU_WOP_CPU          ),
    .APU_NDSFLAGS_CPU             ( APU_NDSFLAGS_CPU     ),
    .APU_NUSFLAGS_CPU             ( APU_NUSFLAGS_CPU     )
  )
  id_stage_i
  (
    .clk                          ( clk                  ),
    .rst_n                        ( rst_ni               ),

    .test_en_i                    ( test_en_i            ),

    .fregfile_disable_i           ( fregfile_disable_i   ),

    // Processor Enable
    .fetch_enable_i               ( fetch_enable_i       ),
    .ctrl_busy_o                  ( ctrl_busy            ),
    .core_ctrl_firstfetch_o       ( core_ctrl_firstfetch ),
    .is_decoding_o                ( is_decoding          ),

    // Interface to instruction memory
    .hwlp_dec_cnt_i               ( hwlp_dec_cnt_id      ),
    .is_hwlp_i                    ( is_hwlp_id           ),
    .instr_valid_i                ( instr_valid_id       ),
    .instr_rdata_i                ( instr_rdata_id       ),
    .instr_req_o                  ( instr_req_int        ),

    // Jumps and branches
    .branch_in_ex_o               ( branch_in_ex         ),
    .branch_decision_i            ( branch_decision      ),
    .jump_target_o                ( jump_target_id       ),

    // IF and ID control signals
    .clear_instr_valid_o          ( clear_instr_valid    ),
    .pc_set_o                     ( pc_set               ),
    .pc_mux_o                     ( pc_mux_id            ),
    .exc_pc_mux_o                 ( exc_pc_mux_id        ),
    .exc_cause_o                  ( exc_cause            ),
    .trap_addr_mux_o              ( trap_addr_mux        ),
    .illegal_c_insn_i             ( illegal_c_insn_id    ),
    .is_compressed_i              ( is_compressed_id     ),
    .is_fetch_failed_i            ( is_fetch_failed_id   ),

    .pc_if_i                      ( pc_if                ),
    .pc_id_i                      ( pc_id                ),

    // Stalls
    .halt_if_o                    ( halt_if              ),

    .id_ready_o                   ( id_ready             ),
    .ex_ready_i                   ( ex_ready             ),
    .wb_ready_i                   ( lsu_ready_wb         ),

    .id_valid_o                   ( id_valid             ),
    .ex_valid_i                   ( ex_valid             ),

    // From the Pipeline ID/EX
    .pc_ex_o                      ( pc_ex                ),

    .alu_en_ex_o                  ( alu_en_ex            ),
    .alu_operator_ex_o            ( alu_operator_ex      ),
    .alu_operand_a_ex_o           ( alu_operand_a_ex     ),
    .alu_operand_b_ex_o           ( alu_operand_b_ex     ),
    .alu_operand_c_ex_o           ( alu_operand_c_ex     ),
    .bmask_a_ex_o                 ( bmask_a_ex           ),
    .bmask_b_ex_o                 ( bmask_b_ex           ),
    .imm_vec_ext_ex_o             ( imm_vec_ext_ex       ),
    .alu_vec_mode_ex_o            ( alu_vec_mode_ex      ),
    .alu_is_clpx_ex_o             ( alu_is_clpx_ex       ),
    .alu_is_subrot_ex_o           ( alu_is_subrot_ex     ),
    .alu_clpx_shift_ex_o          ( alu_clpx_shift_ex    ),

    .regfile_waddr_ex_o           ( regfile_waddr_ex     ),
    .regfile_we_ex_o              ( regfile_we_ex        ),

    .regfile_alu_we_ex_o          ( regfile_alu_we_ex    ),
    .regfile_alu_waddr_ex_o       ( regfile_alu_waddr_ex ),

    // MUL
    .mult_operator_ex_o           ( mult_operator_ex     ), // from ID to EX stage
    .mult_en_ex_o                 ( mult_en_ex           ), // from ID to EX stage
    .mult_sel_subword_ex_o        ( mult_sel_subword_ex  ), // from ID to EX stage
    .mult_signed_mode_ex_o        ( mult_signed_mode_ex  ), // from ID to EX stage
    .mult_operand_a_ex_o          ( mult_operand_a_ex    ), // from ID to EX stage
    .mult_operand_b_ex_o          ( mult_operand_b_ex    ), // from ID to EX stage
    .mult_operand_c_ex_o          ( mult_operand_c_ex    ), // from ID to EX stage
    .mult_imm_ex_o                ( mult_imm_ex          ), // from ID to EX stage

    .mult_dot_op_a_ex_o           ( mult_dot_op_a_ex     ), // from ID to EX stage
    .mult_dot_op_b_ex_o           ( mult_dot_op_b_ex     ), // from ID to EX stage
    .mult_dot_op_c_ex_o           ( mult_dot_op_c_ex     ), // from ID to EX stage
    .mult_dot_signed_ex_o         ( mult_dot_signed_ex   ), // from ID to EX stage
    .mult_is_clpx_ex_o            ( mult_is_clpx_ex      ), // from ID to EX stage
    .mult_clpx_shift_ex_o         ( mult_clpx_shift_ex   ), // from ID to EX stage
    .mult_clpx_img_ex_o           ( mult_clpx_img_ex     ), // from ID to EX stage

    // FPU
    .frm_i                        ( frm_csr                 ),

    // APU
    .apu_en_ex_o                  ( apu_en_ex               ),
    .apu_type_ex_o                ( apu_type_ex             ),
    .apu_op_ex_o                  ( apu_op_ex               ),
    .apu_lat_ex_o                 ( apu_lat_ex              ),
    .apu_operands_ex_o            ( apu_operands_ex         ),
    .apu_flags_ex_o               ( apu_flags_ex            ),
    .apu_waddr_ex_o               ( apu_waddr_ex            ),

    .apu_read_regs_o              ( apu_read_regs           ),
    .apu_read_regs_valid_o        ( apu_read_regs_valid     ),
    .apu_read_dep_i               ( apu_read_dep            ),
    .apu_write_regs_o             ( apu_write_regs          ),
    .apu_write_regs_valid_o       ( apu_write_regs_valid    ),
    .apu_write_dep_i              ( apu_write_dep           ),
    .apu_perf_dep_o               ( perf_apu_dep            ),
    .apu_busy_i                   ( apu_busy                ),

    // CSR ID/EX
    .csr_access_ex_o              ( csr_access_ex        ),
    .csr_op_ex_o                  ( csr_op_ex            ),
    .current_priv_lvl_i           ( current_priv_lvl     ),
    .csr_irq_sec_o                ( csr_irq_sec          ),
    .csr_cause_o                  ( csr_cause            ),
    .csr_save_if_o                ( csr_save_if          ), // control signal to save pc
    .csr_save_id_o                ( csr_save_id          ), // control signal to save pc
    .csr_save_ex_o                ( csr_save_ex          ), // control signal to save pc
    .csr_restore_mret_id_o        ( csr_restore_mret_id  ), // control signal to restore pc
    .csr_restore_uret_id_o        ( csr_restore_uret_id  ), // control signal to restore pc

    .csr_restore_dret_id_o        ( csr_restore_dret_id  ), // control signal to restore pc

    .csr_save_cause_o             ( csr_save_cause       ),

    // hardware loop signals to IF hwlp controller
    .hwlp_start_o                 ( hwlp_start           ),
    .hwlp_end_o                   ( hwlp_end             ),
    .hwlp_cnt_o                   ( hwlp_cnt             ),

    // hardware loop signals from CSR
    .csr_hwlp_regid_i             ( csr_hwlp_regid       ),
    .csr_hwlp_we_i                ( csr_hwlp_we          ),
    .csr_hwlp_data_i              ( csr_hwlp_data        ),

    // LSU
    .data_req_ex_o                ( data_req_ex          ), // to load store unit
    .data_we_ex_o                 ( data_we_ex           ), // to load store unit
    .data_type_ex_o               ( data_type_ex         ), // to load store unit
    .data_sign_ext_ex_o           ( data_sign_ext_ex     ), // to load store unit
    .data_reg_offset_ex_o         ( data_reg_offset_ex   ), // to load store unit
    .data_load_event_ex_o         ( data_load_event_ex   ), // to load store unit

    .data_misaligned_ex_o         ( data_misaligned_ex   ), // to load store unit

    .prepost_useincr_ex_o         ( useincr_addr_ex      ),
    .data_misaligned_i            ( data_misaligned      ),
    .data_err_i                   ( data_err_pmp         ),
    .data_err_ack_o               ( data_err_ack         ),
    // Interrupt Signals
    .irq_i                        ( irq_i                ), // incoming interrupts
    .irq_sec_i                    ( (PULP_SECURE) ? irq_sec_i : 1'b0 ),
    .irq_id_i                     ( irq_id_i             ),
    .m_irq_enable_i               ( m_irq_enable         ),
    .u_irq_enable_i               ( u_irq_enable         ),
    .irq_ack_o                    ( irq_ack_o            ),
    .irq_id_o                     ( irq_id_o             ),

    // Debug Signal
    .debug_mode_o                 ( debug_mode           ),
    .debug_cause_o                ( debug_cause          ),
    .debug_csr_save_o             ( debug_csr_save       ),
    .debug_req_i                  ( debug_req_i          ),
    .debug_single_step_i          ( debug_single_step    ),
    .debug_ebreakm_i              ( debug_ebreakm        ),
    .debug_ebreaku_i              ( debug_ebreaku        ),

    // Forward Signals
    .regfile_waddr_wb_i           ( regfile_waddr_fw_wb_o),  // Write address ex-wb pipeline
    .regfile_we_wb_i              ( regfile_we_wb        ),  // write enable for the register file
    .regfile_wdata_wb_i           ( regfile_wdata        ),  // write data to commit in the register file

    .regfile_alu_waddr_fw_i       ( regfile_alu_waddr_fw ),
    .regfile_alu_we_fw_i          ( regfile_alu_we_fw    ),
    .regfile_alu_wdata_fw_i       ( regfile_alu_wdata_fw ),

    // from ALU
    .mult_multicycle_i            ( mult_multicycle      ),

    // Performance Counters
    .perf_jump_o                  ( perf_jump            ),
    .perf_jr_stall_o              ( perf_jr_stall        ),
    .perf_ld_stall_o              ( perf_ld_stall        ),
    .perf_pipeline_stall_o        ( perf_pipeline_stall  )
  );


  /////////////////////////////////////////////////////
  //   _______  __  ____ _____  _    ____ _____      //
  //  | ____\ \/ / / ___|_   _|/ \  / ___| ____|     //
  //  |  _|  \  /  \___ \ | | / _ \| |  _|  _|       //
  //  | |___ /  \   ___) || |/ ___ \ |_| | |___      //
  //  |_____/_/\_\ |____/ |_/_/   \_\____|_____|     //
  //                                                 //
  /////////////////////////////////////////////////////
  riscv_ex_stage
  #(
   .FPU              ( FPU                ),
   .FP_DIVSQRT       ( FP_DIVSQRT         ),
   .SHARED_FP        ( SHARED_FP          ),
   .SHARED_DSP_MULT  ( SHARED_DSP_MULT    ),
   .SHARED_INT_DIV   ( SHARED_INT_DIV     ),
   .APU_NARGS_CPU    ( APU_NARGS_CPU      ),
   .APU_WOP_CPU      ( APU_WOP_CPU        ),
   .APU_NDSFLAGS_CPU ( APU_NDSFLAGS_CPU   ),
   .APU_NUSFLAGS_CPU ( APU_NUSFLAGS_CPU   )
  )
  ex_stage_i
  (
    // Global signals: Clock and active low asynchronous reset
    .clk                        ( clk                          ),
    .rst_n                      ( rst_ni                       ),

    // Alu signals from ID stage
    .alu_en_i                   ( alu_en_ex                    ),
    .alu_operator_i             ( alu_operator_ex              ), // from ID/EX pipe registers
    .alu_operand_a_i            ( alu_operand_a_ex             ), // from ID/EX pipe registers
    .alu_operand_b_i            ( alu_operand_b_ex             ), // from ID/EX pipe registers
    .alu_operand_c_i            ( alu_operand_c_ex             ), // from ID/EX pipe registers
    .bmask_a_i                  ( bmask_a_ex                   ), // from ID/EX pipe registers
    .bmask_b_i                  ( bmask_b_ex                   ), // from ID/EX pipe registers
    .imm_vec_ext_i              ( imm_vec_ext_ex               ), // from ID/EX pipe registers
    .alu_vec_mode_i             ( alu_vec_mode_ex              ), // from ID/EX pipe registers
    .alu_is_clpx_i              ( alu_is_clpx_ex               ), // from ID/EX pipe registers
    .alu_is_subrot_i            ( alu_is_subrot_ex             ), // from ID/Ex pipe registers
    .alu_clpx_shift_i           ( alu_clpx_shift_ex            ), // from ID/EX pipe registers

    // Multipler
    .mult_operator_i            ( mult_operator_ex             ), // from ID/EX pipe registers
    .mult_operand_a_i           ( mult_operand_a_ex            ), // from ID/EX pipe registers
    .mult_operand_b_i           ( mult_operand_b_ex            ), // from ID/EX pipe registers
    .mult_operand_c_i           ( mult_operand_c_ex            ), // from ID/EX pipe registers
    .mult_en_i                  ( mult_en_ex                   ), // from ID/EX pipe registers
    .mult_sel_subword_i         ( mult_sel_subword_ex          ), // from ID/EX pipe registers
    .mult_signed_mode_i         ( mult_signed_mode_ex          ), // from ID/EX pipe registers
    .mult_imm_i                 ( mult_imm_ex                  ), // from ID/EX pipe registers
    .mult_dot_op_a_i            ( mult_dot_op_a_ex             ), // from ID/EX pipe registers
    .mult_dot_op_b_i            ( mult_dot_op_b_ex             ), // from ID/EX pipe registers
    .mult_dot_op_c_i            ( mult_dot_op_c_ex             ), // from ID/EX pipe registers
    .mult_dot_signed_i          ( mult_dot_signed_ex           ), // from ID/EX pipe registers
    .mult_is_clpx_i             ( mult_is_clpx_ex              ), // from ID/EX pipe registers
    .mult_clpx_shift_i          ( mult_clpx_shift_ex           ), // from ID/EX pipe registers
    .mult_clpx_img_i            ( mult_clpx_img_ex             ), // from ID/EX pipe registers

    .mult_multicycle_o          ( mult_multicycle              ), // to ID/EX pipe registers

    // FPU
    .fpu_prec_i                 ( fprec_csr                    ),
    .fpu_fflags_o               ( fflags                       ),
    .fpu_fflags_we_o            ( fflags_we                    ),

    // APU
    .apu_en_i                   ( apu_en_ex                    ),
    .apu_op_i                   ( apu_op_ex                    ),
    .apu_lat_i                  ( apu_lat_ex                   ),
    .apu_operands_i             ( apu_operands_ex              ),
    .apu_waddr_i                ( apu_waddr_ex                 ),
    .apu_flags_i                ( apu_flags_ex                 ),

    .apu_read_regs_i            ( apu_read_regs                ),
    .apu_read_regs_valid_i      ( apu_read_regs_valid          ),
    .apu_read_dep_o             ( apu_read_dep                 ),
    .apu_write_regs_i           ( apu_write_regs               ),
    .apu_write_regs_valid_i     ( apu_write_regs_valid         ),
    .apu_write_dep_o            ( apu_write_dep                ),

    .apu_perf_type_o            ( perf_apu_type                ),
    .apu_perf_cont_o            ( perf_apu_cont                ),
    .apu_perf_wb_o              ( perf_apu_wb                  ),
    .apu_ready_wb_o             ( apu_ready_wb                 ),
    .apu_busy_o                 ( apu_busy                     ),

    // apu-interconnect
    // handshake signals
    .apu_master_req_o           ( apu_master_req_o             ),
    .apu_master_ready_o         ( apu_master_ready_o           ),
    .apu_master_gnt_i           ( apu_master_gnt_i             ),
    // request channel
    .apu_master_operands_o      ( apu_master_operands_o        ),
    .apu_master_op_o            ( apu_master_op_o              ),
    // response channel
    .apu_master_valid_i         ( apu_master_valid_i           ),
    .apu_master_result_i        ( apu_master_result_i          ),

    .lsu_en_i                   ( data_req_ex                  ),
    .lsu_rdata_i                ( lsu_rdata                    ),

    // interface with CSRs
    .csr_access_i               ( csr_access_ex                ),
    .csr_rdata_i                ( csr_rdata                    ),

    // From ID Stage: Regfile control signals
    .branch_in_ex_i             ( branch_in_ex                 ),
    .regfile_alu_waddr_i        ( regfile_alu_waddr_ex         ),
    .regfile_alu_we_i           ( regfile_alu_we_ex            ),

    .regfile_waddr_i            ( regfile_waddr_ex             ),
    .regfile_we_i               ( regfile_we_ex                ),

    // Output of ex stage pipeline
    .regfile_waddr_wb_o         ( regfile_waddr_fw_wb_o        ),
    .regfile_we_wb_o            ( regfile_we_wb                ),
    .regfile_wdata_wb_o         ( regfile_wdata                ),

    // To IF: Jump and branch target and decision
    .jump_target_o              ( jump_target_ex               ),
    .branch_decision_o          ( branch_decision              ),

    // To ID stage: Forwarding signals
    .regfile_alu_waddr_fw_o     ( regfile_alu_waddr_fw         ),
    .regfile_alu_we_fw_o        ( regfile_alu_we_fw            ),
    .regfile_alu_wdata_fw_o     ( regfile_alu_wdata_fw         ),

    // stall control
    .lsu_ready_ex_i             ( lsu_ready_ex                 ),
    .lsu_err_i                  ( data_err_pmp                 ),

    .ex_ready_o                 ( ex_ready                     ),
    .ex_valid_o                 ( ex_valid                     ),
    .wb_ready_i                 ( lsu_ready_wb                 )
  );


  ////////////////////////////////////////////////////////////////////////////////////////
  //    _     ___    _    ____    ____ _____ ___  ____  _____   _   _ _   _ ___ _____   //
  //   | |   / _ \  / \  |  _ \  / ___|_   _/ _ \|  _ \| ____| | | | | \ | |_ _|_   _|  //
  //   | |  | | | |/ _ \ | | | | \___ \ | || | | | |_) |  _|   | | | |  \| || |  | |    //
  //   | |__| |_| / ___ \| |_| |  ___) || || |_| |  _ <| |___  | |_| | |\  || |  | |    //
  //   |_____\___/_/   \_\____/  |____/ |_| \___/|_| \_\_____|  \___/|_| \_|___| |_|    //
  //                                                                                    //
  ////////////////////////////////////////////////////////////////////////////////////////

  riscv_load_store_unit  load_store_unit_i
  (
    .clk                   ( clk                ),
    .rst_n                 ( rst_ni             ),

    //output to data memory
    .data_req_o            ( data_req_pmp       ),
    .data_gnt_i            ( data_gnt_pmp       ),
    .data_rvalid_i         ( data_rvalid_i      ),
    .data_err_i            ( data_err_pmp       ),

    .data_addr_o           ( data_addr_pmp      ),
    .data_we_o             ( data_we_o          ),
    .data_be_o             ( data_be_o          ),
    .data_wdata_o          ( data_wdata_o       ),
    .data_rdata_i          ( data_rdata_i       ),

    // signal from ex stage
    .data_we_ex_i          ( data_we_ex         ),
    .data_type_ex_i        ( data_type_ex       ),
    .data_wdata_ex_i       ( alu_operand_c_ex   ),
    .data_reg_offset_ex_i  ( data_reg_offset_ex ),
    .data_sign_ext_ex_i    ( data_sign_ext_ex   ),  // sign extension

    .data_rdata_ex_o       ( lsu_rdata          ),
    .data_req_ex_i         ( data_req_ex        ),
    .operand_a_ex_i        ( alu_operand_a_ex   ),
    .operand_b_ex_i        ( alu_operand_b_ex   ),
    .addr_useincr_ex_i     ( useincr_addr_ex    ),

    .data_misaligned_ex_i  ( data_misaligned_ex ), // from ID/EX pipeline
    .data_misaligned_o     ( data_misaligned    ),

    // control signals
    .lsu_ready_ex_o        ( lsu_ready_ex       ),
    .lsu_ready_wb_o        ( lsu_ready_wb       ),

    .ex_valid_i            ( ex_valid           ),
    .busy_o                ( lsu_busy           )
  );

  assign wb_valid = lsu_ready_wb & apu_ready_wb;


  //////////////////////////////////////
  //        ____ ____  ____           //
  //       / ___/ ___||  _ \ ___      //
  //      | |   \___ \| |_) / __|     //
  //      | |___ ___) |  _ <\__ \     //
  //       \____|____/|_| \_\___/     //
  //                                  //
  //   Control and Status Registers   //
  //////////////////////////////////////

  riscv_cs_registers
  #(
    .N_EXT_CNT       ( N_EXT_PERF_COUNTERS   ),
    .FPU             ( FPU                   ),
    .APU             ( APU                   ),
    .PULP_SECURE     ( PULP_SECURE           ),
    .USE_PMP         ( USE_PMP               ),
    .N_PMP_ENTRIES   ( N_PMP_ENTRIES         )
  )
  cs_registers_i
  (
    .clk                     ( clk                ),
    .rst_n                   ( rst_ni             ),

    // Core and Cluster ID from outside
    .core_id_i               ( core_id_i          ),
    .cluster_id_i            ( cluster_id_i       ),
    .mtvec_o                 ( mtvec              ),
    .utvec_o                 ( utvec              ),
    // boot address
    .boot_addr_i             ( boot_addr_i[31:1]  ),
    // Interface to CSRs (SRAM like)
    .csr_access_i            ( csr_access         ),
    .csr_addr_i              ( csr_addr           ),
    .csr_wdata_i             ( csr_wdata          ),
    .csr_op_i                ( csr_op             ),
    .csr_rdata_o             ( csr_rdata          ),

    .frm_o                   ( frm_csr            ),
    .fprec_o                 ( fprec_csr          ),
    .fflags_i                ( fflags_csr         ),
    .fflags_we_i             ( fflags_we          ),

    // Interrupt related control signals
    .m_irq_enable_o          ( m_irq_enable       ),
    .u_irq_enable_o          ( u_irq_enable       ),
    .csr_irq_sec_i           ( csr_irq_sec        ),
    .sec_lvl_o               ( sec_lvl_o          ),
    .mepc_o                  ( mepc               ),
    .uepc_o                  ( uepc               ),

    // debug
    .debug_mode_i            ( debug_mode         ),
    .debug_cause_i           ( debug_cause        ),
    .debug_csr_save_i        ( debug_csr_save     ),
    .depc_o                  ( depc               ),
    .debug_single_step_o     ( debug_single_step  ),
    .debug_ebreakm_o         ( debug_ebreakm      ),
    .debug_ebreaku_o         ( debug_ebreaku      ),

    .priv_lvl_o              ( current_priv_lvl   ),

    .pmp_addr_o              ( pmp_addr           ),
    .pmp_cfg_o               ( pmp_cfg            ),

    .pc_if_i                 ( pc_if              ),
    .pc_id_i                 ( pc_id              ),
    .pc_ex_i                 ( pc_ex              ),

    .csr_save_if_i           ( csr_save_if        ),
    .csr_save_id_i           ( csr_save_id        ),
    .csr_save_ex_i           ( csr_save_ex        ),
    .csr_restore_mret_i      ( csr_restore_mret_id ),
    .csr_restore_uret_i      ( csr_restore_uret_id ),

    .csr_restore_dret_i      ( csr_restore_dret_id ),

    .csr_cause_i             ( csr_cause          ),
    .csr_save_cause_i        ( csr_save_cause     ),

    // from hwloop registers
    .hwlp_start_i            ( hwlp_start         ),
    .hwlp_end_i              ( hwlp_end           ),
    .hwlp_cnt_i              ( hwlp_cnt           ),

    .hwlp_regid_o            ( csr_hwlp_regid     ),
    .hwlp_we_o               ( csr_hwlp_we        ),
    .hwlp_data_o             ( csr_hwlp_data      ),

    // performance counter related signals
    .id_valid_i              ( id_valid           ),
    .is_compressed_i         ( is_compressed_id   ),
    .is_decoding_i           ( is_decoding        ),

    .imiss_i                 ( perf_imiss         ),
    .pc_set_i                ( pc_set             ),
    .jump_i                  ( perf_jump          ),
    .branch_i                ( branch_in_ex       ),
    .branch_taken_i          ( branch_decision    ),
    .ld_stall_i              ( perf_ld_stall      ),
    .jr_stall_i              ( perf_jr_stall      ),
    .pipeline_stall_i        ( perf_pipeline_stall ),

    .apu_typeconflict_i      ( perf_apu_type      ),
    .apu_contention_i        ( perf_apu_cont      ),
    .apu_dep_i               ( perf_apu_dep       ),
    .apu_wb_i                ( perf_apu_wb        ),

    .mem_load_i              ( data_req_o & data_gnt_i & (~data_we_o) ),
    .mem_store_i             ( data_req_o & data_gnt_i & data_we_o    ),

    .ext_counters_i          ( ext_perf_counters_i                    )
  );

  //  CSR access
  assign csr_access   =  csr_access_ex;
  assign csr_addr     =  csr_addr_int;
  assign csr_wdata    =  alu_operand_a_ex;
  assign csr_op       =  csr_op_ex;

  assign csr_addr_int = csr_access_ex ? alu_operand_b_ex[11:0] : '0;



  ///////////////////////////
  //   ____  __  __ ____   //
  //  |  _ \|  \/  |  _ \  //
  //  | |_) | |\/| | |_) | //
  //  |  __/| |  | |  __/  //
  //  |_|   |_|  |_|_|     //
  //                       //
  ///////////////////////////

  generate
  if(PULP_SECURE && USE_PMP) begin : RISCY_PMP
  riscv_pmp
  #(
     .N_PMP_ENTRIES(N_PMP_ENTRIES)
  )
  pmp_unit_i
  (
    .clk                     ( clk                ),
    .rst_n                   ( rst_ni             ),

    .pmp_privil_mode_i       ( current_priv_lvl   ),

    .pmp_addr_i              ( pmp_addr           ),
    .pmp_cfg_i               ( pmp_cfg            ),


    .data_req_i              ( data_req_pmp       ),
    .data_addr_i             ( data_addr_pmp      ),
    .data_we_i               ( data_we_o          ),
    .data_gnt_o              ( data_gnt_pmp       ),

    .data_req_o              ( data_req_o         ),
    .data_gnt_i              ( data_gnt_i         ),
    .data_addr_o             ( data_addr_o        ),
    .data_err_o              ( data_err_pmp       ),
    .data_err_ack_i          ( data_err_ack       ),

    .instr_req_i             ( instr_req_pmp      ),
    .instr_addr_i            ( instr_addr_pmp     ),
    .instr_gnt_o             ( instr_gnt_pmp      ),

    .instr_req_o             ( instr_req_o        ),
    .instr_gnt_i             ( instr_gnt_i        ),
    .instr_addr_o            ( instr_addr_o       ),
    .instr_err_o             ( instr_err_pmp      )
  );
  end else begin
    assign instr_req_o   = instr_req_pmp;
    assign instr_addr_o  = instr_addr_pmp;
    assign instr_gnt_pmp = instr_gnt_i;
    assign instr_err_pmp = 1'b0;

    assign data_req_o    = data_req_pmp;
    assign data_addr_o   = data_addr_pmp;
    assign data_gnt_pmp  = data_gnt_i;
    assign data_err_pmp  = 1'b0;
  end
  endgenerate


`ifndef VERILATOR
`ifdef TRACE_EXECUTION

  logic tracer_clk;
  assign #1 tracer_clk = clk_i;

  riscv_tracer riscv_tracer_i
  (
    .clk            ( tracer_clk                           ), // always-running clock for tracing
    .rst_n          ( rst_ni                               ),

    .fetch_enable   ( fetch_enable_i                       ),
    .core_id        ( core_id_i                            ),
    .cluster_id     ( cluster_id_i                         ),

    .pc             ( id_stage_i.pc_id_i                   ),
    .instr          ( id_stage_i.instr                     ),
    .compressed     ( id_stage_i.is_compressed_i           ),
    .id_valid       ( id_stage_i.id_valid_o                ),
    .is_decoding    ( id_stage_i.is_decoding_o             ),
    .pipe_flush     ( id_stage_i.controller_i.pipe_flush_i ),
    .mret           ( id_stage_i.controller_i.mret_insn_i  ),
    .uret           ( id_stage_i.controller_i.uret_insn_i  ),
    .dret           ( id_stage_i.controller_i.dret_insn_i  ),
    .ecall          ( id_stage_i.controller_i.ecall_insn_i ),
    .ebreak         ( id_stage_i.controller_i.ebrk_insn_i  ),
    .rs1_value      ( id_stage_i.operand_a_fw_id           ),
    .rs2_value      ( id_stage_i.operand_b_fw_id           ),
    .rs3_value      ( id_stage_i.alu_operand_c             ),
    .rs2_value_vec  ( id_stage_i.alu_operand_b             ),

    .rs1_is_fp      ( id_stage_i.regfile_fp_a              ),
    .rs2_is_fp      ( id_stage_i.regfile_fp_b              ),
    .rs3_is_fp      ( id_stage_i.regfile_fp_c              ),
    .rd_is_fp       ( id_stage_i.regfile_fp_d              ),

    .ex_valid       ( ex_valid                             ),
    .ex_reg_addr    ( regfile_alu_waddr_fw                 ),
    .ex_reg_we      ( regfile_alu_we_fw                    ),
    .ex_reg_wdata   ( regfile_alu_wdata_fw                 ),

    .ex_data_addr   ( data_addr_o                          ),
    .ex_data_req    ( data_req_o                           ),
    .ex_data_gnt    ( data_gnt_i                           ),
    .ex_data_we     ( data_we_o                            ),
    .ex_data_wdata  ( data_wdata_o                         ),

    .wb_bypass      ( ex_stage_i.branch_in_ex_i            ),

    .wb_valid       ( wb_valid                             ),
    .wb_reg_addr    ( regfile_waddr_fw_wb_o                ),
    .wb_reg_we      ( regfile_we_wb                        ),
    .wb_reg_wdata   ( regfile_wdata                        ),

    .imm_u_type     ( id_stage_i.imm_u_type                ),
    .imm_uj_type    ( id_stage_i.imm_uj_type               ),
    .imm_i_type     ( id_stage_i.imm_i_type                ),
    .imm_iz_type    ( id_stage_i.imm_iz_type[11:0]         ),
    .imm_z_type     ( id_stage_i.imm_z_type                ),
    .imm_s_type     ( id_stage_i.imm_s_type                ),
    .imm_sb_type    ( id_stage_i.imm_sb_type               ),
    .imm_s2_type    ( id_stage_i.imm_s2_type               ),
    .imm_s3_type    ( id_stage_i.imm_s3_type               ),
    .imm_vs_type    ( id_stage_i.imm_vs_type               ),
    .imm_vu_type    ( id_stage_i.imm_vu_type               ),
    .imm_shuffle_type ( id_stage_i.imm_shuffle_type        ),
    .imm_clip_type  ( id_stage_i.instr_rdata_i[11:7]       )
  );
`endif
`endif



`ifdef RISCV_FORMAL

    //====================   Instruction Metadata   ====================//
    reg        rvfi_valid_if, rvfi_valid_id, rvfi_valid_ex, rvfi_valid_wb;
    reg [31:0] rvfi_insn_if , rvfi_insn_id , rvfi_insn_ex , rvfi_insn_wb ;
    reg                       rvfi_trap_id , rvfi_trap_ex , rvfi_trap_wb ;
    reg        rvfi_halt_if , rvfi_halt_id , rvfi_halt_ex , rvfi_halt_wb ;
    reg        rvfi_intr_if , rvfi_intr_id , rvfi_intr_ex , rvfi_intr_wb ;
    reg [ 1:0]                rvfi_mode_id , rvfi_mode_ex , rvfi_mode_wb ;
    reg [63:0]                                              rvfi_order_wb;
    
    localparam COMP_LW = 5'b00_010, COMP_LWSP = 5'b10_010, COMP_SW = 5'b00_110, COMP_SWSP = 5'b10_110;
    
    wire insn_id_is_div = rvfi_insn_id[ 6: 0] == OPCODE_OP 
                       && rvfi_insn_id[31:25] == 7'h01
                       && rvfi_insn_id[14:12] inside {3'h4, 3'h5, 3'h6, 3'h7}; // div, divu, rem, remu
                       
    wire insn_id_is_mulh = rvfi_insn_id[ 6: 0] == OPCODE_OP 
                        && rvfi_insn_id[31:25] == 7'h01
                        && rvfi_insn_id[14:12] inside {3'h1, 3'h2, 3'h3}; // mulh, mulhu, mulhsu
                        
    wire insn_ex_is_c_load = {rvfi_insn_ex[1:0], rvfi_insn_ex[15:13]} inside {COMP_LW, COMP_LWSP}; // Compressed load
    wire insn_ex_is_load   = rvfi_insn_ex[6:0] inside {OPCODE_LOAD, OPCODE_LOAD_FP, OPCODE_LOAD_POST}
                          || insn_ex_is_c_load;
                        
    wire insn_ex_is_c_store = {rvfi_insn_ex[1:0], rvfi_insn_ex[15:13]} inside {COMP_SW, COMP_SWSP}; // Compressed store
    wire insn_ex_is_store   = rvfi_insn_ex[6:0] inside {OPCODE_STORE, OPCODE_STORE_FP, OPCODE_STORE_POST}
                           || insn_ex_is_c_store;
    
    wire insn_ex_is_mem = insn_ex_is_load || insn_ex_is_store;
    
    wire insn_if_is_csr = rvfi_insn_if[ 6: 0] == OPCODE_SYSTEM 
                       && rvfi_insn_if[14:12] != 3'b000; // Read/modify CSR
    
    logic misaligned_access;
    logic data_access_error;
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_valid_if <= '0;
            rvfi_valid_id <= '0;
            rvfi_valid_ex <= '0;
            rvfi_valid_wb <= '0;
        end
        else begin
            if (if_stage_i.if_ready)
                rvfi_valid_if <= if_stage_i.if_valid;
                
                
            if (id_stage_i.id_ready_o)
                if (insn_if_is_csr && !id_stage_i.is_decoding_o)
                    rvfi_valid_id <= 1'b0;
                else
                    rvfi_valid_id <= rvfi_valid_if && id_stage_i.id_valid_o;
            else
                rvfi_valid_id <= 1'b0;
                
                
            if (ex_stage_i.ex_ready_o) begin
                // Assert valid when div/rem instr finishes
                if (insn_id_is_div && ex_stage_i.alu_i.int_div.div_i.State_SP == 2'b10) // 2'b10 = FINISH
                    rvfi_valid_ex <= 1'b1;
                else
                // Assert valid when mulh instr finishes
                if (insn_id_is_mulh && ex_stage_i.mult_i.mulh_CS == ex_stage_i.mult_i.mulh_CS.last()) // mulh_CS = FINISH
                    rvfi_valid_ex <= 1'b1;
                else
                // Assert valid when a misaligned store completes
                if (insn_ex_is_store && misaligned_access && !load_store_unit_i.data_misaligned_o) // Misaligned store completed 
                    rvfi_valid_ex <= 1'b1;
                else
                    rvfi_valid_ex <= rvfi_valid_id && ex_stage_i.ex_valid_o;
                // Save status of misaligned access and data error for WB stage
                misaligned_access <= load_store_unit_i.data_misaligned_o;
                data_access_error <= load_store_unit_i.data_err_i;
            end
            else
                rvfi_valid_ex <= 1'b0;
                
            
            // De-assert valid if we're waiting for a misaligned access to complete
            if (insn_ex_is_mem && misaligned_access) // Misaligned memory access, stall 1 cycle
                rvfi_valid_wb <= 1'b0;
            else
            // Assert valid when a mem instr completes (except if there's a data error)
            if (insn_ex_is_mem && load_store_unit_i.data_rvalid_i && load_store_unit_i.CS == 2'b01) // 2'b01 = WAIT_RVALID
                rvfi_valid_wb <= (data_access_error) ? 1'b0 : 1'b1; // Don't assert valid if there is a data error!
            else
            if (load_store_unit_i.lsu_ready_wb_o)
                rvfi_valid_wb <= rvfi_valid_ex && wb_valid;
            else
                rvfi_valid_wb <= 1'b0; 
        end
    end
    assign rvfi_valid = rvfi_valid_wb;
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_order_wb <= '0;
        end
        else begin
            rvfi_order_wb <= rvfi_order_wb + rvfi_valid;
        end
    end
    assign rvfi_order = rvfi_order_wb;
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_insn_if <= '0;
            rvfi_insn_id <= '0;
            rvfi_insn_ex <= '0;
            rvfi_insn_wb <= '0;
        end
        else begin
            if (if_stage_i.if_ready)
                rvfi_insn_if <= (if_stage_i.instr_compressed_int) ? {16'b0, if_stage_i.fetch_rdata[15:0]} : if_stage_i.instr_decompressed;
            if (id_stage_i.id_ready_o)
                rvfi_insn_id <= rvfi_insn_if;
            if (ex_stage_i.ex_ready_o)
                rvfi_insn_ex <= rvfi_insn_id;
            // if (load_store_unit_i.lsu_ready_wb_o)
                rvfi_insn_wb <= rvfi_insn_ex;
        end
    end
    assign rvfi_insn = rvfi_insn_wb;
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_trap_id <= '0;
            rvfi_trap_ex <= '0;
            rvfi_trap_wb <= '0;
        end
        else begin
            if (id_stage_i.id_ready_o)
                rvfi_trap_id <= id_stage_i.illegal_insn_dec;
            if (ex_stage_i.ex_ready_o)
                rvfi_trap_ex <= rvfi_trap_id;
            if (load_store_unit_i.lsu_ready_wb_o)
                rvfi_trap_wb <= rvfi_trap_ex;
        end
    end
    assign rvfi_trap = rvfi_trap_wb;
    // rvfi_trap must be set for an instruction that cannot be decoded as a legal instruction, such as 0x00000000.
    // In addition, rvfi_trap must be set for a misaligned memory read or write in PMAs that don't allow 
    // misaligned access, or other memory access violations. 
    // rvfi_trap must also be set for a jump instruction that jumps to a misaligned instruction.    TODO SEE ABOUT THIS!!!!!!!!!!!!!
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_halt_if <= '0;
            rvfi_halt_id <= '0;
            rvfi_halt_ex <= '0;
            rvfi_halt_wb <= '0;
        end
        else begin
            rvfi_halt_if <= if_stage_i.halt_if_i;
            rvfi_halt_id <= id_stage_i.halt_id | rvfi_halt_if;
            rvfi_halt_ex <= rvfi_halt_id;
            rvfi_halt_wb <= rvfi_halt_ex;
        end
    end
    // assign rvfi_halt = rvfi_halt_wb;
    assign rvfi_halt = '0; // Todo!!! Make this work with actual halts!!
    
    
    logic next_is_intr;
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            next_is_intr <= '0;
            rvfi_intr_id <= '0;
            rvfi_intr_if <= '0;
            rvfi_intr_ex <= '0;
            rvfi_intr_wb <= '0;
        end
        else begin
            next_is_intr <= if_stage_i.pc_mux_i inside {PC_EXCEPTION};
            rvfi_intr_if <= next_is_intr;
            rvfi_intr_id <= rvfi_intr_if;
            rvfi_intr_ex <= rvfi_intr_id;
            rvfi_intr_wb <= rvfi_intr_ex;
        end
    end
    assign rvfi_intr = rvfi_intr_wb;
    // rvfi_intr must be set for the first instruction that is part of a trap handler,
    // i.e. an instruction that has a rvfi_pc_rdata that does not match the rvfi_pc_wdata
    // of the previous instruction.
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_mode_id <= '0;
            rvfi_mode_ex <= '0;
            rvfi_mode_wb <= '0;
        end
        else begin
            if (id_stage_i.id_ready_o)
                rvfi_mode_id <= id_stage_i.current_priv_lvl_i;
            if (ex_stage_i.ex_ready_o)
                rvfi_mode_ex <= rvfi_mode_id;
            if (load_store_unit_i.lsu_ready_wb_o)
                rvfi_mode_wb <= rvfi_mode_ex;
        end
    end
    assign rvfi_mode = rvfi_mode_wb; // 0=U-Mode, 1=S-Mode, 2=Reserved, 3=M-Mode    
    // current_priv_lvl is of the following type:
    // // Privileged mode
    // typedef enum logic[1:0] {
    // PRIV_LVL_M = 2'b11,
    // PRIV_LVL_H = 2'b10,
    // PRIV_LVL_S = 2'b01,
    // PRIV_LVL_U = 2'b00
    // } PrivLvl_t;
    
    assign rvfi_ixl = cs_registers_i.MXL;
    // rvfi_ixl must be set to the value of MXL/SXL/UXL in the current privilege level, 
    // using the following encoding: 1=32, 2=64
    
    

    //====================   Integer Register Read/Write   ====================//
    reg [ 4:0] rvfi_rs1_addr_id , rvfi_rs1_addr_ex , rvfi_rs1_addr_wb ;
    reg [ 4:0] rvfi_rs2_addr_id , rvfi_rs2_addr_ex , rvfi_rs2_addr_wb ;
    reg [31:0] rvfi_rs1_rdata_id, rvfi_rs1_rdata_ex, rvfi_rs1_rdata_wb;
    reg [31:0] rvfi_rs2_rdata_id, rvfi_rs2_rdata_ex, rvfi_rs2_rdata_wb;
    reg [ 4:0]                    rvfi_rd_addr_ex  , rvfi_rd_addr_wb  ;
    reg [31:0]                    rvfi_rd_wdata_ex , rvfi_rd_wdata_wb ;
    `ifdef RISCV_FORMAL_CUSTOM_ISA
        reg [ 4:0] rvfi_rs3_addr_id , rvfi_rs3_addr_ex     , rvfi_rs3_addr_wb      ;
        reg [31:0] rvfi_rs3_rdata_id, rvfi_rs3_rdata_ex    , rvfi_rs3_rdata_wb     ;
        reg [ 4:0]                    rvfi_post_rd_addr_ex , rvfi_post_rd_addr_wb  ;
        reg [31:0]                    rvfi_post_rd_wdata_ex, rvfi_post_rd_wdata_wb ;
    `endif
    
    wire insn_if_is_div = rvfi_insn_if[ 6: 0] == OPCODE_OP 
                       && rvfi_insn_if[31:25] == 7'h01
                       && rvfi_insn_if[14:12] inside {3'h4, 3'h5, 3'h6, 3'h7}; // div, divu, rem, remu
    
    wire insn_id_is_post = (rvfi_insn_id[6:0] == OPCODE_LOAD_POST) || (rvfi_insn_id[6:0] == OPCODE_STORE_POST);
    
    // logic op_a_is_reg;
    // always_comb
    //     if (rvfi_insn_if[6:0] == OPCODE_HWLOOP)
    //         op_a_is_reg = (rvfi_insn_if[14:12] inside {3'b010, 3'b100});
    //     else
    //         op_a_is_reg = !(id_stage_i.alu_op_a_mux_sel inside {OP_A_CURRPC, OP_A_IMM});
    // wire op_b_is_reg = !(id_stage_i.alu_op_b_mux_sel inside {OP_B_IMM});
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_rs1_addr_id <= '0;
            rvfi_rs1_addr_ex <= '0;
            rvfi_rs1_addr_wb <= '0;
            rvfi_rs1_rdata_id <= '0;
            rvfi_rs1_rdata_ex <= '0;
            rvfi_rs1_rdata_wb <= '0;
        end
        else begin
            if (id_stage_i.id_ready_o) begin
                if (insn_if_is_div) begin
                    rvfi_rs1_addr_id <= id_stage_i.regfile_addr_rc_id;
                    rvfi_rs1_rdata_id <= id_stage_i.operand_c_fw_id;
                end
                else 
                // if (op_a_is_reg) begin
                if (id_stage_i.rega_used_dec) begin
                    rvfi_rs1_addr_id <= id_stage_i.regfile_addr_ra_id;
                    rvfi_rs1_rdata_id <= id_stage_i.operand_a_fw_id;
                end
                else 
                begin
                    rvfi_rs1_addr_id <= '0;
                    rvfi_rs1_rdata_id <= '0;
                end
            end
            if (ex_stage_i.ex_ready_o) begin
                rvfi_rs1_addr_ex <= rvfi_rs1_addr_id;
                rvfi_rs1_rdata_ex <= rvfi_rs1_rdata_id;
            end
            if (load_store_unit_i.lsu_ready_wb_o) begin
                rvfi_rs1_addr_wb <= rvfi_rs1_addr_ex;
                rvfi_rs1_rdata_wb <= rvfi_rs1_rdata_ex;
            end
        end
    end
    assign rvfi_rs1_addr = rvfi_rs1_addr_wb;
    assign rvfi_rs1_rdata = rvfi_rs1_rdata_wb;
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_rs2_addr_id <= '0;
            rvfi_rs2_addr_ex <= '0;
            rvfi_rs2_addr_wb <= '0;
            rvfi_rs2_rdata_id <= '0;
            rvfi_rs2_rdata_ex <= '0;
            rvfi_rs2_rdata_wb <= '0;
        end
        else begin
            if (id_stage_i.id_ready_o) begin
                rvfi_rs2_addr_id <= id_stage_i.regfile_addr_rb_id;
                rvfi_rs2_rdata_id <= id_stage_i.operand_b_fw_id;
            end
            if (ex_stage_i.ex_ready_o) begin
                rvfi_rs2_addr_ex <= rvfi_rs2_addr_id;
                rvfi_rs2_rdata_ex <= rvfi_rs2_rdata_id;
            end
            if (load_store_unit_i.lsu_ready_wb_o) begin
                rvfi_rs2_addr_wb <= rvfi_rs2_addr_ex;
                rvfi_rs2_rdata_wb <= rvfi_rs2_rdata_ex;
            end
        end
    end
    assign rvfi_rs2_addr = rvfi_rs2_addr_wb;
    assign rvfi_rs2_rdata = rvfi_rs2_rdata_wb;
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_rd_addr_ex <= '0;
            rvfi_rd_addr_wb <= '0;
        end
        else begin
            if (ex_stage_i.ex_ready_o) begin
                if (!insn_id_is_post && ex_stage_i.regfile_alu_we_fw_o)
                    rvfi_rd_addr_ex <= ex_stage_i.regfile_alu_waddr_fw_o;
                else
                    rvfi_rd_addr_ex <= '0;
            end
            
            if (load_store_unit_i.lsu_ready_wb_o) begin
                rvfi_rd_addr_wb <= (id_stage_i.regfile_we_wb_i) ? id_stage_i.regfile_waddr_wb_i : rvfi_rd_addr_ex;
            end
        end
    end
    assign rvfi_rd_addr = rvfi_rd_addr_wb;
    
    // TODO!!! Delete this when we fix hwloops!
    wire insn_id_is_j = rvfi_insn_id[6:0] == OPCODE_JAL || rvfi_insn_id[6:0] == OPCODE_JALR
                     || {rvfi_insn_id[1:0], rvfi_insn_id[15:13]} inside {5'b01_101, 5'b01_001}      //c.j, c.jal
                     || {rvfi_insn_id[1:0], rvfi_insn_id[15:12]} inside {6'b10_1000, 6'b10_1001} && rvfi_insn_id[6:2]==0;   //c.jr, c.jalr
    wire insn_id_is_auipc = rvfi_insn_id[6:0] == OPCODE_AUIPC;
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_rd_wdata_ex <= '0;
            rvfi_rd_wdata_wb <= '0;
        end
        else begin
            if (ex_stage_i.ex_ready_o) begin
                if (ex_stage_i.regfile_alu_we_fw_o && !insn_id_is_post) begin
                    if (ex_stage_i.regfile_alu_waddr_fw_o == '0)
                        rvfi_rd_wdata_ex <= '0;
                    // TODO!!!! Please fix this!! (Fix hardware loops to fix this)
                    // We clear the LSB for jumps and auipc because hwloops break everything
                    else if (insn_id_is_j || insn_id_is_auipc)
                        rvfi_rd_wdata_ex <= {ex_stage_i.regfile_alu_wdata_fw_o[31:1], 1'b0};
                    else 
                        rvfi_rd_wdata_ex <= ex_stage_i.regfile_alu_wdata_fw_o;
                end
                else
                    rvfi_rd_wdata_ex <= '0;
            end
            
            if (load_store_unit_i.lsu_ready_wb_o) begin
                if (id_stage_i.regfile_we_wb_i)
                    if (id_stage_i.regfile_waddr_wb_i == '0)
                        rvfi_rd_wdata_wb <= '0;
                    else 
                        rvfi_rd_wdata_wb <= id_stage_i.regfile_wdata_wb_i;
                else
                    rvfi_rd_wdata_wb <= rvfi_rd_wdata_ex;
            end
        end
    end
    assign rvfi_rd_wdata = rvfi_rd_wdata_wb;
    
    `ifdef RISCV_FORMAL_CUSTOM_ISA
        always @(posedge clk or negedge rst_ni) begin
            if (!rst_ni) begin
                rvfi_rs3_addr_id <= '0;
                rvfi_rs3_addr_ex <= '0;
                rvfi_rs3_addr_wb <= '0;
                rvfi_rs3_rdata_id <= '0;
                rvfi_rs3_rdata_ex <= '0;
                rvfi_rs3_rdata_wb <= '0;
            end
            else begin
                if (id_stage_i.id_ready_o) begin
                    rvfi_rs3_addr_id <= id_stage_i.regfile_addr_rc_id;
                    rvfi_rs3_rdata_id <= id_stage_i.operand_c_fw_id;
                end
                if (ex_stage_i.ex_ready_o) begin
                    rvfi_rs3_addr_ex <= rvfi_rs3_addr_id;
                    rvfi_rs3_rdata_ex <= rvfi_rs3_rdata_id;
                end
                if (load_store_unit_i.lsu_ready_wb_o) begin
                    rvfi_rs3_addr_wb <= rvfi_rs3_addr_ex;
                    rvfi_rs3_rdata_wb <= rvfi_rs3_rdata_ex;
                end
            end
        end
        assign rvfi_rs3_addr = rvfi_rs3_addr_wb;
        assign rvfi_rs3_rdata = rvfi_rs3_rdata_wb;
        
        always @(posedge clk or negedge rst_ni) begin
            if (!rst_ni) begin
                rvfi_post_rd_addr_ex <= '0;
                rvfi_post_rd_addr_wb <= '0;
            end
            else begin
                if (ex_stage_i.ex_ready_o) begin
                    if (insn_id_is_post && ex_stage_i.regfile_alu_we_fw_o)
                        rvfi_post_rd_addr_ex <= ex_stage_i.regfile_alu_waddr_fw_o;
                    else if (!insn_id_is_post)
                        rvfi_post_rd_addr_ex <= '0;
                end
                if (load_store_unit_i.lsu_ready_wb_o) begin
                    rvfi_post_rd_addr_wb <= rvfi_post_rd_addr_ex;
                end
            end
        end
        assign rvfi_post_rd_addr = rvfi_post_rd_addr_wb;
        
        always @(posedge clk or negedge rst_ni) begin
            if (!rst_ni) begin
                rvfi_post_rd_wdata_ex <= '0;
                rvfi_post_rd_wdata_wb <= '0;
            end
            else begin
                if (ex_stage_i.ex_ready_o) begin
                    if (insn_id_is_post && ex_stage_i.regfile_alu_we_fw_o)
                        if (ex_stage_i.regfile_alu_waddr_fw_o != '0)
                            rvfi_post_rd_wdata_ex <= ex_stage_i.regfile_alu_wdata_fw_o;
                        else
                            rvfi_post_rd_wdata_ex <= '0;
                    else if (!insn_id_is_post)
                        rvfi_post_rd_wdata_ex <= '0;
                end
                if (load_store_unit_i.lsu_ready_wb_o) begin
                    rvfi_post_rd_wdata_wb <= rvfi_post_rd_wdata_ex;
                end
            end
        end
        assign rvfi_post_rd_wdata = rvfi_post_rd_wdata_wb;
    `endif
    
    
    
    //====================   Program Counter   ====================//
    reg [31:0] rvfi_pc_rdata_if, rvfi_pc_rdata_id, rvfi_pc_rdata_ex, rvfi_pc_rdata_wb;
    reg [31:0]                   rvfi_pc_wdata_id, rvfi_pc_wdata_ex, rvfi_pc_wdata_wb;
    `ifdef RISCV_FORMAL_CUSTOM_ISA
        reg        rvfi_is_hwlp_if   , rvfi_is_hwlp_id   , rvfi_is_hwlp_ex   , rvfi_is_hwlp_wb   ;
        reg [31:0] rvfi_hwlp_start_if, rvfi_hwlp_start_id, rvfi_hwlp_start_ex, rvfi_hwlp_start_wb;
    `endif
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_pc_rdata_if <= '0;
            rvfi_pc_rdata_id <= '0;
            rvfi_pc_rdata_ex <= '0;
            rvfi_pc_rdata_wb <= '0;
        end
        else begin
            if (if_stage_i.if_ready)
                // rvfi_pc_rdata_if <= if_stage_i.pc_if_o;
                rvfi_pc_rdata_if <= {if_stage_i.pc_if_o[31:1], 1'b0}; // Clearing the LSB is necessary because hwloops break everything!
            if (id_stage_i.id_ready_o)
                rvfi_pc_rdata_id <= rvfi_pc_rdata_if;
            if (ex_stage_i.ex_ready_o)
                rvfi_pc_rdata_ex <= rvfi_pc_rdata_id;
            if (load_store_unit_i.lsu_ready_wb_o)
                rvfi_pc_rdata_wb <= rvfi_pc_rdata_ex;
        end
    end
    assign rvfi_pc_rdata = rvfi_pc_rdata_wb;
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_pc_wdata_id <= '0;
            rvfi_pc_wdata_ex <= '0;
            rvfi_pc_wdata_wb <= '0;
        end
        else begin
            if (id_stage_i.id_ready_o)
                if (id_stage_i.jump_in_id inside {BRANCH_JAL, BRANCH_JALR})
                    rvfi_pc_wdata_id <= {id_stage_i.jump_target_o[31:1], 1'b0};
                else
                    // TODO!!!! Please fix this!! (Fix hardware loops to fix this)
                    // We're tricking rvfi into thinking the next pc is pc + 4 or pc + 2
                    rvfi_pc_wdata_id <= (rvfi_insn_if[1:0]!=2'b11) ? (rvfi_pc_rdata_if + 2) : (rvfi_pc_rdata_if + 4);
                    // rvfi_pc_wdata_id <= id_stage_i.pc_if_i;
            if (ex_stage_i.ex_ready_o)
                if (id_stage_i.branch_taken_ex)
                    rvfi_pc_wdata_ex <= {ex_stage_i.jump_target_o[31:1], 1'b0};
                else
                    rvfi_pc_wdata_ex <= rvfi_pc_wdata_id;
            if (load_store_unit_i.lsu_ready_wb_o)
                rvfi_pc_wdata_wb <= rvfi_pc_wdata_ex;
        end
    end
    assign rvfi_pc_wdata = rvfi_pc_wdata_wb;
    
    `ifdef RISCV_FORMAL_CUSTOM_ISA
        // WIP! This does NOT work! WIP!
        reg [31:0] prev_fetch_rdata;
        reg [31:0] prev_fetch_addr;
        reg [31:0] insn_end_if, insn_end_id, insn_end_ex;
        reg hwlp_jump_l;
        always @(posedge clk or negedge rst_ni) begin
            if (!rst_ni) begin
                rvfi_is_hwlp_if <= '0;
                rvfi_is_hwlp_id <= '0;
                rvfi_is_hwlp_ex <= '0;
                rvfi_is_hwlp_wb <= '0;
                rvfi_hwlp_start_if <= '0;
                rvfi_hwlp_start_id <= '0;
                rvfi_hwlp_start_ex <= '0;
                rvfi_hwlp_start_wb <= '0;
                prev_fetch_rdata <= '0;
                prev_fetch_addr <= '0;
            end
            else begin
                `define PREFETCH if_stage_i.prefetch_32.prefetch_buffer_i
                prev_fetch_rdata <= if_stage_i.fetch_rdata;
                prev_fetch_addr <= if_stage_i.fetch_addr;
                hwlp_jump_l <= if_stage_i.hwlp_jump;
                
                // if (if_stage_i.hwlp_jump) begin
                if (`PREFETCH.hwlp_masked) begin
                    rvfi_is_hwlp_if <= 1'b1;
                    insn_end_if <= (if_stage_i.instr_compressed_int) ? {16'b0, if_stage_i.fetch_rdata[15:0]} : if_stage_i.instr_decompressed;
                    rvfi_hwlp_start_if <= if_stage_i.hwlp_target;
                end
                else if (if_stage_i.if_ready) begin
                    rvfi_is_hwlp_if <= 1'b0;
                end
                
                if (`PREFETCH.hwlp_NS == 3'b010) begin // 3'b010 == HWLP_FETCHING
                    if (`PREFETCH.hwlp_CS != 3'b010) begin
                        // rvfi_is_hwlp_if <= 1'b1;
                    end
                end
                // else if (if_stage_i.if_ready && prev_fetch_addr != if_stage_i.fetch_addr) begin
                else if (if_stage_i.if_ready) begin
                    // rvfi_is_hwlp_if <= 1'b0;
                end
                
                if (rvfi_is_hwlp_if) begin
                    rvfi_hwlp_start_id <= rvfi_hwlp_start_if;
                    if (insn_end_if == rvfi_insn_if)
                        rvfi_is_hwlp_id <= 1'b1;
                    else
                        rvfi_is_hwlp_id <= 1'b0;
                end
                else if (id_stage_i.id_ready_o) begin
                    rvfi_is_hwlp_id <= 1'b0;
                end
                
                if (rvfi_is_hwlp_id) begin
                    rvfi_hwlp_start_ex <= rvfi_hwlp_start_id;
                    if (insn_end_id == rvfi_insn_id)
                        rvfi_is_hwlp_ex <= 1'b1;
                    else
                        rvfi_is_hwlp_ex <= 1'b0;
                end
                else if (ex_stage_i.ex_ready_o) begin
                    rvfi_is_hwlp_ex <= 1'b0;
                end
                
                if (rvfi_is_hwlp_ex) begin
                    rvfi_hwlp_start_wb <= rvfi_hwlp_start_ex;
                    if (insn_end_ex == rvfi_insn_ex)
                        rvfi_is_hwlp_wb <= 1'b1;
                    else
                        rvfi_is_hwlp_wb <= 1'b0;
                end
                else if (load_store_unit_i.lsu_ready_wb_o) begin
                    rvfi_is_hwlp_wb <= 1'b0;
                end
                
                if (id_stage_i.id_ready_o) begin
                    // rvfi_is_hwlp_id <= rvfi_is_hwlp_if;
                    // rvfi_is_hwlp_id <= rvfi_is_hwlp_if && `PREFETCH.fetch_is_hwlp;
                    // rvfi_is_hwlp_id <= (`PREFETCH.hwlp_CS == 3'b010); // 3'b010 == HWLP_FETCHING
                    insn_end_id <= insn_end_if;
                end
                if (ex_stage_i.ex_ready_o) begin
                    // rvfi_is_hwlp_ex <= rvfi_is_hwlp_id;
                    // rvfi_is_hwlp_ex <= id_stage_i.is_hwlp_i;
                    insn_end_ex <= insn_end_id;
                end
                if (load_store_unit_i.lsu_ready_wb_o) begin
                    // rvfi_is_hwlp_wb <= rvfi_is_hwlp_ex;
                    // rvfi_is_hwlp_wb <= rvfi_is_hwlp_ex && (insn_end_ex == rvfi_insn_ex);
                end
            end
        end
        // assign rvfi_is_hwlp = rvfi_is_hwlp_wb;
        assign rvfi_is_hwlp = 1'b0; // TODO!!! Fix hardware loops!!
        assign rvfi_hwlp_start = rvfi_hwlp_start_wb;
    `endif
    
    
    //====================   Memory Access   ====================//
    reg [31:0] rvfi_mem_addr_ex , rvfi_mem_addr_wb ;
    reg [ 3:0]                    rvfi_mem_rmask_wb;
    reg [ 3:0] rvfi_mem_wmask_ex, rvfi_mem_wmask_wb;
    reg [31:0]                    rvfi_mem_rdata_wb;
    reg [31:0] rvfi_mem_wdata_ex, rvfi_mem_wdata_wb;
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_mem_addr_ex <= '0;
            rvfi_mem_addr_wb <= '0;
        end
        else begin
            if (ex_stage_i.ex_ready_o)
                rvfi_mem_addr_ex <= (misaligned_access) ? rvfi_mem_addr_ex : load_store_unit_i.data_addr_o;
            if (load_store_unit_i.lsu_ready_wb_o)
                rvfi_mem_addr_wb <= rvfi_mem_addr_ex;
        end
    end
    assign rvfi_mem_addr = rvfi_mem_addr_wb;
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_mem_rmask_wb <= '0;
        end
        else begin
            case (load_store_unit_i.data_type_q)
                2'b00:       rvfi_mem_rmask_wb = 4'b1111;
                2'b01:       rvfi_mem_rmask_wb = 4'b0011;
                2'b10,2'b11: rvfi_mem_rmask_wb = 4'b0001;
            endcase                
        end
    end
    assign rvfi_mem_rmask = rvfi_mem_rmask_wb;
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_mem_wmask_ex <= '0;
            rvfi_mem_wmask_wb <= '0;
        end
        else begin
            if (ex_stage_i.ex_ready_o)
                // Drive mask if it's a write operation
                if (load_store_unit_i.data_req_o && load_store_unit_i.data_we_o) begin
                    if (!misaligned_access)
                        rvfi_mem_wmask_ex <= load_store_unit_i.data_be >> load_store_unit_i.data_addr_int[1:0];
                    else 
                        if (load_store_unit_i.data_type_ex_i == 2'b00) // Store word
                            rvfi_mem_wmask_ex <= (load_store_unit_i.data_be << 4-load_store_unit_i.data_addr_int[1:0]) | rvfi_mem_wmask_ex;
                        else if (load_store_unit_i.data_type_ex_i == 2'b01) // Store half-word
                            rvfi_mem_wmask_ex <= (load_store_unit_i.data_be << 1) | rvfi_mem_wmask_ex;
                end
                else // Not a write operation
                    rvfi_mem_wmask_ex <= '0;
            
            if (load_store_unit_i.lsu_ready_wb_o)
                rvfi_mem_wmask_wb <= rvfi_mem_wmask_ex;
        end
    end
    assign rvfi_mem_wmask = rvfi_mem_wmask_wb;
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_mem_rdata_wb <= '0;
        end
        else begin
            rvfi_mem_rdata_wb <= load_store_unit_i.data_rdata_ex_o;
        end
    end
    assign rvfi_mem_rdata = rvfi_mem_rdata_wb;
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            rvfi_mem_wdata_ex <= '0;
            rvfi_mem_wdata_wb <= '0;
        end
        else begin
            if (ex_stage_i.ex_ready_o)
                rvfi_mem_wdata_ex <= load_store_unit_i.data_wdata_ex_i;
            if (load_store_unit_i.lsu_ready_wb_o)
                rvfi_mem_wdata_wb <= rvfi_mem_wdata_ex;
        end
    end
    assign rvfi_mem_wdata = rvfi_mem_wdata_wb;

    //====================   CSR - misa   ====================//
    logic [31:0] rvfi_csr_mask_ex , rvfi_csr_mask_wb ;
    logic [31:0] rvfi_csr_rdata_ex, rvfi_csr_rdata_wb;
    logic [31:0] rvfi_csr_wdata_ex, rvfi_csr_wdata_wb;
    
    always @(posedge clk or negedge rst_ni) begin
        if (!rst_ni) begin
            // rvfi_csr_mask_ex  <= '0;
            // rvfi_csr_mask_wb  <= '0;
            rvfi_csr_rdata_ex <= '0;
            rvfi_csr_rdata_wb <= '0;
            rvfi_csr_wdata_ex <= '0;
            rvfi_csr_wdata_wb <= '0;
        end
        else begin
            if (ex_stage_i.ex_ready_o && cs_registers_i.csr_we_int) begin
                rvfi_csr_rdata_ex <= cs_registers_i.csr_rdata_o;
                rvfi_csr_wdata_ex <= cs_registers_i.csr_wdata_int;
            end
            if (load_store_unit_i.lsu_ready_wb_o) begin
                rvfi_csr_rdata_wb <= rvfi_csr_rdata_ex;
                rvfi_csr_wdata_wb <= rvfi_csr_wdata_ex;
            end
        end
    end
    
    assign rvfi_csr_mask_wb = {32{rvfi_valid_wb}};
    
    assign rvfi_csr_misa_rmask = '1;
    assign rvfi_csr_misa_rdata = cs_registers_i.MISA_VALUE;
    assign rvfi_csr_misa_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_misa_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - mstatus   ====================//
    
    assign rvfi_csr_mstatus_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_mstatus_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_mstatus_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_mstatus_wdata = rvfi_csr_wdata_wb;
    
    //====================   CSR - mstatus   ====================//

    assign rvfi_csr_mstatus_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_mstatus_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_mstatus_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_mstatus_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - mtvec   ====================//

    assign rvfi_csr_mtvec_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_mtvec_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_mtvec_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_mtvec_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - mepc   ====================//

    assign rvfi_csr_mepc_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_mepc_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_mepc_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_mepc_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - mcause   ====================//

    assign rvfi_csr_mcause_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_mcause_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_mcause_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_mcause_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - mhartid   ====================//

    assign rvfi_csr_mhartid_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_mhartid_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_mhartid_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_mhartid_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - mscratch   ====================//

    assign rvfi_csr_mscratch_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_mscratch_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_mscratch_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_mscratch_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpcfg0   ====================//

    assign rvfi_csr_pmpcfg0_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpcfg0_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpcfg0_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpcfg0_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpcfg1   ====================//

    assign rvfi_csr_pmpcfg1_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpcfg1_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpcfg1_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpcfg1_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpcfg2   ====================//

    assign rvfi_csr_pmpcfg2_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpcfg2_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpcfg2_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpcfg2_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpcfg3   ====================//

    assign rvfi_csr_pmpcfg3_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpcfg3_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpcfg3_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpcfg3_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpaddr0   ====================//

    assign rvfi_csr_pmpaddr0_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr0_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpaddr0_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr0_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpaddr1   ====================//

    assign rvfi_csr_pmpaddr1_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr1_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpaddr1_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr1_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpaddr2   ====================//

    assign rvfi_csr_pmpaddr2_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr2_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpaddr2_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr2_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpaddr3   ====================//

    assign rvfi_csr_pmpaddr3_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr3_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpaddr3_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr3_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpaddr4   ====================//

    assign rvfi_csr_pmpaddr4_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr4_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpaddr4_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr4_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpaddr5   ====================//

    assign rvfi_csr_pmpaddr5_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr5_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpaddr5_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr5_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpaddr6   ====================//

    assign rvfi_csr_pmpaddr6_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr6_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpaddr6_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr6_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpaddr7   ====================//

    assign rvfi_csr_pmpaddr7_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr7_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpaddr7_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr7_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpaddr8   ====================//

    assign rvfi_csr_pmpaddr8_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr8_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpaddr8_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr8_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpaddr9   ====================//

    assign rvfi_csr_pmpaddr9_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr9_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpaddr9_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr9_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpaddr10   ====================//

    assign rvfi_csr_pmpaddr10_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr10_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpaddr10_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr10_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpaddr11   ====================//

    assign rvfi_csr_pmpaddr11_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr11_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpaddr11_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr11_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpaddr12   ====================//

    assign rvfi_csr_pmpaddr12_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr12_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpaddr12_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr12_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpaddr13   ====================//

    assign rvfi_csr_pmpaddr13_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr13_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpaddr13_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr13_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpaddr14   ====================//

    assign rvfi_csr_pmpaddr14_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr14_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpaddr14_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr14_wdata = rvfi_csr_wdata_wb;

    //====================   CSR - pmpaddr15   ====================//

    assign rvfi_csr_pmpaddr15_rmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr15_rdata = rvfi_csr_rdata_wb;
    assign rvfi_csr_pmpaddr15_wmask = rvfi_csr_mask_wb;
    assign rvfi_csr_pmpaddr15_wdata = rvfi_csr_wdata_wb;
`endif

endmodule
