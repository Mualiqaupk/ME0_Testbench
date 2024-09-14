module Mux_2_1(
input clk,
input sel,
input datain,
output reg dataout

);

always @(posedge clk)
      case (sel)
 		1'b0 		: dataout <= datain;
         	1'b1 		: dataout <= 1'b0;
        	default	:  dataout <= datain; 
      endcase


endmodule