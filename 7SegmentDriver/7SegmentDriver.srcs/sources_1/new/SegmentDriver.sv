`timescale 1ns / 1ps


module SegmentDriver(
    input clk,
    input [15:0] sw,
    output wire [6:0] a_to_g,
    output logic [3:0] anode,
    output wire dp
    );
    assign dp = 1;
    logic [3:0] segIn;
    
    initial begin
        segIn = sw[3:0];
    end
    
    SegInterpreter interp(.x(segIn), .a_to_g(a_to_g));
    RingCounter stater(.clk(clk), .state(anode));
    
    always @* begin
        case(anode)
            4'b1110 : segIn = sw[3:0];
            4'b1101 : segIn = sw[7:4];
            4'b1011 : segIn = sw[11:8];
            4'b0111 : segIn = sw[15:12];
            default : segIn = sw[3:0];
        endcase
    end
endmodule