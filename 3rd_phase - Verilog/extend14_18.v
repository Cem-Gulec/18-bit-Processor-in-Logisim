module Extender_14_to_18(
	input [13:0] i,
	output [17:0] o
);
	assign o[17] = i[13];
	assign o[16] = i[13];
	assign o[15] = i[13];
	assign o[14] = i[13];

	assign o[13] = i[13];
	assign o[12] = i[12];
	assign o[11] = i[11];
	assign o[10] = i[10];
	assign o[9] = i[9];
	assign o[8] = i[8];
	assign o[7] = i[7];
	assign o[6] = i[6];
	assign o[5] = i[5];
	assign o[4] = i[4];
	assign o[3] = i[3];
	assign o[2] = i[2];
	assign o[1] = i[1];
	assign o[0] = i[0];
endmodule;
