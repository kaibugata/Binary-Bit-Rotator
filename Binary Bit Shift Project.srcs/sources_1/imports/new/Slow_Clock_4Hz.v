`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/25/2024 12:41:00 AM
// Design Name: 
// Module Name: Slow_Clock_4Hz
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


module Slow_Clock_4Hz(
    input clk_in,
    output clk_out
    );
    reg [25:0] count = 0;
    reg clk_out;
    
    always @(posedge clk_in)
    begin
    count<= count + 1;
    if(count == 12_500_500) 
        begin
        count <= 0;
        clk_out = ~clk_out; //inverts the clock
        end
    end
endmodule
