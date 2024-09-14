module Mux_8_1(
input wire clk,
input wire [2:0]sel,
input wire [7:0]datain,
output reg dataout

);

always @(posedge clk)
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


endmodule