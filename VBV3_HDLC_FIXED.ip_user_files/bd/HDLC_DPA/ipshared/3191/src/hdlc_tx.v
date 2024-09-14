
module hdlc_tx(
input clk,
input rst_n,
input [31:0]register_address,
input [31:0]register_data,
input [31:0]data_mask,
input start,
input [2:0]mode,
output busy,
output wire activity,
output wire activity_1,
output wire activity_2,
output wire activity_3,
input wire [7:0]data_in,
output [7:0]dout_from_ip,
output wire [31:0]crc_counter,
output wire [7:0]crc_in,
output wire [15:0]crc_out,
output wire crc_en, 
output wire crc_init

);

wire bit_out_from_formatter;
wire bit_out_from_stuffer;
wire five_ones;
wire bitstuff_enable;
wire activity_output_encoder;

tx_packet_formatter tx_packet_formatter_inst
(
.clk(clk),
.rst_n(rst_n),
.register_address(register_address),
.register_data(register_data),
.data_mask(data_mask),
.start(start),
.mode(mode),
.busy(busy),
//.done(),
.bitstuff_enable(bitstuff_enable),
.activity(activity),
.activity_1(activity_1),
.activity_2(activity_2),
.activity_3(activity_3),
.out_ready(five_ones),//input from bit stuff module
.bit_out(bit_out_from_formatter),
.crc_counter(crc_counter),
.crc_in(crc_in),
.crc_out(crc_out),
.crc_en(crc_en), 
.crc_init(crc_init)


);


zero_stuff zero_stuff_inst(
.clk(clk),
.rst_n(rst_n),
.ce(bitstuff_enable),
.bit_in(bit_out_from_formatter),
.bit_out(bit_out_from_stuffer),
.five_ones(five_ones)
);

output_encoder  output_encoder_inst (
.clk(clk),
.rst_n(rst_n),
.activity(activity_output_encoder),
.data_in(bit_out_from_stuffer),
.data_bus_in(data_in),
.dout(dout_from_ip)

);

assign activity_output_encoder =  activity_3;
endmodule
