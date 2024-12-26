`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 10:28:10 PM
// Design Name: 
// Module Name: Mux4in
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




//4Input2Sel Mux
module Mux4in(
    input [1:0] S,
    input [3:0] I,
    output Y
    );
    wire [1:0] W;
   Mux Mux0(.Y(W[0]),.S0(S[0]),.I({I[1],I[0]}));
   Mux Mux1(.Y(W[1]),.S0(S[0]),.I({I[3],I[2]}));//it was originally .S0(S[1]) https://www.youtube.com/watch?v=S9UU9EuY3rQ
   Mux MuxFinal(.Y(Y),.S0(S[1]),.I({W[1],W[0]}));
    
endmodule
