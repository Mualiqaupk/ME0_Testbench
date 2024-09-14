`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.09.2024 14:33:55
// Design Name: 
// Module Name: MyFIFO
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


module TU_FIFO(
    input wire S_AXI_ACLK,               // Clock signal
    input wire S_AXI_ARESETN,            // Active low reset
    input wire bitslip_ena,
    input wire [63:0]aligned_data,            // Input data (64-bit)
    output reg [63:0]data_out            // Output data (64-bit)
);

    parameter Max = 4;               // Maximum size of FIFO
    reg [63:0] fifo [0:Max-1];       // Fixed size array for FIFO storage
    reg [2:0] N;                     // Index to track the number of valid elements
    integer i;                       // Iterator for looping

    // Reset or initialize FIFO
    always @(posedge S_AXI_ACLK or negedge S_AXI_ARESETN) begin
        if (!S_AXI_ARESETN|!bitslip_ena) begin
            N <= 0;                  // On reset, set N to 0 (FIFO empty)
            for (i = 0; i < Max; i = i + 1)
                fifo[i] <= 64'd0;    // Clear the FIFO contents
            data_out <= 64'd0;       // Clear output
        end else begin
            // Write new data only if data_in is non-zero
            if (aligned_data != 0 && N < Max) begin
                fifo[N] <= aligned_data;   // Write non-zero data at the next position
                N <= N + 1;           // Increment the number of valid elements
            end else if (aligned_data != 0 && N == Max) begin
                // If FIFO is full, overwrite the last element
                fifo[Max-1] <= aligned_data;
            end
            
            // Output the last valid element
            if (N > 0) begin
                data_out <= fifo[N-1]; // Output the last valid element
            end else begin
                data_out <= 64'd0;     // Output 0 if FIFO is empty
            end
        end
    end
endmodule
