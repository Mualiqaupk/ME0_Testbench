module tx_packet_formatter
(
input clk,
input rst_n,
input [31:0]register_address,
input [31:0]register_data,
input [31:0]data_mask,
input start,
input [2:0]mode,
output wire busy,
output done,
output wire bitstuff_enable,
output activity,
output reg activity_1,
output reg activity_2,
output reg activity_3,
input out_ready,
output bit_out,
output [31:0]crc_counter
);
wire [7:0]crc_msb;
wire [7:0]crc_lsb;
wire [7:0]data_out_mux32_1;
parameter HDLC_FS = 8'H7E;
parameter HDLC_CONTROL = 8'H03;
parameter HDLC_ADDRESS = 8'H00;

//parameter IPBUS_HEADER_0= 8'h1f;
parameter IPBUS_HEADER_1=8'h06;//transaction id
parameter IPBUS_HEADER_2=8'h01;//words [12 bits]1
parameter IPBUS_HEADER_3=8'h20;
reg [7:0]IPBUS_HEADER_0;


//reg 	bytecnt_en;
reg 	[4:0]bytecount;
reg 	[2:0]bit_count;
wire crc_init;
wire crc_en;
reg [2:0]sel_8_1;
reg bytecnt_en;
reg start_p;
reg [31:0]crc_counter;
crc16_8 CRC2_INST(
.reset(~rst_n),
.clk(clk),
.d(data_out_mux32_1),
.en(crc_en),
.crc_rst(crc_init),
.crc(),
.crc_inv({crc_msb,crc_lsb}),
.crc_ok()
);


mux32_1 mux32_1_inst
(
.clk(clk),
.input0(HDLC_FS),
.input1(HDLC_ADDRESS),
.input2(HDLC_CONTROL),

.input3(IPBUS_HEADER_0),
.input4(IPBUS_HEADER_1),
.input5(IPBUS_HEADER_2),
.input6(IPBUS_HEADER_3),

.input7(register_address[7:0]),
.input8(register_address[15:8]),
.input9(register_address[23:16]),
.input10(register_address[31:24]),

.input11(register_data[7:0]),
.input12(register_data[15:8]),
.input13(register_data[23:16]),
.input14(register_data[31:24]),

.input15(data_mask[7:0]),
.input16(data_mask[15:8]),
.input17(data_mask[23:16]),
.input18(data_mask[31:24]),

.input19(crc_lsb),
.input20(crc_msb),
.input21(HDLC_FS),


.sel(bytecount),
.data_out_mux32_1(data_out_mux32_1)

);

Mux_8_1  Mux_8_1_inst(
.clk(clk),
.sel(sel_8_1),
.datain(data_out_mux32_1),
.dataout(bit_out)

);




always@(posedge clk)
if(~rst_n)
	begin
		bytecnt_en<=0;
		bytecount <= 0;
		bit_count <= 0;
        end
else if (~start_p & start)
	begin
		
		bytecnt_en<=1;
		bytecount <= 0;
		bit_count <= 0;
        end

else if(bytecnt_en)
	begin 
	if(~out_ready)
		begin
		if(bit_count<7)
			bit_count<=bit_count+1;
		else 
		begin
			bit_count<=0;
			if(bytecount ==21) begin bytecount=0;bytecnt_en<=0;end 
			else
			begin 
			if(mode==0 & bytecount ==10)//read transaction, exclude write_data and data_mask words 
			bytecount<=bytecount + 9;
			else if(mode==1 & bytecount ==14)//simple write, exclude data mask  
			bytecount<=bytecount + 5;
			//else if(mode==2 & bytecount ==14)//read modify write, must include data mask 
			//bytecount<=bytecount + 5;
			else
			bytecount<=bytecount + 1; 

			end
		end				
		
		end// out_ready
	end//end bytecnt_en

/////////////delay 1 cycle 
always@(posedge clk)
if(~rst_n)
sel_8_1<=0;
else 
sel_8_1<= bit_count;



always@(posedge clk)
if(~rst_n)
begin
activity_1<=0;
activity_2<=0;
end
else 
begin
activity_1<=activity;
activity_2<=activity_1;
activity_3<=activity_2;
end
//////////////////////////////////

  
always@(posedge clk)
if(~rst_n)
    IPBUS_HEADER_0 <= 8'h1f;
else if (mode == 0)//read
    IPBUS_HEADER_0= 8'h0f;
else if(mode ==1)//write 
    IPBUS_HEADER_0= 8'h1f;
else if (mode==2)//RMW
    IPBUS_HEADER_0= 8'h4f;

////////////we will start our processing on rising edge of start signal, so need start_p signal to find edge 
always@(posedge clk)
if(~rst_n)
start_p<=0;
else start_p <= start;



assign activity = bytecnt_en; 
assign crc_init         =  bytecount ==0  & bytecnt_en==1 ;				//crc start pulse
assign crc_en 		    = (bytecount > 0 & bytecount < 19) & bit_count == 4 & (bytecnt_en==1 & out_ready==0) ;		//crc enable pulse , should be high one cycle  per data byte. 

assign bitstuff_enable 	= (bytecount > 0 & bytecount < 21 ) & bytecnt_en==1;
assign busy             = activity | activity_3;

always@(posedge clk)
if(~rst_n)
crc_counter<=0;
else if(activity==0)
crc_counter<=0;
else if(crc_en)
crc_counter<=crc_counter+1;




endmodule 