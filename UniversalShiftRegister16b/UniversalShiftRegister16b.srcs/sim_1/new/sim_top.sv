`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2025 06:20:38 PM
// Design Name: 
// Module Name: sim_top
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


module sim_top(

    );
    logic [15:0] sim_Pout;
    logic [15:0] sim_Pin = 0;
    logic sim_Sin = 0;
    logic sim_Sout;
    logic enable = 0;
    logic simclk = 0;
    
    always #1 simclk = ~simclk;
    USR16b UUT(.clk(simclk), .Sin(sim_Sin), .Penable(enable), .Pin(sim_Pin), .Sout(sim_Sout), .Pout(sim_Pout));
    //always @(negedge simclk) sim_Sin = ~sim_Sin;
    initial begin
        enable = 1;
        sim_Pin = 16'b0_00000000001_000_1;
        #2
        enable = 0;
        #30
        enable = 1;
        sim_Pin = 16'b1111111_010101010;
        #2
        enable = 0;
        #30
        enable = 1;
        sim_Pin = 16'b101010_1111111111;
        #2
        enable = 0;
        sim_Sin = 1;
     end
    
endmodule
