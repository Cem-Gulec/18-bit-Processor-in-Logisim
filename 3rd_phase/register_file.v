`include "register.v"

module register_file(
	input[3:0] read_register_1, read_register_2, write_register,
	input[17:0] write_data,
	input reg_write, clk
	output[17:0] reg_value
);

	wire [17:0] en;
 
	assign en = (reg_write == 1'b1) ? write_data : en;
	
	Register register0(write_data[0], en[0], clk, reg_value[0]);
	Register register1(write_data[1], en[1], clk, reg_value[1]);
	Register register2(write_data[2], en[2], clk, reg_value[2]);
	Register register3(write_data[3], en[3], clk, reg_value[3]);
	Register register4(write_data[4], en[4], clk, reg_value[4]);
	Register register5(write_data[5], en[5], clk, reg_value[5]);
	Register register6(write_data[6], en[6], clk, reg_value[6]);
	Register register7(write_data[7], en[7], clk, reg_value[7]);
	Register register8(write_data[8], en[8], clk, reg_value[8]);
	Register register9(write_data[9], en[9], clk, reg_value[9]);
	Register register10(write_data[10], en[10], clk, reg_value[10]);
	Register register11(write_data[11], en[11], clk, reg_value[11]);
	Register register12(write_data[12], en[12], clk, reg_value[12]);
	Register register13(write_data[13], en[13], clk, reg_value[13]);
	Register register14(write_data[14], en[14], clk, reg_value[14]);
	Register register15(write_data[15], en[15], clk, reg_value[15]);

endmodule