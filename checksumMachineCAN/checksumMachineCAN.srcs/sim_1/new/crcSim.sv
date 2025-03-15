`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 01:58:10 AM
// Design Name: 
// Module Name: crcSim
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


module crcSim(

    );
    logic clk = 0;
    logic [26:0] data = 27'b000000000011000000110100101;
    logic dataBit = data[26];
    logic clr = 0;
    logic [14:0] crc;
    always #1 clk = ~clk;
    checksumMachine crcer(.clk(clk), .data(dataBit), .clr(clr), .crc(crc));
    initial begin
        clr = 1;
        #2
        clr = 0;
        for (int i = 25; i >= 0; i--) begin
            #2
            dataBit = data[i];
        end
        #2
        clr = 1;
    end
endmodule
