`timescale 1ns / 1ps
module Mux_8_1(
input clk,
input rst_n,
input [2:0]sel,
input [7:0]datain,
output reg dataout,
input wire five_ones
);

always @(posedge clk)
if(!rst_n)
dataout<=0;
else if(!five_ones)
begin
      case (sel)
         3'b000 : dataout <= datain[0];
         3'b001 : dataout <= datain[1];
         3'b010 : dataout <= datain[2];
         3'b011 : dataout <= datain[3];
         3'b100 : dataout <= datain[4];
         3'b101 : dataout <= datain[5];
         3'b110 : dataout <= datain[6];
         3'b111 : dataout <= datain[7];
         
      endcase
end

else 
dataout<=dataout;

endmodule