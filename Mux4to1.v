`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 12:00:17
// Design Name: 
// Module Name: Mux4to1
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


module Mux4to1(
    input [3:0] DecHor,
    input [3:0] UniHor,
    input [3:0] DecMin,
    input [3:0] UniMin,
    input [2:0] Sel,
    output reg [3:0] Tiempo
    );
    
    always @(DecHor or UniHor or DecMin or UniMin or Sel)
    begin
        case (Sel)
            2'b00 : Tiempo = UniMin;
            2'b01 : Tiempo = DecMin;
            2'b10 : Tiempo = UniHor;
            2'b11 : Tiempo = DecHor;
            default : Tiempo = 0;
        endcase
    end
    
endmodule
