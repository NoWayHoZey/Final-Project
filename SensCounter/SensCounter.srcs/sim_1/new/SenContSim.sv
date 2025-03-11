`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2025 08:14:51 PM
// Design Name: 
// Module Name: SenContSim
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


module SenContSim(
    );
    logic sig = 0 ;    
    logic rst = 0;
    logic [7:0] count;
    
    always #1 sig = ~sig;
    SensCount scs (.sig(sig), .rst(rst), .count(count));
endmodule
