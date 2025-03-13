`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 09:37:06 PM
// Design Name: 
// Module Name: Can_ID_SIM
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


module Can_ID_SIM();
    logic clk;
    logic rst;
    logic [7:0] data;
    logic [10:0] can_id_out;

    always #5 clk = ~clk;
    Can_ID uut (.clk(clk),.rst(rst),.data(data),.can_id_out(can_id_out));


    initial begin
        clk = 0;
        rst = 0;
        data = 8;
 
        #10
        data = 13;
        #10
        data = 9;
        #10
        data = 10;
        #10
        data = 11;
        #10
        data = 14;
        #10
        data = 3;
        #10
        data =1;
        #10
        data = 8;
        
    end

endmodule
