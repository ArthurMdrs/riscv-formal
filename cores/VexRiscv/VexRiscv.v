// Generator : SpinalHDL v0.10.15    git head : b2cc963be712aa10e43c07c8c2d261d3433a28ef
// Date      : 05/11/2017, 14:08:05
// Component : VexRiscv


`define AluCtrlEnum_binary_sequancial_type [1:0]
`define AluCtrlEnum_binary_sequancial_ADD_SUB 'b00
`define AluCtrlEnum_binary_sequancial_SLT_SLTU 'b01
`define AluCtrlEnum_binary_sequancial_BITWISE 'b10

`define Src1CtrlEnum_binary_sequancial_type [1:0]
`define Src1CtrlEnum_binary_sequancial_RS 'b00
`define Src1CtrlEnum_binary_sequancial_IMU 'b01
`define Src1CtrlEnum_binary_sequancial_FOUR 'b10

`define Src2CtrlEnum_binary_sequancial_type [1:0]
`define Src2CtrlEnum_binary_sequancial_RS 'b00
`define Src2CtrlEnum_binary_sequancial_IMI 'b01
`define Src2CtrlEnum_binary_sequancial_IMS 'b10
`define Src2CtrlEnum_binary_sequancial_PC 'b11

`define ShiftCtrlEnum_binary_sequancial_type [1:0]
`define ShiftCtrlEnum_binary_sequancial_DISABLE_1 'b00
`define ShiftCtrlEnum_binary_sequancial_SLL_1 'b01
`define ShiftCtrlEnum_binary_sequancial_SRL_1 'b10
`define ShiftCtrlEnum_binary_sequancial_SRA_1 'b11

`define BranchCtrlEnum_binary_sequancial_type [1:0]
`define BranchCtrlEnum_binary_sequancial_INC 'b00
`define BranchCtrlEnum_binary_sequancial_B 'b01
`define BranchCtrlEnum_binary_sequancial_JAL 'b10
`define BranchCtrlEnum_binary_sequancial_JALR 'b11

`define AluBitwiseCtrlEnum_binary_sequancial_type [1:0]
`define AluBitwiseCtrlEnum_binary_sequancial_XOR_1 'b00
`define AluBitwiseCtrlEnum_binary_sequancial_OR_1 'b01
`define AluBitwiseCtrlEnum_binary_sequancial_AND_1 'b10
`define AluBitwiseCtrlEnum_binary_sequancial_SRC1 'b11

module VexRiscv
( 
  output reg  rvfi_valid,
  output [63:0] rvfi_order,
  output [31:0] rvfi_insn,
  output reg  rvfi_trap,
  output reg  rvfi_halt,
  output  rvfi_intr,
  output [4:0] rvfi_rs1_addr,
  output [31:0] rvfi_rs1_rdata,
  output [4:0] rvfi_rs2_addr,
  output [31:0] rvfi_rs2_rdata,
  output [4:0] rvfi_rd_addr,
  output [31:0] rvfi_rd_wdata,
  output [31:0] rvfi_pc_rdata,
  output [31:0] rvfi_pc_wdata,
  output [31:0] rvfi_mem_addr,
  output [3:0] rvfi_mem_rmask,
  output [3:0] rvfi_mem_wmask,
  output [31:0] rvfi_mem_rdata,
  output [31:0] rvfi_mem_wdata,
  output  iBus_cmd_valid,
  input   iBus_cmd_ready,
  output [31:0] iBus_cmd_payload_pc,
  input   iBus_rsp_ready,
  input   iBus_rsp_error,
  input  [31:0] iBus_rsp_inst,
  output  dBus_cmd_valid,
  input   dBus_cmd_ready,
  output  dBus_cmd_payload_wr,
  output [31:0] dBus_cmd_payload_address,
  output [31:0] dBus_cmd_payload_data,
  output [1:0] dBus_cmd_payload_size,
  input   dBus_rsp_ready,
  input   dBus_rsp_error,
  input  [31:0] dBus_rsp_data,
  input   clk,
  input   reset 
);

  reg  prefetch_arbitration_haltItself;
  wire  prefetch_arbitration_haltByOther;
  wire  prefetch_arbitration_removeIt;
  wire  _1;
  reg  prefetch_arbitration_isValid;
  wire  prefetch_arbitration_isStuck;
  wire  prefetch_arbitration_isStuckByOthers;
  wire  prefetch_arbitration_isFiring;
  reg  fetch_arbitration_haltItself;
  wire  fetch_arbitration_haltByOther;
  reg  fetch_arbitration_removeIt;
  wire  fetch_arbitration_flushAll;
  wire  _2;
  reg  fetch_arbitration_isValid;
  wire  fetch_arbitration_isStuck;
  wire  fetch_arbitration_isStuckByOthers;
  wire  fetch_arbitration_isFlushed;
  reg  decode_arbitration_haltItself/* verilator public */ ;
  wire  decode_arbitration_haltByOther;
  reg  decode_arbitration_removeIt;
  wire  decode_arbitration_flushAll;
  wire  _3;
  reg  decode_arbitration_isValid/* verilator public */ ;
  wire  decode_arbitration_isStuck;
  wire  decode_arbitration_isStuckByOthers;
  wire  decode_arbitration_isFlushed;
  reg  execute_arbitration_haltItself;
  wire  execute_arbitration_haltByOther;
  reg  execute_arbitration_removeIt;
  reg  execute_arbitration_flushAll;
  wire  _4;
  reg  execute_arbitration_isValid;
  wire  execute_arbitration_isStuck;
  wire  execute_arbitration_isStuckByOthers;
  wire  execute_arbitration_isFlushed;
  reg  memory_arbitration_haltItself;
  wire  memory_arbitration_haltByOther;
  reg  memory_arbitration_removeIt;
  wire  memory_arbitration_flushAll;
  wire  _5;
  reg  memory_arbitration_isValid;
  wire  memory_arbitration_isStuck;
  wire  memory_arbitration_isStuckByOthers;
  wire  memory_arbitration_isFlushed;
  wire  memory_arbitration_isFiring;
  wire  writeBack_arbitration_haltItself;
  wire  writeBack_arbitration_haltByOther;
  reg  writeBack_arbitration_removeIt;
  wire  writeBack_arbitration_flushAll;
  wire  _6;
  reg  writeBack_arbitration_isValid/* verilator public */ ;
  wire  writeBack_arbitration_isStuck;
  wire  writeBack_arbitration_isStuckByOthers;
  wire  writeBack_arbitration_isFlushed;
  wire  writeBack_arbitration_isFiring/* verilator public */ ;
  reg [31:0] decode_INSTRUCTION/* verilator public */ ;
  wire [31:0] decode_PC/* verilator public */ ;
  reg [31:0] writeBack_INSTRUCTION/* verilator public */ ;
  wire [31:0] writeBack_PC/* verilator public */ ;
  wire  decodeExceptionPort_valid;
  wire  _7;
  wire [31:0] _8;
  wire  _9;
  reg [63:0] writeBack_FomalPlugin_order;
  wire [63:0] _10;
  wire [31:0] _11;
  wire  _12;
  wire  _13;
  wire  _14;
  wire  _15;
  wire [4:0] _16;
  wire [4:0] _17;
  wire  _18;
  wire [4:0] _19;
  wire [4:0] _20;
  wire  _21;
  wire [4:0] _22;
  wire [4:0] _23;
  reg [31:0] _24;
  reg  writeBack_FomalPlugin_haltRequest;
  wire  _25;
  wire  _26;
  wire  _27;
  wire  _28;
  wire  _29;
  wire  _30;
  wire  _31;
  reg  _32;
  wire  _33;
  wire  _34;
  wire  _35;
  wire  _36;
  wire  _37;
  reg  _38;
  wire  _39;
  wire  _40;
  wire  _41;
  wire  _42;
  reg  _43;
  reg  _44;
  reg  _45;
  reg  _46;
  reg  _47;
  wire  _48;
  wire  _49;
  wire  _50;
  wire  _51;
  wire  _52;
  wire  _53;
  wire  _54;
  wire  _55;
  wire  _56;
  wire  _57;
  wire  _58;
  reg [31:0] prefetch_PcManagerSimplePlugin_pcReg/* verilator public */ ;
  wire  _59;
  reg  prefetch_PcManagerSimplePlugin_inc;
  wire [1:0] _60;
  wire [2:0] _61;
  wire [31:0] prefetch_PcManagerSimplePlugin_pcBeforeJumps;
  reg [31:0] prefetch_PcManagerSimplePlugin_pc;
  wire [31:0] prefetch_PC_CALC_WITHOUT_JUMP;
  reg  prefetch_PcManagerSimplePlugin_samplePcNext;
  wire  prefetch_PcManagerSimplePlugin_jump_pcLoad_valid;
  wire [31:0] prefetch_PcManagerSimplePlugin_jump_pcLoad_payload;
  wire  _62;
  wire  _63;
  wire  _64;
  wire  _65;
  wire  _66;
  wire [31:0] prefetch_PC;
  wire [31:0] _67;
  reg [31:0] _68;
  wire  _69;
  reg  prefetch_IBusSimplePlugin_pendingCmd;
  wire  _70;
  wire  _71;
  wire [31:0] _72;
  wire  _73;
  wire  _74;
  wire  _75;
  reg  _76;
  wire  _77;
  wire  _78;
  reg [31:0] _79;
  reg [31:0] _80;
  wire  _81;
  wire  _82;
  wire [31:0] _83;
  wire  _84;
  wire  _85;
  reg  execute_MEMORY_ENABLE;
  wire  execute_ALIGNEMENT_FAULT;
  reg [31:0] execute_INSTRUCTION;
  wire [31:0] execute_SRC_ADD;
  wire [31:0] _86;
  wire [1:0] _87;
  reg [31:0] execute_RS2;
  reg [31:0] _88;
  wire  _89;
  wire  _90;
  wire [1:0] _91;
  wire [3:0] _92;
  wire [3:0] _93;
  wire [3:0] _94;
  reg [3:0] execute_DBusSimplePlugin_formalMask;
  wire [3:0] _95;
  wire [3:0] _96;
  reg  memory_MEMORY_ENABLE;
  reg [31:0] memory_INSTRUCTION;
  wire  _97;
  wire  _98;
  reg [31:0] writeBack_DBusSimplePlugin_rspShifted;
  reg [31:0] writeBack_MEMORY_READ_DATA;
  wire [1:0] writeBack_MEMORY_ADDRESS_LOW;
  wire [1:0] _99;
  wire [1:0] _100;
  wire [1:0] _101;
  wire  _102;
  reg [31:0] _103;
  wire  _104;
  reg [31:0] _105;
  reg [31:0] writeBack_DBusSimplePlugin_rspFormated;
  reg  writeBack_MEMORY_ENABLE;
  wire  _106;
  wire [19:0] _107;
  wire  _108;
  wire  _109;
  wire  _110;
  wire  _111;
  wire  _112;
  wire  _113;
  wire  _114;
  wire  _115;
  wire  _116;
  wire [31:0] _117;
  wire [31:0] _118;
  wire [31:0] _119;
  wire [31:0] _120;
  wire [31:0] _121;
  wire [0:0] _122;
  wire [0:0] _123;
  wire [0:0] _124;
  wire [0:0] _125;
  wire [0:0] _126;
  wire [0:0] _127;
  wire [0:0] _128;
  wire [0:0] _129;
  wire  decode_INSTRUCTION_READY;
  wire  decode_LEGAL_INSTRUCTION;
  reg [31:0] RegFilePlugin_regFile [0:31]/* verilator public */ ;
  reg  decode_REGFILE_WRITE_VALID;
  wire  _130;
  wire [31:0] decode_INSTRUCTION_ANTICIPATED;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress1;
  wire [4:0] decode_RegFilePlugin_regFileReadAddress2;
  wire [31:0] decode_RegFilePlugin_rs1Data;
  reg [31:0] RegFilePlugin_regFile_port0_data;
  wire [4:0] RegFilePlugin_regFile_port0_address;
  wire  RegFilePlugin_regFile_port0_enable;
  wire  _131;
  wire [31:0] decode_RegFilePlugin_rs2Data;
  reg [31:0] RegFilePlugin_regFile_port1_data;
  wire [4:0] RegFilePlugin_regFile_port1_address;
  wire  RegFilePlugin_regFile_port1_enable;
  wire  _132;
  reg  writeBack_RegFilePlugin_regFileWrite_valid/* verilator public */ ;
  wire [4:0] writeBack_RegFilePlugin_regFileWrite_payload_address/* verilator public */ ;
  wire [31:0] writeBack_RegFilePlugin_regFileWrite_payload_data/* verilator public */ ;
  wire [4:0] RegFilePlugin_regFile_port2_address;
  wire [31:0] RegFilePlugin_regFile_port2_data;
  wire  RegFilePlugin_regFile_port2_enable;
  wire [4:0] _133;
  wire  _134;
  reg  _135;
  wire  _136;
  wire  _137;
  reg `AluBitwiseCtrlEnum_binary_sequancial_type execute_ALU_BITWISE_CTRL;
  reg [31:0] execute_SRC1;
  reg [31:0] execute_SRC2;
  reg [31:0] execute_IntAluPlugin_bitwise;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type _138;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type _139;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type _140;
  reg `AluCtrlEnum_binary_sequancial_type execute_ALU_CTRL;
  wire  execute_SRC_LESS;
  wire [31:0] _141;
  wire [31:0] execute_SRC_ADD_SUB;
  reg [31:0] _142;
  wire `AluCtrlEnum_binary_sequancial_type _143;
  wire `AluCtrlEnum_binary_sequancial_type _144;
  wire `Src1CtrlEnum_binary_sequancial_type decode_SRC1_CTRL;
  wire [31:0] _145;
  wire [11:0] _146;
  reg [31:0] _147;
  wire `Src1CtrlEnum_binary_sequancial_type _148;
  wire `Src1CtrlEnum_binary_sequancial_type _149;
  wire `Src2CtrlEnum_binary_sequancial_type decode_SRC2_CTRL;
  wire [31:0] _150;
  wire [11:0] _151;
  wire  _152;
  reg [19:0] _153;
  wire [11:0] _154;
  wire  _155;
  reg [19:0] _156;
  wire [31:0] _157;
  reg [31:0] _158;
  wire `Src2CtrlEnum_binary_sequancial_type _159;
  wire `Src2CtrlEnum_binary_sequancial_type _160;
  wire `Src2CtrlEnum_binary_sequancial_type _161;
  wire [31:0] _162;
  reg  execute_SRC_USE_SUB_LESS;
  wire [31:0] _163;
  wire [31:0] _164;
  wire [1:0] _165;
  wire [1:0] _166;
  wire [31:0] _167;
  wire [31:0] execute_SrcPlugin_addSub;
  reg  execute_SRC_LESS_UNSIGNED;
  wire  execute_SrcPlugin_less;
  wire  _168;
  reg  execute_LightShifterPlugin_isActive;
  reg `ShiftCtrlEnum_binary_sequancial_type execute_SHIFT_CTRL;
  wire `ShiftCtrlEnum_binary_sequancial_type _169;
  wire  execute_LightShifterPlugin_isShift;
  reg [4:0] execute_LightShifterPlugin_amplitudeReg;
  wire [4:0] _170;
  wire [4:0] execute_LightShifterPlugin_amplitude;
  reg [31:0] memory_REGFILE_WRITE_DATA;
  wire [31:0] execute_LightShifterPlugin_shiftInput;
  wire [3:0] _171;
  wire  execute_LightShifterPlugin_done;
  wire  _172;
  reg [31:0] _173;
  wire [31:0] _174;
  wire `ShiftCtrlEnum_binary_sequancial_type _175;
  wire [32:0] _176;
  wire [31:0] _177;
  reg [31:0] _178;
  wire `ShiftCtrlEnum_binary_sequancial_type _179;
  wire  _180;
  wire  _181;
  wire [4:0] _182;
  wire  _183;
  wire  _184;
  wire  _185;
  reg  _186;
  reg  _187;
  reg  _188;
  reg [4:0] _189;
  wire  _190;
  wire  _191;
  wire  _192;
  wire  _193;
  wire  _194;
  wire  _195;
  reg  writeBack_REGFILE_WRITE_VALID;
  wire  _196;
  wire  _197;
  wire  _198;
  wire  _199;
  wire  _200;
  reg  memory_BYPASSABLE_MEMORY_STAGE;
  reg  memory_REGFILE_WRITE_VALID;
  wire  _201;
  wire  _202;
  wire  _203;
  wire  _204;
  wire  _205;
  reg  execute_BYPASSABLE_EXECUTE_STAGE;
  reg  execute_REGFILE_WRITE_VALID;
  wire  _206;
  wire  _207;
  wire  _208;
  wire  _209;
  wire  _210;
  wire  decode_RS1_USE;
  wire  _211;
  wire  decode_RS2_USE;
  wire  _212;
  wire  _213;
  wire  execute_BranchPlugin_eq;
  reg `BranchCtrlEnum_binary_sequancial_type execute_BRANCH_CTRL;
  wire  _214;
  wire  _215;
  wire  _216;
  wire [2:0] _217;
  wire [2:0] _218;
  wire [2:0] _219;
  reg  _220;
  wire [2:0] _221;
  wire [2:0] _222;
  reg  _223;
  wire `BranchCtrlEnum_binary_sequancial_type _224;
  wire `BranchCtrlEnum_binary_sequancial_type _225;
  wire `BranchCtrlEnum_binary_sequancial_type _226;
  wire `BranchCtrlEnum_binary_sequancial_type _227;
  reg [31:0] execute_RS1;
  wire [31:0] _228;
  wire [31:0] execute_PC;
  wire [31:0] execute_BranchPlugin_branch_src1;
  wire [19:0] _229;
  wire  _230;
  reg [10:0] _231;
  wire  _232;
  wire [11:0] _233;
  wire  _234;
  reg [19:0] _235;
  wire [11:0] _236;
  wire  _237;
  reg [18:0] _238;
  wire  _239;
  reg [31:0] _240;
  wire `BranchCtrlEnum_binary_sequancial_type _241;
  wire `BranchCtrlEnum_binary_sequancial_type _242;
  wire [31:0] execute_BranchPlugin_branch_src2;
  wire [31:0] execute_BranchPlugin_branchAdder;
  wire [30:0] _243;
  wire `BranchCtrlEnum_binary_sequancial_type _244;
  wire  _245;
  wire [31:0] _246;
  reg  memory_BRANCH_DO;
  wire [31:0] memory_BRANCH_CALC;
  wire  _247;
  wire  _248;
  wire [1:0] _249;
  wire [31:0] execute_REGFILE_WRITE_DATA;
  reg [31:0] writeBack_REGFILE_WRITE_DATA;
  reg  execute_RS2_USE;
  reg  memory_RS2_USE;
  reg  writeBack_RS2_USE;
  wire [31:0] decode_RS1;
  reg [31:0] memory_RS1;
  reg [31:0] writeBack_RS1;
  wire [31:0] decode_RS2;
  reg [31:0] memory_RS2;
  reg [31:0] writeBack_RS2;
  wire [31:0] execute_FORMAL_MEM_WDATA;
  reg [31:0] memory_FORMAL_MEM_WDATA;
  reg [31:0] writeBack_FORMAL_MEM_WDATA;
  wire [31:0] fetch_PC;
  wire [31:0] memory_PC;
  reg [31:0] _250;
  reg [31:0] _251;
  reg [31:0] _252;
  reg [31:0] _253;
  reg [31:0] _254;
  wire  decode_BYPASSABLE_EXECUTE_STAGE;
  wire [31:0] memory_MEMORY_READ_DATA;
  wire  decode_BYPASSABLE_MEMORY_STAGE;
  reg  execute_BYPASSABLE_MEMORY_STAGE;
  reg  execute_RS1_USE;
  reg  memory_RS1_USE;
  reg  writeBack_RS1_USE;
  wire [3:0] execute_FORMAL_MEM_RMASK;
  reg [3:0] memory_FORMAL_MEM_RMASK;
  reg [3:0] writeBack_FORMAL_MEM_RMASK;
  wire [31:0] execute_FORMAL_MEM_ADDR;
  wire [31:0] memory_FORMAL_MEM_ADDR;
  wire [31:0] writeBack_FORMAL_MEM_ADDR;
  reg [31:0] _255;
  reg [31:0] _256;
  wire  prefetch_FORMAL_HALT;
  reg  fetch_FORMAL_HALT;
  reg  decode_FORMAL_HALT;
  reg  execute_FORMAL_HALT;
  reg  memory_FORMAL_HALT;
  reg  writeBack_FORMAL_HALT;
  wire `BranchCtrlEnum_binary_sequancial_type decode_BRANCH_CTRL;
  wire  decode_SRC_USE_SUB_LESS;
  wire [3:0] execute_FORMAL_MEM_WMASK;
  reg [3:0] memory_FORMAL_MEM_WMASK;
  reg [3:0] writeBack_FORMAL_MEM_WMASK;
  wire [31:0] writeBack_FORMAL_MEM_RDATA;
  wire [31:0] execute_BRANCH_CALC;
  reg [31:0] _257;
  wire [31:0] fetch_INSTRUCTION;
  wire [31:0] prefetch_FORMAL_PC_NEXT;
  wire [31:0] fetch_FORMAL_PC_NEXT;
  wire [31:0] decode_FORMAL_PC_NEXT;
  wire [31:0] execute_FORMAL_PC_NEXT;
  wire [31:0] memory_FORMAL_PC_NEXT;
  wire [31:0] writeBack_FORMAL_PC_NEXT;
  reg [31:0] _258;
  reg [31:0] _259;
  reg [31:0] _260;
  reg [31:0] _261;
  reg [31:0] _262;
  wire `AluBitwiseCtrlEnum_binary_sequancial_type decode_ALU_BITWISE_CTRL;
  wire [31:0] decode_SRC1;
  wire `AluCtrlEnum_binary_sequancial_type decode_ALU_CTRL;
  wire  decode_MEMORY_ENABLE;
  wire [31:0] decode_SRC2;
  wire [1:0] execute_MEMORY_ADDRESS_LOW;
  wire [1:0] memory_MEMORY_ADDRESS_LOW;
  reg [1:0] _263;
  reg [1:0] _264;
  wire  execute_BRANCH_DO;
  wire `ShiftCtrlEnum_binary_sequancial_type decode_SHIFT_CTRL;
  wire  decode_SRC_LESS_UNSIGNED;
  wire  _265;
  wire  _266;
  wire  _267;
  wire  _268;
  wire  _269;
  wire  _270;
  wire  _271;
  wire  _272;
  wire  _273;
  wire  _274;
  wire  _275;
  wire  _276;
  wire  _277;
  wire  _278;
  wire  _279;
  wire  _280;
  wire  _281;
  wire  _282;
  wire  _283;
  wire  _284;
  wire  _285;
  wire  _286;
  wire  _287;
  wire  _288;
  wire [31:0] _289;
  wire [1:0] _290;
  wire  _291;
  wire  _292;
  wire [31:0] _293;
  wire [31:0] _294;
  wire [1:0] _295;
  wire [31:0] _296;
  wire [4:0] _297;
  wire [4:0] _298;
  wire [4:0] _299;
  assign prefetch_arbitration_haltByOther = 1'b0;
  assign prefetch_arbitration_removeIt = 1'b0;
  assign _1 = 1'b0;
  assign prefetch_arbitration_isStuck = (prefetch_arbitration_haltItself || prefetch_arbitration_isStuckByOthers);
  assign prefetch_arbitration_isStuckByOthers = (prefetch_arbitration_haltByOther || (((((_277 || fetch_arbitration_haltItself) || decode_arbitration_haltItself) || execute_arbitration_haltItself) || memory_arbitration_haltItself) || writeBack_arbitration_haltItself));
  assign prefetch_arbitration_isFiring = ((prefetch_arbitration_isValid && (! prefetch_arbitration_isStuck)) && (! prefetch_arbitration_removeIt));
  assign fetch_arbitration_haltByOther = 1'b0;
  assign fetch_arbitration_flushAll = 1'b0;
  assign _2 = 1'b0;
  assign fetch_arbitration_isStuck = (fetch_arbitration_haltItself || fetch_arbitration_isStuckByOthers);
  assign fetch_arbitration_isStuckByOthers = (fetch_arbitration_haltByOther || ((((_278 || decode_arbitration_haltItself) || execute_arbitration_haltItself) || memory_arbitration_haltItself) || writeBack_arbitration_haltItself));
  assign fetch_arbitration_isFlushed = ((((fetch_arbitration_flushAll || decode_arbitration_flushAll) || execute_arbitration_flushAll) || memory_arbitration_flushAll) || writeBack_arbitration_flushAll);
  assign decode_arbitration_haltByOther = 1'b0;
  assign decode_arbitration_flushAll = 1'b0;
  assign _3 = 1'b0;
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((_279 || execute_arbitration_haltItself) || memory_arbitration_haltItself) || writeBack_arbitration_haltItself));
  assign decode_arbitration_isFlushed = (((decode_arbitration_flushAll || execute_arbitration_flushAll) || memory_arbitration_flushAll) || writeBack_arbitration_flushAll);
  assign execute_arbitration_haltByOther = 1'b0;
  assign _4 = 1'b0;
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((_280 || memory_arbitration_haltItself) || writeBack_arbitration_haltItself));
  assign execute_arbitration_isFlushed = ((execute_arbitration_flushAll || memory_arbitration_flushAll) || writeBack_arbitration_flushAll);
  assign memory_arbitration_haltByOther = 1'b0;
  assign memory_arbitration_flushAll = 1'b0;
  assign _5 = 1'b0;
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (_281 || writeBack_arbitration_haltItself));
  assign memory_arbitration_isFlushed = (memory_arbitration_flushAll || writeBack_arbitration_flushAll);
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  assign writeBack_arbitration_flushAll = 1'b0;
  assign _6 = 1'b0;
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || _282);
  assign writeBack_arbitration_isFlushed = writeBack_arbitration_flushAll;
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  assign decode_PC = _251;
  assign writeBack_PC = _254;
  assign rvfi_order = writeBack_FomalPlugin_order;
  assign rvfi_insn = _11;
  assign rvfi_intr = _14;
  assign rvfi_rs1_addr = _17;
  assign rvfi_rs1_rdata = (_15 ? writeBack_RS1 : (32'b00000000000000000000000000000000));
  assign rvfi_rs2_addr = _20;
  assign rvfi_rs2_rdata = (_18 ? writeBack_RS2 : (32'b00000000000000000000000000000000));
  assign rvfi_rd_addr = _23;
  assign rvfi_rd_wdata = (_21 ? _24 : (32'b00000000000000000000000000000000));
  assign rvfi_pc_rdata = writeBack_PC;
  assign rvfi_pc_wdata = writeBack_FORMAL_PC_NEXT;
  assign rvfi_mem_addr = writeBack_FORMAL_MEM_ADDR;
  assign rvfi_mem_rmask = writeBack_FORMAL_MEM_RMASK;
  assign rvfi_mem_wmask = writeBack_FORMAL_MEM_WMASK;
  assign rvfi_mem_rdata = writeBack_FORMAL_MEM_RDATA;
  assign rvfi_mem_wdata = writeBack_FORMAL_MEM_WDATA;
  assign decodeExceptionPort_valid = ((decode_arbitration_isValid && decode_INSTRUCTION_READY) && (! decode_LEGAL_INSTRUCTION));
  assign _7 = (memory_arbitration_isFiring && memory_BRANCH_DO);
  assign _8 = memory_BRANCH_CALC;
  assign _9 = ((memory_arbitration_isValid && memory_BRANCH_DO) && (_249 != (2'b00)));
  assign _10 = (writeBack_FomalPlugin_order + (64'b0000000000000000000000000000000000000000000000000000000000000001));
  assign _11 = writeBack_INSTRUCTION;
  assign _12 = 1'b0;
  assign _13 = 1'b0;
  assign _14 = 1'b0;
  assign _15 = writeBack_RS1_USE;
  assign _16 = _11[19 : 15];
  assign _17 = (_15 ? _16 : _297);
  assign _18 = writeBack_RS2_USE;
  assign _19 = _11[24 : 20];
  assign _20 = (_18 ? _19 : _298);
  assign _21 = writeBack_REGFILE_WRITE_VALID;
  assign _22 = _11[11 : 7];
  assign _23 = (_21 ? _22 : _299);
  assign _25 = prefetch_FORMAL_HALT;
  assign _26 = 1'b1;
  assign _27 = 1'b1;
  assign _28 = 1'b0;
  assign _29 = fetch_FORMAL_HALT;
  assign _30 = 1'b1;
  assign _31 = 1'b1;
  assign _33 = 1'b1;
  assign _34 = 1'b1;
  assign _35 = execute_FORMAL_HALT;
  assign _36 = 1'b1;
  assign _37 = 1'b1;
  assign _39 = 1'b1;
  assign _40 = 1'b1;
  assign _41 = 1'b1;
  assign _42 = 1'b1;
  assign _48 = 1'b1;
  assign _49 = 1'b1;
  assign _50 = 1'b1;
  assign _51 = 1'b0;
  assign _52 = 1'b1;
  assign _53 = 1'b1;
  assign _54 = 1'b0;
  assign _55 = 1'b1;
  assign _56 = 1'b1;
  assign _57 = 1'b0;
  assign _58 = 1'b1;
  assign _59 = 1'b0;
  assign _60 = (2'b00);
  assign _61 = {prefetch_PcManagerSimplePlugin_inc,_60};
  assign prefetch_PcManagerSimplePlugin_pcBeforeJumps = (prefetch_PcManagerSimplePlugin_pcReg + _296);
  assign prefetch_PC_CALC_WITHOUT_JUMP = prefetch_PcManagerSimplePlugin_pcBeforeJumps;
  assign prefetch_PcManagerSimplePlugin_jump_pcLoad_valid = _7;
  assign prefetch_PcManagerSimplePlugin_jump_pcLoad_payload = _8;
  assign _62 = 1'b0;
  assign _63 = 1'b1;
  assign _64 = 1'b0;
  assign _65 = 1'b1;
  assign _66 = 1'b1;
  assign prefetch_PC = prefetch_PcManagerSimplePlugin_pc;
  assign _67 = (prefetch_PC + (32'b00000000000000000000000000000100));
  assign iBus_cmd_valid = _288;
  assign iBus_cmd_payload_pc = _72;
  assign _69 = 1'b0;
  assign _70 = 1'b0;
  assign _71 = 1'b1;
  assign _72 = prefetch_PC;
  assign _73 = 1'b1;
  assign _74 = 1'b0;
  assign _75 = 1'b0;
  assign _77 = 1'b1;
  assign _78 = 1'b0;
  assign _81 = 1'b1;
  assign _82 = 1'b0;
  assign _83 = fetch_INSTRUCTION;
  assign _84 = 1'b1;
  assign dBus_cmd_valid = _291;
  assign dBus_cmd_payload_wr = _292;
  assign dBus_cmd_payload_address = _289;
  assign dBus_cmd_payload_data = _293;
  assign dBus_cmd_payload_size = _290;
  assign _85 = 1'b0;
  assign execute_ALIGNEMENT_FAULT = _85;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign _86 = execute_SRC_ADD;
  assign _87 = execute_INSTRUCTION[13 : 12];
  assign _89 = 1'b1;
  assign _90 = 1'b0;
  assign _91 = _289[1 : 0];
  assign _92 = (4'b0001);
  assign _93 = (4'b0011);
  assign _94 = (4'b1111);
  assign _95 = (4'b0000);
  assign _96 = (4'b0000);
  assign _97 = 1'b1;
  assign _98 = 1'b1;
  assign writeBack_MEMORY_ADDRESS_LOW = _264;
  assign _99 = (2'b10);
  assign _100 = (2'b11);
  assign _101 = writeBack_INSTRUCTION[13 : 12];
  assign _102 = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  assign _104 = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  assign _106 = 1'b1;
  assign _107 = {({_109,{((decode_INSTRUCTION & (32'b01000000000000000000000000110000)) == (32'b01000000000000000000000000110000)),((decode_INSTRUCTION & (32'b00000000000000000010000000010100)) == (32'b00000000000000000010000000010000))}} != (3'b000)),{({_115,_116} != (2'b00)),{(((decode_INSTRUCTION & (32'b00000000000000000000000001001000)) == (32'b00000000000000000000000001000000)) != (1'b0)),{({((decode_INSTRUCTION & (32'b00000000000000000100000000000100)) == (32'b00000000000000000100000000000000)),{((decode_INSTRUCTION & (32'b00000000000000000000000001100100)) == (32'b00000000000000000000000000100100)),((decode_INSTRUCTION & (32'b00000000000000000011000000000100)) == (32'b00000000000000000001000000000000))}} != (3'b000)),{(((decode_INSTRUCTION & (32'b00000000000000000110000000000100)) == (32'b00000000000000000010000000000000)) != (1'b0)),{({_115,{_112,{_113,{_114,((decode_INSTRUCTION & (32'b00000000000000000100000001000000)) == (32'b00000000000000000100000000000000))}}}} != (5'b00000)),{({_112,_111} != (2'b00)),{({((decode_INSTRUCTION & (32'b00000000000000000111000000010100)) == (32'b00000000000000000101000000010000)),((decode_INSTRUCTION & (32'b00000000000000000111000001100100)) == (32'b00000000000000000101000000100000))} != (2'b00)),{({((decode_INSTRUCTION & (32'b01000000000000000011000000010100)) == (32'b01000000000000000001000000010000)),{((decode_INSTRUCTION & (32'b01000000000000000100000001100100)) == (32'b01000000000000000100000000100000)),((decode_INSTRUCTION & (32'b00000000000000000111000000010100)) == (32'b00000000000000000001000000010000))}} != (3'b000)),{({_115,_116} != (2'b00)),{(((decode_INSTRUCTION & (32'b00000000000000000000000001000100)) == (32'b00000000000000000000000000000100)) != (1'b0)),{({((decode_INSTRUCTION & (32'b00000000000000000010000000010000)) == (32'b00000000000000000010000000000000)),((decode_INSTRUCTION & (32'b00000000000000000101000000000000)) == (32'b00000000000000000001000000000000))} != (2'b00)),{({_115,{_113,_108}} != (3'b000)),{({_115,{_113,_114}} != (3'b000)),{({((decode_INSTRUCTION & (32'b00000000000000000001000000000000)) == (32'b00000000000000000001000000000000)),_113} != (2'b00)),{({_113,{((decode_INSTRUCTION & (32'b00000000000000000011000000000000)) == (32'b00000000000000000001000000000000)),((decode_INSTRUCTION & (32'b00000000000000000011000000000000)) == (32'b00000000000000000010000000000000))}} != (3'b000)),{({((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000000)),{_110,((decode_INSTRUCTION & (32'b00000000000000000000000000011000)) == (32'b00000000000000000000000000000000))}} != (3'b000)),{({_112,_111} != (2'b00)),{(_110 != (1'b0)),({_109,{((decode_INSTRUCTION & (32'b00000000000000000000000000100100)) == (32'b00000000000000000000000000100000)),_108}} != (3'b000))}}}}}}}}}}}}}}}}}}};
  assign _108 = ((decode_INSTRUCTION & (32'b00000000000000000000000001110000)) == (32'b00000000000000000000000000100000));
  assign _109 = ((decode_INSTRUCTION & (32'b00000000000000000000000001000100)) == (32'b00000000000000000000000001000000));
  assign _110 = ((decode_INSTRUCTION & (32'b00000000000000000000000001010000)) == (32'b00000000000000000000000000000000));
  assign _111 = ((decode_INSTRUCTION & (32'b00000000000000000000000000100000)) == (32'b00000000000000000000000000100000));
  assign _112 = ((decode_INSTRUCTION & (32'b00000000000000000000000000010000)) == (32'b00000000000000000000000000010000));
  assign _113 = ((decode_INSTRUCTION & (32'b00000000000000000000000000000100)) == (32'b00000000000000000000000000000100));
  assign _114 = ((decode_INSTRUCTION & (32'b00000000000000000000000000100000)) == (32'b00000000000000000000000000000000));
  assign _115 = ((decode_INSTRUCTION & (32'b00000000000000000000000000001000)) == (32'b00000000000000000000000000001000));
  assign _116 = ((decode_INSTRUCTION & (32'b00000000000000000000000000010100)) == (32'b00000000000000000000000000000100));
  assign _117 = (32'b10111110000000000111000001111111);
  assign _118 = (32'b10111110000000000111000001111111);
  assign _119 = (32'b11111100000000000011000001111111);
  assign _120 = (32'b10111100000000000111000001111111);
  assign _121 = (32'b11111110000000000000000001111111);
  assign _122 = _107[0 : 0];
  assign _123 = _107[1 : 1];
  assign _124 = _107[2 : 2];
  assign _125 = _107[3 : 3];
  assign _126 = _107[8 : 8];
  assign _127 = _107[13 : 13];
  assign _128 = _107[14 : 14];
  assign _129 = _107[19 : 19];
  assign decode_INSTRUCTION_READY = _84;
  assign decode_LEGAL_INSTRUCTION = ({((decode_INSTRUCTION & (32'b00000000000000000000000001011111)) == (32'b00000000000000000000000000010111)),{((decode_INSTRUCTION & (32'b00000000000000000000000001111111)) == (32'b00000000000000000000000001101111)),{((decode_INSTRUCTION & (32'b00000000000000000001000001101111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & (32'b00000000000000000100000001111111)) == (32'b00000000000000000100000001100011)),{((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000000000001100011)),{((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000010000000010011)),{((decode_INSTRUCTION & (32'b00000000000000000110000000111111)) == (32'b00000000000000000000000000100011)),{((decode_INSTRUCTION & (32'b00000000000000000010000001111111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & (32'b00000000000000000110000001011111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & (32'b00000000000000000101000001011111)) == (32'b00000000000000000000000000000011)),{((decode_INSTRUCTION & (32'b00000000000000000111000001111011)) == (32'b00000000000000000000000001100011)),{((decode_INSTRUCTION & _121) == (32'b00000000000000000000000000110011)),{((decode_INSTRUCTION & _120) == (32'b00000000000000000101000000010011)),{((decode_INSTRUCTION & _119) == (32'b00000000000000000001000000010011)),{((decode_INSTRUCTION & _118) == (32'b00000000000000000101000000110011)),((decode_INSTRUCTION & _117) == (32'b00000000000000000000000000110011))}}}}}}}}}}}}}}} != (16'b0000000000000000));
  assign _130 = 1'b0;
  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : _83);
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = RegFilePlugin_regFile_port0_data;
  assign RegFilePlugin_regFile_port0_address = decode_RegFilePlugin_regFileReadAddress1;
  assign RegFilePlugin_regFile_port0_enable = _131;
  assign _131 = 1'b1;
  assign decode_RegFilePlugin_rs2Data = RegFilePlugin_regFile_port1_data;
  assign RegFilePlugin_regFile_port1_address = decode_RegFilePlugin_regFileReadAddress2;
  assign RegFilePlugin_regFile_port1_enable = _132;
  assign _132 = 1'b1;
  assign writeBack_RegFilePlugin_regFileWrite_payload_address = _133;
  assign writeBack_RegFilePlugin_regFileWrite_payload_data = _24;
  assign RegFilePlugin_regFile_port2_address = writeBack_RegFilePlugin_regFileWrite_payload_address;
  assign RegFilePlugin_regFile_port2_data = writeBack_RegFilePlugin_regFileWrite_payload_data;
  assign RegFilePlugin_regFile_port2_enable = writeBack_RegFilePlugin_regFileWrite_valid;
  assign _133 = _11[11 : 7];
  assign _134 = 1'b0;
  assign _136 = 1'b1;
  assign _137 = 1'b1;
  assign _138 = `AluBitwiseCtrlEnum_binary_sequancial_AND_1;
  assign _139 = `AluBitwiseCtrlEnum_binary_sequancial_OR_1;
  assign _140 = `AluBitwiseCtrlEnum_binary_sequancial_XOR_1;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign _141 = execute_SRC_LESS;
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign _143 = `AluCtrlEnum_binary_sequancial_BITWISE;
  assign _144 = `AluCtrlEnum_binary_sequancial_SLT_SLTU;
  assign decode_SRC1_CTRL = _107[10 : 9];
  assign _145 = decode_RS1;
  assign _146 = (12'b000000000000);
  assign _148 = `Src1CtrlEnum_binary_sequancial_RS;
  assign _149 = `Src1CtrlEnum_binary_sequancial_FOUR;
  assign decode_SRC2_CTRL = _107[7 : 6];
  assign _150 = decode_RS2;
  assign _151 = decode_INSTRUCTION[31 : 20];
  assign _152 = _151[11];
  assign _154 = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _155 = _154[11];
  assign _157 = decode_PC;
  assign _159 = `Src2CtrlEnum_binary_sequancial_RS;
  assign _160 = `Src2CtrlEnum_binary_sequancial_IMI;
  assign _161 = `Src2CtrlEnum_binary_sequancial_IMS;
  assign _162 = execute_SRC1;
  assign _163 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _164 = ($signed(_162) + $signed(_163));
  assign _165 = (2'b01);
  assign _166 = (execute_SRC_USE_SUB_LESS ? _165 : _295);
  assign _167 = ($signed(_164) + $signed(_294));
  assign execute_SrcPlugin_addSub = _167;
  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign _168 = 1'b0;
  assign _169 = `ShiftCtrlEnum_binary_sequancial_DISABLE_1;
  assign execute_LightShifterPlugin_isShift = (execute_SHIFT_CTRL != _169);
  assign _170 = execute_SRC2[4 : 0];
  assign execute_LightShifterPlugin_amplitude = (execute_LightShifterPlugin_isActive ? execute_LightShifterPlugin_amplitudeReg : _170);
  assign execute_LightShifterPlugin_shiftInput = (execute_LightShifterPlugin_isActive ? memory_REGFILE_WRITE_DATA : execute_SRC1);
  assign _171 = execute_LightShifterPlugin_amplitude[4 : 1];
  assign execute_LightShifterPlugin_done = (_171 == (4'b0000));
  assign _172 = ((execute_arbitration_isValid && execute_LightShifterPlugin_isShift) && (execute_SRC2[4 : 0] != (5'b00000)));
  assign _174 = (execute_LightShifterPlugin_shiftInput <<< 1);
  assign _175 = `ShiftCtrlEnum_binary_sequancial_SRA_1;
  assign _176 = {((execute_SHIFT_CTRL == _175) && execute_LightShifterPlugin_shiftInput[31]),execute_LightShifterPlugin_shiftInput};
  assign _177 = (_176 >>> 1);
  assign _179 = `ShiftCtrlEnum_binary_sequancial_SLL_1;
  assign _180 = (! execute_arbitration_isStuckByOthers);
  assign _181 = 1'b1;
  assign _182 = (execute_LightShifterPlugin_amplitude - (5'b00001));
  assign _183 = 1'b0;
  assign _184 = 1'b1;
  assign _185 = 1'b0;
  assign _190 = 1'b0;
  assign _191 = 1'b1;
  assign _192 = 1'b0;
  assign _193 = 1'b1;
  assign _194 = 1'b0;
  assign _195 = 1'b1;
  assign _196 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _197 = 1'b1;
  assign _198 = (_197 || (! _195));
  assign _199 = 1'b1;
  assign _200 = 1'b1;
  assign _201 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _202 = 1'b1;
  assign _203 = (_202 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _204 = 1'b1;
  assign _205 = 1'b1;
  assign _206 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _207 = 1'b1;
  assign _208 = (_207 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _209 = 1'b1;
  assign _210 = 1'b1;
  assign decode_RS1_USE = _125[0];
  assign _211 = 1'b0;
  assign decode_RS2_USE = _122[0];
  assign _212 = 1'b0;
  assign _213 = 1'b1;
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _214 = 1'b0;
  assign _215 = 1'b1;
  assign _216 = 1'b1;
  assign _217 = execute_INSTRUCTION[14 : 12];
  assign _218 = (3'b000);
  assign _219 = (3'b001);
  assign _221 = (3'b101);
  assign _222 = (3'b101);
  assign _224 = `BranchCtrlEnum_binary_sequancial_INC;
  assign _225 = `BranchCtrlEnum_binary_sequancial_JAL;
  assign _226 = `BranchCtrlEnum_binary_sequancial_JALR;
  assign _227 = `BranchCtrlEnum_binary_sequancial_JALR;
  assign _228 = execute_RS1;
  assign execute_PC = _252;
  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == _227) ? _228 : execute_PC);
  assign _229 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _230 = _229[19];
  assign _232 = 1'b0;
  assign _233 = execute_INSTRUCTION[31 : 20];
  assign _234 = _233[11];
  assign _236 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _237 = _236[11];
  assign _239 = 1'b0;
  assign _241 = `BranchCtrlEnum_binary_sequancial_JAL;
  assign _242 = `BranchCtrlEnum_binary_sequancial_JALR;
  assign execute_BranchPlugin_branch_src2 = _240;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign _243 = execute_BranchPlugin_branchAdder[31 : 1];
  assign _244 = `BranchCtrlEnum_binary_sequancial_JALR;
  assign _245 = 1'b0;
  assign _246 = {_243,((execute_BRANCH_CTRL == _244) ? _245 : execute_BranchPlugin_branchAdder[0])};
  assign memory_BRANCH_CALC = _257;
  assign _247 = 1'b1;
  assign _248 = 1'b0;
  assign _249 = _8[1 : 0];
  assign execute_REGFILE_WRITE_DATA = _142;
  assign decode_RS1 = decode_RegFilePlugin_rs1Data;
  assign decode_RS2 = decode_RegFilePlugin_rs2Data;
  assign execute_FORMAL_MEM_WDATA = _293;
  assign fetch_PC = _250;
  assign memory_PC = _253;
  assign decode_BYPASSABLE_EXECUTE_STAGE = _127[0];
  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign decode_BYPASSABLE_MEMORY_STAGE = _124[0];
  assign execute_FORMAL_MEM_RMASK = ((_291 && (! _292)) ? execute_DBusSimplePlugin_formalMask : _96);
  assign execute_FORMAL_MEM_ADDR = _289;
  assign memory_FORMAL_MEM_ADDR = _255;
  assign writeBack_FORMAL_MEM_ADDR = _256;
  assign prefetch_FORMAL_HALT = _51;
  assign decode_BRANCH_CTRL = _107[18 : 17];
  assign decode_SRC_USE_SUB_LESS = _129[0];
  assign execute_FORMAL_MEM_WMASK = ((_291 && _292) ? execute_DBusSimplePlugin_formalMask : _95);
  assign writeBack_FORMAL_MEM_RDATA = writeBack_DBusSimplePlugin_rspFormated;
  assign execute_BRANCH_CALC = _246;
  assign fetch_INSTRUCTION = _80;
  assign prefetch_FORMAL_PC_NEXT = _67;
  assign fetch_FORMAL_PC_NEXT = _258;
  assign decode_FORMAL_PC_NEXT = _259;
  assign execute_FORMAL_PC_NEXT = _260;
  assign memory_FORMAL_PC_NEXT = _261;
  assign writeBack_FORMAL_PC_NEXT = _262;
  assign decode_ALU_BITWISE_CTRL = _107[5 : 4];
  assign decode_SRC1 = _147;
  assign decode_ALU_CTRL = _107[16 : 15];
  assign decode_MEMORY_ENABLE = _123[0];
  assign decode_SRC2 = _158;
  assign execute_MEMORY_ADDRESS_LOW = _91;
  assign memory_MEMORY_ADDRESS_LOW = _263;
  assign execute_BRANCH_DO = _223;
  assign decode_SHIFT_CTRL = _107[12 : 11];
  assign decode_SRC_LESS_UNSIGNED = _126[0];
  assign _265 = 1'b0;
  assign _266 = 1'b1;
  assign _267 = 1'b1;
  assign _268 = 1'b0;
  assign _269 = 1'b1;
  assign _270 = 1'b0;
  assign _271 = 1'b1;
  assign _272 = 1'b0;
  assign _273 = 1'b1;
  assign _274 = 1'b0;
  assign _275 = 1'b1;
  assign _276 = 1'b0;
  assign _277 = 1'b0;
  assign _278 = 1'b0;
  assign _279 = 1'b0;
  assign _280 = 1'b0;
  assign _281 = 1'b0;
  assign _282 = 1'b0;
  assign _283 = 1'b0;
  assign _284 = 1'b0;
  assign _285 = 1'b0;
  assign _286 = 1'b0;
  assign _287 = 1'b0;
  assign _288 = (((prefetch_arbitration_isValid && (! prefetch_arbitration_removeIt)) && (! prefetch_arbitration_isStuckByOthers)) && (! (prefetch_IBusSimplePlugin_pendingCmd && (! iBus_rsp_ready))));
  assign _289 = _86;
  assign _290 = _87;
  assign _291 = ((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_removeIt)) && (! execute_ALIGNEMENT_FAULT));
  assign _292 = execute_INSTRUCTION[5];
  assign _293 = _88;
  assign _294 = $signed(_166);
  assign _295 = (2'b00);
  assign _296 = _61;
  assign _297 = (5'b00000);
  assign _298 = (5'b00000);
  assign _299 = (5'b00000);
  always @ (iBus_cmd_ready or iBus_rsp_ready or prefetch_IBusSimplePlugin_pendingCmd or _73 or _74)
  begin
    prefetch_arbitration_haltItself = _74;
    if(((! iBus_cmd_ready) || (prefetch_IBusSimplePlugin_pendingCmd && (! iBus_rsp_ready))))begin
      prefetch_arbitration_haltItself = _73;
    end
  end

  always @ (fetch_arbitration_isValid or iBus_rsp_ready or _76 or _81 or _82)
  begin
    fetch_arbitration_haltItself = _82;
    if(((fetch_arbitration_isValid && (! iBus_rsp_ready)) && (! _76)))begin
      fetch_arbitration_haltItself = _81;
    end
  end

  always @ (fetch_arbitration_isFlushed or _267 or _268)
  begin
    fetch_arbitration_removeIt = _268;
    if(fetch_arbitration_isFlushed)begin
      fetch_arbitration_removeIt = _267;
    end
  end

  always @ (decode_arbitration_isValid or decodeExceptionPort_valid or _53 or _54 or _186 or _187 or _213)
  begin
    decode_arbitration_haltItself = _54;
    if(decodeExceptionPort_valid)begin
      decode_arbitration_haltItself = _53;
    end
    if((decode_arbitration_isValid && (_186 || _187)))begin
      decode_arbitration_haltItself = _213;
    end
  end

  always @ (decode_arbitration_isFlushed or _269 or _270)
  begin
    decode_arbitration_removeIt = _270;
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = _269;
    end
  end

  always @ (execute_arbitration_isValid or dBus_cmd_ready or execute_MEMORY_ENABLE or execute_ALIGNEMENT_FAULT or _89 or _90 or execute_LightShifterPlugin_done or _172 or _180 or _184)
  begin
    execute_arbitration_haltItself = _90;
    if((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_ALIGNEMENT_FAULT)))begin
      execute_arbitration_haltItself = _89;
    end
    if(_172)begin
      if(_180)begin
        if(execute_LightShifterPlugin_done)begin
        end else begin
          execute_arbitration_haltItself = _184;
        end
      end
    end
  end

  always @ (execute_arbitration_isFlushed or _271 or _272)
  begin
    execute_arbitration_removeIt = _272;
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = _271;
    end
  end

  always @ (_7 or _247 or _248)
  begin
    execute_arbitration_flushAll = _248;
    if(_7)begin
      execute_arbitration_flushAll = _247;
    end
  end

  always @ (memory_arbitration_isValid or _9 or _56 or _57 or dBus_rsp_ready or memory_MEMORY_ENABLE or memory_INSTRUCTION or _97)
  begin
    memory_arbitration_haltItself = _57;
    if(_9)begin
      memory_arbitration_haltItself = _56;
    end
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_INSTRUCTION[5])) && (! dBus_rsp_ready)))begin
      memory_arbitration_haltItself = _97;
    end
  end

  always @ (memory_arbitration_isFlushed or _273 or _274)
  begin
    memory_arbitration_removeIt = _274;
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = _273;
    end
  end

  always @ (writeBack_arbitration_isFlushed or _275 or _276)
  begin
    writeBack_arbitration_removeIt = _276;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = _275;
    end
  end

  always @ (writeBack_arbitration_isFiring or _47 or _48)
  begin
    rvfi_valid = writeBack_arbitration_isFiring;
    if(_47)begin
      rvfi_valid = _48;
    end
  end

  always @ (_12 or _47 or _49)
  begin
    rvfi_trap = _12;
    if(_47)begin
      rvfi_trap = _49;
    end
  end

  always @ (_13 or _47 or _50)
  begin
    rvfi_halt = _13;
    if(_47)begin
      rvfi_halt = _50;
    end
  end

  always @ (writeBack_arbitration_isValid or writeBack_DBusSimplePlugin_rspFormated or writeBack_MEMORY_ENABLE or writeBack_REGFILE_WRITE_DATA)
  begin
    _24 = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _24 = writeBack_DBusSimplePlugin_rspFormated;
    end
  end

  always @ (prefetch_arbitration_isValid or fetch_arbitration_isValid or decode_arbitration_isValid or execute_arbitration_isValid or memory_arbitration_isValid or writeBack_arbitration_isValid or _25 or _26 or _27 or _28 or _29 or _30 or _31 or _32 or _33 or _34 or _35 or _36 or _37 or _38 or _39 or _40 or _41 or _42 or writeBack_FORMAL_HALT)
  begin
    writeBack_FomalPlugin_haltRequest = _28;
    if((prefetch_arbitration_isValid && _25))begin
      if((((((_26 && (! fetch_arbitration_isValid)) && (! decode_arbitration_isValid)) && (! execute_arbitration_isValid)) && (! memory_arbitration_isValid)) && (! writeBack_arbitration_isValid)))begin
        writeBack_FomalPlugin_haltRequest = _27;
      end
    end
    if((fetch_arbitration_isValid && _29))begin
      if(((((_30 && (! decode_arbitration_isValid)) && (! execute_arbitration_isValid)) && (! memory_arbitration_isValid)) && (! writeBack_arbitration_isValid)))begin
        writeBack_FomalPlugin_haltRequest = _31;
      end
    end
    if((decode_arbitration_isValid && _32))begin
      if((((_33 && (! execute_arbitration_isValid)) && (! memory_arbitration_isValid)) && (! writeBack_arbitration_isValid)))begin
        writeBack_FomalPlugin_haltRequest = _34;
      end
    end
    if((execute_arbitration_isValid && _35))begin
      if(((_36 && (! memory_arbitration_isValid)) && (! writeBack_arbitration_isValid)))begin
        writeBack_FomalPlugin_haltRequest = _37;
      end
    end
    if((memory_arbitration_isValid && _38))begin
      if((_39 && (! writeBack_arbitration_isValid)))begin
        writeBack_FomalPlugin_haltRequest = _40;
      end
    end
    if((writeBack_arbitration_isValid && writeBack_FORMAL_HALT))begin
      if(_41)begin
        writeBack_FomalPlugin_haltRequest = _42;
      end
    end
  end

  always @ (decodeExceptionPort_valid or _52 or decode_FORMAL_HALT)
  begin
    _32 = decode_FORMAL_HALT;
    if(decodeExceptionPort_valid)begin
      _32 = _52;
    end
  end

  always @ (_9 or _55 or memory_FORMAL_HALT)
  begin
    _38 = memory_FORMAL_HALT;
    if(_9)begin
      _38 = _55;
    end
  end

  always @ (prefetch_PC_CALC_WITHOUT_JUMP or prefetch_PcManagerSimplePlugin_jump_pcLoad_valid or prefetch_PcManagerSimplePlugin_jump_pcLoad_payload)
  begin
    prefetch_PcManagerSimplePlugin_pc = prefetch_PC_CALC_WITHOUT_JUMP;
    if(prefetch_PcManagerSimplePlugin_jump_pcLoad_valid)begin
      prefetch_PcManagerSimplePlugin_pc = prefetch_PcManagerSimplePlugin_jump_pcLoad_payload;
    end
  end

  always @ (prefetch_arbitration_isFiring or prefetch_PcManagerSimplePlugin_jump_pcLoad_valid or _63 or _64 or _66)
  begin
    prefetch_PcManagerSimplePlugin_samplePcNext = _64;
    if(prefetch_PcManagerSimplePlugin_jump_pcLoad_valid)begin
      prefetch_PcManagerSimplePlugin_samplePcNext = _63;
    end
    if(prefetch_arbitration_isFiring)begin
      prefetch_PcManagerSimplePlugin_samplePcNext = _66;
    end
  end

  always @ (_7 or _8 or memory_FORMAL_PC_NEXT)
  begin
    _68 = memory_FORMAL_PC_NEXT;
    if(_7)begin
      _68 = _8;
    end
  end

  always @ (iBus_rsp_inst or _76 or _79)
  begin
    _80 = iBus_rsp_inst;
    if(_76)begin
      _80 = _79;
    end
  end

  always @ (execute_RS2 or _290)
  begin
    case(_290)
      (2'b00) : begin
        _88 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      (2'b01) : begin
        _88 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _88 = execute_RS2[31 : 0];
      end
    endcase
  end

  always @ (_92 or _93 or _94 or _290)
  begin
    case(_290)
      (2'b00) : begin
        execute_DBusSimplePlugin_formalMask = _92;
      end
      (2'b01) : begin
        execute_DBusSimplePlugin_formalMask = _93;
      end
      default : begin
        execute_DBusSimplePlugin_formalMask = _94;
      end
    endcase
  end

  always @ (writeBack_MEMORY_READ_DATA or writeBack_MEMORY_ADDRESS_LOW)
  begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      (2'b01) : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      (2'b10) : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      (2'b11) : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  always @ (writeBack_DBusSimplePlugin_rspShifted or _102)
  begin
    _103[31] = _102;
    _103[30] = _102;
    _103[29] = _102;
    _103[28] = _102;
    _103[27] = _102;
    _103[26] = _102;
    _103[25] = _102;
    _103[24] = _102;
    _103[23] = _102;
    _103[22] = _102;
    _103[21] = _102;
    _103[20] = _102;
    _103[19] = _102;
    _103[18] = _102;
    _103[17] = _102;
    _103[16] = _102;
    _103[15] = _102;
    _103[14] = _102;
    _103[13] = _102;
    _103[12] = _102;
    _103[11] = _102;
    _103[10] = _102;
    _103[9] = _102;
    _103[8] = _102;
    _103[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  always @ (writeBack_DBusSimplePlugin_rspShifted or _104)
  begin
    _105[31] = _104;
    _105[30] = _104;
    _105[29] = _104;
    _105[28] = _104;
    _105[27] = _104;
    _105[26] = _104;
    _105[25] = _104;
    _105[24] = _104;
    _105[23] = _104;
    _105[22] = _104;
    _105[21] = _104;
    _105[20] = _104;
    _105[19] = _104;
    _105[18] = _104;
    _105[17] = _104;
    _105[16] = _104;
    _105[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (writeBack_DBusSimplePlugin_rspShifted or _101 or _103 or _105)
  begin
    case(_101)
      (2'b00) : begin
        writeBack_DBusSimplePlugin_rspFormated = _103;
      end
      (2'b01) : begin
        writeBack_DBusSimplePlugin_rspFormated = _105;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  always @ (decode_INSTRUCTION or _128 or _130)
  begin
    decode_REGFILE_WRITE_VALID = _128[0];
    if((decode_INSTRUCTION[11 : 7] == (5'b00000)))begin
      decode_REGFILE_WRITE_VALID = _130;
    end
  end

  always @ (writeBack_arbitration_isFiring or _21 or _135 or _137)
  begin
    writeBack_RegFilePlugin_regFileWrite_valid = (_21 && writeBack_arbitration_isFiring);
    if(_135)begin
      writeBack_RegFilePlugin_regFileWrite_valid = _137;
    end
  end

  always @ (execute_ALU_BITWISE_CTRL or execute_SRC1 or execute_SRC2)
  begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequancial_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_binary_sequancial_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      `AluBitwiseCtrlEnum_binary_sequancial_XOR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = execute_SRC1;
      end
    endcase
  end

  always @ (execute_IntAluPlugin_bitwise or execute_ALU_CTRL or _141 or execute_SRC_ADD_SUB)
  begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_binary_sequancial_BITWISE : begin
        _142 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_binary_sequancial_SLT_SLTU : begin
        _142 = _141;
      end
      default : begin
        _142 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (decode_INSTRUCTION or decode_SRC1_CTRL or _145 or _146)
  begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_binary_sequancial_RS : begin
        _147 = _145;
      end
      `Src1CtrlEnum_binary_sequancial_FOUR : begin
        _147 = (32'b00000000000000000000000000000100);
      end
      default : begin
        _147 = {decode_INSTRUCTION[31 : 12],_146};
      end
    endcase
  end

  always @ (_152)
  begin
    _153[19] = _152;
    _153[18] = _152;
    _153[17] = _152;
    _153[16] = _152;
    _153[15] = _152;
    _153[14] = _152;
    _153[13] = _152;
    _153[12] = _152;
    _153[11] = _152;
    _153[10] = _152;
    _153[9] = _152;
    _153[8] = _152;
    _153[7] = _152;
    _153[6] = _152;
    _153[5] = _152;
    _153[4] = _152;
    _153[3] = _152;
    _153[2] = _152;
    _153[1] = _152;
    _153[0] = _152;
  end

  always @ (_155)
  begin
    _156[19] = _155;
    _156[18] = _155;
    _156[17] = _155;
    _156[16] = _155;
    _156[15] = _155;
    _156[14] = _155;
    _156[13] = _155;
    _156[12] = _155;
    _156[11] = _155;
    _156[10] = _155;
    _156[9] = _155;
    _156[8] = _155;
    _156[7] = _155;
    _156[6] = _155;
    _156[5] = _155;
    _156[4] = _155;
    _156[3] = _155;
    _156[2] = _155;
    _156[1] = _155;
    _156[0] = _155;
  end

  always @ (decode_INSTRUCTION or decode_SRC2_CTRL or _150 or _153 or _156 or _157)
  begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_binary_sequancial_RS : begin
        _158 = _150;
      end
      `Src2CtrlEnum_binary_sequancial_IMI : begin
        _158 = {_153,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_binary_sequancial_IMS : begin
        _158 = {_156,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _158 = _157;
      end
    endcase
  end

  always @ (_172 or _178 or execute_REGFILE_WRITE_DATA)
  begin
    _173 = execute_REGFILE_WRITE_DATA;
    if(_172)begin
      _173 = _178;
    end
  end

  always @ (execute_SHIFT_CTRL or _174 or _177 or _179)
  begin
    if((execute_SHIFT_CTRL == _179))begin
      _178 = _174;
    end else begin
      _178 = _177;
    end
  end

  always @ (decode_INSTRUCTION or writeBack_INSTRUCTION or execute_INSTRUCTION or memory_INSTRUCTION or _188 or _189 or _191 or _192 or _196 or _198 or _199 or _201 or _203 or _204 or _206 or _208 or _209 or decode_RS1_USE or _211)
  begin
    _186 = _192;
    if(_188)begin
      if((_189 == decode_INSTRUCTION[19 : 15]))begin
        _186 = _191;
      end
    end
    if(_196)begin
      if(_198)begin
        if((writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _186 = _199;
        end
      end
    end
    if(_201)begin
      if(_203)begin
        if((memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _186 = _204;
        end
      end
    end
    if(_206)begin
      if(_208)begin
        if((execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]))begin
          _186 = _209;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _186 = _211;
    end
  end

  always @ (decode_INSTRUCTION or writeBack_INSTRUCTION or execute_INSTRUCTION or memory_INSTRUCTION or _188 or _189 or _193 or _194 or _196 or _198 or _200 or _201 or _203 or _205 or _206 or _208 or _210 or decode_RS2_USE or _212)
  begin
    _187 = _194;
    if(_188)begin
      if((_189 == decode_INSTRUCTION[24 : 20]))begin
        _187 = _193;
      end
    end
    if(_196)begin
      if(_198)begin
        if((writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _187 = _200;
        end
      end
    end
    if(_201)begin
      if(_203)begin
        if((memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _187 = _205;
        end
      end
    end
    if(_206)begin
      if(_208)begin
        if((execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]))begin
          _187 = _210;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _187 = _212;
    end
  end

  always @ (execute_SRC_LESS or execute_BranchPlugin_eq or _217 or _218 or _219 or _221 or _222)
  begin
    if((_217 == _218))begin
      _220 = execute_BranchPlugin_eq;
    end else if((_217 == _219))begin
      _220 = (! execute_BranchPlugin_eq);
    end else if(((_217 & _221) == _222))begin
      _220 = (! execute_SRC_LESS);
    end else begin
      _220 = execute_SRC_LESS;
    end
  end

  always @ (execute_BRANCH_CTRL or _214 or _215 or _216 or _220)
  begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequancial_INC : begin
        _223 = _214;
      end
      `BranchCtrlEnum_binary_sequancial_JAL : begin
        _223 = _215;
      end
      `BranchCtrlEnum_binary_sequancial_JALR : begin
        _223 = _216;
      end
      default : begin
        _223 = _220;
      end
    endcase
  end

  always @ (_230)
  begin
    _231[10] = _230;
    _231[9] = _230;
    _231[8] = _230;
    _231[7] = _230;
    _231[6] = _230;
    _231[5] = _230;
    _231[4] = _230;
    _231[3] = _230;
    _231[2] = _230;
    _231[1] = _230;
    _231[0] = _230;
  end

  always @ (_234)
  begin
    _235[19] = _234;
    _235[18] = _234;
    _235[17] = _234;
    _235[16] = _234;
    _235[15] = _234;
    _235[14] = _234;
    _235[13] = _234;
    _235[12] = _234;
    _235[11] = _234;
    _235[10] = _234;
    _235[9] = _234;
    _235[8] = _234;
    _235[7] = _234;
    _235[6] = _234;
    _235[5] = _234;
    _235[4] = _234;
    _235[3] = _234;
    _235[2] = _234;
    _235[1] = _234;
    _235[0] = _234;
  end

  always @ (_237)
  begin
    _238[18] = _237;
    _238[17] = _237;
    _238[16] = _237;
    _238[15] = _237;
    _238[14] = _237;
    _238[13] = _237;
    _238[12] = _237;
    _238[11] = _237;
    _238[10] = _237;
    _238[9] = _237;
    _238[8] = _237;
    _238[7] = _237;
    _238[6] = _237;
    _238[5] = _237;
    _238[4] = _237;
    _238[3] = _237;
    _238[2] = _237;
    _238[1] = _237;
    _238[0] = _237;
  end

  always @ (execute_INSTRUCTION or execute_BRANCH_CTRL or _231 or _232 or _235 or _238 or _239)
  begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequancial_JAL : begin
        _240 = {{_231,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},_232};
      end
      `BranchCtrlEnum_binary_sequancial_JALR : begin
        _240 = {_235,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _240 = {{_238,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},_239};
      end
    endcase
  end

  always @ (posedge clk)
  begin
    if(reset) begin
      prefetch_arbitration_isValid <= _1;
      fetch_arbitration_isValid <= _2;
      decode_arbitration_isValid <= _3;
      execute_arbitration_isValid <= _4;
      memory_arbitration_isValid <= _5;
      writeBack_arbitration_isValid <= _6;
      writeBack_FomalPlugin_order <= (64'b0000000000000000000000000000000000000000000000000000000000000000);
      prefetch_PcManagerSimplePlugin_pcReg <= (32'b00000000000000000000000000000000);
      prefetch_PcManagerSimplePlugin_inc <= _59;
      prefetch_IBusSimplePlugin_pendingCmd <= _69;
      _76 <= _75;
      _135 <= _136;
      execute_LightShifterPlugin_isActive <= _168;
      _188 <= _190;
      writeBack_REGFILE_WRITE_DATA <= (32'b00000000000000000000000000000000);
      writeBack_INSTRUCTION <= (32'b00000000000000000000000000000000);
    end else begin
      prefetch_arbitration_isValid <= _58;
      if(((! fetch_arbitration_isStuck) || fetch_arbitration_removeIt))begin
        fetch_arbitration_isValid <= _283;
      end
      if(((! prefetch_arbitration_isStuck) && (! prefetch_arbitration_removeIt)))begin
        fetch_arbitration_isValid <= prefetch_arbitration_isValid;
      end
      if(((! decode_arbitration_isStuck) || decode_arbitration_removeIt))begin
        decode_arbitration_isValid <= _284;
      end
      if(((! fetch_arbitration_isStuck) && (! fetch_arbitration_removeIt)))begin
        decode_arbitration_isValid <= fetch_arbitration_isValid;
      end
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= _285;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= _286;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= _287;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      if(writeBack_arbitration_isFiring)begin
        writeBack_FomalPlugin_order <= _10;
      end
      if(prefetch_PcManagerSimplePlugin_samplePcNext)begin
        prefetch_PcManagerSimplePlugin_pcReg <= prefetch_PcManagerSimplePlugin_pc;
      end
      if(prefetch_PcManagerSimplePlugin_jump_pcLoad_valid)begin
        prefetch_PcManagerSimplePlugin_inc <= _62;
      end
      if(prefetch_arbitration_isFiring)begin
        prefetch_PcManagerSimplePlugin_inc <= _65;
      end
      if(iBus_rsp_ready)begin
        prefetch_IBusSimplePlugin_pendingCmd <= _70;
      end
      if((_288 && iBus_cmd_ready))begin
        prefetch_IBusSimplePlugin_pendingCmd <= _71;
      end
      if(iBus_rsp_ready)begin
        _76 <= _77;
      end
      if((! fetch_arbitration_isStuck))begin
        _76 <= _78;
      end
      _135 <= _134;
      if(_172)begin
        if(_180)begin
          execute_LightShifterPlugin_isActive <= _181;
          if(execute_LightShifterPlugin_done)begin
            execute_LightShifterPlugin_isActive <= _183;
          end
        end
      end
      if(execute_arbitration_removeIt)begin
        execute_LightShifterPlugin_isActive <= _185;
      end
      _188 <= (_21 && writeBack_arbitration_isFiring);
      if((! writeBack_arbitration_isStuck))begin
        writeBack_REGFILE_WRITE_DATA <= memory_REGFILE_WRITE_DATA;
      end
      if((! writeBack_arbitration_isStuck))begin
        writeBack_INSTRUCTION <= memory_INSTRUCTION;
      end
    end
  end

  always @ (posedge clk)
  begin
    if (!((! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck)) || (! _98))) begin
      $display("ERROR DBusSimplePlugin doesn't allow memory stage stall when read happend");
    end
    if (!((! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_INSTRUCTION[5])) && writeBack_arbitration_isStuck)) || (! _106))) begin
      $display("ERROR DBusSimplePlugin doesn't allow memory stage stall when read happend");
    end
    RegFilePlugin_regFile_port0_data <= RegFilePlugin_regFile[RegFilePlugin_regFile_port0_address];
    RegFilePlugin_regFile_port1_data <= RegFilePlugin_regFile[RegFilePlugin_regFile_port1_address];
    if(RegFilePlugin_regFile_port2_enable)begin
      RegFilePlugin_regFile[RegFilePlugin_regFile_port2_address] <= RegFilePlugin_regFile_port2_data;
    end
    if (!((prefetch_arbitration_removeIt == _265) || (! _266))) begin
      $display("ERROR removeIt should never be asserted on this stage");
    end
    _43 <= writeBack_FomalPlugin_haltRequest;
    _44 <= _43;
    _45 <= _44;
    _46 <= _45;
    _47 <= _46;
    if((! _76))begin
      _79 <= iBus_rsp_inst;
    end
    if(_172)begin
      if(_180)begin
        execute_LightShifterPlugin_amplitudeReg <= _182;
      end
    end
    _189 <= _11[11 : 7];
    if((! memory_arbitration_isStuck))begin
      memory_REGFILE_WRITE_DATA <= _173;
    end
    if((! execute_arbitration_isStuck))begin
      execute_RS2_USE <= decode_RS2_USE;
    end
    if((! memory_arbitration_isStuck))begin
      memory_RS2_USE <= execute_RS2_USE;
    end
    if((! writeBack_arbitration_isStuck))begin
      writeBack_RS2_USE <= memory_RS2_USE;
    end
    if((! execute_arbitration_isStuck))begin
      execute_RS1 <= _145;
    end
    if((! memory_arbitration_isStuck))begin
      memory_RS1 <= execute_RS1;
    end
    if((! writeBack_arbitration_isStuck))begin
      writeBack_RS1 <= memory_RS1;
    end
    if((! execute_arbitration_isStuck))begin
      execute_RS2 <= _150;
    end
    if((! memory_arbitration_isStuck))begin
      memory_RS2 <= execute_RS2;
    end
    if((! writeBack_arbitration_isStuck))begin
      writeBack_RS2 <= memory_RS2;
    end
    if((! memory_arbitration_isStuck))begin
      memory_FORMAL_MEM_WDATA <= execute_FORMAL_MEM_WDATA;
    end
    if((! writeBack_arbitration_isStuck))begin
      writeBack_FORMAL_MEM_WDATA <= memory_FORMAL_MEM_WDATA;
    end
    if((! fetch_arbitration_isStuck))begin
      _250 <= _72;
    end
    if((! decode_arbitration_isStuck))begin
      _251 <= fetch_PC;
    end
    if((! execute_arbitration_isStuck))begin
      _252 <= _157;
    end
    if((! memory_arbitration_isStuck))begin
      _253 <= execute_PC;
    end
    if((! writeBack_arbitration_isStuck))begin
      _254 <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! writeBack_arbitration_isStuck))begin
      writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if((! execute_arbitration_isStuck))begin
      execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      execute_RS1_USE <= decode_RS1_USE;
    end
    if((! memory_arbitration_isStuck))begin
      memory_RS1_USE <= execute_RS1_USE;
    end
    if((! writeBack_arbitration_isStuck))begin
      writeBack_RS1_USE <= memory_RS1_USE;
    end
    if((! memory_arbitration_isStuck))begin
      memory_FORMAL_MEM_RMASK <= execute_FORMAL_MEM_RMASK;
    end
    if((! writeBack_arbitration_isStuck))begin
      writeBack_FORMAL_MEM_RMASK <= memory_FORMAL_MEM_RMASK;
    end
    if((! memory_arbitration_isStuck))begin
      _255 <= execute_FORMAL_MEM_ADDR;
    end
    if((! writeBack_arbitration_isStuck))begin
      _256 <= memory_FORMAL_MEM_ADDR;
    end
    if((! fetch_arbitration_isStuck))begin
      fetch_FORMAL_HALT <= _25;
    end
    if((! decode_arbitration_isStuck))begin
      decode_FORMAL_HALT <= _29;
    end
    if((! execute_arbitration_isStuck))begin
      execute_FORMAL_HALT <= _32;
    end
    if((! memory_arbitration_isStuck))begin
      memory_FORMAL_HALT <= _35;
    end
    if((! writeBack_arbitration_isStuck))begin
      writeBack_FORMAL_HALT <= _38;
    end
    if((! execute_arbitration_isStuck))begin
      execute_BRANCH_CTRL <= decode_BRANCH_CTRL;
    end
    if((! execute_arbitration_isStuck))begin
      execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! memory_arbitration_isStuck))begin
      memory_FORMAL_MEM_WMASK <= execute_FORMAL_MEM_WMASK;
    end
    if((! writeBack_arbitration_isStuck))begin
      writeBack_FORMAL_MEM_WMASK <= memory_FORMAL_MEM_WMASK;
    end
    if((! memory_arbitration_isStuck))begin
      _257 <= execute_BRANCH_CALC;
    end
    if((! decode_arbitration_isStuck))begin
      decode_INSTRUCTION <= _83;
    end
    if((! execute_arbitration_isStuck))begin
      execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! fetch_arbitration_isStuck))begin
      _258 <= prefetch_FORMAL_PC_NEXT;
    end
    if((! decode_arbitration_isStuck))begin
      _259 <= fetch_FORMAL_PC_NEXT;
    end
    if((! execute_arbitration_isStuck))begin
      _260 <= decode_FORMAL_PC_NEXT;
    end
    if((! memory_arbitration_isStuck))begin
      _261 <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      _262 <= _68;
    end
    if((! execute_arbitration_isStuck))begin
      execute_ALU_BITWISE_CTRL <= decode_ALU_BITWISE_CTRL;
    end
    if((! execute_arbitration_isStuck))begin
      execute_SRC1 <= decode_SRC1;
    end
    if((! execute_arbitration_isStuck))begin
      execute_ALU_CTRL <= decode_ALU_CTRL;
    end
    if((! execute_arbitration_isStuck))begin
      execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      execute_SRC2 <= decode_SRC2;
    end
    if((! memory_arbitration_isStuck))begin
      _263 <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      _264 <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! memory_arbitration_isStuck))begin
      memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! execute_arbitration_isStuck))begin
      execute_SHIFT_CTRL <= decode_SHIFT_CTRL;
    end
    if((! execute_arbitration_isStuck))begin
      execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
  end

endmodule

