module crc_counter(
	input wire clk,
	input wire rst_n,
	input wire soft_rst,
	input wire en,
	output reg overflow,
	output reg [31:0]crc_error_cnt 
	);
   
   always @(posedge clk)
      if (~rst_n)
	begin
         crc_error_cnt <= 0;
	overflow<=0;
	end
       else if (soft_rst)
	begin
         crc_error_cnt <= 0;
	overflow<=0;
	end
      else if (en)
	begin 
	 	if(crc_error_cnt == 32'hFFFFFFFF) overflow <=1;
		
		 
        	crc_error_cnt <= crc_error_cnt + 1'b1;
	end

endmodule