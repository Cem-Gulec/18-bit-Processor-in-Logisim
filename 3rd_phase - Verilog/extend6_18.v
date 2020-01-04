module Extender_6_to_18(
	input [5:0] i,
	output [17:0] o
);
	assign o[17] = i[5];
	assign o[16] = i[5];
	assign o[15] = i[5];
	assign o[14] = i[5];
	assign o[13] = i[5];
	assign o[12] = i[5];
	assign o[11] = i[5];
	assign o[10] = i[5];
	assign o[9] = i[5];
	assign o[8] = i[5];
	assign o[7] = i[5];
	assign o[6] = i[5];
	
	assign o[5] = i[5];
	assign o[4] = i[4];
	assign o[3] = i[3];
	assign o[2] = i[2];
	assign o[1] = i[1];
	assign o[0] = i[0];
endmodule;

