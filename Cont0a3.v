`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 11:58:18
// Design Name: 
// Module Name: Cont0a3
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


module Cont0a3(
    input Enable,
    input Rst,
    input Clk,
    output [1:0] Cuenta
    );
    
    reg [1:0] inc = 0;
    always @(posedge Clk)
    begin
        if (Rst)
            inc = 2'b00;
        else
            if (Enable)
                if (inc == 2'b11)
                    inc = 2'b00;
                else
                    inc = inc + 1'b1;
    end
    
    assign Cuenta = inc;
    
endmodule
