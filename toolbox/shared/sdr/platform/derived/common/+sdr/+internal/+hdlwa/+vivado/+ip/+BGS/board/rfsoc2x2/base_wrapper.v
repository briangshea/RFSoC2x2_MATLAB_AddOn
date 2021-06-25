//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Fri Jun 25 13:26:44 2021
//Host        : brian-MS-7B24 running 64-bit Linux Mint 20.1
//Command     : generate_target base_wrapper.bd
//Design      : base_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module base_wrapper
   (Vp_Vn_v_n,
    Vp_Vn_v_p,
    adc0_clk_clk_n,
    adc0_clk_clk_p,
    ddr4_pl_act_n,
    ddr4_pl_adr,
    ddr4_pl_ba,
    ddr4_pl_bg,
    ddr4_pl_ck_c,
    ddr4_pl_ck_t,
    ddr4_pl_cke,
    ddr4_pl_cs_n,
    ddr4_pl_dm_n,
    ddr4_pl_dq,
    ddr4_pl_dqs_c,
    ddr4_pl_dqs_t,
    ddr4_pl_odt,
    ddr4_pl_reset_n,
    dp_aux_data_in,
    dp_aux_data_oe,
    dp_aux_data_out,
    dp_hot_plug_detect,
    lmk_reset,
    sys_clk_ddr4_clk_n,
    sys_clk_ddr4_clk_p,
    sysref_in_diff_n,
    sysref_in_diff_p,
    syzygy_std0_tri_io,
    syzygy_vio_en,
    vin0_01_v_n,
    vin0_01_v_p);
  input Vp_Vn_v_n;
  input Vp_Vn_v_p;
  input adc0_clk_clk_n;
  input adc0_clk_clk_p;
  output ddr4_pl_act_n;
  output [16:0]ddr4_pl_adr;
  output [1:0]ddr4_pl_ba;
  output [0:0]ddr4_pl_bg;
  output [0:0]ddr4_pl_ck_c;
  output [0:0]ddr4_pl_ck_t;
  output [0:0]ddr4_pl_cke;
  output [0:0]ddr4_pl_cs_n;
  inout [7:0]ddr4_pl_dm_n;
  inout [63:0]ddr4_pl_dq;
  inout [7:0]ddr4_pl_dqs_c;
  inout [7:0]ddr4_pl_dqs_t;
  output [0:0]ddr4_pl_odt;
  output ddr4_pl_reset_n;
  input dp_aux_data_in;
  output [0:0]dp_aux_data_oe;
  output dp_aux_data_out;
  input dp_hot_plug_detect;
  output [0:0]lmk_reset;
  input [0:0]sys_clk_ddr4_clk_n;
  input [0:0]sys_clk_ddr4_clk_p;
  input sysref_in_diff_n;
  input sysref_in_diff_p;
  inout [31:0]syzygy_std0_tri_io;
  output [0:0]syzygy_vio_en;
  input vin0_01_v_n;
  input vin0_01_v_p;

  wire Vp_Vn_v_n;
  wire Vp_Vn_v_p;
  wire adc0_clk_clk_n;
  wire adc0_clk_clk_p;
  wire ddr4_pl_act_n;
  wire [16:0]ddr4_pl_adr;
  wire [1:0]ddr4_pl_ba;
  wire [0:0]ddr4_pl_bg;
  wire [0:0]ddr4_pl_ck_c;
  wire [0:0]ddr4_pl_ck_t;
  wire [0:0]ddr4_pl_cke;
  wire [0:0]ddr4_pl_cs_n;
  wire [7:0]ddr4_pl_dm_n;
  wire [63:0]ddr4_pl_dq;
  wire [7:0]ddr4_pl_dqs_c;
  wire [7:0]ddr4_pl_dqs_t;
  wire [0:0]ddr4_pl_odt;
  wire ddr4_pl_reset_n;
  wire dp_aux_data_in;
  wire [0:0]dp_aux_data_oe;
  wire dp_aux_data_out;
  wire dp_hot_plug_detect;
  wire [0:0]lmk_reset;
  wire [0:0]sys_clk_ddr4_clk_n;
  wire [0:0]sys_clk_ddr4_clk_p;
  wire sysref_in_diff_n;
  wire sysref_in_diff_p;
  wire [0:0]syzygy_std0_tri_i_0;
  wire [1:1]syzygy_std0_tri_i_1;
  wire [10:10]syzygy_std0_tri_i_10;
  wire [11:11]syzygy_std0_tri_i_11;
  wire [12:12]syzygy_std0_tri_i_12;
  wire [13:13]syzygy_std0_tri_i_13;
  wire [14:14]syzygy_std0_tri_i_14;
  wire [15:15]syzygy_std0_tri_i_15;
  wire [16:16]syzygy_std0_tri_i_16;
  wire [17:17]syzygy_std0_tri_i_17;
  wire [18:18]syzygy_std0_tri_i_18;
  wire [19:19]syzygy_std0_tri_i_19;
  wire [2:2]syzygy_std0_tri_i_2;
  wire [20:20]syzygy_std0_tri_i_20;
  wire [21:21]syzygy_std0_tri_i_21;
  wire [22:22]syzygy_std0_tri_i_22;
  wire [23:23]syzygy_std0_tri_i_23;
  wire [24:24]syzygy_std0_tri_i_24;
  wire [25:25]syzygy_std0_tri_i_25;
  wire [26:26]syzygy_std0_tri_i_26;
  wire [27:27]syzygy_std0_tri_i_27;
  wire [28:28]syzygy_std0_tri_i_28;
  wire [29:29]syzygy_std0_tri_i_29;
  wire [3:3]syzygy_std0_tri_i_3;
  wire [30:30]syzygy_std0_tri_i_30;
  wire [31:31]syzygy_std0_tri_i_31;
  wire [4:4]syzygy_std0_tri_i_4;
  wire [5:5]syzygy_std0_tri_i_5;
  wire [6:6]syzygy_std0_tri_i_6;
  wire [7:7]syzygy_std0_tri_i_7;
  wire [8:8]syzygy_std0_tri_i_8;
  wire [9:9]syzygy_std0_tri_i_9;
  wire [0:0]syzygy_std0_tri_io_0;
  wire [1:1]syzygy_std0_tri_io_1;
  wire [10:10]syzygy_std0_tri_io_10;
  wire [11:11]syzygy_std0_tri_io_11;
  wire [12:12]syzygy_std0_tri_io_12;
  wire [13:13]syzygy_std0_tri_io_13;
  wire [14:14]syzygy_std0_tri_io_14;
  wire [15:15]syzygy_std0_tri_io_15;
  wire [16:16]syzygy_std0_tri_io_16;
  wire [17:17]syzygy_std0_tri_io_17;
  wire [18:18]syzygy_std0_tri_io_18;
  wire [19:19]syzygy_std0_tri_io_19;
  wire [2:2]syzygy_std0_tri_io_2;
  wire [20:20]syzygy_std0_tri_io_20;
  wire [21:21]syzygy_std0_tri_io_21;
  wire [22:22]syzygy_std0_tri_io_22;
  wire [23:23]syzygy_std0_tri_io_23;
  wire [24:24]syzygy_std0_tri_io_24;
  wire [25:25]syzygy_std0_tri_io_25;
  wire [26:26]syzygy_std0_tri_io_26;
  wire [27:27]syzygy_std0_tri_io_27;
  wire [28:28]syzygy_std0_tri_io_28;
  wire [29:29]syzygy_std0_tri_io_29;
  wire [3:3]syzygy_std0_tri_io_3;
  wire [30:30]syzygy_std0_tri_io_30;
  wire [31:31]syzygy_std0_tri_io_31;
  wire [4:4]syzygy_std0_tri_io_4;
  wire [5:5]syzygy_std0_tri_io_5;
  wire [6:6]syzygy_std0_tri_io_6;
  wire [7:7]syzygy_std0_tri_io_7;
  wire [8:8]syzygy_std0_tri_io_8;
  wire [9:9]syzygy_std0_tri_io_9;
  wire [0:0]syzygy_std0_tri_o_0;
  wire [1:1]syzygy_std0_tri_o_1;
  wire [10:10]syzygy_std0_tri_o_10;
  wire [11:11]syzygy_std0_tri_o_11;
  wire [12:12]syzygy_std0_tri_o_12;
  wire [13:13]syzygy_std0_tri_o_13;
  wire [14:14]syzygy_std0_tri_o_14;
  wire [15:15]syzygy_std0_tri_o_15;
  wire [16:16]syzygy_std0_tri_o_16;
  wire [17:17]syzygy_std0_tri_o_17;
  wire [18:18]syzygy_std0_tri_o_18;
  wire [19:19]syzygy_std0_tri_o_19;
  wire [2:2]syzygy_std0_tri_o_2;
  wire [20:20]syzygy_std0_tri_o_20;
  wire [21:21]syzygy_std0_tri_o_21;
  wire [22:22]syzygy_std0_tri_o_22;
  wire [23:23]syzygy_std0_tri_o_23;
  wire [24:24]syzygy_std0_tri_o_24;
  wire [25:25]syzygy_std0_tri_o_25;
  wire [26:26]syzygy_std0_tri_o_26;
  wire [27:27]syzygy_std0_tri_o_27;
  wire [28:28]syzygy_std0_tri_o_28;
  wire [29:29]syzygy_std0_tri_o_29;
  wire [3:3]syzygy_std0_tri_o_3;
  wire [30:30]syzygy_std0_tri_o_30;
  wire [31:31]syzygy_std0_tri_o_31;
  wire [4:4]syzygy_std0_tri_o_4;
  wire [5:5]syzygy_std0_tri_o_5;
  wire [6:6]syzygy_std0_tri_o_6;
  wire [7:7]syzygy_std0_tri_o_7;
  wire [8:8]syzygy_std0_tri_o_8;
  wire [9:9]syzygy_std0_tri_o_9;
  wire [0:0]syzygy_std0_tri_t_0;
  wire [1:1]syzygy_std0_tri_t_1;
  wire [10:10]syzygy_std0_tri_t_10;
  wire [11:11]syzygy_std0_tri_t_11;
  wire [12:12]syzygy_std0_tri_t_12;
  wire [13:13]syzygy_std0_tri_t_13;
  wire [14:14]syzygy_std0_tri_t_14;
  wire [15:15]syzygy_std0_tri_t_15;
  wire [16:16]syzygy_std0_tri_t_16;
  wire [17:17]syzygy_std0_tri_t_17;
  wire [18:18]syzygy_std0_tri_t_18;
  wire [19:19]syzygy_std0_tri_t_19;
  wire [2:2]syzygy_std0_tri_t_2;
  wire [20:20]syzygy_std0_tri_t_20;
  wire [21:21]syzygy_std0_tri_t_21;
  wire [22:22]syzygy_std0_tri_t_22;
  wire [23:23]syzygy_std0_tri_t_23;
  wire [24:24]syzygy_std0_tri_t_24;
  wire [25:25]syzygy_std0_tri_t_25;
  wire [26:26]syzygy_std0_tri_t_26;
  wire [27:27]syzygy_std0_tri_t_27;
  wire [28:28]syzygy_std0_tri_t_28;
  wire [29:29]syzygy_std0_tri_t_29;
  wire [3:3]syzygy_std0_tri_t_3;
  wire [30:30]syzygy_std0_tri_t_30;
  wire [31:31]syzygy_std0_tri_t_31;
  wire [4:4]syzygy_std0_tri_t_4;
  wire [5:5]syzygy_std0_tri_t_5;
  wire [6:6]syzygy_std0_tri_t_6;
  wire [7:7]syzygy_std0_tri_t_7;
  wire [8:8]syzygy_std0_tri_t_8;
  wire [9:9]syzygy_std0_tri_t_9;
  wire [0:0]syzygy_vio_en;
  wire vin0_01_v_n;
  wire vin0_01_v_p;

  base base_i
       (.Vp_Vn_v_n(Vp_Vn_v_n),
        .Vp_Vn_v_p(Vp_Vn_v_p),
        .adc0_clk_clk_n(adc0_clk_clk_n),
        .adc0_clk_clk_p(adc0_clk_clk_p),
        .ddr4_pl_act_n(ddr4_pl_act_n),
        .ddr4_pl_adr(ddr4_pl_adr),
        .ddr4_pl_ba(ddr4_pl_ba),
        .ddr4_pl_bg(ddr4_pl_bg),
        .ddr4_pl_ck_c(ddr4_pl_ck_c),
        .ddr4_pl_ck_t(ddr4_pl_ck_t),
        .ddr4_pl_cke(ddr4_pl_cke),
        .ddr4_pl_cs_n(ddr4_pl_cs_n),
        .ddr4_pl_dm_n(ddr4_pl_dm_n),
        .ddr4_pl_dq(ddr4_pl_dq),
        .ddr4_pl_dqs_c(ddr4_pl_dqs_c),
        .ddr4_pl_dqs_t(ddr4_pl_dqs_t),
        .ddr4_pl_odt(ddr4_pl_odt),
        .ddr4_pl_reset_n(ddr4_pl_reset_n),
        .dp_aux_data_in(dp_aux_data_in),
        .dp_aux_data_oe(dp_aux_data_oe),
        .dp_aux_data_out(dp_aux_data_out),
        .dp_hot_plug_detect(dp_hot_plug_detect),
        .lmk_reset(lmk_reset),
        .sys_clk_ddr4_clk_n(sys_clk_ddr4_clk_n),
        .sys_clk_ddr4_clk_p(sys_clk_ddr4_clk_p),
        .sysref_in_diff_n(sysref_in_diff_n),
        .sysref_in_diff_p(sysref_in_diff_p),
        .syzygy_std0_tri_i({syzygy_std0_tri_i_31,syzygy_std0_tri_i_30,syzygy_std0_tri_i_29,syzygy_std0_tri_i_28,syzygy_std0_tri_i_27,syzygy_std0_tri_i_26,syzygy_std0_tri_i_25,syzygy_std0_tri_i_24,syzygy_std0_tri_i_23,syzygy_std0_tri_i_22,syzygy_std0_tri_i_21,syzygy_std0_tri_i_20,syzygy_std0_tri_i_19,syzygy_std0_tri_i_18,syzygy_std0_tri_i_17,syzygy_std0_tri_i_16,syzygy_std0_tri_i_15,syzygy_std0_tri_i_14,syzygy_std0_tri_i_13,syzygy_std0_tri_i_12,syzygy_std0_tri_i_11,syzygy_std0_tri_i_10,syzygy_std0_tri_i_9,syzygy_std0_tri_i_8,syzygy_std0_tri_i_7,syzygy_std0_tri_i_6,syzygy_std0_tri_i_5,syzygy_std0_tri_i_4,syzygy_std0_tri_i_3,syzygy_std0_tri_i_2,syzygy_std0_tri_i_1,syzygy_std0_tri_i_0}),
        .syzygy_std0_tri_o({syzygy_std0_tri_o_31,syzygy_std0_tri_o_30,syzygy_std0_tri_o_29,syzygy_std0_tri_o_28,syzygy_std0_tri_o_27,syzygy_std0_tri_o_26,syzygy_std0_tri_o_25,syzygy_std0_tri_o_24,syzygy_std0_tri_o_23,syzygy_std0_tri_o_22,syzygy_std0_tri_o_21,syzygy_std0_tri_o_20,syzygy_std0_tri_o_19,syzygy_std0_tri_o_18,syzygy_std0_tri_o_17,syzygy_std0_tri_o_16,syzygy_std0_tri_o_15,syzygy_std0_tri_o_14,syzygy_std0_tri_o_13,syzygy_std0_tri_o_12,syzygy_std0_tri_o_11,syzygy_std0_tri_o_10,syzygy_std0_tri_o_9,syzygy_std0_tri_o_8,syzygy_std0_tri_o_7,syzygy_std0_tri_o_6,syzygy_std0_tri_o_5,syzygy_std0_tri_o_4,syzygy_std0_tri_o_3,syzygy_std0_tri_o_2,syzygy_std0_tri_o_1,syzygy_std0_tri_o_0}),
        .syzygy_std0_tri_t({syzygy_std0_tri_t_31,syzygy_std0_tri_t_30,syzygy_std0_tri_t_29,syzygy_std0_tri_t_28,syzygy_std0_tri_t_27,syzygy_std0_tri_t_26,syzygy_std0_tri_t_25,syzygy_std0_tri_t_24,syzygy_std0_tri_t_23,syzygy_std0_tri_t_22,syzygy_std0_tri_t_21,syzygy_std0_tri_t_20,syzygy_std0_tri_t_19,syzygy_std0_tri_t_18,syzygy_std0_tri_t_17,syzygy_std0_tri_t_16,syzygy_std0_tri_t_15,syzygy_std0_tri_t_14,syzygy_std0_tri_t_13,syzygy_std0_tri_t_12,syzygy_std0_tri_t_11,syzygy_std0_tri_t_10,syzygy_std0_tri_t_9,syzygy_std0_tri_t_8,syzygy_std0_tri_t_7,syzygy_std0_tri_t_6,syzygy_std0_tri_t_5,syzygy_std0_tri_t_4,syzygy_std0_tri_t_3,syzygy_std0_tri_t_2,syzygy_std0_tri_t_1,syzygy_std0_tri_t_0}),
        .syzygy_vio_en(syzygy_vio_en),
        .vin0_01_v_n(vin0_01_v_n),
        .vin0_01_v_p(vin0_01_v_p));
  IOBUF syzygy_std0_tri_iobuf_0
       (.I(syzygy_std0_tri_o_0),
        .IO(syzygy_std0_tri_io[0]),
        .O(syzygy_std0_tri_i_0),
        .T(syzygy_std0_tri_t_0));
  IOBUF syzygy_std0_tri_iobuf_1
       (.I(syzygy_std0_tri_o_1),
        .IO(syzygy_std0_tri_io[1]),
        .O(syzygy_std0_tri_i_1),
        .T(syzygy_std0_tri_t_1));
  IOBUF syzygy_std0_tri_iobuf_10
       (.I(syzygy_std0_tri_o_10),
        .IO(syzygy_std0_tri_io[10]),
        .O(syzygy_std0_tri_i_10),
        .T(syzygy_std0_tri_t_10));
  IOBUF syzygy_std0_tri_iobuf_11
       (.I(syzygy_std0_tri_o_11),
        .IO(syzygy_std0_tri_io[11]),
        .O(syzygy_std0_tri_i_11),
        .T(syzygy_std0_tri_t_11));
  IOBUF syzygy_std0_tri_iobuf_12
       (.I(syzygy_std0_tri_o_12),
        .IO(syzygy_std0_tri_io[12]),
        .O(syzygy_std0_tri_i_12),
        .T(syzygy_std0_tri_t_12));
  IOBUF syzygy_std0_tri_iobuf_13
       (.I(syzygy_std0_tri_o_13),
        .IO(syzygy_std0_tri_io[13]),
        .O(syzygy_std0_tri_i_13),
        .T(syzygy_std0_tri_t_13));
  IOBUF syzygy_std0_tri_iobuf_14
       (.I(syzygy_std0_tri_o_14),
        .IO(syzygy_std0_tri_io[14]),
        .O(syzygy_std0_tri_i_14),
        .T(syzygy_std0_tri_t_14));
  IOBUF syzygy_std0_tri_iobuf_15
       (.I(syzygy_std0_tri_o_15),
        .IO(syzygy_std0_tri_io[15]),
        .O(syzygy_std0_tri_i_15),
        .T(syzygy_std0_tri_t_15));
  IOBUF syzygy_std0_tri_iobuf_16
       (.I(syzygy_std0_tri_o_16),
        .IO(syzygy_std0_tri_io[16]),
        .O(syzygy_std0_tri_i_16),
        .T(syzygy_std0_tri_t_16));
  IOBUF syzygy_std0_tri_iobuf_17
       (.I(syzygy_std0_tri_o_17),
        .IO(syzygy_std0_tri_io[17]),
        .O(syzygy_std0_tri_i_17),
        .T(syzygy_std0_tri_t_17));
  IOBUF syzygy_std0_tri_iobuf_18
       (.I(syzygy_std0_tri_o_18),
        .IO(syzygy_std0_tri_io[18]),
        .O(syzygy_std0_tri_i_18),
        .T(syzygy_std0_tri_t_18));
  IOBUF syzygy_std0_tri_iobuf_19
       (.I(syzygy_std0_tri_o_19),
        .IO(syzygy_std0_tri_io[19]),
        .O(syzygy_std0_tri_i_19),
        .T(syzygy_std0_tri_t_19));
  IOBUF syzygy_std0_tri_iobuf_2
       (.I(syzygy_std0_tri_o_2),
        .IO(syzygy_std0_tri_io[2]),
        .O(syzygy_std0_tri_i_2),
        .T(syzygy_std0_tri_t_2));
  IOBUF syzygy_std0_tri_iobuf_20
       (.I(syzygy_std0_tri_o_20),
        .IO(syzygy_std0_tri_io[20]),
        .O(syzygy_std0_tri_i_20),
        .T(syzygy_std0_tri_t_20));
  IOBUF syzygy_std0_tri_iobuf_21
       (.I(syzygy_std0_tri_o_21),
        .IO(syzygy_std0_tri_io[21]),
        .O(syzygy_std0_tri_i_21),
        .T(syzygy_std0_tri_t_21));
  IOBUF syzygy_std0_tri_iobuf_22
       (.I(syzygy_std0_tri_o_22),
        .IO(syzygy_std0_tri_io[22]),
        .O(syzygy_std0_tri_i_22),
        .T(syzygy_std0_tri_t_22));
  IOBUF syzygy_std0_tri_iobuf_23
       (.I(syzygy_std0_tri_o_23),
        .IO(syzygy_std0_tri_io[23]),
        .O(syzygy_std0_tri_i_23),
        .T(syzygy_std0_tri_t_23));
  IOBUF syzygy_std0_tri_iobuf_24
       (.I(syzygy_std0_tri_o_24),
        .IO(syzygy_std0_tri_io[24]),
        .O(syzygy_std0_tri_i_24),
        .T(syzygy_std0_tri_t_24));
  IOBUF syzygy_std0_tri_iobuf_25
       (.I(syzygy_std0_tri_o_25),
        .IO(syzygy_std0_tri_io[25]),
        .O(syzygy_std0_tri_i_25),
        .T(syzygy_std0_tri_t_25));
  IOBUF syzygy_std0_tri_iobuf_26
       (.I(syzygy_std0_tri_o_26),
        .IO(syzygy_std0_tri_io[26]),
        .O(syzygy_std0_tri_i_26),
        .T(syzygy_std0_tri_t_26));
  IOBUF syzygy_std0_tri_iobuf_27
       (.I(syzygy_std0_tri_o_27),
        .IO(syzygy_std0_tri_io[27]),
        .O(syzygy_std0_tri_i_27),
        .T(syzygy_std0_tri_t_27));
  IOBUF syzygy_std0_tri_iobuf_28
       (.I(syzygy_std0_tri_o_28),
        .IO(syzygy_std0_tri_io[28]),
        .O(syzygy_std0_tri_i_28),
        .T(syzygy_std0_tri_t_28));
  IOBUF syzygy_std0_tri_iobuf_29
       (.I(syzygy_std0_tri_o_29),
        .IO(syzygy_std0_tri_io[29]),
        .O(syzygy_std0_tri_i_29),
        .T(syzygy_std0_tri_t_29));
  IOBUF syzygy_std0_tri_iobuf_3
       (.I(syzygy_std0_tri_o_3),
        .IO(syzygy_std0_tri_io[3]),
        .O(syzygy_std0_tri_i_3),
        .T(syzygy_std0_tri_t_3));
  IOBUF syzygy_std0_tri_iobuf_30
       (.I(syzygy_std0_tri_o_30),
        .IO(syzygy_std0_tri_io[30]),
        .O(syzygy_std0_tri_i_30),
        .T(syzygy_std0_tri_t_30));
  IOBUF syzygy_std0_tri_iobuf_31
       (.I(syzygy_std0_tri_o_31),
        .IO(syzygy_std0_tri_io[31]),
        .O(syzygy_std0_tri_i_31),
        .T(syzygy_std0_tri_t_31));
  IOBUF syzygy_std0_tri_iobuf_4
       (.I(syzygy_std0_tri_o_4),
        .IO(syzygy_std0_tri_io[4]),
        .O(syzygy_std0_tri_i_4),
        .T(syzygy_std0_tri_t_4));
  IOBUF syzygy_std0_tri_iobuf_5
       (.I(syzygy_std0_tri_o_5),
        .IO(syzygy_std0_tri_io[5]),
        .O(syzygy_std0_tri_i_5),
        .T(syzygy_std0_tri_t_5));
  IOBUF syzygy_std0_tri_iobuf_6
       (.I(syzygy_std0_tri_o_6),
        .IO(syzygy_std0_tri_io[6]),
        .O(syzygy_std0_tri_i_6),
        .T(syzygy_std0_tri_t_6));
  IOBUF syzygy_std0_tri_iobuf_7
       (.I(syzygy_std0_tri_o_7),
        .IO(syzygy_std0_tri_io[7]),
        .O(syzygy_std0_tri_i_7),
        .T(syzygy_std0_tri_t_7));
  IOBUF syzygy_std0_tri_iobuf_8
       (.I(syzygy_std0_tri_o_8),
        .IO(syzygy_std0_tri_io[8]),
        .O(syzygy_std0_tri_i_8),
        .T(syzygy_std0_tri_t_8));
  IOBUF syzygy_std0_tri_iobuf_9
       (.I(syzygy_std0_tri_o_9),
        .IO(syzygy_std0_tri_io[9]),
        .O(syzygy_std0_tri_i_9),
        .T(syzygy_std0_tri_t_9));
endmodule
