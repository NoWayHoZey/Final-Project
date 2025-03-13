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
    assign outClk2 = timer16SIn;
    assign btnOut = timer16;
    
    logic CANclk; //can clock register
    //clock for 1mbps can data rate
    clockDivider #(.COUNT(100)) CANclkdiv (.clk(sysClock), .dclk(CANclk));
    
    logic msgclk; //message clock register
    //clock for can message send timing
    clockDivider  #(.COUNT(400_000_000)) msgclkdiv (.clk(sysClock), .dclk(msgclk));
    
    logic btnclk;
    clockDivider #(.COUNT(10_000_000)) btnclkdiv (.clk(sysClock), .dclk(btnclk));
    
    logic buttonOut;
    btnDebounce bouncer (.clk(sysClock), .button(btn), .buttonOut(buttonOut));
    
    logic sensor;
    enabledClock eClock (.clk(btnclk), .enable(buttonOut), .clkOut(sensor));
    
    logic [7:0] hrCount; //heartrate count register
    logic hrReset;
    TFlipFlop hrFF (.t(1), .q(hrReset), .clk(timer11POut[10] || timer1POut[1]));
    //counter of heartrate from sensor input
    SensCount hrCounter (.sig(sensor), .rst(hrReset), .count(hrCount));
    
    logic [10:0] CANID; //can id register
    //can message id machine based on heartrate
    Can_ID CANIdeaer (.clk(sysClock), .data(hrCount), .can_id_out(CANID));
    
    logic timer16; //16 bit delay register
    logic timer16SIn; //16 bit delay enable or input register
    logic [15:0] timer16POut; //16 bit delay parallel register
    TFlipFlop timer16FF (.t(1), .q(timer16SIn), .clk(msgclk || timer16POut[1])); //16 bit delay enable flip flop
    //shift register used as bit counter
    USR16b timer16Reg (.clk(CANclk), .Pout(timer16POut), .Sout(timer16), .Sin(timer16SIn));
    
    logic timer11SIn; //11 bit delay enable or input register
    logic [15:0] timer11POut; //11 bit delay parallel register
    TFlipFlop timer11FF (.t(1), .q(timer11SIn), .clk(timer16 || timer11POut[1])); //11 bit delay enable flip flop
    //shift register used as bit counter
    USR16b timer11Reg (.clk(CANclk), .Pout(timer11POut), .Sin(timer11SIn));
    
    logic timer1SIn; //1 bit delay enable or input register
    logic [15:0] timer1POut; //1 bit delay parallel register
    TFlipFlop timer1FF (.t(1), .q(timer1SIn), .clk(timer11POut[10] || timer1POut[1]));  //1 bit delay enable flip flop
    //shift register used as bit counter
    USR16b timer1Reg (.clk(CANclk), .Pout(timer1POut), .Sin(timer1SIn));
    
    logic [14:0] crc; //can checksum register
    logic checkClear; //can checksum reset register
    TFlipFlop checkFF (.t(1), .q(checkClear), .clk(msgclk || timer16POut[1])); //can checksum reset flip flop
    //can checksum machine
    checksumMachine crcer (.clk(CANclk), .data(CANSerial), .clr(checkClear), .crc(crc));
    
    wire [15:0] CANRegPIn;
    assign CANRegPIn = (timer16POut > 0) ? {5'b11111, (hrCount * 15), 3'b000} : (timer11POut[10:0] > 0) ? {1'b1, crc} : {4'b0000, CANID, 1'b0}; //can shift register parallel input register
    logic CANRegPEnable; //can shift register parallel input enable register
    assign CANPEnableClocks = msgclk || timer16POut[1] || timer16 || timer11POut[1] || timer11POut[10] || timer1POut[1];
    TFlipFlop CANPEnableFF (.t(1), .q(CANRegPEnable), .clk(CANPEnableClocks)); //can shift register parallel input enable flip flop
    //shift register for can output
    USR16b CANReg (.clk(CANclk), .Pin(CANRegPIn), .Sout(CANSerial), .Penable(CANRegPEnable), .Sin('1));
endmodule