`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 12:01:29
// Design Name: 
// Module Name: DecBCD7Seg
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


module DecBCD7Seg(
    input [3:0] BCD,
    output reg [7:0] Seg
    );
    
    always @(BCD)
    begin
        case (BCD)
            4'b0000: Seg <= 8'b11000000;
            4'b0001: Seg <= 8'b11111001;
            4'b0010: Seg <= 8'b10100100;
            4'b0011: Seg <= 8'b10110000;
            4'b0100: Seg <= 8'b10011001;
            4'b0101: Seg <= 8'b10010010;
            4'b0110: Seg <= 8'b10000010;
            4'b0111: Seg <= 8'b11111000;
            4'b1000: Seg <= 8'b10000000;
            4'b1001: Seg <= 8'b10010000;
            default: Seg <= 8'b11111111;
        endcase
    end
    
endmodule
