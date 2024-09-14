// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:F1_F2_FILTER:1.0
// IP Revision: 1

(* X_CORE_INFO = "F1_F2_FILTER,Vivado 2017.4" *)
(* CHECK_LICENSE_TYPE = "HDLC_DPA_F1_F2_FILTER_0,F1_F2_FILTER,{}" *)
(* CORE_GENERATION_INFO = "HDLC_DPA_F1_F2_FILTER_0,F1_F2_FILTER,{x_ipProduct=Vivado 2017.4,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=F1_F2_FILTER,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,IDLE=001,FILTER_DATA=010,SEND_PACKET=100,F1=01111110,F2=10000001,F3=11111101,F4=00000010,F5=11111010,F6=00000101,F7=11110100,F8=00001011,F9=11101000,F10=00010111,F11=11010000,F12=00101111,F13=10100000,F14=01011111,F15=01000000,F16=10111111,H0A=00011110,H0B=01011110,H1A=00011010,H1B=01010110\
,NUM_BYTES=11001}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module HDLC_DPA_F1_F2_FILTER_0 (
  clk40,
  rst_n,
  bit_aligned,
  d_in,
  dv,
  d_out
);

input wire clk40;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst_n, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst_n RST" *)
input wire rst_n;
input wire bit_aligned;
input wire [7 : 0] d_in;
output wire dv;
output wire [31 : 0] d_out;

  F1_F2_FILTER #(
    .IDLE(3'B001),
    .FILTER_DATA(3'B010),
    .SEND_PACKET(3'B100),
    .F1(8'B01111110),
    .F2(8'B10000001),
    .F3(8'B11111101),
    .F4(8'B00000010),
    .F5(8'B11111010),
    .F6(8'B00000101),
    .F7(8'B11110100),
    .F8(8'B00001011),
    .F9(8'B11101000),
    .F10(8'B00010111),
    .F11(8'B11010000),
    .F12(8'B00101111),
    .F13(8'B10100000),
    .F14(8'B01011111),
    .F15(8'B01000000),
    .F16(8'B10111111),
    .H0A(8'B00011110),
    .H0B(8'B01011110),
    .H1A(8'B00011010),
    .H1B(8'B01010110),
    .NUM_BYTES(5'B11001)
  ) inst (
    .clk40(clk40),
    .rst_n(rst_n),
    .bit_aligned(bit_aligned),
    .d_in(d_in),
    .dv(dv),
    .d_out(d_out)
  );
endmodule
