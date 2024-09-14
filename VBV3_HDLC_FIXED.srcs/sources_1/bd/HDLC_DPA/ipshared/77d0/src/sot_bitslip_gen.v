`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.08.2024 00:35:38
// Design Name: 
// Module Name: tu_bitslip_gen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2017 12:32:01
// Design Name: 
// Module Name: bit_slip_Generator
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

module sot_bitslip_gen(
    input S_AXI_ACLK,
    input S_AXI_ARESETN,
    input bitslip_ena,
    input [7:0]data_in_sot,
    output reg [7:0]sot_data_out,
    output reg sot_bitslip,
    output reg sot_success,
    output reg SOT_HIT
    );
    //reg bitslip_out;
    reg bitslip_ena_p;
   
    
     
    
   
    //reg sot_success;
    reg wait_cnt_en;
    reg wait_cnt_rst;
    reg Bitslip_cnt_en;
    reg Bitslip_cnt_rst;
    reg [3:0]wait_cnt;
    reg [4:0]Bitslip_cnt;
    reg [7:0]data_in_p;
    wire [7:0] data_out;

  
  
  ///////// Instantiating FIFO /////////////
  
  SOT_FIFO inst (
       .S_AXI_ACLK(S_AXI_ACLK),
       .S_AXI_ARESETN(S_AXI_ARESETN),
       .bitslip_ena(bitslip_ena),
       .data_in_sot(data_in_sot),
       .data_out(data_out)
     );
  
    
    
    
       parameter IDLE    = 5'b00001;
       parameter CHECK   = 5'b00010;
       parameter BITSLIP = 5'b00100;
       parameter WAIT    = 5'B01000;
       parameter FINISH  = 5'b10000;
    
       reg [4:0] state = IDLE;
    
       always @(posedge S_AXI_ACLK )
          if (~S_AXI_ARESETN) begin
             state <= IDLE;
             sot_bitslip<=0;
             sot_success<=0;
             wait_cnt_en<=0;
             Bitslip_cnt_en<=0;
             wait_cnt_rst<=1;
             Bitslip_cnt_rst<=1;
 
          end
          else
          begin  //defaults
           
           ///sot_success<=0;
           sot_bitslip<=0; 
           wait_cnt_en<=0;
           wait_cnt_rst<=0;
           Bitslip_cnt_en<=0;
           Bitslip_cnt_rst<=0;
             case (state)

                IDLE : begin
                   if (~bitslip_ena_p & bitslip_ena ) begin
                      state <= CHECK; end
                       
                  else begin
                        wait_cnt_en<=0;
                        wait_cnt_rst<=1;
                        Bitslip_cnt_en<=0;
                        Bitslip_cnt_rst<=1; end
                      end       
                CHECK : begin
                    sot_success<=0;
                   if ((|data_in_p) == 1) begin
                      sot_data_out <= data_in_p; 
                      SOT_HIT <=1;
                      state <= FINISH;
                      sot_success<=1;end
                     else if (Bitslip_cnt<=40)
                      state <= BITSLIP;
                    else if(Bitslip_cnt>40)begin
                     sot_success<=0;
                     sot_data_out <= 0; 
                     SOT_HIT <=0;
                     state<=FINISH;end
                   else
                      state <= CHECK;
                      end
                BITSLIP : begin
                   sot_bitslip<=1;
		           Bitslip_cnt_en<=1;	
                   state<=WAIT;
                   end
                WAIT : begin
                    wait_cnt_en<=1;
                   if (wait_cnt==3)begin
                      state <= CHECK;
		      wait_cnt_rst<=1;end
                   else
                      state <= WAIT;
                      end
                
                
                FINISH : begin
                       state <= IDLE;
                       end
                       
             endcase
           end                     
           
           
           
           
           always@(posedge S_AXI_ACLK)
           if(~S_AXI_ARESETN)
           wait_cnt<=0;
           else if(wait_cnt_rst)
           wait_cnt<=0;
           else if(wait_cnt_en)
           wait_cnt<=wait_cnt+1;


        ////////////////////////////bislip counter, if no success in 10 shifts ,it means vfat3 is not responding    
           always@(posedge S_AXI_ACLK)
                      if(~S_AXI_ARESETN)
                      Bitslip_cnt<=0;
                      else if(Bitslip_cnt_rst)
                      Bitslip_cnt<=0;
                      else if(Bitslip_cnt_en) 
                      Bitslip_cnt<=Bitslip_cnt+1; 
            
          
          
      ////////////////////////////bislip start signal(from processor) bitslip_ena 
            always@(posedge S_AXI_ACLK)
                         if(~S_AXI_ARESETN)
                             bitslip_ena_p<=0;
                         else     
                         bitslip_ena_p<=bitslip_ena;
      ///////////////////////////////////////////////////////////////////////////////////////////////
      
                          
     
     
     ////////////////data_in_sot one last value ////////////////////////////////////////////////////////      
            
            always@(posedge S_AXI_ACLK)
                 if(~S_AXI_ARESETN)
                   data_in_p <=0;
                  
                 else if ((sot_success==0)&((|data_in_p)==0))data_in_p <= data_in_sot;
                 else if(sot_success==1)data_in_p <= 0;
                   
                        
                            
endmodule
