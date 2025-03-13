`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/13/2025 04:20:52 AM
// Design Name: 
// Module Name: btnDebounce
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


module btnDebounce(
    input clk,
    input button,
    output logic buttonOut
    );

    reg [19:0] count;
    reg button_reg, button_reg2;
    
    always @(posedge clk) begin
        button_reg = button;
        button_reg2 = button_reg;
    
        if (button_reg != button_reg2)
            count = 0;
        else if (count == 20'hFFFFF)
            buttonOut = button_reg2;
        else
            count = count + 1;
    end
endmodule
