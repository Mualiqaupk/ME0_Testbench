`timescale 1ns / 1ps
module Mux_2_1(
input clk,
input rst_n,
input sel,
input datain,
output reg dataout
);

reg datain_1;
reg sel_1;
always @(posedge clk)
      casex ({sel_1,sel})
 		2'b00 		: dataout <= datain;
         	2'b01 		: dataout <= 1'b0;//zero stuff
		2'b1x 		: dataout <= datain_1;//zero stuff
        	default	:  dataout <= datain; 
      endcase

always@(posedge clk)
if(!rst_n)
datain_1<=0;
else 
datain_1<=datain;

always@(posedge clk)
if(!rst_n)
sel_1<=0;
else 
sel_1<=sel;


endmodule