`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/24/2024 01:22:30 PM
// Design Name: 
// Module Name: sevseg4top
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


module sevseg4top(
    input clk,              // System clock input
    input [3:0] A,          // 4-bit input to display
    output reg [3:0] an,    // Anode control for the 4 displays
    output reg [6:0] B      // Cathode control for the segments
);
    reg [15:0] clk_div;     // Clock divider to slow down multiplexing
    reg [1:0] digit_select; // Selects which digit is currently active
    reg [6:0] B0, B1, B2, B3; // Segment patterns for each digit

    // Clock divider to create a slower clock for multiplexing
    always @(posedge clk) begin
        clk_div <= clk_div + 1;
    end
    wire slow_clk = clk_div[15]; // Use the 16th bit as the slow clock

    // Generate segment patterns for each digit
    always @* begin
        // Pattern for digit 0 (A[0])
        case (A[0])
            1'b0: B0 = 7'b0000001; // '0'
            1'b1: B0 = 7'b1001111; // '1'
            default: B0 = 7'b0000001; // Default to '0'
        endcase

        // Pattern for digit 1 (A[1])
        case (A[1])
            1'b0: B1 = 7'b0000001; // '0'
            1'b1: B1 = 7'b1001111; // '1'
            default: B1 = 7'b0000001; // Default to '0'
        endcase

        // Pattern for digit 2 (A[2])
        case (A[2])
            1'b0: B2 = 7'b0000001; // '0'
            1'b1: B2 = 7'b1001111; // '1'
            default: B2 = 7'b0000001; // Default to '0'
        endcase

        // Pattern for digit 3 (A[3])
        case (A[3])
            1'b0: B3 = 7'b0000001; // '0'
            1'b1: B3 = 7'b1001111; // '1'
            default: B3 = 7'b0000001; // Default to '0'
        endcase
    end

    // Multiplexing logic
    always @(posedge slow_clk) begin
        digit_select <= digit_select + 1; // Cycle through the digits
    end

    always @* begin
        case (digit_select)
            2'b00: begin
                an = 4'b1110; // Enable first display (active low)
                B = B0;       // Set segments for digit 0
            end
            2'b01: begin
                an = 4'b1101; // Enable second display
                B = B1;       // Set segments for digit 1
            end
            2'b10: begin
                an = 4'b1011; // Enable third display
                B = B2;       // Set segments for digit 2
            end
            2'b11: begin
                an = 4'b0111; // Enable fourth display
                B = B3;       // Set segments for digit 3
            end
        endcase
    end
endmodule

