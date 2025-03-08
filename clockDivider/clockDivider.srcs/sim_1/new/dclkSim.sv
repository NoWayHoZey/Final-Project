`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2025 10:10:15 PM
// Design Name: 
// Module Name: dclkSim
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


module dclkSim(
    );
    logic clk = 0;
    logic clkOut;
    
    always #1 clk = ~clk;
    
    clockDivider #(.COUNT(2)) div2 (.clk(clk), .dclk(clkOut));
    
    
endmodule
