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

    TFlipFlop tff [7:0] (.t('1), .start('1), .rst(rst), .clk({count[6:0], sig}), .q(count));
    
endmodule
