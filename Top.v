`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.03.2020 11:52:12
// Design Name: 
// Module Name: Top
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


module Top(
    input HorEn,
    input [3:0] DecEnt,
    input MinEn,
    input [3:0] UniEn,
    input Rst,
    input Clk,
    output [7:0] Seg,
    output [3:0] Disp,
    output [7:0] SegOut
    );
       // Declare embedded signals that allow me to interconnect modules
    wire        EnHoras_Int;
    wire        EnDecMin_Int;
    wire        EnUniMin_Int;
    wire        EnSeg_Int;
    wire        EnDecSeg_Int;
    wire        Clk1Hz_Int;
    wire        TCODecMin_Int;
    wire        TCOUniMin_Int;
    wire        TCODecSeg_Int;
    wire        TCOUniSeg_Int;
    wire        [7:0] Hor_Int;
    wire        [3:0] DecMin_Int;
    wire        [3:0] UniMin_Int;
    wire        ClkRefresh_Int;
    wire        [1:0] Sel_Int;
    wire        [3:0] Tiempo_Int;
    
    //Create Logic Gates
    assign EnHoras_Int = EnDecMin_Int & TCODecMin_Int & Clk1Hz_Int;
    assign EnDecMin_Int = EnUniMin_Int & TCOUniMin_Int & Clk1Hz_Int;
    assign EnUniMin_Int = TCOUniSeg_Int & TCODecSeg_Int & Clk1Hz_Int;
    assign EnSeg_Int = HorEn | MinEn;
    assign EnDecSeg_Int = TCOUniSeg_Int & Clk1Hz_Int;
    // Instantiate (connect) modules together
    // New instantiation method
//    FrequencyDivider U1(Clk,Rst,EnFreq_emb);
//    Counter          U2(EnFreq_emb,Clk,Rst,Count_emb);
//    Decoder7Seg      U3(Count_emb,Seg,Anode);
      Clk1Hz         U1(Rst,Clk,Clk1Hz_Int);
      Cont0a9        U2(EnSeg_Int,Clk1Hz_Int,Rst,Clk,4'b0000,TCOUniSeg_Int,SegOut[3:0]);
      Cont0a5        U3(EnSeg_Int,EnDecSeg_Int,Rst,Clk,4'b0000,TCODecSeg_Int,SegOut[7:4]);
      Cont0a9        U4(MinEn,EnUniMin_Int,Rst,Clk,UniEn,TCOUniMin_Int,UniMin_Int);
      Cont0a5        U5(MinEn,EnDecMin_Int,Rst,Clk,DecEnt,TCODecMin_Int,DecMin_Int);
      Cont0a23       U6(HorEn,EnHoras_Int,Rst,Clk,DecEnt,UniEn,Hor_Int);
      RefreshDisplay U7(Rst,Clk,ClkRefresh_Int);
      Cont0a3        U8(ClkRefresh_Int,Rst,Clk,Sel_Int);
      Mux4to1        U9(Hor_Int[7:4],Hor_Int[3:0],DecMin_Int,UniMin_Int,Sel_Int,Tiempo_Int);
      SelAnodo       U10(Sel_Int,Disp);
      DecBCD7Seg     U11(Tiempo_Int,Seg);    
endmodule               
