`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 09:29:32 PM
// Design Name: 
// Module Name: Mux4inTB
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


module Mux4inTB;
    reg [1:0] B;
    reg [3:0] A; 
    wire Y;

    // Instantiate the module under test (DUT)
    Mux4in UUT (
       .S(B),.I(A),.Y(Y)
    );
    

    // Initialize inputs and simulate behavior
    integer i = 0;
    initial begin
        for (i = 0; i < 64; i = i + 1) begin
            {A, B} = i[5:0];
            $monitor("Time: %0d, A: %b, B: %b, Y: %b", $time, A, B, Y);
            #10;             
        end
        
        $finish; // End the simulation
    end



   
endmodule

