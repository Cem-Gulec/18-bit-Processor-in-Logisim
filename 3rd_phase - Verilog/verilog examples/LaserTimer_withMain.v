`timescale 1 ns/1 ns
module LaserTimer(B, X, Clk);
  
  input B;
  output reg X;
  input Clk;
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
  initial begin
	StateNext <= S_Off;
  end
  
  //StateReg
  always @(posedge Clk) begin

      State <= StateNext;
  end
endmodule
    
module mainLaser();
reg clk;
wire X;
reg Rst;
reg B;


LaserTimer myLaser(B, X, clk, Rst);
 

 initial begin
	clk<=1'b0;
	#30 B<=1'b1;
	#30 B<=1'b1;
	#30 B<=1'b0;
	#30 B<=1'b1;
	#30 B<=1'b0;
	
end

always begin
	#15 clk<=~clk;	
end

endmodule