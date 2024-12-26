`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 12:36:51 AM
// Design Name: 
// Module Name: BitShiftTB
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


module BitShiftTB;

    // Declare input signals as reg
    reg [3:0] A; 
    reg [1:0] B;
    // Declare output signals as wire
    wire [3:0] O;

    // Instantiate the module under test (DUT)
    Bitshift DUT (
        .A(A),.C(B),.O(O)
    );
    

    // Initialize inputs and simulate behavior
    integer i = 0;
    initial begin
        for (i = 0; i < 64; i = i + 1) begin
            {A, B} = i[5:0];
            #10;             
        end
        
        
        $finish; // End the simulation
    end
    
    
 
endmodule





