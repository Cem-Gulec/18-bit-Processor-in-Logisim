`timescale 1 ns/1 ns
module LaserTimer(instruction,mux2,B, X, Clk, Rst);
  
  input B;
  output reg X;
  input Clk, Rst;
  /****/
  input [15:0] instruction;
  output reg [1:0] Mux2;
  /***/
  parameter S_Off=2'b00;
  reg [1:0] State, StateNext;
  //State encodings:
  // S_Off 00, S_On1 01, S_On2 10, S_On3 11
  
  //CombLogic
  always @(State, B) begin
    X <= State[1] | State[0];
    StateNext[1] <= (~State[1] & State[0]) | (State[1] & ~State[0]);
    StateNext[0] <= (~State[1] & ~State[0] & B) | (State[1] & ~State[0]);  
  end
  
  //StateReg
  always @(posedge Clk) begin

      State <= StateNext;
  end
endmodule
    
