
module Mux_16_1(
input wire clk,
input wire [3:0]sel,
input wire[7:0]datain_1,
input wire[7:0]datain_2,
input wire[7:0]datain_3,
input wire[7:0]datain_4,
input wire[7:0]datain_5,
input wire[7:0]datain_6,
input wire[7:0]datain_7,
input wire[7:0]datain_8,
input wire[7:0]datain_9,
input wire[7:0]datain_10,
input wire[7:0]datain_11,
input wire[7:0]datain_12,
input wire[7:0]datain_13,
input wire[7:0]datain_14,
input wire[7:0]datain_15,
input wire[7:0]datain_16,
output reg [7:0]dataout

);

always @(posedge clk)
      case (sel)
         4'b0000 : dataout <= datain_16;
         4'b0001 : dataout <= datain_15;
         4'b0010 : dataout <= datain_14;
         4'b0011 : dataout <= datain_13;
         4'b0100 : dataout <= datain_12;
         4'b0101 : dataout <= datain_11;
         4'b0110 : dataout <= datain_10;
         4'b0111 : dataout <= datain_9;
         4'b1000 : dataout <= datain_8;
         4'b1001 : dataout <= datain_7;
         4'b1010 : dataout <= datain_6;
         4'b1011 : dataout <= datain_5;
         4'b1100 : dataout <= datain_4;
         4'b1101 : dataout <= datain_3;
         4'b1110 : dataout <= datain_2;
         4'b1111 : dataout <= datain_1;
      endcase



endmodule