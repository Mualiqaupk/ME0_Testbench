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


module tu_bitslip_gen(
    input S_AXI_ACLK,
    input S_AXI_ARESETN,
    input bitslip_ena,
    input [63:0]trigger_data_in,
    output reg [7:0]tu_bitslip,
    output reg [63:0]dout,
    output reg tu_success
    );
    //reg bitslip_out;
    reg bitslip_ena_p;
    reg [63:0]trigger_data_in_p;
    wire [63:0]aligned_data;
    
    
     
    reg data_cnt_en ;
    reg data_cnt_rst;
   
    reg wait_cnt_en;
    reg wait_cnt_rst;
    reg Bitslip_cnt_en;
    reg Bitslip_cnt_rst;
    reg [3:0]wait_cnt;
    wire [63:0]data_out;
    reg [15:0]Bitslip_cnt;
    reg [2:0] data_cnt;
    
    wire hit;
    
         ////// Trigger Bits rearrangement ////////////////////////////////////////

assign aligned_data = { trigger_data_in[7], trigger_data_in[15], trigger_data_in[23], trigger_data_in[31],trigger_data_in[39],trigger_data_in[47],trigger_data_in[55],trigger_data_in[63],
    trigger_data_in[6], trigger_data_in[14], trigger_data_in[22], trigger_data_in[30],trigger_data_in[38],trigger_data_in[46],trigger_data_in[54],trigger_data_in[62],
    trigger_data_in[5], trigger_data_in[13], trigger_data_in[21], trigger_data_in[29],trigger_data_in[37],trigger_data_in[45],trigger_data_in[53],trigger_data_in[61],
    trigger_data_in[4], trigger_data_in[12], trigger_data_in[20], trigger_data_in[28],trigger_data_in[36],trigger_data_in[44],trigger_data_in[52],trigger_data_in[60],
    trigger_data_in[3], trigger_data_in[11], trigger_data_in[19], trigger_data_in[27],trigger_data_in[35],trigger_data_in[43],trigger_data_in[51],trigger_data_in[59],
    trigger_data_in[2], trigger_data_in[10], trigger_data_in[18], trigger_data_in[26],trigger_data_in[34],trigger_data_in[42],trigger_data_in[50],trigger_data_in[58],
    trigger_data_in[1], trigger_data_in[9], trigger_data_in[17], trigger_data_in[25],trigger_data_in[33],trigger_data_in[41],trigger_data_in[49],trigger_data_in[57],    
    trigger_data_in[0], trigger_data_in[8], trigger_data_in[16], trigger_data_in[24],trigger_data_in[32],trigger_data_in[40],trigger_data_in[48],trigger_data_in[56] };
    
//assign aligned_data = trigger_data_in;
    
  //////// Instaintiation of local fifo //////////////
  
  
TU_FIFO inst (
     .S_AXI_ACLK(S_AXI_ACLK),
     .S_AXI_ARESETN(S_AXI_ARESETN),
     .bitslip_ena(bitslip_ena),
     .aligned_data(aligned_data),
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
             tu_bitslip <=8'h00;
             tu_success<=0;
             wait_cnt_en<=0;
             Bitslip_cnt_en<=0;
             wait_cnt_rst<=1;
             Bitslip_cnt_rst<=1;
             dout <=0;
             trigger_data_in_p <=0;
             data_cnt<=0;
          end
          else
          begin  //defaults
           
           tu_bitslip<=8'h00;
           wait_cnt_en<=0;
           wait_cnt_rst<=0;
           Bitslip_cnt_en<=0;
           Bitslip_cnt_rst<=0;
             case (state)
                   
            
             
                IDLE :  begin
                           if (~bitslip_ena_p & bitslip_ena)begin
                              state <= CHECK;
                              end
                        else  
                            begin
                                wait_cnt_en<=0;
                                wait_cnt_rst<=1;
                                Bitslip_cnt_en<=0;
                                Bitslip_cnt_rst<=1;
                            end
                        end       
                CHECK : begin
                    tu_success <=0;
                    if (|data_out == 1)
                    begin
                                state <= FINISH;
                                dout <=data_out;
                                tu_success<=1;
                              
                    end
                     else if (Bitslip_cnt<=2500)
                      state <= BITSLIP;
                    else if(Bitslip_cnt>2500)begin
                     tu_success<=0;
                     state<=FINISH;end
                   else
                      state <= CHECK;
                      end
            BITSLIP : begin
                          tu_bitslip<=8'hff;
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
     


endmodule

