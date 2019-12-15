module Full_Comperator(
	input a,b,
	input gt_in,
	input lt_in,
	input eq_in,
	output qt, lt, eq
);
	assign gt = gt_in | eq_in & a & ~b;
	assign lt = lt_in | eq_in & ~a & b;
	assign eq = eq_in & (a ^ b);
	
endmodule


module Comperator_18_bits(
	input [0:18] a,b,
	output gt, lt, eq
);
	wire g[18:0];
	wire l[18:0];
	wire e[18:0];

	Full_Comperator c_00 (a[0],  b[0],  1'b0,  1'b0,  1'b0, g[0], l[0], e[0] );
	Full_Comperator c_01 (a[1],  b[1],  g[0],  l[0],  e[0], g[1], l[1], e[1] );
	Full_Comperator c_02 (a[2],  b[2],  g[1],  l[1],  e[1], g[2], l[2], e[2] );
	Full_Comperator c_03 (a[3],  b[3],  g[2],  l[2],  e[2], g[3], l[3], e[3] );
	Full_Comperator c_04 (a[4],  b[4],  g[3],  l[3],  e[3], g[4], l[4], e[4] );
	Full_Comperator c_05 (a[5],  b[5],  g[4],  l[4],  e[4], g[5], l[5], e[5] );
	Full_Comperator c_06 (a[6],  b[6],  g[5],  l[5],  e[5], g[6], l[6], e[6] );
	Full_Comperator c_07 (a[7],  b[7],  g[6],  l[6],  e[6], g[7], l[7], e[7] );
	Full_Comperator c_08 (a[8],  b[8],  g[7],  l[7],  e[7], g[8], l[8], e[8] );
	Full_Comperator c_09 (a[9],  b[9],  g[8],  l[8],  e[8], g[9], l[9], e[9] );
	Full_Comperator c_10 (a[10], b[10], g[9],  l[9],  e[9], g[10], l[10], e[10] );
	Full_Comperator c_11 (a[11], b[11], g[10], l[10], e[10], g[11], l[11], e[11] );
	Full_Comperator c_12 (a[12], b[12], g[11], l[11], e[11], g[12], l[12], e[12] );
	Full_Comperator c_13 (a[13], b[13], g[12], l[12], e[12], g[13], l[13], e[13] );
	Full_Comperator c_14 (a[14], b[14], g[13], l[13], e[13], g[14], l[14], e[14] );
	Full_Comperator c_15 (a[15], b[15], g[14], l[14], e[14], g[15], l[15], e[15] );
	Full_Comperator c_16 (a[16], b[16], g[15], l[15], e[15], g[16], l[16], e[16] );
	Full_Comperator c_17 (a[17], b[17], g[16], l[16], e[16], gt, lt, eq );
endmodule