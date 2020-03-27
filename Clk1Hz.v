`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 11:53:08
// Design Name: 
// Module Name: Clk1Hz
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


module Clk1Hz(
    input Rst,
    input Clk,
    output reg ClkOut
    );
    
    parameter BoardFrequency = 100000000;
    parameter Exp = 27;
    //Embedded signals
    reg [Exp-1:0] FreqCounter;
    always @(posedge Clk)
    begin
        if (Rst)
            FreqCounter = 0;
        else
            if (FreqCounter == (BoardFrequency - 1)) begin
                FreqCounter = 0;
                ClkOut = 1'b1;
            end
            else begin
                FreqCounter = FreqCounter + 1'b1;
                ClkOut = 1'b0;
            end
    end
endmodule
