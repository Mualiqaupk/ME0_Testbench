`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.07.2018 17:04:45
// Design Name: 
// Module Name: diff_to_diff
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


module diff_to_diff(
    input wire RXD_P_I,
    input wire RXD_N_I,
    output wire RXD_P_O,
    output wire RXD_N_O
    );
    
    
    
    
    // IBUFDS_DIFF_OUT : In order to incorporate this function into the design,
    //     Verilog     : the following instance declaration needs to be placed
    //    instance     : in the body of the design code.  The instance name
    //   declaration   : (IBUFDS_DIFF_OUT_inst) and/or the port declarations within the
    //      code       : parenthesis may be changed to properly reference and
    //                 : connect this function to the design.  All inputs
    //                 : and outputs must be connected.
    
    //  <-----Cut code below this line---->
    
       // IBUFDS_DIFF_OUT: Differential Input Buffer with Differential Output
       //                  Kintex-7
       // Xilinx HDL Language Template, version 2017.4
    
       IBUFDS_DIFF_OUT #(
          .DIFF_TERM("TRUE"),   // Differential Termination, "TRUE"/"FALSE" 
          .IBUF_LOW_PWR("FALSE"), // Low power="TRUE", Highest performance="FALSE" 
          .IOSTANDARD("DEFAULT") // Specify the input I/O standard
       ) IBUFDS_DIFF_OUT_inst (
          .O(RXD_P_O),   // Buffer diff_p output
          .OB(RXD_N_O), // Buffer diff_n output
          .I(RXD_P_I),   // Diff_p buffer input (connect directly to top-level port)
          .IB(RXD_N_I)  // Diff_n buffer input (connect directly to top-level port)
       );
    
       // End of IBUFDS_DIFF_OUT_inst instantiation
                        
                        
                        
endmodule
