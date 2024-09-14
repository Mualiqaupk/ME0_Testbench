module zero_stuff(
input wire clk,
input wire rst_n,
input wire ce,
input bit_in,
output bit_out,
output five_ones
);




shift_reg5bit shift_reg5bit_inst(
.clk(clk),
.rst_n(rst_n),
.din(bit_in),
.ce(ce),
.five_ones( five_ones),
.p_out()
);


Mux_2_1 Mux_2_1_inst (

.clk(clk),
.sel(five_ones),
.datain(bit_in),
.dataout(bit_out)

);

endmodule


