module mux_2to1 ( 
	input[17:0] in0, in1,
   	input[1:0] sel,
    output[17:0] out);

    assign out = (sel == 1'b1) ? in1 : in0;

endmodule

module mux_4to1 ( 
	input[17:0] in0, in1, in2, in3,
   	input[1:0] sel,
    output[17:0] out);

    //whenever one of the input value or selective bit value changes
    always @ (in0 or in1 or in2 or in3 or sel)
    begin
    	case(sel)
    		2'b00 : out <= in0;
    		2'b01 : out <= in1;
    		2'b10 : out <= in2;
    		2'b11 : out <= in3;
    	endcase
    end
endmodule

module mux_16to1 ( 
	input[17:0] in0, in1, in2, in3, in4, in5, in6, in7, in8, in9,
	input[17:0] in10, in11, in12, in13, in14, in15, in16, in17,
   	input[1:0] sel,
    output[17:0] out);

    //whenever one of the input value or selective bit value changes
    always @ (in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8 or in9 or 			in10 or in11 or in12 or in13 or in14 or in15 or in16 or in17 or sel)
    begin
    	case(sel)
    		4'h0 : out <= in0;
    		4'h1 : out <= in1;
    		4'h2 : out <= in2;
    		4'h3 : out <= in3;
    		4'h4 : out <= in4;
    		4'h5 : out <= in5;
    		4'h6 : out <= in6;
    		4'h7 : out <= in7;
    		4'h8 : out <= in8;
    		4'h9 : out <= in9;
    		4'ha : out <= in10;
    		4'hb : out <= in11;
    		4'hc : out <= in12;
    		4'hd : out <= in13;
    		4'he : out <= in14;
    		4'hf : out <= in15;
    	endcase
    end
endmodule