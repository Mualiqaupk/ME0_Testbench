`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.04.2017 12:01:47
// Design Name: 
// Module Name: DIFF_To_single
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


module DIFF_To_single(
    input wire IN_P,
    input wire IN_N,
    output wire   OUT
    );
    
    
    
    IBUFDS #(
          .DIFF_TERM("TRUE"),       // Differential Termination
          .IBUF_LOW_PWR("FALSE"),     // Low power="TRUE", Highest performance="FALSE" 
          .IOSTANDARD("LVDS_25")     // Specify the input I/O standard
       ) IBUFDS_inst (
          .O(OUT),  // Buffer output
          .I(IN_P),  // Diff_p buffer input (connect directly to top-level port)
          .IB(IN_N) // Diff_n buffer input (connect directly to top-level port)
       );
endmodule
