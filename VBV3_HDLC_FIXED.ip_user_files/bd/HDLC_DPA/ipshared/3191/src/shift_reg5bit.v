module shift_reg5bit(
`timescale 1ns / 1ps
input clk,
input rst_n,
input din,
input ce,
output  five_ones,
output wire [4:0]p_out
);


// Note: By using a reset for this shift register, this cannot
   //       be placed in an SRL shift register LUT.

   

   reg[4:0] temp;

   always @(posedge clk)
      if (~rst_n)
         temp <= 0;
	else if (five_ones)
         temp <= 0;
      else if (ce)
		begin
         temp[3:0]  	<= temp[4:1];
	temp[4]		<= din;
		end
   

//always @(posedge clk)
//if (~rst_n)
//    five_ones <= 0;
//    	else if (&temp)
//          five_ones <= 1;
//	else
//	 five_ones<=0;
//
assign  five_ones 	= (&temp) ;
assign p_out 		= temp;

endmodule