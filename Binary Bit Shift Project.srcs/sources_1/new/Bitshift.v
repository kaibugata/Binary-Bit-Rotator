`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/15/2024 12:36:51 AM
// Design Name: 
// Module Name: Bitshift
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




module Bitshift(
    input [3:0] A,
    input [1:0] C,
    input wire clk,
    input wire button,
    output [3:0] O,
    output [3:0] an,      
    output [6:0] B  
     );
     wire [3:0] W;
    
    wire debounce;
    wire clk_out;
    reg TF;
    reg [1:0] in;
    Slow_Clock_4Hz u1(clk,clk_out);//creates the slow clock based on the fast one
    
    
    //button logic
    wire Q1,Q2,Q2_not;
    D_FF d1(clk_out, button, Q1);//first d flip flop based on button input
    D_FF d2(clk_out, Q1, Q2);
    assign Q2_not = ~Q2;
    assign debounce = Q1 & Q2_not;//now debounce will work
    //end of button logic
    
    initial begin
        in = C;
        TF = 0;
    end
    
    // Update LED based on button state
    always @(posedge clk_out) //maybe clk or maybe clk_out
        if(TF == 1)
            if(in == 3)
                in <= 0;
            else
                in <= in + 1;
        else
            in <= C;
        
    always @ (posedge clk_out)
        if(button)
           if(TF == 1)
               TF <= 0;
           else if (TF == 0)
               TF <= 1;
    
    
    //first muxes
    Mux Mux00(.Y(W[0]),.S0(in[1]),.I({A[2], A[0]}));
    Mux Mux01(.Y(W[1]),.S0(in[1]),.I({A[3], A[1]}));
    Mux Mux02(.Y(W[2]),.S0(in[1]),.I({A[0], A[2]}));
    Mux Mux03(.Y(W[3]),.S0(in[1]),.I({A[1], A[3]}));
                           
                           
                           
                           
    //second muxes         
    Mux Mux10(.Y(O[0]),.S0(in[0]),.I({W[3], W[0]}));
    Mux Mux11(.Y(O[1]),.S0(in[0]),.I({W[0], W[1]}));
    Mux Mux12(.Y(O[2]),.S0(in[0]),.I({W[1], W[2]}));
    Mux Mux13(.Y(O[3]),.S0(in[0]),.I({W[2], W[3]}));
    
    //seven seg display
    sevseg4top sevSeg(.A(O),.clk(clk),.an(an),.B(B));
    
    
   
   
  
endmodule


