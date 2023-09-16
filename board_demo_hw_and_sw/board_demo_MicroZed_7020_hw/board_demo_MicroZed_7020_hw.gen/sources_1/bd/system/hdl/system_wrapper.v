//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
//Date        : Sat Sep 16 18:43:49 2023
//Host        : VIKTOR-PC running 64-bit major release  (build 9200)
//Command     : generate_target system_wrapper.bd
//Design      : system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module system_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    J3_01,
    J3_02,
    J3_03,
    J3_04,
    J3_05,
    J3_06,
    J3_07,
    J3_08,
    J3_09,
    J3_10,
    J3_11,
    J3_12,
    J3_13,
    J3_14,
    J3_15,
    J3_16,
    J3_17,
    J3_18,
    J3_19,
    J3_20,
    J3_21,
    J3_22,
    J3_23,
    J3_24,
    J3_26,
    J3_27,
    J3_28,
    J3_29,
    J3_30,
    J3_31,
    J3_33_UART_TX,
    J3_34,
    J3_35,
    J3_36,
    J3_37,
    J3_38,
    J3_39,
    J3_40,
    J3_41,
    J3_42,
    J3_43,
    J3_44,
    J3_45,
    J3_48,
    J3_49,
    J3_52,
    J4_01,
    J4_02,
    J4_03,
    J4_04,
    J4_05,
    J4_06,
    J4_07,
    J4_08,
    J4_09,
    J4_10,
    J4_11,
    J4_12,
    J4_13,
    J4_14,
    J4_16,
    J4_17,
    J4_18,
    J4_19,
    J4_20,
    J4_21,
    J4_22,
    J4_23,
    J4_24,
    J4_25,
    J4_26,
    J4_27,
    J4_28,
    J4_29,
    J4_30,
    J4_31,
    J4_32,
    J4_33,
    J4_34,
    J4_35,
    J4_36,
    J4_37,
    J4_38,
    LED1,
    LED2,
    OSC_50MHZ,
    PMOD1_1,
    PMOD1_2,
    PMOD1_3,
    PMOD1_4,
    PMOD1_5,
    PMOD1_6,
    PMOD1_7,
    PMOD1_8,
    PMOD2_1,
    PMOD2_2,
    PMOD2_3,
    PMOD2_4,
    PMOD2_5,
    PMOD2_6,
    PMOD2_7,
    PMOD2_8,
    PMOD3_1,
    PMOD3_2,
    PMOD3_3,
    PMOD3_4,
    PMOD3_5,
    PMOD3_6,
    PMOD3_7,
    PMOD3_8,
    SWITCH1,
    SWITCH2);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output J3_01;
  output [0:0]J3_02;
  output [0:0]J3_03;
  output [0:0]J3_04;
  output [0:0]J3_05;
  output [0:0]J3_06;
  output [0:0]J3_07;
  output [0:0]J3_08;
  output [0:0]J3_09;
  output [0:0]J3_10;
  output [0:0]J3_11;
  output [0:0]J3_12;
  output [0:0]J3_13;
  output [0:0]J3_14;
  output [0:0]J3_15;
  output [0:0]J3_16;
  output [0:0]J3_17;
  output [0:0]J3_18;
  output [0:0]J3_19;
  output [0:0]J3_20;
  output [0:0]J3_21;
  output [0:0]J3_22;
  output [0:0]J3_23;
  output [0:0]J3_24;
  output [0:0]J3_26;
  output [0:0]J3_27;
  output [0:0]J3_28;
  output [0:0]J3_29;
  output [0:0]J3_30;
  output [0:0]J3_31;
  output J3_33_UART_TX;
  output [0:0]J3_34;
  output [0:0]J3_35;
  output [0:0]J3_36;
  output [0:0]J3_37;
  output [0:0]J3_38;
  output [0:0]J3_39;
  output [0:0]J3_40;
  output [0:0]J3_41;
  output [0:0]J3_42;
  output [0:0]J3_43;
  output [0:0]J3_44;
  output [0:0]J3_45;
  output [0:0]J3_48;
  output [0:0]J3_49;
  output [0:0]J3_52;
  output [0:0]J4_01;
  output [0:0]J4_02;
  output [0:0]J4_03;
  output [0:0]J4_04;
  output [0:0]J4_05;
  output [0:0]J4_06;
  output [0:0]J4_07;
  output [0:0]J4_08;
  output [0:0]J4_09;
  output [0:0]J4_10;
  output [0:0]J4_11;
  output [0:0]J4_12;
  output [0:0]J4_13;
  output [0:0]J4_14;
  output [0:0]J4_16;
  output [0:0]J4_17;
  output [0:0]J4_18;
  output [0:0]J4_19;
  output [0:0]J4_20;
  output [0:0]J4_21;
  output [0:0]J4_22;
  output [0:0]J4_23;
  output [0:0]J4_24;
  output [0:0]J4_25;
  output [0:0]J4_26;
  output [0:0]J4_27;
  output [0:0]J4_28;
  output [0:0]J4_29;
  output [0:0]J4_30;
  output [0:0]J4_31;
  output [0:0]J4_32;
  output [0:0]J4_33;
  output [0:0]J4_34;
  output [0:0]J4_35;
  output [0:0]J4_36;
  output [0:0]J4_37;
  output [0:0]J4_38;
  output [0:0]LED1;
  output [0:0]LED2;
  input OSC_50MHZ;
  output [0:0]PMOD1_1;
  output [0:0]PMOD1_2;
  output [0:0]PMOD1_3;
  output [0:0]PMOD1_4;
  output [0:0]PMOD1_5;
  output [0:0]PMOD1_6;
  output [0:0]PMOD1_7;
  output [0:0]PMOD1_8;
  output [0:0]PMOD2_1;
  output [0:0]PMOD2_2;
  output [0:0]PMOD2_3;
  output [0:0]PMOD2_4;
  output [0:0]PMOD2_5;
  output [0:0]PMOD2_6;
  output [0:0]PMOD2_7;
  output [0:0]PMOD2_8;
  output [0:0]PMOD3_1;
  output [0:0]PMOD3_2;
  output [0:0]PMOD3_3;
  output [0:0]PMOD3_4;
  output [0:0]PMOD3_5;
  output [0:0]PMOD3_6;
  output [0:0]PMOD3_7;
  output [0:0]PMOD3_8;
  input SWITCH1;
  input SWITCH2;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire J3_01;
  wire [0:0]J3_02;
  wire [0:0]J3_03;
  wire [0:0]J3_04;
  wire [0:0]J3_05;
  wire [0:0]J3_06;
  wire [0:0]J3_07;
  wire [0:0]J3_08;
  wire [0:0]J3_09;
  wire [0:0]J3_10;
  wire [0:0]J3_11;
  wire [0:0]J3_12;
  wire [0:0]J3_13;
  wire [0:0]J3_14;
  wire [0:0]J3_15;
  wire [0:0]J3_16;
  wire [0:0]J3_17;
  wire [0:0]J3_18;
  wire [0:0]J3_19;
  wire [0:0]J3_20;
  wire [0:0]J3_21;
  wire [0:0]J3_22;
  wire [0:0]J3_23;
  wire [0:0]J3_24;
  wire [0:0]J3_26;
  wire [0:0]J3_27;
  wire [0:0]J3_28;
  wire [0:0]J3_29;
  wire [0:0]J3_30;
  wire [0:0]J3_31;
  wire J3_33_UART_TX;
  wire [0:0]J3_34;
  wire [0:0]J3_35;
  wire [0:0]J3_36;
  wire [0:0]J3_37;
  wire [0:0]J3_38;
  wire [0:0]J3_39;
  wire [0:0]J3_40;
  wire [0:0]J3_41;
  wire [0:0]J3_42;
  wire [0:0]J3_43;
  wire [0:0]J3_44;
  wire [0:0]J3_45;
  wire [0:0]J3_48;
  wire [0:0]J3_49;
  wire [0:0]J3_52;
  wire [0:0]J4_01;
  wire [0:0]J4_02;
  wire [0:0]J4_03;
  wire [0:0]J4_04;
  wire [0:0]J4_05;
  wire [0:0]J4_06;
  wire [0:0]J4_07;
  wire [0:0]J4_08;
  wire [0:0]J4_09;
  wire [0:0]J4_10;
  wire [0:0]J4_11;
  wire [0:0]J4_12;
  wire [0:0]J4_13;
  wire [0:0]J4_14;
  wire [0:0]J4_16;
  wire [0:0]J4_17;
  wire [0:0]J4_18;
  wire [0:0]J4_19;
  wire [0:0]J4_20;
  wire [0:0]J4_21;
  wire [0:0]J4_22;
  wire [0:0]J4_23;
  wire [0:0]J4_24;
  wire [0:0]J4_25;
  wire [0:0]J4_26;
  wire [0:0]J4_27;
  wire [0:0]J4_28;
  wire [0:0]J4_29;
  wire [0:0]J4_30;
  wire [0:0]J4_31;
  wire [0:0]J4_32;
  wire [0:0]J4_33;
  wire [0:0]J4_34;
  wire [0:0]J4_35;
  wire [0:0]J4_36;
  wire [0:0]J4_37;
  wire [0:0]J4_38;
  wire [0:0]LED1;
  wire [0:0]LED2;
  wire OSC_50MHZ;
  wire [0:0]PMOD1_1;
  wire [0:0]PMOD1_2;
  wire [0:0]PMOD1_3;
  wire [0:0]PMOD1_4;
  wire [0:0]PMOD1_5;
  wire [0:0]PMOD1_6;
  wire [0:0]PMOD1_7;
  wire [0:0]PMOD1_8;
  wire [0:0]PMOD2_1;
  wire [0:0]PMOD2_2;
  wire [0:0]PMOD2_3;
  wire [0:0]PMOD2_4;
  wire [0:0]PMOD2_5;
  wire [0:0]PMOD2_6;
  wire [0:0]PMOD2_7;
  wire [0:0]PMOD2_8;
  wire [0:0]PMOD3_1;
  wire [0:0]PMOD3_2;
  wire [0:0]PMOD3_3;
  wire [0:0]PMOD3_4;
  wire [0:0]PMOD3_5;
  wire [0:0]PMOD3_6;
  wire [0:0]PMOD3_7;
  wire [0:0]PMOD3_8;
  wire SWITCH1;
  wire SWITCH2;

  system system_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .J3_01(J3_01),
        .J3_02(J3_02),
        .J3_03(J3_03),
        .J3_04(J3_04),
        .J3_05(J3_05),
        .J3_06(J3_06),
        .J3_07(J3_07),
        .J3_08(J3_08),
        .J3_09(J3_09),
        .J3_10(J3_10),
        .J3_11(J3_11),
        .J3_12(J3_12),
        .J3_13(J3_13),
        .J3_14(J3_14),
        .J3_15(J3_15),
        .J3_16(J3_16),
        .J3_17(J3_17),
        .J3_18(J3_18),
        .J3_19(J3_19),
        .J3_20(J3_20),
        .J3_21(J3_21),
        .J3_22(J3_22),
        .J3_23(J3_23),
        .J3_24(J3_24),
        .J3_26(J3_26),
        .J3_27(J3_27),
        .J3_28(J3_28),
        .J3_29(J3_29),
        .J3_30(J3_30),
        .J3_31(J3_31),
        .J3_33_UART_TX(J3_33_UART_TX),
        .J3_34(J3_34),
        .J3_35(J3_35),
        .J3_36(J3_36),
        .J3_37(J3_37),
        .J3_38(J3_38),
        .J3_39(J3_39),
        .J3_40(J3_40),
        .J3_41(J3_41),
        .J3_42(J3_42),
        .J3_43(J3_43),
        .J3_44(J3_44),
        .J3_45(J3_45),
        .J3_48(J3_48),
        .J3_49(J3_49),
        .J3_52(J3_52),
        .J4_01(J4_01),
        .J4_02(J4_02),
        .J4_03(J4_03),
        .J4_04(J4_04),
        .J4_05(J4_05),
        .J4_06(J4_06),
        .J4_07(J4_07),
        .J4_08(J4_08),
        .J4_09(J4_09),
        .J4_10(J4_10),
        .J4_11(J4_11),
        .J4_12(J4_12),
        .J4_13(J4_13),
        .J4_14(J4_14),
        .J4_16(J4_16),
        .J4_17(J4_17),
        .J4_18(J4_18),
        .J4_19(J4_19),
        .J4_20(J4_20),
        .J4_21(J4_21),
        .J4_22(J4_22),
        .J4_23(J4_23),
        .J4_24(J4_24),
        .J4_25(J4_25),
        .J4_26(J4_26),
        .J4_27(J4_27),
        .J4_28(J4_28),
        .J4_29(J4_29),
        .J4_30(J4_30),
        .J4_31(J4_31),
        .J4_32(J4_32),
        .J4_33(J4_33),
        .J4_34(J4_34),
        .J4_35(J4_35),
        .J4_36(J4_36),
        .J4_37(J4_37),
        .J4_38(J4_38),
        .LED1(LED1),
        .LED2(LED2),
        .OSC_50MHZ(OSC_50MHZ),
        .PMOD1_1(PMOD1_1),
        .PMOD1_2(PMOD1_2),
        .PMOD1_3(PMOD1_3),
        .PMOD1_4(PMOD1_4),
        .PMOD1_5(PMOD1_5),
        .PMOD1_6(PMOD1_6),
        .PMOD1_7(PMOD1_7),
        .PMOD1_8(PMOD1_8),
        .PMOD2_1(PMOD2_1),
        .PMOD2_2(PMOD2_2),
        .PMOD2_3(PMOD2_3),
        .PMOD2_4(PMOD2_4),
        .PMOD2_5(PMOD2_5),
        .PMOD2_6(PMOD2_6),
        .PMOD2_7(PMOD2_7),
        .PMOD2_8(PMOD2_8),
        .PMOD3_1(PMOD3_1),
        .PMOD3_2(PMOD3_2),
        .PMOD3_3(PMOD3_3),
        .PMOD3_4(PMOD3_4),
        .PMOD3_5(PMOD3_5),
        .PMOD3_6(PMOD3_6),
        .PMOD3_7(PMOD3_7),
        .PMOD3_8(PMOD3_8),
        .SWITCH1(SWITCH1),
        .SWITCH2(SWITCH2));
endmodule
