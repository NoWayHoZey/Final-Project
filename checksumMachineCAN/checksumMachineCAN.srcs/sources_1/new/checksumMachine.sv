`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2025 08:10:24 PM
// Design Name: 
// Module Name: checksumMachine
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


module checksumMachine(
    input clk,
    input data,
    input clr,
    output reg [14:0] crc
    );
   wire inv;
   
   assign inv = data ^ crc[14];
   
   always @(posedge clk or posedge clr) begin
      if (clr) begin
         crc = 0;
      end
      else begin
         crc[14] = crc[13] ^ inv;
         crc[13] = crc[12];
         crc[12] = crc[11];
         crc[11] = crc[10];
         crc[10] = crc[9] ^ inv;
         crc[9] = crc[8];
         crc[8] = crc[7] ^ inv;
         crc[7] = crc[6] ^ inv;
         crc[6] = crc[5];
         crc[5] = crc[4];
         crc[4] = crc[3] ^ inv;
         crc[3] = crc[2] ^ inv;
         crc[2] = crc[1];
         crc[1] = crc[0] ^ inv;
         crc[0] = inv;
      end
   end
endmodule
