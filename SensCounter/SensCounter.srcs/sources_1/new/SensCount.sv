`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2025 08:33:57 PM
// Design Name: 
// Module Name: SensCount
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


module SensCount(
    input sig,    
    input rst,        
    output [7:0] count
);
   
    logic [8:0] data;
    assign data[0] = sig;
    assign count = data[8:1];
    

    TFlipFlop tff [7:0] (.t(1'b1),.rst(rst), .clk(data[7:0]), .q(data[8:1]));
    
    
endmodule
