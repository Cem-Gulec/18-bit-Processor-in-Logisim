module counter(
	input clr,clk,
	input[1:0] state,
	input[17:0] d,
 	output reg[17:0] q
);
	always @(posedge clk, posedge clr) 
	begin
	  if(clr) 
	  	q <= 18'h00000;
	  else
	    case(state)
		2'b00: q<=d;
		2'b01: q<=q+1;
		2'b10: q<=q-1;
	    endcase
	end
endmodule
