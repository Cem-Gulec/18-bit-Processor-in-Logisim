
`timescale 1 ns/1 ns
module eq2_sop
(
input wire [1:0] a , b ,
output wire aeqb
);
//internal signal decleration
wire p0, pl, p2, p3;
//sum of product terms
assign aeqb = p0 | pl | p2 | p3;
// product terms
assign p0 = (~a[1] &  ~b[1]) & (~a[0] & ~b[0]) ;
assign pl = (~a[1] &  ~b[1]) & ( a[0] &  b[0]) ;
assign p2 = ( a[1] &   b[1]) & (~a[0] & ~b[0]) ;
assign p3 = ( a[1] &   b[1]) & ( a[0] &  b[0]) ;
endmodule

module mainComparator();
  reg [1:0] x,y;
  wire isEqual;
  eq2_sop eqFirst(x,y,isEqual);
  initial begin
    #15  x=2'b00;  y=2'b00;
    #15  x=2'b00;  y=2'b01;
    #15  x=2'b00;  y=2'b10;
    #15  x=2'b00;  y=2'b00;
    #15  x=2'b11;  y=2'b11;
    #15  x=2'b01;  y=2'b10;
    #15  x=2'b10;  y=2'b10;
    #15  x=2'b01;  y=2'b01;
    
  end
endmodule