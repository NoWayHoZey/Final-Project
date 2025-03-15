`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2025 08:21:06 PM
// Design Name: 
// Module Name: TFlipFlop
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


module TFlipFlop(
    input t,
    input rst,
    input start,
    input clk,
    output reg q
  
);
    initial begin
    q = start;
    end
    
    always @(negedge clk or posedge rst) begin
        if (rst)
            q <= 0;
        else if (t)
            q <= ~q;
    end
endmodule

    

