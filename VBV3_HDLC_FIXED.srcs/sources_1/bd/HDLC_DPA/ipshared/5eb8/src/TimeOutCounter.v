module TimeOutCounter(
	input wire clk,
	input wire rst_n,
	input wire soft_rst,
	output reg [31:0]TimeOutCount 
	);
   
   always @(posedge clk)
      if (~rst_n)
	begin
         TimeOutCount <= 0;
	
	end
       else if (soft_rst)
	begin
         TimeOutCount <= 0;
	end
      else 
	TimeOutCount <= TimeOutCount + 1'b1;
	

endmodule