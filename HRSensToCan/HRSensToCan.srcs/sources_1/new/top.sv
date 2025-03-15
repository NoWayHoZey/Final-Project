`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 11:11:28 PM
// Design Name: 
// Module Name: top
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


module top(
    input sysClock, btn,
    output CANSerial, outClk1, outClk2, btnOut
    );
    
    assign outClk1 = CANclk;
    assign outClk2 = CANRegPEnable;
    assign btnOut = (timer16POut > 0 || timer11POut[0]);
    
    logic CANclk; //can clock register
    //clock for 1mbps can data rate
    clockDivider #(.COUNT(50)) CANclkdiv (.clk(sysClock), .dclk(CANclk));
    
    logic msgclk; //message clock register
    //clock for can message send timing
    clockDivider  #(.COUNT(200_000_000)) msgclkdiv (.clk(sysClock), .dclk(msgclk));
    
    logic btnclk;
    clockDivider #(.COUNT(7_000_000)) btnclkdiv (.clk(sysClock), .dclk(btnclk));
    
    logic buttonOut;
    btnDebounce bouncer (.clk(sysClock), .button(btn), .buttonOut(buttonOut));
    
    logic sensor;
    enabledClock eClock (.clk(btnclk), .enable(buttonOut), .clkOut(sensor));
    
    logic timer16SOut; //16 bit delay register
    logic [15:0] timer16POut; //16 bit delay parallel register
    logic [15:0] timer11POut; //11 bit delay parallel register
    
    logic timer16Q;
    
    TFlipFlop timer16FF (.t(1), .start('0), .q(timer16Q), .clk(msgclk ^ timer16POut[0])); //16 bit delay enable flip flo
    
    assign msgBegin = (msgclk ^ timer16POut[0]) && timer16Q;
    assign CANRegPEnable = msgBegin ^ timer16SOut ^ timer11POut[10];
    
    //shift register used as bit counter
    USR16b timer16Reg (.clk(CANclk), .Pout(timer16POut), .Sout(timer16SOut), .Sin(msgBegin));
    USR16b timer11Reg (.clk(CANclk), .Pout(timer11POut), .Sin(timer16SOut));

    logic [7:0] hrCount; //heartrate count register
    //counter of heartrate from sensor input
    SensCount hrCounter (.sig(sensor), .rst(timer11POut[10]), .count(hrCount));

    logic [10:0] CANID; //can id register
    //can message id machine based on heartrate
    Can_ID CANIdeaer (.clk(sysClock), .data(hrCount), .can_id_out(CANID));
    
    logic [14:0] crc; //can checksum register
    checksumMachine crcer (.clk(CANclk), .data(CANSerial), .clr(msgBegin), .crc(crc)); //can checksum machine
    
    wire [7:0] CANData = hrCount[3:0] * 15;
    wire [15:0] f1 = {4'b0000, CANID, 1'b0};
    wire [15:0] f2 = {'0};//{5'b11111, CANData, 3'b100};
    wire [15:0] f3 = {1'b1, crc};
    wire [15:0] CANRegPIn = (timer16POut > 0 || timer11POut[0]) ?  f2 : (timer11POut[10:0] > 0) ?  f3 : f1;
    logic [15:0] CANRegPOut;
    //shift register for can output
    USR16b CANReg (.clk(CANclk), .Pin(CANRegPIn), .Sout(CANSerial), .Penable(CANRegPEnable), .Sin('1), .Pout(CANRegPOut));
endmodule