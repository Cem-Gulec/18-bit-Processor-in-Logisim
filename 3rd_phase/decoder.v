module decoder_4_bits ( 
	input[3:0] sel,
    output[17:0] out);

    wire[15:0] out; 

    //whenever one of the input value or selective bit value changes
    always @ (sel or out)
    begin
    	case(sel)
    		4'h0 : out <= 16'b0000000000000001;
    		4'h1 : out <= 16'b0000000000000010;
    		4'h2 : out <= 16'b0000000000000100;
    		4'h3 : out <= 16'b0000000000001000;
    		4'h4 : out <= 16'b0000000000010000;
    		4'h5 : out <= 16'b0000000000100000;
    		4'h6 : out <= 16'b0000000001000000;
    		4'h7 : out <= 16'b0000000010000000;
    		4'h8 : out <= 16'b0000000100000000;
    		4'h9 : out <= 16'b0000001000000000;
    		4'ha : out <= 16'b0000010000000000;
    		4'hb : out <= 16'b0000100000000000;
    		4'hc : out <= 16'b0001000000000000;
    		4'hd : out <= 16'b0010000000000000;
    		4'he : out <= 16'b0100000000000000;
    		4'hf : out <= 16'b1000000000000000;
    	endcase
    end

endmodule