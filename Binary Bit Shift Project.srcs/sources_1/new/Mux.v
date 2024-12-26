`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/16/2024 12:06:29 AM
// Design Name: 
// Module Name: Mux
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


module Mux(
    input S0,
    input [1:0] I,
    output Y
    );
//and (T0, ~S0,I0);
//and (T1, S0,I1);
//or(Y,T0,T1);

assign Y = (~S0 & I[0]) | (S0 & I[1]);

endmodule 