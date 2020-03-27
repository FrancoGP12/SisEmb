`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 11:55:26
// Design Name: 
// Module Name: Cont0a5
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


module Cont0a5(
    input Load,
    input Enable,
    input Rst,
    input Clk,
    input [3:0] Valor,
    output TCO,
    output [3:0] Cuenta
    );
    
    reg [3:0] inc = 0;
    always @(posedge Clk)
    begin
        if (Rst)
            inc = 4'b0000;
        else if (Load)
            inc =(inc > 4'b0101)?4'b0101:Valor;
        else
            if (Enable)
                if (inc == 4'b0101)
                    inc = 4'b0000;
                else
                    inc = inc + 1'b1;
    end
    
    assign Cuenta = inc;
    assign TCO = (inc == 4'b0101) ? 1'b1 : 1'b0;
    
endmodule
