`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2025 05:31:34 PM
// Design Name: 
// Module Name: Seg_sim
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


module Seg_sim(

    );
    logic [15:0] sim_sw;
    logic [6:0] sim_ag;
    logic [3:0] simAn;
    logic simdp;
    logic clk = 0;
    always #1 clk = ~clk;
    
    SegmentDriver UUT (.clk(clk), .sw(sim_sw), .a_to_g(sim_ag), .dp(simdp), .anode(simAn));
        
    initial begin
        sim_sw = 15'b0100_0011_0010_0001;
    end
endmodule
