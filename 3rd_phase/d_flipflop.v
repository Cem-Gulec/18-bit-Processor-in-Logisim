module posedge_dff(
	input d,clk,
	output q);

	//whenever posedge of clock signal comes
	always @(posedge clk) 
	begin
 		q <= d; 
	end 
endmodule 