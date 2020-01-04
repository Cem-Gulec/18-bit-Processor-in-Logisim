
module Invert18(
	input [17:0] i,
	output [17:0] r
);
	assign r[17] = ~i[17];
	assign r[16] = ~i[16];
	assign r[15] = ~i[15];
	assign r[14] = ~i[14];
	assign r[13] = ~i[13];
	assign r[12] = ~i[12];
	assign r[11] = ~i[11];
	assign r[10] = ~i[10];
	assign r[9] = ~i[9];
	assign r[8] = ~i[8];
	assign r[7] = ~i[7];
	assign r[6] = ~i[6];
	assign r[5] = ~i[5];
	assign r[4] = ~i[4];
	assign r[3] = ~i[3];
	assign r[2] = ~i[2];
	assign r[1] = ~i[1];
	assign r[0] = ~i[0];

	assign o = r + 1'd1;
endmodule;
