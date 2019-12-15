`include "18_bits_adder.v"
`include "Mux.v"

module ALU(A, B, alu_operation, result);

    input wire [17:0] A, B;
    input wire [1:0] alu_operation;
    output wire [17:0] result;

    wire [17:0] add_result, and_result, or_result, xor_result;
    Adder_18_bits adder (add_result, A, B);
    assign andResult = A & B;
    assign orResult = A | B;
    assign xorResult = A ^ B;

    mux4to1 m1(result, add_result, and_result, or_result, xor_result,alu_operation);

endmodule