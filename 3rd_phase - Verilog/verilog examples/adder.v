`timescale 1 ns/1 ns
module Adder #(parameter N=4)(A, B, S);

  input [N:0] A, B; 
  output [N:0] S;
  reg [N:0] S;
  
  always @(A, B) begin
    S <= A + B;
  end
endmodule

module AddwCarry #(parameter N=4)(A, B, Ci, S, Co);
  
  input [N:0] A,B;
  input Ci;
  output [N:0] S;
  reg [N:0] S;
  output Co;
  reg Co;
  
  reg [N+1:0] A1,B1,S1;
  always @(A, B, Ci) begin
    A1= {1'b0, A}; B1= {1'b0, B};
    S1= A1 + B1 + Ci;
    S <= S1[N:0];
    Co <= S1[N+1];
  end
endmodule

module Comparator #(parameter N=4)(A, B, Gt, Eq, Lt);
  
  input [N:0] A;
  input signed [N:0] B;
  output Gt, Eq, Lt;
  reg Gt, Eq, Lt;
  
  always @(A, B) begin
    if($signed({1'b0,A}) < B) begin
      Gt<=0; Eq <=0; Lt<=1;
    end
    else if($signed({1'b0,A}) > B) begin
      Gt<=1; Eq<=0; Lt<=0;
    end
    else begin
      Gt<=0;  Eq<=1;  Lt<=0;
    end
  end
endmodule