`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2018 17:37:09
// Design Name: 
// Module Name: DPA_TAPS_MODEL
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


module DPA_TAPS_MODEL(

input rst_n,
input clk,

input [5:0]  M_delay_val_In_Mod, // Master Delay Tap 
input [5:0]  S_delay_val_In_Mod, // Slave Delay Tap   
    
output reg [7:0] M_data_Out_Mod,
output reg [7:0] S_data_Out_Mod    
 );

always @ (posedge clk)
if(~rst_n)
          begin
              M_data_Out_Mod <= 0;
              S_data_Out_Mod <= 0;
          end
                else begin
                M_data_Out_Mod <= M_data_Out_Mod;
                S_data_Out_Mod <= M_data_Out_Mod;
                end
          
always @ (posedge clk) begin
          if (( M_delay_val_In_Mod> 0) & (M_delay_val_In_Mod < 21))begin 
          M_data_Out_Mod <= 8'h00;    
          end
          
          else if ((M_delay_val_In_Mod >= 22) & (M_delay_val_In_Mod <= 23))begin 
          M_data_Out_Mod <= 8'h81;    
          end

          else if ((M_delay_val_In_Mod >  24) & (M_delay_val_In_Mod < 43))begin 
          M_data_Out_Mod <= 8'h73;    
          end
          
          else if ((M_delay_val_In_Mod > 44) & (M_delay_val_In_Mod < 47))begin 
          M_data_Out_Mod <= 8'hA0;    
          end

end

always @ (posedge clk) begin
         if ((S_delay_val_In_Mod > 0) & (S_delay_val_In_Mod < 32))begin 
          S_data_Out_Mod <= 8'hFF;    
          end
          
          else if ((S_delay_val_In_Mod >= 33) & (S_delay_val_In_Mod <=  34))begin 
          S_data_Out_Mod <= 8'hF1;    
          end

          else if ((S_delay_val_In_Mod > 35) & (S_delay_val_In_Mod < 54))begin 
          S_data_Out_Mod <= 8'h8D;    
          end
          
          else if ((S_delay_val_In_Mod > 55) & (S_delay_val_In_Mod < 58))begin 
          S_data_Out_Mod <= 8'hCA;    
          end
        
end


endmodule
