module tBench;
    wire [7:0] sum;
    wire cout, overflow;
    reg [15:0] test; 
integer count ; 
   
    ripple_carry_adder_8bit DUT (
        .a(test[15:8]),
        .b(test[7:0]),
        .sum(sum),
        .cout(cout),
        .overflow(overflow)
    );

    reg [8:0] expected;
    reg expected_overflow;

    
    initial begin
        $display("Starting compact testbench...");

        for (count = 0; count < 65536; count = count + 1) begin
            test = count ;
				#1; 
            expected = test[15:8] + test[7:0];

            
            expected_overflow = (test[15] & test[7] & ~expected[7]) |
                                (~test[15] & ~test[7] & expected[7]);

           
            //$display("Test: a=%d, b=%d, Expected Sum=%d, Expected Carry=%b, Expected Overflow=%b",
                    // test[15:8], test[7:0], expected[7:0], expected[8], expected_overflow);

        
            //$display("Actual Sum=%d, Actual Carry=%b, Actual Overflow=%b",
                    // sum, cout, overflow);

          
            if ({cout, sum} !== expected) begin
                $display("ERROR: a=%d b=%d Expected Sum=%d (got %d) Expected Carry=%b (got %b)",
                         test[15:8], test[7:0], expected[7:0], sum, expected[8], cout);
            end

            
            if (overflow !== expected_overflow) begin
                $display("ERROR: a=%d b=%d Expected Overflow=%b (got %b)",
                         test[15:8], test[7:0], expected_overflow, overflow);
            end
        end

        $display("All tests completed.");
        #1 $finish;
    end
endmodule
