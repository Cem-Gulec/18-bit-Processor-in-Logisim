`timescale 1 ns/1 ns
module and2(X,Y,F);
  input X,Y;
  output F;
  reg F,A;
  always @(X, Y)begin
    F<=X & Y;
    A<=X | Y;
  end
endmodule

module xor2(X,Y,F);
  input X,Y;
  output F;
  reg F;
  always @(X, Y)begin
    F<= X^Y;  
  end
endmodule

module SR_Latch(set,reset,Q);
  input set,reset;
  output Q;
  wire set,reset;
  wire Qprime,Q;
  
    assign Q = !(reset | Qprime);
    assign Qprime= !(set | Q);
  
 /* always begin
  #20  set<=0;  reset<=0; 
  #20  set<=0;  reset<=1; 
  #20  set<=1;  reset<=0; 
  #20  set<=1;  reset<=1; 
  end*/
  
  
endmodule

module main();
  reg A,B,C;
  wire w1,w2,final;
  and2 gate1(A,B,w1);
  and2 gate2(A,C,w2);
  xor2 gate3(w1,w2,final); 
  SR_Latch SR(A,B,final); 
  always begin
    #20 A<=0; B<=0;
     #20 A<=0; B<=1;
      #20 A<=1; B<=0;
       #20 A<=1; B<=1;
   /* #20 A<=0; B<=0; C<=0;
    #20 A<=0; B<=0; C<=1;
    #20 A<=0; B<=1; C<=0;
    #20 A<=0; B<=1; C<=1;
    #20 A<=1; B<=0; C<=0;
    #20 A<=1; B<=0; C<=1;
    #20 A<=1; B<=1; C<=0;
    #20 A<=1; B<=1; C<=1;*/
  end  
endmodule