`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 11:57:07
// Design Name: 
// Module Name: Cont0a23
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


module Cont0a23(
    input Load,
    input Enable,
    input Rst,
    input Clk,
    input [3:0] ValorDec,
    input [3:0] ValorUni,
    output [7:0] Cuenta
    );
    
    reg [3:0] incDec = 0;
    reg [3:0] incUni = 0;
    always @(posedge Clk)
    begin
        if (Rst) begin
            incUni = 4'b0000;
            incDec = 4'b0000;
        end
        else if (Load) 
        begin
            incDec = ValorDec;
            incUni = ValorUni;
            if (incDec> 4'b0010) incDec= 4'b0010;
            if (incUni> 4'b1001) incUni= 4'b1001;
            if (incDec==4'b0010)incUni=(incUni>4'b0011)?4'b0011:ValorUni;
        end
        else
            if (Enable)
                if (incDec== 4'b0010 && incUni== 4'b0011) begin
                    incDec= 4'b0000;
                    incUni= 4'b0000;
                end
                else 
                begin
                    if (incUni== 4'b1001) begin
                        incUni= 0;
                        incDec= incDec + 1'b1;
                    end
                    else
                        incUni= incUni + 1'b1;
                end
    end
    
    assign Cuenta[7:4] = incDec;
    assign Cuenta[3:0] = incUni;
    
endmodule
