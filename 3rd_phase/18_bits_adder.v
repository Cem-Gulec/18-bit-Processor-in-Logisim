module HA( input a, b, output c_out, s );
	assign s = a ^ b;
	assign c_out = a & b;   
endmodule // Half_Adder
 
module FA( input a, b, c_in, output c_out, s );
	wire wire_1; 
	wire wire_2;
	wire wire_3;

	assign wire_1 = a ^ b;
	assign wire_2 = wire_1 & c_in;
	assign wire_3 = a & b;

	assign c_out = wire_2 | wire_3;
	assign s = wire_1 ^ c_in;
endmodule // Full_Adder

module Adder_2_bits (input [1:0] a,b, input c_in, output [1:0] s, output c_out);
	FA fa_00 ( a[0], b[0], c_in, c0, s[0] );
	FA fa_01 ( a[1], b[1], c0, c_out, s[1] );	
endmodule; // 2 bits adder

module Adder_18_bits( input [19:0] a,b, output [19:0] s, output c_out);
	wire c[7:0];
	Adder_2_bits a_00 ( a[1:0],   b[1:0],   1'b0, c[0], s[1:0] );
	Adder_2_bits a_01 ( a[3:2],   b[3:2],   c[0], c[1], s[3:2] );
	Adder_2_bits a_02 ( a[5:4],   b[5:4],   c[1], c[2], s[5:4] );
	Adder_2_bits a_03 ( a[7:6],   b[7:6],   c[2], c[3], s[7:6] );
	Adder_2_bits a_04 ( a[9:8],   b[9:8],   c[3], c[4], s[9:8] );
	Adder_2_bits a_05 ( a[11:10], b[11:10], c[4], c[5], s[11:10] );
	Adder_2_bits a_06 ( a[13:12], b[13:12], c[5], c[6], s[13:12] );
	Adder_2_bits a_07 ( a[15:14], b[15:14], c[6], c[7], s[15:14] );
	Adder_2_bits a_08 ( a[17:16], b[17:16], c[7], c_out,s[17:16] );

endmodule; // 18 bits adder