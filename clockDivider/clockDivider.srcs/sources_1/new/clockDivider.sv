`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2025 09:53:37 PM
// Design Name: 
// Module Name: clockDivider
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


module clockDivider 
    #(parameter COUNT = 100)
    (input clk, output logic dclk);
    
    reg [31:0] counter;
    
    initial begin 
        counter = 0;
        dclk = 0;
    end
    
    always @ (posedge clk) begin 
        counter = counter + 1;
        if (counter == COUNT) begin
            counter = 0;
            dclk = ~dclk;
        end
    end
    
endmodule
