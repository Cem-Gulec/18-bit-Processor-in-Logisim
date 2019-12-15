module counter(
	input aclr,clk,
	input[17:0] d,
	input[1:0] func,
 	outout reg[17:0] q
);
	always @(posedge clk, posedge aclr) 
	begin
	  if(aclr) q <= 18'h00000;
	  else
	    case(func)
		2'b00: q<=d;
		2'b01: q<=q+1;
		2'b10: q<=q-1;
	    endcase
	end
endmodule
