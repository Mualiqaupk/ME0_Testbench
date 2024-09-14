 module hit_counter(
	input wire clk,
	input wire rst_n,
	input wire soft_rst,
	input wire en1,
	input wire en2,
	output reg [15:0]hit_cnt 
	);
   
   always @(posedge clk)
      if (!rst_n)
         hit_cnt <= {16{1'b0}};
       else if (soft_rst)
         hit_cnt <= {16{1'b0}};
      else if (en1)
	begin
         if(en2)  hit_cnt <= hit_cnt + 1'b1;
	end

endmodule