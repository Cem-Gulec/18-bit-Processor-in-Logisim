// dff
module d_ff(clk,d,q,_q);
input d,clk;

output q,_q;
reg q,_q;
always@(posedge clk)
begin
    q<=d;
    _q<=~d;
end
endmodule 
// dff with asynchronus reset
module d_ff_reset
   (
    input wire clk, reset,
    input wire d,
    output reg q
   );
   always @(posedge clk, posedge reset)
      if (reset)
         q <= 1'b0;
      else
         q <= d;
endmodule

module reg_reset
(
input wire clk, reset,
input wire [7:0] d ,
output reg [7:0] q
);
// body
always @ ( posedge clk , posedge reset)
  if ( reset )
    q <= 0 ;
  else
    q <= d ;
endmodule