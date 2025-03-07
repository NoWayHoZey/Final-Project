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
    output [15:0] Pout
    );
    
    logic [16:0] data = 0;
    
    assign Pout = data[16:1];
    assign Sout = data[16];
    
    always @(posedge clk) begin
        if (Penable) begin
            data[15:0] = Pin;
        end else begin
            data[0] = Sin;
        end
    end
    
    DFlipFlop ffs [15:0] (.D(data[15:0]), .Q(data[16:1]), .clk(clk));
    
endmodule
