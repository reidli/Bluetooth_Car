//Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
//Date        : Thu Jan 03 09:54:04 2019
//Host        : LAPTOP-7VSBDP8A running 64-bit major release  (build 9200)
//Command     : generate_target MIPSfpga_system_wrapper.bd
//Design      : MIPSfpga_system_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module MIPSfpga_system_wrapper
   (CLK100MHZ,
    CPU_RESETN,
    DDR2_SDRAM_addr,
    DDR2_SDRAM_ba,
    DDR2_SDRAM_cas_n,
    DDR2_SDRAM_ck_n,
    DDR2_SDRAM_ck_p,
    DDR2_SDRAM_cke,
    DDR2_SDRAM_cs_n,
    DDR2_SDRAM_dm,
    DDR2_SDRAM_dq,
    DDR2_SDRAM_dqs_n,
    DDR2_SDRAM_dqs_p,
    DDR2_SDRAM_odt,
    DDR2_SDRAM_ras_n,
    DDR2_SDRAM_we_n,
    Dir_clk,
    Dir_enable,
    Dir_latch,
    Dir_serial,
    JB1,
    JB2,
    JB3,
    JB4,
    JB7,
    JB8,
    LED,
    PWMs,
    Pwm0A,
    Pwm0B,
    Pwm2A,
    Pwm2B,
    UART_RXD_OUT,
    UART_TXD_IN,
    btin,
    btout,
    hs_in,
    hs_out,
    sencer_scl_io,
    sencer_sda_io,
    sxtrest,
    vgain,
    vgaout,
    vs_in,
    vs_out,
    xclk);
  input CLK100MHZ;
  input CPU_RESETN;
  output [12:0]DDR2_SDRAM_addr;
  output [2:0]DDR2_SDRAM_ba;
  output DDR2_SDRAM_cas_n;
  output [0:0]DDR2_SDRAM_ck_n;
  output [0:0]DDR2_SDRAM_ck_p;
  output [0:0]DDR2_SDRAM_cke;
  output [0:0]DDR2_SDRAM_cs_n;
  output [1:0]DDR2_SDRAM_dm;
  inout [15:0]DDR2_SDRAM_dq;
  inout [1:0]DDR2_SDRAM_dqs_n;
  inout [1:0]DDR2_SDRAM_dqs_p;
  output [0:0]DDR2_SDRAM_odt;
  output DDR2_SDRAM_ras_n;
  output DDR2_SDRAM_we_n;
  output Dir_clk;
  output Dir_enable;
  output Dir_latch;
  output Dir_serial;
  input JB1;
  input JB2;
  output JB3;
  input JB4;
  input JB7;
  input JB8;
  output [15:0]LED;
  output [1:0]PWMs;
  output Pwm0A;
  output Pwm0B;
  output Pwm2A;
  output Pwm2B;
  output UART_RXD_OUT;
  input UART_TXD_IN;
  input btin;
  output btout;
  input hs_in;
  output hs_out;
  inout sencer_scl_io;
  inout sencer_sda_io;
  output [0:0]sxtrest;
  input [7:0]vgain;
  output [7:0]vgaout;
  input vs_in;
  output vs_out;
  output xclk;

  wire CLK100MHZ;
  wire CPU_RESETN;
  wire [12:0]DDR2_SDRAM_addr;
  wire [2:0]DDR2_SDRAM_ba;
  wire DDR2_SDRAM_cas_n;
  wire [0:0]DDR2_SDRAM_ck_n;
  wire [0:0]DDR2_SDRAM_ck_p;
  wire [0:0]DDR2_SDRAM_cke;
  wire [0:0]DDR2_SDRAM_cs_n;
  wire [1:0]DDR2_SDRAM_dm;
  wire [15:0]DDR2_SDRAM_dq;
  wire [1:0]DDR2_SDRAM_dqs_n;
  wire [1:0]DDR2_SDRAM_dqs_p;
  wire [0:0]DDR2_SDRAM_odt;
  wire DDR2_SDRAM_ras_n;
  wire DDR2_SDRAM_we_n;
  wire Dir_clk;
  wire Dir_enable;
  wire Dir_latch;
  wire Dir_serial;
  wire JB1;
  wire JB2;
  wire JB3;
  wire JB4;
  wire JB7;
  wire JB8;
  wire [15:0]LED;
  wire [1:0]PWMs;
  wire Pwm0A;
  wire Pwm0B;
  wire Pwm2A;
  wire Pwm2B;
  wire UART_RXD_OUT;
  wire UART_TXD_IN;
  wire btin;
  wire btout;
  wire hs_in;
  wire hs_out;
  wire sencer_scl_i;
  wire sencer_scl_io;
  wire sencer_scl_o;
  wire sencer_scl_t;
  wire sencer_sda_i;
  wire sencer_sda_io;
  wire sencer_sda_o;
  wire sencer_sda_t;
  wire [0:0]sxtrest;
  wire [7:0]vgain;
  wire [7:0]vgaout;
  wire vs_in;
  wire vs_out;
  wire xclk;

  MIPSfpga_system MIPSfpga_system_i
       (.CLK100MHZ(CLK100MHZ),
        .CPU_RESETN(CPU_RESETN),
        .DDR2_SDRAM_addr(DDR2_SDRAM_addr),
        .DDR2_SDRAM_ba(DDR2_SDRAM_ba),
        .DDR2_SDRAM_cas_n(DDR2_SDRAM_cas_n),
        .DDR2_SDRAM_ck_n(DDR2_SDRAM_ck_n),
        .DDR2_SDRAM_ck_p(DDR2_SDRAM_ck_p),
        .DDR2_SDRAM_cke(DDR2_SDRAM_cke),
        .DDR2_SDRAM_cs_n(DDR2_SDRAM_cs_n),
        .DDR2_SDRAM_dm(DDR2_SDRAM_dm),
        .DDR2_SDRAM_dq(DDR2_SDRAM_dq),
        .DDR2_SDRAM_dqs_n(DDR2_SDRAM_dqs_n),
        .DDR2_SDRAM_dqs_p(DDR2_SDRAM_dqs_p),
        .DDR2_SDRAM_odt(DDR2_SDRAM_odt),
        .DDR2_SDRAM_ras_n(DDR2_SDRAM_ras_n),
        .DDR2_SDRAM_we_n(DDR2_SDRAM_we_n),
        .Dir_clk(Dir_clk),
        .Dir_enable(Dir_enable),
        .Dir_latch(Dir_latch),
        .Dir_serial(Dir_serial),
        .JB1(JB1),
        .JB2(JB2),
        .JB3(JB3),
        .JB4(JB4),
        .JB7(JB7),
        .JB8(JB8),
        .LED(LED),
        .PWMs(PWMs),
        .Pwm0A(Pwm0A),
        .Pwm0B(Pwm0B),
        .Pwm2A(Pwm2A),
        .Pwm2B(Pwm2B),
        .UART_RXD_OUT(UART_RXD_OUT),
        .UART_TXD_IN(UART_TXD_IN),
        .btin(btin),
        .btout(btout),
        .hs_in(hs_in),
        .hs_out(hs_out),
        .sencer_scl_i(sencer_scl_i),
        .sencer_scl_o(sencer_scl_o),
        .sencer_scl_t(sencer_scl_t),
        .sencer_sda_i(sencer_sda_i),
        .sencer_sda_o(sencer_sda_o),
        .sencer_sda_t(sencer_sda_t),
        .sxtrest(sxtrest),
        .vgain(vgain),
        .vgaout(vgaout),
        .vs_in(vs_in),
        .vs_out(vs_out),
        .xclk(xclk));
  IOBUF sencer_scl_iobuf
       (.I(sencer_scl_o),
        .IO(sencer_scl_io),
        .O(sencer_scl_i),
        .T(sencer_scl_t));
  IOBUF sencer_sda_iobuf
       (.I(sencer_sda_o),
        .IO(sencer_sda_io),
        .O(sencer_sda_i),
        .T(sencer_sda_t));
endmodule
