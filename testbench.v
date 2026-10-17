
module testbench;

reg [3:0] A, B;
reg [1:0] op;
wire [3:0] result;

integer tests = 0;
integer errors = 0;
integer a, b, operation;
reg [3:0] expected;

alu_4bit dut (
    .A(A),
    .B(B),
    .op(op),
    .result(result)
);

initial begin
    for (operation = 0; operation < 4; operation = operation + 1) begin
        for (a = 0; a < 16; a = a + 1) begin
            for (b = 0; b < 16; b = b + 1) begin

                A = a;
                B = b;
                op = operation;

                case (op)
                    2'b00: expected = A + B;
                    2'b01: expected = A - B;
                    2'b10: expected = A & B;
                    2'b11: expected = A | B;
                endcase

                #1;
                tests = tests + 1;

                if (result !== expected) begin
                    errors = errors + 1;
                    $display("FAIL: A=%d B=%d op=%b expected=%d actual=%d",
                             A, B, op, expected, result);
                end
            end
        end
    end

    $display("-------------------------");
    $display("Tests completed: %0d", tests);
    $display("Errors found: %0d", errors);

    if (errors == 0)
        $display("ALL TESTS PASSED!");
    else
        $display("VERIFICATION FAILED!");

    $finish;
end

endmodule
