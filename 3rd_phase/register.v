module Register(
	input[17:0] d,
	input en, clk,
	output[17:0] q
	input clear);

	//whenever posedge of clock signal comes
	always @(posedge clk) 
	if(clear)
	begin
 		q <= 18'b0; 
	end
	else if(en)
	begin
		q <= d;
	end
endmodule 