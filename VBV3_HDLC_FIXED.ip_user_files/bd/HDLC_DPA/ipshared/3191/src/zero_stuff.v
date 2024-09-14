module zero_stuff(
`timescale 1ns / 1ps
input wire clk,
input wire rst_n,
input wire ce,
input bit_in,
output bit_out,
output wire five_ones
);


wire hold;
reg hold_1;

shift_reg5bit shift_reg5bit_inst(
.clk(clk),
.rst_n(rst_n),
.din(bit_in),
.ce(ce),
.five_ones(hold),
.p_out()
);


Mux_2_1 Mux_2_1_inst (

.clk(clk),
.rst_n(rst_n),
.sel(hold),
.datain(bit_in),
.dataout(bit_out)

);

//always@(posedge clk)
//if(!rst_n)
//hold_1<=0;
//else hold_1<=hold;


assign five_ones = hold;
endmodule


