
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2017 21:13:07
// Design Name: 
// Module Name: t_data_decode
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps
module t_hdlc_tx();

 parameter PERIOD = 20;
parameter COUNTER_WIDTH = 8;
reg clk;
reg rst_n;
reg enable;
reg start;
reg [7:0]data_in;
reg [COUNTER_WIDTH-1:0] counter = {COUNTER_WIDTH{1'b0}};


wire [7:0]final_data_out;
wire five_ones;
wire bit_out_from_formatter;
reg [31:0]register_address; 
reg [31:0]register_data;    
reg[31:0]data_mask;        
wire bitstuff_enable;
reg [3:0]Transaction_ID = 2;
wire activity;
wire activity_1;
wire activity_2;
wire activity_3;
reg activity_4;
integer i ;
//wire five_ones;
int osi;
   always begin
      clk = 1'b0;
      #(PERIOD/2) clk = 1'b1;
      #(PERIOD/2);
   end

 initial
 begin
#(PERIOD/2) rst_n=0;enable = 0;start=0;
 #(PERIOD*5)     rst_n=1;
#(PERIOD*5 +1)     enable=1;start = 1;
#((PERIOD)+1)     start= 0;
#(PERIOD*1000 + 1)     start=1;
#(PERIOD+1)     start=0;
 end
 

 
  
     always @(posedge clk)
     if(~rst_n)
     counter<=0;
     else if(~five_ones) 
        counter <= counter + 1;
                          

initial
begin 
register_address = 32'hffffff81;
register_data    = 32'h00002007;
data_mask        = 32'h87654321;
end



hdlc_tx hdlc_tx_inst(
.clk(clk),
.rst_n(rst_n),
.register_address(register_address),
.register_data(register_data),
.data_mask(data_mask),
.start(start),
.mode(Transaction_ID),
.busy(busy),
.activity(activity),
.activity_1(activity_1),
.activity_2(activity_2),
.activity_3(activity_3),
.dout_from_ip(final_data_out)



);




initial begin
osi = $fopen("output.log");
if(!osi) $finish;
end
initial
begin
#(PERIOD*2000)$fclose(osi);
#(PERIOD*10)$stop;
end

always @ (posedge clk)
begin
if(~rst_n)
i<=1;
else if(activity_4==0)
i<=1;
else if (activity_4==1)
begin 
$fwriteh(osi, "%h\t",final_data_out);
if(i%8 ==0)$fwriteh(osi, "\n");
i<=i+1;
$display("%d\t" ,i);

end
end
always@(posedge clk)
if(~rst_n)
activity_4<=0;
else 
activity_4 <= activity_3;




    endmodule