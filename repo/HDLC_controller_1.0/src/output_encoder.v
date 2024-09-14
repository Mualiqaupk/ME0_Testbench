module output_encoder(
input wire clk,
input wire rst_n,
input activity,
input wire data_in,
input wire [7:0]data_bus_in,
output reg [7:0]dout

);


   

   always @(posedge clk)
      if (~rst_n)
         dout<=0;
      else if(~activity)
         dout  <= data_bus_in;
      else
         case (data_in)
            	1'b0 : dout <= 8'h96;
		1'b1 : dout <= 8'h99;
 		   
            	default : dout  <= data_bus_in;
         endcase



endmodule