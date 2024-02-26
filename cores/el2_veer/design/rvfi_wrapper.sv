module rvfi_wrapper 
 #(
`include "el2_param.vh"
) (
	input clock,
	input reset,
	`RVFI_OUTPUTS
);
	(* keep *) wire trap;

	// (* keep *) `rvformal_rand_reg mem_ready;
	// (* keep *) `rvformal_rand_reg [31:0] mem_rdata;

	// (* keep *) wire        mem_valid;
	// (* keep *) wire        mem_instr;
	// (* keep *) wire [31:0] mem_addr;
	// (* keep *) wire [31:0] mem_wdata;
	// (* keep *) wire [3:0]  mem_wstrb;

    

    // VeeR constant inputs
    (* keep *) wire [31:0] rst_vec = 'h80000000;
    (* keep *) wire        nmi_int = 0;
    (* keep *) wire [31:0] nmi_vec = 32'hee000000;
    (* keep *) wire [31:1] jtag_id = {4'b1, 16'b0, 11'h45};
    (* keep *) wire        lsu_bus_clk_en = 1;
    (* keep *) wire        ifu_bus_clk_en = 1;
    (* keep *) wire        dbg_bus_clk_en = 1;
    (* keep *) wire        dma_bus_clk_en = 1;
    (* keep *) el2_ic_data_ext_in_pkt_t [pt.ICACHE_NUM_WAYS-1:0][pt.ICACHE_BANKS_WAY-1:0] ic_data_ext_in_pkt = '0;
    (* keep *) el2_ic_tag_ext_in_pkt_t  [pt.ICACHE_NUM_WAYS-1:0] ic_tag_ext_in_pkt = '0;
    (* keep *) wire        timer_int = 0;
    (* keep *) wire        soft_int  = 0;
    (* keep *) wire [pt.PIC_TOTAL_INT:1] extintsrc_req = '0;
    (* keep *) wire        jtag_tck    =  0;
    (* keep *) wire        jtag_tms    =  0;
    (* keep *) wire        jtag_tdi    =  0;
    (* keep *) wire        jtag_trst_n =  0;
    (* keep *) wire [31:4] core_id     = '0;
    (* keep *) wire        mpc_debug_halt_req = 0;
    (* keep *) wire        mpc_debug_run_req  = 1;
    (* keep *) wire        mpc_reset_run_req  = 1;
    (* keep *) wire        i_cpu_halt_req     = 0;
    (* keep *) wire        i_cpu_run_req      = 0;
    (* keep *) wire        scan_mode          = 0;
    (* keep *) wire        mbist_mode         = 0;
    (* keep *) wire        dmi_uncore_enable;
    (* keep *) wire [31:0] dmi_uncore_rdata;

    // VeeR outputs
    (* keep *) wire [31:0] trace_rv_i_insn_ip;
    (* keep *) wire [31:0] trace_rv_i_address_ip;
    (* keep *) wire        trace_rv_i_valid_ip;
    (* keep *) wire        trace_rv_i_exception_ip;
    (* keep *) wire [4:0]  trace_rv_i_ecause_ip;
    (* keep *) wire        trace_rv_i_interrupt_ip;
    (* keep *) wire [31:0] trace_rv_i_tval_ip;
    (* keep *) wire        iccm_ecc_single_error;   
    (* keep *) wire        iccm_ecc_double_error;   
    (* keep *) wire        dccm_ecc_single_error;   
    (* keep *) wire        dccm_ecc_double_error; 
    (* keep *) wire        dec_tlu_perfcnt0;
    (* keep *) wire        dec_tlu_perfcnt1;
    (* keep *) wire        dec_tlu_perfcnt2;
    (* keep *) wire        dec_tlu_perfcnt3; 
    (* keep *) wire        jtag_tdo; 
    (* keep *) wire        mpc_debug_halt_ack; 
    (* keep *) wire        mpc_debug_run_ack; 
    (* keep *) wire        debug_brkpt_status; 
    (* keep *) wire        o_cpu_halt_ack; 
    (* keep *) wire        o_cpu_halt_status; 
    (* keep *) wire        o_cpu_run_ack; 
    (* keep *) wire        o_debug_mode_status; 


    (* keep *) wire                             active_l2clk;
    (* keep *) wire                             free_l2clk;

    // DCCM ports
    (* keep *) wire         dccm_wren;
    (* keep *) wire         dccm_rden;
    (* keep *) wire [pt.DCCM_BITS-1:0]         dccm_wr_addr_lo;
    (* keep *) wire [pt.DCCM_BITS-1:0]         dccm_wr_addr_hi;
    (* keep *) wire [pt.DCCM_BITS-1:0]         dccm_rd_addr_lo;
    (* keep *) wire [pt.DCCM_BITS-1:0]         dccm_rd_addr_hi;
    (* keep *) wire [pt.DCCM_FDATA_WIDTH-1:0]  dccm_wr_data_lo;
    (* keep *) wire [pt.DCCM_FDATA_WIDTH-1:0]  dccm_wr_data_hi;

    (* keep *) `rvformal_rand_reg [pt.DCCM_FDATA_WIDTH-1:0]  dccm_rd_data_lo;
    (* keep *) `rvformal_rand_reg [pt.DCCM_FDATA_WIDTH-1:0]  dccm_rd_data_hi;

    // PIC ports

    // Icache & Itag ports
    (* keep *) wire [31:1]  ic_rw_addr;
    (* keep *) wire [pt.ICACHE_NUM_WAYS-1:0]   ic_wr_en  ;     // Which way to write
    (* keep *) wire         ic_rd_en ;


    (* keep *) wire [pt.ICACHE_NUM_WAYS-1:0]   ic_tag_valid;   // Valid from the I$ tag valid outside (in flops).

    (* keep *) `rvformal_rand_reg [pt.ICACHE_NUM_WAYS-1:0]   ic_rd_hit;      // ic_rd_hit[3:0]
    (* keep *) `rvformal_rand_reg         ic_tag_perr;                       // Ic tag parity error

    (* keep *) wire [pt.ICACHE_INDEX_HI:3]  ic_debug_addr;     // Read/Write addresss to the Icache.
    (* keep *) wire         ic_debug_rd_en;                    // Icache debug rd
    (* keep *) wire         ic_debug_wr_en;                    // Icache debug wr
    (* keep *) wire         ic_debug_tag_array;                // Debug tag array
    (* keep *) wire [pt.ICACHE_NUM_WAYS-1:0]   ic_debug_way;   // Debug way. Rd or Wr.

    (* keep *) `rvformal_rand_reg [25:0]  ictag_debug_rd_data;               // Debug icache tag.
    (* keep *) wire [pt.ICACHE_BANKS_WAY-1:0][70:0]  ic_wr_data;
    (* keep *) `rvformal_rand_reg [63:0]  ic_rd_data;
    (* keep *) `rvformal_rand_reg [70:0]  ic_debug_rd_data;                  // Data read from Icache. 2x64bits + parity bits. F2 stage. With ECC
    (* keep *) wire [70:0]  ic_debug_wr_data;                  // Debug wr cache.

    (* keep *) `rvformal_rand_reg [pt.ICACHE_BANKS_WAY-1:0] ic_eccerr;       // ecc error per bank
    (* keep *) `rvformal_rand_reg [pt.ICACHE_BANKS_WAY-1:0] ic_parerr;       // parity error per bank

    (* keep *) wire [63:0]  ic_premux_data;
    (* keep *) wire         ic_sel_premux_data;

    // ICCM ports
    (* keep *) wire [pt.ICCM_BITS-1:1]    iccm_rw_addr;
    (* keep *) wire           iccm_wren;
    (* keep *) wire           iccm_rden;
    (* keep *) wire [2:0]     iccm_wr_size;
    (* keep *) wire [77:0]    iccm_wr_data;
    (* keep *) wire           iccm_buf_correct_ecc;
    (* keep *) wire           iccm_correction_state;

    (* keep *) `rvformal_rand_reg [63:0]    iccm_rd_data;
    (* keep *) `rvformal_rand_reg [77:0]    iccm_rd_data_ecc;

    (* keep *) wire        core_rst_l;                         // Core reset including rst_l and dbg_rst_l
    (* keep *) wire        jtag_tdoEn;

    (* keep *) wire        dccm_clk_override;
    (* keep *) wire        icm_clk_override;
    (* keep *) wire        dec_tlu_core_ecc_disable;


    // zero out the signals not presented at the wrapper instantiation level
    `ifdef RV_BUILD_AXI4

    //// AHB LITE BUS
    (* keep *) wire [31:0]              haddr;
    (* keep *) wire [2:0]               hburst;
    (* keep *) wire                     hmastlock;
    (* keep *) wire [3:0]               hprot;
    (* keep *) wire [2:0]               hsize;
    (* keep *) wire [1:0]               htrans;
    (* keep *) wire                     hwrite;

    (* keep *) wire [63:0]              hrdata;
    (* keep *) wire                     hready;
    (* keep *) wire                     hresp;

    // LSU AHB Master
    (* keep *) wire [31:0]              lsu_haddr;
    (* keep *) wire [2:0]               lsu_hburst;
    (* keep *) wire                     lsu_hmastlock;
    (* keep *) wire [3:0]               lsu_hprot;
    (* keep *) wire [2:0]               lsu_hsize;
    (* keep *) wire [1:0]               lsu_htrans;
    (* keep *) wire                     lsu_hwrite;
    (* keep *) wire [63:0]              lsu_hwdata;

    (* keep *) wire [63:0]              lsu_hrdata;
    (* keep *) wire                     lsu_hready;
    (* keep *) wire                     lsu_hresp;
    
    // Debug Syster Bus AHB
    (* keep *) wire [31:0]              sb_haddr;
    (* keep *) wire [2:0]               sb_hburst;
    (* keep *) wire                     sb_hmastlock;
    (* keep *) wire [3:0]               sb_hprot;
    (* keep *) wire [2:0]               sb_hsize;
    (* keep *) wire [1:0]               sb_htrans;
    (* keep *) wire                     sb_hwrite;
    (* keep *) wire [63:0]              sb_hwdata;

    (* keep *) wire [63:0]             sb_hrdata;
    (* keep *) wire                    sb_hready;
    (* keep *) wire                    sb_hresp;

    // DMA Slave
    (* keep *) wire                     dma_hsel;
    (* keep *) wire [31:0]              dma_haddr;
    (* keep *) wire [2:0]               dma_hburst;
    (* keep *) wire                     dma_hmastlock;
    (* keep *) wire [3:0]               dma_hprot;
    (* keep *) wire [2:0]               dma_hsize;
    (* keep *) wire [1:0]               dma_htrans;
    (* keep *) wire                     dma_hwrite;
    (* keep *) wire [63:0]              dma_hwdata;
    (* keep *) wire                     dma_hreadyin;

    (* keep *) wire [63:0]              dma_hrdata;
    (* keep *) wire                     dma_hreadyout;
    (* keep *) wire                     dma_hresp;



    // AHB
    assign  hrdata[63:0]                           = '0;
    assign  hready                                 = '0;
    assign  hresp                                  = '0;
    // LSU
    assign  lsu_hrdata[63:0]                       = '0;
    assign  lsu_hready                             = '0;
    assign  lsu_hresp                              = '0;
    // Debug
    assign  sb_hrdata[63:0]                        = '0;
    assign  sb_hready                              = '0;
    assign  sb_hresp                               = '0;

    // DMA
    assign  dma_hsel                               = '0;
    assign  dma_haddr[31:0]                        = '0;
    assign  dma_hburst[2:0]                        = '0;
    assign  dma_hmastlock                          = '0;
    assign  dma_hprot[3:0]                         = '0;
    assign  dma_hsize[2:0]                         = '0;
    assign  dma_htrans[1:0]                        = '0;
    assign  dma_hwrite                             = '0;
    assign  dma_hwdata[63:0]                       = '0;
    assign  dma_hreadyin                           = '0;

    `endif //  `ifdef RV_BUILD_AXI4

    `ifdef RV_BUILD_AXI4
   //-------------------------- LSU AXI signals--------------------------
   // AXI Write Channels
   (* keep *) wire                            lsu_axi_awvalid;
   (* keep *) `rvformal_rand_reg                            lsu_axi_awready;
   (* keep *) wire [pt.LSU_BUS_TAG-1:0]       lsu_axi_awid;
   (* keep *) wire [31:0]                     lsu_axi_awaddr;
   (* keep *) wire [3:0]                      lsu_axi_awregion;
   (* keep *) wire [7:0]                      lsu_axi_awlen;
   (* keep *) wire [2:0]                      lsu_axi_awsize;
   (* keep *) wire [1:0]                      lsu_axi_awburst;
   (* keep *) wire                            lsu_axi_awlock;
   (* keep *) wire [3:0]                      lsu_axi_awcache;
   (* keep *) wire [2:0]                      lsu_axi_awprot;
   (* keep *) wire [3:0]                      lsu_axi_awqos;

   (* keep *) wire                            lsu_axi_wvalid;
   (* keep *) `rvformal_rand_reg                            lsu_axi_wready;
   (* keep *) wire [63:0]                     lsu_axi_wdata;
   (* keep *) wire [7:0]                      lsu_axi_wstrb;
   (* keep *) wire                            lsu_axi_wlast;

   (* keep *) `rvformal_rand_reg                            lsu_axi_bvalid;
   (* keep *) wire                            lsu_axi_bready;
   (* keep *) `rvformal_rand_reg [1:0]                      lsu_axi_bresp;
   (* keep *) `rvformal_rand_reg [pt.LSU_BUS_TAG-1:0]       lsu_axi_bid;

   // AXI Read Channels
   (* keep *) wire                            lsu_axi_arvalid;
   (* keep *) `rvformal_rand_reg                            lsu_axi_arready;
   (* keep *) wire [pt.LSU_BUS_TAG-1:0]       lsu_axi_arid;
   (* keep *) wire [31:0]                     lsu_axi_araddr;
   (* keep *) wire [3:0]                      lsu_axi_arregion;
   (* keep *) wire [7:0]                      lsu_axi_arlen;
   (* keep *) wire [2:0]                      lsu_axi_arsize;
   (* keep *) wire [1:0]                      lsu_axi_arburst;
   (* keep *) wire                            lsu_axi_arlock;
   (* keep *) wire [3:0]                      lsu_axi_arcache;
   (* keep *) wire [2:0]                      lsu_axi_arprot;
   (* keep *) wire [3:0]                      lsu_axi_arqos;

   (* keep *) `rvformal_rand_reg                            lsu_axi_rvalid;
   (* keep *) wire                            lsu_axi_rready;
   (* keep *) `rvformal_rand_reg [pt.LSU_BUS_TAG-1:0]       lsu_axi_rid;
   (* keep *) `rvformal_rand_reg [63:0]                     lsu_axi_rdata;
   (* keep *) `rvformal_rand_reg [1:0]                      lsu_axi_rresp;
   (* keep *) `rvformal_rand_reg                            lsu_axi_rlast;

   //-------------------------- IFU AXI signals--------------------------
   // AXI Write Channels
   (* keep *) wire                            ifu_axi_awvalid;
   (* keep *) `rvformal_rand_reg                            ifu_axi_awready;
   (* keep *) wire [pt.IFU_BUS_TAG-1:0]       ifu_axi_awid;
   (* keep *) wire [31:0]                     ifu_axi_awaddr;
   (* keep *) wire [3:0]                      ifu_axi_awregion;
   (* keep *) wire [7:0]                      ifu_axi_awlen;
   (* keep *) wire [2:0]                      ifu_axi_awsize;
   (* keep *) wire [1:0]                      ifu_axi_awburst;
   (* keep *) wire                            ifu_axi_awlock;
   (* keep *) wire [3:0]                      ifu_axi_awcache;
   (* keep *) wire [2:0]                      ifu_axi_awprot;
   (* keep *) wire [3:0]                      ifu_axi_awqos;

   (* keep *) wire                            ifu_axi_wvalid;
   (* keep *) `rvformal_rand_reg                            ifu_axi_wready;
   (* keep *) wire [63:0]                     ifu_axi_wdata;
   (* keep *) wire [7:0]                      ifu_axi_wstrb;
   (* keep *) wire                            ifu_axi_wlast;

   (* keep *) `rvformal_rand_reg                            ifu_axi_bvalid;
   (* keep *) wire                            ifu_axi_bready;
   (* keep *) `rvformal_rand_reg [1:0]                      ifu_axi_bresp;
   (* keep *) `rvformal_rand_reg [pt.IFU_BUS_TAG-1:0]       ifu_axi_bid;

   // AXI Read Channels
   (* keep *) wire                            ifu_axi_arvalid;
   (* keep *) `rvformal_rand_reg                            ifu_axi_arready;
   (* keep *) wire [pt.IFU_BUS_TAG-1:0]       ifu_axi_arid;
   (* keep *) wire [31:0]                     ifu_axi_araddr;
   (* keep *) wire [3:0]                      ifu_axi_arregion;
   (* keep *) wire [7:0]                      ifu_axi_arlen;
   (* keep *) wire [2:0]                      ifu_axi_arsize;
   (* keep *) wire [1:0]                      ifu_axi_arburst;
   (* keep *) wire                            ifu_axi_arlock;
   (* keep *) wire [3:0]                      ifu_axi_arcache;
   (* keep *) wire [2:0]                      ifu_axi_arprot;
   (* keep *) wire [3:0]                      ifu_axi_arqos;

   (* keep *) `rvformal_rand_reg                            ifu_axi_rvalid;
   (* keep *) wire                            ifu_axi_rready;
   (* keep *) `rvformal_rand_reg [pt.IFU_BUS_TAG-1:0]       ifu_axi_rid;
   (* keep *) `rvformal_rand_reg [63:0]                     ifu_axi_rdata;
   (* keep *) `rvformal_rand_reg [1:0]                      ifu_axi_rresp;
   (* keep *) `rvformal_rand_reg                            ifu_axi_rlast;

   //-------------------------- SB AXI signals--------------------------
   // AXI Write Channels
   (* keep *) wire                            sb_axi_awvalid;
   (* keep *) `rvformal_rand_reg                            sb_axi_awready;
   (* keep *) wire [pt.SB_BUS_TAG-1:0]        sb_axi_awid;
   (* keep *) wire [31:0]                     sb_axi_awaddr;
   (* keep *) wire [3:0]                      sb_axi_awregion;
   (* keep *) wire [7:0]                      sb_axi_awlen;
   (* keep *) wire [2:0]                      sb_axi_awsize;
   (* keep *) wire [1:0]                      sb_axi_awburst;
   (* keep *) wire                            sb_axi_awlock;
   (* keep *) wire [3:0]                      sb_axi_awcache;
   (* keep *) wire [2:0]                      sb_axi_awprot;
   (* keep *) wire [3:0]                      sb_axi_awqos;

   (* keep *) wire                            sb_axi_wvalid;
   (* keep *) `rvformal_rand_reg                            sb_axi_wready;
   (* keep *) wire [63:0]                     sb_axi_wdata;
   (* keep *) wire [7:0]                      sb_axi_wstrb;
   (* keep *) wire                            sb_axi_wlast;

   (* keep *) `rvformal_rand_reg                            sb_axi_bvalid;
   (* keep *) wire                            sb_axi_bready;
   (* keep *) `rvformal_rand_reg [1:0]                      sb_axi_bresp;
   (* keep *) `rvformal_rand_reg [pt.SB_BUS_TAG-1:0]        sb_axi_bid;

   // AXI Read Channels
   (* keep *) wire                            sb_axi_arvalid;
   (* keep *) `rvformal_rand_reg                            sb_axi_arready;
   (* keep *) wire [pt.SB_BUS_TAG-1:0]        sb_axi_arid;
   (* keep *) wire [31:0]                     sb_axi_araddr;
   (* keep *) wire [3:0]                      sb_axi_arregion;
   (* keep *) wire [7:0]                      sb_axi_arlen;
   (* keep *) wire [2:0]                      sb_axi_arsize;
   (* keep *) wire [1:0]                      sb_axi_arburst;
   (* keep *) wire                            sb_axi_arlock;
   (* keep *) wire [3:0]                      sb_axi_arcache;
   (* keep *) wire [2:0]                      sb_axi_arprot;
   (* keep *) wire [3:0]                      sb_axi_arqos;

   (* keep *) `rvformal_rand_reg                            sb_axi_rvalid;
   (* keep *) wire                            sb_axi_rready;
   (* keep *) `rvformal_rand_reg [pt.SB_BUS_TAG-1:0]        sb_axi_rid;
   (* keep *) `rvformal_rand_reg [63:0]                     sb_axi_rdata;
   (* keep *) `rvformal_rand_reg [1:0]                      sb_axi_rresp;
   (* keep *) `rvformal_rand_reg                            sb_axi_rlast;

   //-------------------------- DMA AXI signals--------------------------
   // AXI Write Channels
   (* keep *) `rvformal_rand_reg                            dma_axi_awvalid;
   (* keep *) wire                            dma_axi_awready;
   (* keep *) `rvformal_rand_reg [pt.DMA_BUS_TAG-1:0]       dma_axi_awid;
   (* keep *) `rvformal_rand_reg [31:0]                     dma_axi_awaddr;
   (* keep *) `rvformal_rand_reg [2:0]                      dma_axi_awsize;
   (* keep *) `rvformal_rand_reg [2:0]                      dma_axi_awprot;
   (* keep *) `rvformal_rand_reg [7:0]                      dma_axi_awlen;
   (* keep *) `rvformal_rand_reg [1:0]                      dma_axi_awburst;


   (* keep *) `rvformal_rand_reg                            dma_axi_wvalid;
   (* keep *) wire                            dma_axi_wready;
   (* keep *) `rvformal_rand_reg [63:0]                     dma_axi_wdata;
   (* keep *) `rvformal_rand_reg [7:0]                      dma_axi_wstrb;
   (* keep *) `rvformal_rand_reg                            dma_axi_wlast;

   (* keep *) wire                            dma_axi_bvalid;
   (* keep *) `rvformal_rand_reg                            dma_axi_bready;
   (* keep *) wire [1:0]                      dma_axi_bresp;
   (* keep *) wire [pt.DMA_BUS_TAG-1:0]       dma_axi_bid;

   // AXI Read Channels
   (* keep *) `rvformal_rand_reg                            dma_axi_arvalid;
   (* keep *) wire                            dma_axi_arready;
   (* keep *) `rvformal_rand_reg [pt.DMA_BUS_TAG-1:0]       dma_axi_arid;
   (* keep *) `rvformal_rand_reg [31:0]                     dma_axi_araddr;
   (* keep *) `rvformal_rand_reg [2:0]                      dma_axi_arsize;
   (* keep *) `rvformal_rand_reg [2:0]                      dma_axi_arprot;
   (* keep *) `rvformal_rand_reg [7:0]                      dma_axi_arlen;
   (* keep *) `rvformal_rand_reg [1:0]                      dma_axi_arburst;

   (* keep *) wire                            dma_axi_rvalid;
   (* keep *) `rvformal_rand_reg                            dma_axi_rready;
   (* keep *) wire [pt.DMA_BUS_TAG-1:0]       dma_axi_rid;
   (* keep *) wire [63:0]                     dma_axi_rdata;
   (* keep *) wire [1:0]                      dma_axi_rresp;
   (* keep *) wire                            dma_axi_rlast;
`endif



    `ifdef RV_BUILD_AHB_LITE
    (* keep *) wire                            lsu_axi_awvalid;
    (* keep *) wire                            lsu_axi_awready;
    (* keep *) wire [pt.LSU_BUS_TAG-1:0]       lsu_axi_awid;
    (* keep *) wire [31:0]                     lsu_axi_awaddr;
    (* keep *) wire [3:0]                      lsu_axi_awregion;
    (* keep *) wire [7:0]                      lsu_axi_awlen;
    (* keep *) wire [2:0]                      lsu_axi_awsize;
    (* keep *) wire [1:0]                      lsu_axi_awburst;
    (* keep *) wire                            lsu_axi_awlock;
    (* keep *) wire [3:0]                      lsu_axi_awcache;
    (* keep *) wire [2:0]                      lsu_axi_awprot;
    (* keep *) wire [3:0]                      lsu_axi_awqos;

    (* keep *) wire                            lsu_axi_wvalid;
    (* keep *) wire                            lsu_axi_wready;
    (* keep *) wire [63:0]                     lsu_axi_wdata;
    (* keep *) wire [7:0]                      lsu_axi_wstrb;
    (* keep *) wire                            lsu_axi_wlast;

    (* keep *) wire                            lsu_axi_bvalid;
    (* keep *) wire                            lsu_axi_bready;
    (* keep *) wire [1:0]                      lsu_axi_bresp;
    (* keep *) wire [pt.LSU_BUS_TAG-1:0]       lsu_axi_bid;

    // AXI Read Channels
    (* keep *) wire                            lsu_axi_arvalid;
    (* keep *) wire                            lsu_axi_arready;
    (* keep *) wire [pt.LSU_BUS_TAG-1:0]       lsu_axi_arid;
    (* keep *) wire [31:0]                     lsu_axi_araddr;
    (* keep *) wire [3:0]                      lsu_axi_arregion;
    (* keep *) wire [7:0]                      lsu_axi_arlen;
    (* keep *) wire [2:0]                      lsu_axi_arsize;
    (* keep *) wire [1:0]                      lsu_axi_arburst;
    (* keep *) wire                            lsu_axi_arlock;
    (* keep *) wire [3:0]                      lsu_axi_arcache;
    (* keep *) wire [2:0]                      lsu_axi_arprot;
    (* keep *) wire [3:0]                      lsu_axi_arqos;

    (* keep *) wire                            lsu_axi_rvalid;
    (* keep *) wire                            lsu_axi_rready;
    (* keep *) wire [pt.LSU_BUS_TAG-1:0]       lsu_axi_rid;
    (* keep *) wire [63:0]                     lsu_axi_rdata;
    (* keep *) wire [1:0]                      lsu_axi_rresp;
    (* keep *) wire                            lsu_axi_rlast;

    //-------------------------- IFU AXI signals--------------------------
    // AXI Write Channels
    (* keep *) wire                            ifu_axi_awvalid;
    (* keep *) wire                            ifu_axi_awready;
    (* keep *) wire [pt.IFU_BUS_TAG-1:0]       ifu_axi_awid;
    (* keep *) wire [31:0]                     ifu_axi_awaddr;
    (* keep *) wire [3:0]                      ifu_axi_awregion;
    (* keep *) wire [7:0]                      ifu_axi_awlen;
    (* keep *) wire [2:0]                      ifu_axi_awsize;
    (* keep *) wire [1:0]                      ifu_axi_awburst;
    (* keep *) wire                            ifu_axi_awlock;
    (* keep *) wire [3:0]                      ifu_axi_awcache;
    (* keep *) wire [2:0]                      ifu_axi_awprot;
    (* keep *) wire [3:0]                      ifu_axi_awqos;

    (* keep *) wire                            ifu_axi_wvalid;
    (* keep *) wire                            ifu_axi_wready;
    (* keep *) wire [63:0]                     ifu_axi_wdata;
    (* keep *) wire [7:0]                      ifu_axi_wstrb;
    (* keep *) wire                            ifu_axi_wlast;

    (* keep *) wire                            ifu_axi_bvalid;
    (* keep *) wire                            ifu_axi_bready;
    (* keep *) wire [1:0]                      ifu_axi_bresp;
    (* keep *) wire [pt.IFU_BUS_TAG-1:0]      ifu_axi_bid;

    // AXI Read Channels
    (* keep *) wire                            ifu_axi_arvalid;
    (* keep *) wire                            ifu_axi_arready;
    (* keep *) wire [pt.IFU_BUS_TAG-1:0]       ifu_axi_arid;
    (* keep *) wire [31:0]                     ifu_axi_araddr;
    (* keep *) wire [3:0]                      ifu_axi_arregion;
    (* keep *) wire [7:0]                      ifu_axi_arlen;
    (* keep *) wire [2:0]                      ifu_axi_arsize;
    (* keep *) wire [1:0]                      ifu_axi_arburst;
    (* keep *) wire                            ifu_axi_arlock;
    (* keep *) wire [3:0]                      ifu_axi_arcache;
    (* keep *) wire [2:0]                      ifu_axi_arprot;
    (* keep *) wire [3:0]                      ifu_axi_arqos;

    (* keep *) wire                            ifu_axi_rvalid;
    (* keep *) wire                            ifu_axi_rready;
    (* keep *) wire [pt.IFU_BUS_TAG-1:0]       ifu_axi_rid;
    (* keep *) wire [63:0]                     ifu_axi_rdata;
    (* keep *) wire [1:0]                      ifu_axi_rresp;
    (* keep *) wire                            ifu_axi_rlast;

    //-------------------------- SB AXI signals--------------------------
    // AXI Write Channels
    (* keep *) wire                            sb_axi_awvalid;
    (* keep *) wire                            sb_axi_awready;
    (* keep *) wire [pt.SB_BUS_TAG-1:0]        sb_axi_awid;
    (* keep *) wire [31:0]                     sb_axi_awaddr;
    (* keep *) wire [3:0]                      sb_axi_awregion;
    (* keep *) wire [7:0]                      sb_axi_awlen;
    (* keep *) wire [2:0]                      sb_axi_awsize;
    (* keep *) wire [1:0]                      sb_axi_awburst;
    (* keep *) wire                            sb_axi_awlock;
    (* keep *) wire [3:0]                      sb_axi_awcache;
    (* keep *) wire [2:0]                      sb_axi_awprot;
    (* keep *) wire [3:0]                      sb_axi_awqos;

    (* keep *) wire                            sb_axi_wvalid;
    (* keep *) wire                            sb_axi_wready;
    (* keep *) wire [63:0]                     sb_axi_wdata;
    (* keep *) wire [7:0]                      sb_axi_wstrb;
    (* keep *) wire                            sb_axi_wlast;

    (* keep *) wire                            sb_axi_bvalid;
    (* keep *) wire                            sb_axi_bready;
    (* keep *) wire [1:0]                      sb_axi_bresp;
    (* keep *) wire [pt.SB_BUS_TAG-1:0]        sb_axi_bid;

    // AXI Read Channels
    (* keep *) wire                            sb_axi_arvalid;
    (* keep *) wire                            sb_axi_arready;
    (* keep *) wire [pt.SB_BUS_TAG-1:0]        sb_axi_arid;
    (* keep *) wire [31:0]                     sb_axi_araddr;
    (* keep *) wire [3:0]                      sb_axi_arregion;
    (* keep *) wire [7:0]                      sb_axi_arlen;
    (* keep *) wire [2:0]                      sb_axi_arsize;
    (* keep *) wire [1:0]                      sb_axi_arburst;
    (* keep *) wire                            sb_axi_arlock;
    (* keep *) wire [3:0]                      sb_axi_arcache;
    (* keep *) wire [2:0]                      sb_axi_arprot;
    (* keep *) wire [3:0]                      sb_axi_arqos;

    (* keep *) wire                            sb_axi_rvalid;
    (* keep *) wire                            sb_axi_rready;
    (* keep *) wire [pt.SB_BUS_TAG-1:0]        sb_axi_rid;
    (* keep *) wire [63:0]                     sb_axi_rdata;
    (* keep *) wire [1:0]                      sb_axi_rresp;
    (* keep *) wire                            sb_axi_rlast;

    //-------------------------- DMA AXI signals--------------------------
    // AXI Write Channels
    (* keep *) wire                         dma_axi_awvalid;
    (* keep *) wire                         dma_axi_awready;
    (* keep *) wire [pt.DMA_BUS_TAG-1:0]    dma_axi_awid;
    (* keep *) wire [31:0]                  dma_axi_awaddr;
    (* keep *) wire [2:0]                   dma_axi_awsize;
    (* keep *) wire [2:0]                   dma_axi_awprot;
    (* keep *) wire [7:0]                   dma_axi_awlen;
    (* keep *) wire [1:0]                   dma_axi_awburst;


    (* keep *) wire                         dma_axi_wvalid;
    (* keep *) wire                         dma_axi_wready;
    (* keep *) wire [63:0]                  dma_axi_wdata;
    (* keep *) wire [7:0]                   dma_axi_wstrb;
    (* keep *) wire                         dma_axi_wlast;

    (* keep *) wire                         dma_axi_bvalid;
    (* keep *) wire                         dma_axi_bready;
    (* keep *) wire [1:0]                   dma_axi_bresp;
    (* keep *) wire [pt.DMA_BUS_TAG-1:0]    dma_axi_bid;

    // AXI Read Channels
    (* keep *) wire                         dma_axi_arvalid;
    (* keep *) wire                         dma_axi_arready;
    (* keep *) wire [pt.DMA_BUS_TAG-1:0]    dma_axi_arid;
    (* keep *) wire [31:0]                  dma_axi_araddr;
    (* keep *) wire [2:0]                   dma_axi_arsize;
    (* keep *) wire [2:0]                   dma_axi_arprot;
    (* keep *) wire [7:0]                   dma_axi_arlen;
    (* keep *) wire [1:0]                   dma_axi_arburst;

    (* keep *) wire                         dma_axi_rvalid;
    (* keep *) wire                         dma_axi_rready;
    (* keep *) wire [pt.DMA_BUS_TAG-1:0]    dma_axi_rid;
    (* keep *) wire [63:0]                  dma_axi_rdata;
    (* keep *) wire [1:0]                   dma_axi_rresp;
    (* keep *) wire                         dma_axi_rlast;

    // AXI
    assign ifu_axi_awready = 1'b1;
    assign ifu_axi_wready = 1'b1;
    assign ifu_axi_bvalid = '0;
    assign ifu_axi_bresp[1:0] = '0;
    assign ifu_axi_bid[pt.IFU_BUS_TAG-1:0] = '0;

    `endif //  `ifdef RV_BUILD_AHB_LITE

    `ifdef RV_BUILD_AHB_LITE
 //// AHB LITE BUS
   (* keep *) wire [31:0]                     haddr;
   (* keep *) wire [2:0]                      hburst;
   (* keep *) wire                            hmastlock;
   (* keep *) wire [3:0]                      hprot;
   (* keep *) wire [2:0]                      hsize;
   (* keep *) wire [1:0]                      htrans;
   (* keep *) wire                            hwrite;

   (* keep *) `rvformal_rand_reg [63:0]                      hrdata;
   (* keep *) `rvformal_rand_reg                             hready;
   (* keep *) `rvformal_rand_reg                             hresp;

   // LSU AHB Master
   (* keep *) wire [31:0]                     lsu_haddr;
   (* keep *) wire [2:0]                      lsu_hburst;
   (* keep *) wire                            lsu_hmastlock;
   (* keep *) wire [3:0]                      lsu_hprot;
   (* keep *) wire [2:0]                      lsu_hsize;
   (* keep *) wire [1:0]                      lsu_htrans;
   (* keep *) wire                            lsu_hwrite;
   (* keep *) wire [63:0]                     lsu_hwdata;

   (* keep *) `rvformal_rand_reg [63:0]                      lsu_hrdata;
   (* keep *) `rvformal_rand_reg                             lsu_hready;
   (* keep *) `rvformal_rand_reg                             lsu_hresp;
   // System Bus Debug Master
   (* keep *) wire [31:0]                     sb_haddr;
   (* keep *) wire [2:0]                      sb_hburst;
   (* keep *) wire                            sb_hmastlock;
   (* keep *) wire [3:0]                      sb_hprot;
   (* keep *) wire [2:0]                      sb_hsize;
   (* keep *) wire [1:0]                      sb_htrans;
   (* keep *) wire                            sb_hwrite;
   (* keep *) wire [63:0]                     sb_hwdata;

    (* keep *) `rvformal_rand_reg [63:0]                     sb_hrdata;
    (* keep *) `rvformal_rand_reg                            sb_hready;
    (* keep *) `rvformal_rand_reg                            sb_hresp;

   // DMA Slave
   (* keep *) `rvformal_rand_reg                             dma_hsel;
   (* keep *) `rvformal_rand_reg [31:0]                      dma_haddr;
   (* keep *) `rvformal_rand_reg [2:0]                       dma_hburst;
   (* keep *) `rvformal_rand_reg                             dma_hmastlock;
   (* keep *) `rvformal_rand_reg [3:0]                       dma_hprot;
   (* keep *) `rvformal_rand_reg [2:0]                       dma_hsize;
   (* keep *) `rvformal_rand_reg [1:0]                       dma_htrans;
   (* keep *) `rvformal_rand_reg                             dma_hwrite;
   (* keep *) `rvformal_rand_reg [63:0]                      dma_hwdata;
   (* keep *) `rvformal_rand_reg                             dma_hreadyin;

   (* keep *) wire [63:0]                     dma_hrdata;
   (* keep *) wire                            dma_hreadyout;
   (* keep *) wire                            dma_hresp;
`endif


    // DMI (core)
    (* keep *) wire                   dmi_en;
    (* keep *) wire [6:0]             dmi_addr;
    (* keep *) wire                   dmi_wr_en;
    (* keep *) wire [31:0]            dmi_wdata;
    (* keep *) wire [31:0]            dmi_rdata;

    // DMI (core)
    (* keep *) `rvformal_rand_reg                   dmi_reg_en;
    (* keep *) `rvformal_rand_reg [6:0]             dmi_reg_addr;
    (* keep *) `rvformal_rand_reg                   dmi_reg_wr_en;
    (* keep *) `rvformal_rand_reg [31:0]            dmi_reg_wdata;
    (* keep *) wire [31:0]            dmi_reg_rdata;

	el2_veer #(.pt(pt)) uut (
		.clk      ( clock),
		.rst_l    (!reset),
		.dbg_rst_l(!reset),
        .rst_vec  (rst_vec[31:1]),
        .nmi_vec  (nmi_vec[31:1]),
        .*,

		`RVFI_CONN
        
        // .dbg_rst_l,
        // .rst_vec,
        // .nmi_int,
        // .nmi_vec,
        // .core_rst_l,

        // .active_l2clk,
        // .free_l2clk,

        // .trace_rv_i_insn_ip,
        // .trace_rv_i_address_ip,
        // .trace_rv_i_valid_ip,
        // .trace_rv_i_exception_ip,
        // .trace_rv_i_ecause_ip,
        // .trace_rv_i_interrupt_ip,
        // .trace_rv_i_tval_ip,


        // .dccm_clk_override,
        // .icm_clk_override,
        // .dec_tlu_core_ecc_disable,

        // // external halt/run interface
        // .i_cpu_halt_req, // Asynchronous Halt request to CPU
        // .i_cpu_run_req,// Asynchronous Restart request to CPU
        // .o_cpu_halt_ack, // Core Acknowledge to Halt request
        // .o_cpu_halt_status, // 1'b1 indicates processor is halted
        // .o_cpu_run_ack,// Core Acknowledge to run request
        // .o_debug_mode_status, // Core to the PMU that core is in debug mode. When core is in debug mode, the PMU should refrain from sendng a halt or run request

        // .core_id, // CORE ID

        // // external MPC halt/run interface
        // .mpc_debug_halt_req, // Async halt request
        // .mpc_debug_run_req, // Async run request
        // .mpc_reset_run_req, // Run/halt after reset
        // .mpc_debug_halt_ack, // Halt ack
        // .mpc_debug_run_ack, // Run ack
        // .debug_brkpt_status, // debug breakpoint

        // .dec_tlu_perfcnt0, // toggles when slot0 perf counter 0 has an event inc
        // .dec_tlu_perfcnt1,
        // .dec_tlu_perfcnt2,
        // .dec_tlu_perfcnt3,

        // // DCCM ports
        // .dccm_wren,
        // .dccm_rden,
        // .dccm_wr_addr_lo,
        // .dccm_wr_addr_hi,
        // .dccm_rd_addr_lo,
        // .dccm_rd_addr_hi,
        // .dccm_wr_data_lo,
        // .dccm_wr_data_hi,

        // .dccm_rd_data_lo,
        // .dccm_rd_data_hi,

        // // ICCM ports
        // .iccm_rw_addr,
        // .iccm_wren,
        // .iccm_rden,
        // .iccm_wr_size,
        // .iccm_wr_data,
        // .iccm_buf_correct_ecc,
        // .iccm_correction_state,

        // .iccm_rd_data,
        // .iccm_rd_data_ecc,

        // // ICache , ITAG  ports
        // .ic_rw_addr,
        // .ic_tag_valid,
        // .ic_wr_en,
        // .ic_rd_en,

        // .ic_wr_data, // Data to fill to the Icache. With ECC
        // .ic_rd_data ,// Data read from Icache. 2x64bits + parity bits. F2 stage. With ECC
        // .ic_debug_rd_data ,// Data read from Icache. 2x64bits + parity bits. F2 stage. With ECC
        // .ictag_debug_rd_data,// Debug icache tag.
        // .ic_debug_wr_data,// Debug wr cache.

        // .ic_eccerr,
        // .ic_parerr,
        // .ic_premux_data,// Premux data to be muxed with each way of the Icache.
        // .ic_sel_premux_data, // Select premux data


        // .ic_debug_addr, // Read/Write addresss to the Icache.
        // .ic_debug_rd_en,// Icache debug rd
        // .ic_debug_wr_en,// Icache debug wr
        // .ic_debug_tag_array, // Debug tag array
        // .ic_debug_way,  // Debug way. Rd or Wr.



        // .ic_rd_hit,
        // .ic_tag_perr,// Icache Tag parity error

        // //-------------------------- LSU AXI signals--------------------------
        // // AXI Write Channels
        // .lsu_axi_awvalid,
        // .lsu_axi_awready,
        // .lsu_axi_awid,
        // .lsu_axi_awaddr,
        // .lsu_axi_awregion,
        // .lsu_axi_awlen,
        // .lsu_axi_awsize,
        // .lsu_axi_awburst,
        // .lsu_axi_awlock,
        // .lsu_axi_awcache,
        // .lsu_axi_awprot,
        // .lsu_axi_awqos,

        // .lsu_axi_wvalid,
        // .lsu_axi_wready,
        // .lsu_axi_wdata,
        // .lsu_axi_wstrb,
        // .lsu_axi_wlast,

        // .lsu_axi_bvalid,
        // .lsu_axi_bready,
        // .lsu_axi_bresp,
        // .lsu_axi_bid,

        // // AXI Read Channels
        // .lsu_axi_arvalid,
        // .lsu_axi_arready,
        // .lsu_axi_arid,
        // .lsu_axi_araddr,
        // .lsu_axi_arregion,
        // .lsu_axi_arlen,
        // .lsu_axi_arsize,
        // .lsu_axi_arburst,
        // .lsu_axi_arlock,
        // .lsu_axi_arcache,
        // .lsu_axi_arprot,
        // .lsu_axi_arqos,

        // .lsu_axi_rvalid,
        // .lsu_axi_rready,
        // .lsu_axi_rid,
        // .lsu_axi_rdata,
        // .lsu_axi_rresp,
        // .lsu_axi_rlast,

        // //-------------------------- IFU AXI signals--------------------------
        // // AXI Write Channels
        // .ifu_axi_awvalid,
        // .ifu_axi_awready,
        // .ifu_axi_awid,
        // .ifu_axi_awaddr,
        // .ifu_axi_awregion,
        // .ifu_axi_awlen,
        // .ifu_axi_awsize,
        // .ifu_axi_awburst,
        // .ifu_axi_awlock,
        // .ifu_axi_awcache,
        // .ifu_axi_awprot,
        // .ifu_axi_awqos,

        // .ifu_axi_wvalid,
        // .ifu_axi_wready,
        // .ifu_axi_wdata,
        // .ifu_axi_wstrb,
        // .ifu_axi_wlast,

        // .ifu_axi_bvalid,
        // .ifu_axi_bready,
        // .ifu_axi_bresp,
        // .ifu_axi_bid,

        // // AXI Read Channels
        // .ifu_axi_arvalid,
        // .ifu_axi_arready,
        // .ifu_axi_arid,
        // .ifu_axi_araddr,
        // .ifu_axi_arregion,
        // .ifu_axi_arlen,
        // .ifu_axi_arsize,
        // .ifu_axi_arburst,
        // .ifu_axi_arlock,
        // .ifu_axi_arcache,
        // .ifu_axi_arprot,
        // .ifu_axi_arqos,

        // .ifu_axi_rvalid,
        // .ifu_axi_rready,
        // .ifu_axi_rid,
        // .ifu_axi_rdata,
        // .ifu_axi_rresp,
        // .ifu_axi_rlast,

        // //-------------------------- SB AXI signals--------------------------
        // // AXI Write Channels
        // .sb_axi_awvalid,
        // .sb_axi_awready,
        // .sb_axi_awid,
        // .sb_axi_awaddr,
        // .sb_axi_awregion,
        // .sb_axi_awlen,
        // .sb_axi_awsize,
        // .sb_axi_awburst,
        // .sb_axi_awlock,
        // .sb_axi_awcache,
        // .sb_axi_awprot,
        // .sb_axi_awqos,

        // .sb_axi_wvalid,
        // .sb_axi_wready,
        // .sb_axi_wdata,
        // .sb_axi_wstrb,
        // .sb_axi_wlast,

        // .sb_axi_bvalid,
        // .sb_axi_bready,
        // .sb_axi_bresp,
        // .sb_axi_bid,

        // // AXI Read Channels
        // .sb_axi_arvalid,
        // .sb_axi_arready,
        // .sb_axi_arid,
        // .sb_axi_araddr,
        // .sb_axi_arregion,
        // .sb_axi_arlen,
        // .sb_axi_arsize,
        // .sb_axi_arburst,
        // .sb_axi_arlock,
        // .sb_axi_arcache,
        // .sb_axi_arprot,
        // .sb_axi_arqos,

        // .sb_axi_rvalid,
        // .sb_axi_rready,
        // .sb_axi_rid,
        // .sb_axi_rdata,
        // .sb_axi_rresp,
        // .sb_axi_rlast,

        // //-------------------------- DMA AXI signals--------------------------
        // // AXI Write Channels
        // .dma_axi_awvalid,
        // .dma_axi_awready,
        // .dma_axi_awid,
        // .dma_axi_awaddr,
        // .dma_axi_awsize,
        // .dma_axi_awprot,
        // .dma_axi_awlen,
        // .dma_axi_awburst,


        // .dma_axi_wvalid,
        // .dma_axi_wready,
        // .dma_axi_wdata,
        // .dma_axi_wstrb,
        // .dma_axi_wlast,

        // .dma_axi_bvalid,
        // .dma_axi_bready,
        // .dma_axi_bresp,
        // .dma_axi_bid,

        // // AXI Read Channels
        // .dma_axi_arvalid,
        // .dma_axi_arready,
        // .dma_axi_arid,
        // .dma_axi_araddr,
        // .dma_axi_arsize,
        // .dma_axi_arprot,
        // .dma_axi_arlen,
        // .dma_axi_arburst,

        // .dma_axi_rvalid,
        // .dma_axi_rready,
        // .dma_axi_rid,
        // .dma_axi_rdata,
        // .dma_axi_rresp,
        // .dma_axi_rlast,


        // //// AHB LITE BUS
        // .haddr,
        // .hburst,
        // .hmastlock,
        // .hprot,
        // .hsize,
        // .htrans,
        // .hwrite,

        // .hrdata,
        // .hready,
        // .hresp,

        // // LSU AHB Master
        // .lsu_haddr,
        // .lsu_hburst,
        // .lsu_hmastlock,
        // .lsu_hprot,
        // .lsu_hsize,
        // .lsu_htrans,
        // .lsu_hwrite,
        // .lsu_hwdata,

        // .lsu_hrdata,
        // .lsu_hready,
        // .lsu_hresp,

        // //System Bus Debug Master
        // .sb_haddr,
        // .sb_hburst,
        // .sb_hmastlock,
        // .sb_hprot,
        // .sb_hsize,
        // .sb_htrans,
        // .sb_hwrite,
        // .sb_hwdata,

        // .sb_hrdata,
        // .sb_hready,
        // .sb_hresp,

        // // DMA Slave
        // .dma_hsel,
        // .dma_haddr,
        // .dma_hburst,
        // .dma_hmastlock,
        // .dma_hprot,
        // .dma_hsize,
        // .dma_htrans,
        // .dma_hwrite,
        // .dma_hwdata,
        // .dma_hreadyin,

        // .dma_hrdata,
        // .dma_hreadyout,
        // .dma_hresp,

        // .lsu_bus_clk_en,
        // .ifu_bus_clk_en,
        // .dbg_bus_clk_en,
        // .dma_bus_clk_en,

        // .dmi_reg_en,// read or write
        // .dmi_reg_addr, // address of DM register
        // .dmi_reg_wr_en,// write instruction
        // .dmi_reg_wdata,// write data
        // .dmi_reg_rdata,

        // // ICCM/DCCM ECC status
        // .iccm_ecc_single_error,
        // .iccm_ecc_double_error,
        // .dccm_ecc_single_error,
        // .dccm_ecc_double_error,

        // .extintsrc_req,
        // .timer_int,
        // .soft_int,
        // .scan_mode
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

