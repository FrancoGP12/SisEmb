`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 11:54:33
// Design Name: 
// Module Name: Cont0a9
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


module Cont0a9(
    input Load,
    input Enable,
    input Rst,
    input Clk,
    input [3:0] Valor,
    output TCO,
    output [3:0] Cuenta
    );
    
    //Embedded signals
    reg [3:0] inc = 0;
    always @(posedge Clk)
    begin
        if (Rst)
            inc = 4'b0000;
        else if (Load)
            inc = (inc > 4'b1001) ? 4'b1001 : Valor;
        else 
            begin
            if (Enable)
                if (inc == 4'b1001)
                    inc = 4'b0000;
                else
                    inc = inc + 1'b1;
            end
    end
    
    assign Cuenta = inc;
    assign TCO = (inc == 4'b1001) ? 1'b1 : 1'b0;
    
endmodule
