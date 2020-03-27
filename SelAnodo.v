`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 12:00:51
// Design Name: 
// Module Name: SelAnodo
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


module SelAnodo(
    input [1:0] Sel,
    output reg [3:0] Anodo
    );
    
     always @(Sel)
    begin
        case (Sel)
            2'b00 : Anodo = 4'b1110;
            2'b01 : Anodo = 4'b1101;
            2'b10 : Anodo = 4'b1011;
            2'b11 : Anodo = 4'b0111;
            default : Anodo = 4'b1111;
        endcase
    end
endmodule
