`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 07:35:07 PM
// Design Name: 
// Module Name: Can_ID
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
module Can_ID (
    input  clk,
    input  rst,
    input  [7:0] data,   
    output logic [10:0] can_id_out 
);
    initial begin
        can_id_out = 0;
    end
    always @(posedge clk or posedge rst) begin
        if (rst)
            can_id_out <= 11'b0;
        else begin
            if (data < 9)
                can_id_out[2:0] = 0;
            else if (data < 10)
                can_id_out[2:0] = 1;
            else if (data < 11)
                can_id_out[2:0] = 2; 
            else if (data < 12)
                can_id_out[2:0] = 3;
            else
                can_id_out[2:0] = 4;
        end
    end


endmodule


