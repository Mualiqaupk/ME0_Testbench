`timescale 1ns / 1ps
module mux32_1
(

input wire clk,
input rst_n,
input wire [7:0]input0,
input wire [7:0]input1,
input wire [7:0]input2,
input wire [7:0]input3,
input wire [7:0]input4,
input wire [7:0]input5,
input wire [7:0]input6,
input wire [7:0]input7,
input wire [7:0]input8,
input wire [7:0]input9,
input wire [7:0]input10,
input wire [7:0]input11,
input wire [7:0]input12,
input wire [7:0]input13,
input wire [7:0]input14,
input wire [7:0]input15,
input wire [7:0]input16,
input wire [7:0]input17,
input wire [7:0]input18,
input wire [7:0]input19,
input wire [7:0]input20,
input wire [7:0]input21,

input wire [4:0]sel,
output reg[7:0]data_out_mux32_1,
input wire five_ones

);

always @(posedge clk)
if(!rst_n)
data_out_mux32_1<=0;
else if(!five_ones)
begin
      case (sel)
        5'd0 	: data_out_mux32_1 <= input0;
        5'd1	: data_out_mux32_1 <= input1;
	5'd2 	: data_out_mux32_1 <= input2;
	5'd3 	: data_out_mux32_1 <= input3;
	5'd4 	: data_out_mux32_1 <= input4;
	5'd5 	: data_out_mux32_1 <= input5;
	5'd6 	: data_out_mux32_1 <= input6;
	5'd7 	: data_out_mux32_1 <= input7;
	5'd8 	: data_out_mux32_1 <= input8;
	5'd9 	: data_out_mux32_1 <= input9;
	5'd10 	: data_out_mux32_1 <= input10;
	5'd11 	: data_out_mux32_1 <= input11;
        5'd12 	: data_out_mux32_1 <= input12;
        5'd13 	: data_out_mux32_1 <= input13;
        5'd14 	: data_out_mux32_1 <= input14;
        5'd15 	: data_out_mux32_1 <= input15;
	5'd16 	: data_out_mux32_1 <= input16;
	5'd17 	: data_out_mux32_1 <= input17;
        5'd18 	: data_out_mux32_1 <= input18;
        5'd19 	: data_out_mux32_1 <= input19;
        5'd20 	: data_out_mux32_1 <= input20;
        5'd21 	: data_out_mux32_1 <= input21;
        

	
      endcase
end					
else data_out_mux32_1 <=data_out_mux32_1;
endmodule