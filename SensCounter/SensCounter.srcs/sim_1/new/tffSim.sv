`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2025 04:50:40 PM
// Design Name: 
// Module Name: tffSim
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


module tffSim(

    );
    
    logic sig = 0;
    logic sig2 = 0;
    logic rst = 0;
    wire clk = sig ^ sig2;
    logic q;
    always #2 sig = ~sig;
    TFlipFlop tff (.t('1), .start('0), .clk(clk), .rst('0), .q(q));
    
    initial begin
        #15
        sig2 = 1;
        #15
        sig2 = 0;
        #15
        sig2 = 1;
        #5
        sig2 = 0;
    end
endmodule
