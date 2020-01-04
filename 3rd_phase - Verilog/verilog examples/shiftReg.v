`timescale 1 ns/1 ns
module shiftReg
(
input wire [1:0] s1s0 ,
input shl_in,
input shr_in,
input wire [3:0] I,
output reg [3:0] Q,
input clk
);
always @(posedge clk)
begin
  if (s1s0==2'b00) // can be written as (~en)
    Q<=I;
  else if(s1s0==2'b01)
    Q<= {shr_in,Q[3:1]};
  else if (s1s0==2'b10)
    Q<= {Q[2:0],shl_in};
  else if (s1s0==2'b11)
    Q<= Q
  else
    Q = 4'bxxxx;
end
endmodule

module mainShiftReg();

reg clk;
reg [1:0] s1s0;
reg shl_in;
reg shr_in;
reg [3:0] I;
wire [3:0] Q;

shiftReg myReg(s1s0,shl_in,shr_in,I,Q,clk);
initial begin
	
	clk<=1'b0;
	#30 s1s0<=2'b00;
	I<=4'b0000;
	#30 s1s0<=2'b01;
	shl_in<=1;
	shr_in<=1;
	I<=4'b0000;
	#30 s1s0<=2'b10;
	shl_in<=1;
	shr_in<=1;
	I<=4'b0101;
end

always begin
	#15 clk<=~clk;	
end

endmodule