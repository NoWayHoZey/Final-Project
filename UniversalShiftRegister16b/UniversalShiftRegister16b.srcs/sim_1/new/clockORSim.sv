`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2025 05:28:49 PM
// Design Name: 
// Module Name: clockORSim
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


module clockORSim(

    );
    logic [15:0] a = '0;
    logic [15:0] b = '0;
    wire [1:0] tester = (a == 0) ? 2'b00 : (b > 0) ? 2'b01 : 2'b11;
    
    initial begin
        #2
        a <= a+1;
        #2
        b <= b+1;
        #2
        a <= '0;
    end
endmodule
