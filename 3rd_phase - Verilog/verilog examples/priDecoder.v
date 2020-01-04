`timescale 1 ns/1 ns
module decoder_2_4_if
(
input wire [1:0] a ,
input wire en,
output reg [3:0] y
);
always @*
  if (en==1'b0) // can be written as (~en)
    y = 4'b0000;
  else if(a==2'b00)
    y = 4'b0001;
  else if (a==2'b01)
    y = 4'b0010;
  else if (a==2'b10)
    y = 4'b0100;
  else
    y = 4'b1000;
 endmodule
 
 module decoder_2_4_case
(
input wire [1:0] a ,
input wire en,
output reg [3:0] y
);
always @*
  case({en,a})
    3'b000, 3'b001, 3'b010, 3'b011: y = 4'b0000;
    3'b100: begin y = 4'b0001; end
    3'b101: y = 4'b0010;
    3'b110: y = 4'b0100;
    3'b111: y = 4'b1000; // default also can be used
  endcase
endmodule