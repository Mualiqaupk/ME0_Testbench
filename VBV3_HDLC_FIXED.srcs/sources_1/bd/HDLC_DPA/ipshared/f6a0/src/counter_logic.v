`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.03.2018 18:20:15
// Design Name: 
// Module Name: counter_logic
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

   
    
    
    module counter_logic(
        input wire clk_40MHz,
        input wire rst_n,
        input wire [7:0]data_in,
        output reg [7:0]data_out,
        output  reg data_valid,
        output reg done,
        input wire [31:0] DELAY1,
        input wire [31:0] DELAY2,
        input wire [31:0]cnt_LV1A,
        input wire start,
        ///////bist signals/////////////////
        output wire VFAT3_BIST_start,
        input  wire VFAT3_BIST_end,
        input  wire VFAT3_BIST_ok,
        input wire BIST_cnt_rst,
        input wire start_BIST_test,
        output wire [31:0] BIST_CYCLES,
        output wire BIST_end
        );
        //reg bitslip_out;
        
        parameter LV1A  = 8'H69;
        parameter CALPULSE = 8'H3C; 
        
        
        
        
         
        
       
        
        
        reg [31:0]cnt; 
        reg start_reg;
        reg start_reg_p;
        reg [7:0]toggle_out;
        reg cnt_LV1A_dec;
        reg [31:0]cnt_LV1A_reg;
        reg [31:0] DELAY1_reg;
        reg [31:0] DELAY2_reg;
         /////////////variables for BIST function ///////////////////////
         
         reg BIST_start_reg;
         reg [31:0]BIST_cnt;
         reg start_BIST_test_p;
         reg BIST_end;
         ////////////////////////////////////
         
         
    /*
    
    CALPULSE DELAY1 LV1A DELAY2 CALPULSE DELAY1 LV1A DELAY2 
    */
    
                ////////////////////////////bislip counter, if no success in 10 shifts ,it means vfat3 is not responding    
                   always@(posedge clk_40MHz)
                           if(~rst_n)
                           begin
                            cnt<=0;
                            done<=1;
                           end 
                              
                           else if(cnt_LV1A_reg>0)//CNT ENABLE OUTER LOOP
                           begin
                              done <=0; 
                              cnt_LV1A_dec<=0;
                              data_out<= data_in;//toggle_out;
                               
                              if(cnt == (DELAY1_reg + DELAY2_reg + 1))//reached at the end of one full cycle
                                begin
                                    cnt<=0;// completed one (clapulse, lv1a cycle) counter 
                                //    cnt_LV1A_dec<=1;// asser cnt_LV1A dec signal after completion of one cycle
                                end
                             else if(cnt == (DELAY1_reg + DELAY2_reg))//reached at the end of one full cycle -1
                                begin
                                cnt_LV1A_dec<=1;// asser cnt_LV1A dec signal after completion of one cycle
                                 cnt   <=  cnt+1;
                                end  
                              else if(cnt == 0 )
                                begin
                                    cnt   <=  cnt+1; 
                                    data_out   <=  CALPULSE;
                                end
                              else if(cnt > 0  & cnt <= DELAY1_reg)
                                begin
                                    cnt      <= cnt+1; 
                                                       
                                end
                              else if(cnt == (DELAY1_reg+1))
                                begin
                                    cnt      <=  cnt+1; 
                                    data_out <=  LV1A;
                                end
                              else if(cnt > (DELAY1_reg+1) & cnt< (DELAY1_reg+DELAY2_reg+1) )
                                begin
                               cnt<=cnt+1;
                                end
                               
                             else 
                             begin
                             data_out<= data_in;//8'haa;  
                             cnt   <=  cnt+1;
                             end                          
                               
                           end
                           else
                           begin 
                           data_out <= data_in;
                           done<= 1;
                           cnt<= 0;
                           end
                              
                         
                    
                
                
              
                            
         
         
         ////////////////RISING EDGE OF START SIGNAL GENERATION for lv1As////////////////////////////////////////////////////////      
                 
                 
                 
                 always@(posedge clk_40MHz)
                    if(~rst_n)
                    begin
                      start_reg<=0;
                      start_reg_p<=0;
                    end
                      
                    else 
                    begin      
                      start_reg   <= start;
                      start_reg_p <= start_reg;
                      end
               
               
               
               
       //////////////////SAMPLE VALUES OF LV1A COUNTER, AND DELAY VALUES @ RISING EDGE OF START SIGNAL /////////////////////////////////////////////////////////////////////////////
        
       always@(posedge clk_40MHz)
                         if(~rst_n)
                         begin
                //            cnt_LV1A_reg <= 0;
                            DELAY1_reg <= 0;//DELAY1;
                            DELAY2_reg <= 0;//DELAY2;
                         end
                           
                           
                         else if(start_reg & ~start_reg_p) 
                         begin      
                  //          cnt_LV1A_reg <= cnt_LV1A;
                            DELAY1_reg <= DELAY1;
                            DELAY2_reg <= DELAY2;
                         end
    
                        
          
       //////////////////////////////
       always@(posedge clk_40MHz)
                       if(~rst_n)
                       begin
                         cnt_LV1A_reg<=0;
                         
                       end
                         
                       else if(start_reg & ~start_reg_p)
                       begin      
                         cnt_LV1A_reg<=cnt_LV1A;
                         end
                       else if (cnt_LV1A_dec)
                         cnt_LV1A_reg<=cnt_LV1A_reg -1;
                  
       ///////////////////////BIST TEST LOGIC///////////////////////////////////////////////////////////////////////
       
       //////////////////////////////
              always@(posedge clk_40MHz)
                              if(~rst_n)
                              begin
                                BIST_start_reg<=0;
                                
                              end
                                
                              else if(start_BIST_test & ~start_BIST_test_p)// start bist command from microblaze
                              begin      
                                BIST_start_reg <= 1;
                                end
                              else if (VFAT3_BIST_end)
                                BIST_start_reg <= 0;
                         
       
       //////////////////////BIST active counter////////////////////////////////
       always@(posedge clk_40MHz)
                              if(~rst_n)
                              begin
                                BIST_cnt<=0;
                              end
                              else if(BIST_cnt_rst)
                                BIST_cnt<=0;
                              else if(BIST_start_reg)//test in progrss
                              begin
                              BIST_cnt <= BIST_cnt +1;  
                              end      
       
       
       
       
       
       ////////////////////////last value of start_BIST_test //////////////
               always@(posedge clk_40MHz)
                           if(~rst_n)
                           begin
                             start_BIST_test_p<=0;
                             
                           end
                             
                           else 
                           begin      
                             start_BIST_test_p   <= start_BIST_test;
                             
                             end
                      
       
       
       
       
       /////////////////////
       always@(posedge clk_40MHz)
       if(~rst_n)
        BIST_end<=0;
       else if(BIST_cnt_rst)
        BIST_end<=0;
       else if(VFAT3_BIST_end)
        BIST_end<=1;
       
       ///////////////////////////////////////////////////////////////////////////////////////
       
       assign VFAT3_BIST_start = BIST_start_reg;
      // assign BIST_end         = VFAT3_BIST_end;
       assign BIST_CYCLES      = BIST_cnt;
       
               
   
endmodule
