`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2025 06:56:41 PM
// Design Name: 
// Module Name: RingCounter
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


module RingCounter(
    input clk,
    output logic [3:0] state
    );
    initial state = 4'b1110;
    
    always @ (posedge clk) begin
        logic tmp = state[3];
        state = state << 1;
        state[0] = tmp;
    end
endmodule
