`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2025 11:38:42 AM
// Design Name: 
// Module Name: USR16b
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


module USR16b(
    input Sin, 
    input [15:0] Pin, 
    input Penable, 
    input clk,
    output Sout,
    output reg [15:0] Pout
    );
    
    wire [15:0] data;
    
    assign data = Penable ? Pin : {Pout[14:0], Sin};
    assign Sout = Pout[15];
    
    initial Pout = '0;
    
    DFlipFlop ffs [15:0] (.D(data), .Q(Pout), .clk(clk));
endmodule
