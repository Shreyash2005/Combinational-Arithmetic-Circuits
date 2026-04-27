module tb_lab2p3;
    parameter K = 9;
    reg [2*K-1:0] test;
    wire [K-1:0] sum;
    wire cout,overflow;

    Lab2p3 #(K) dut (
        .a(test[2*K-1:K]),
        .b(test[K-1:0]),
        .sum(sum),
        .cout(cout),
        .overflow(overflow)
    );
 integer count ;
    initial begin
        for (count = 0;count<(2**K); count = count+ 1) begin
	test = count[2*K-1:0] ;  
             #10;
            if ({cout, sum} !== (test[2*K-1:K] + test[K-1:0])) begin
                $display("ERROR: a=%b b=%b sum=%b cout=%b expected=%b",
                         test[2*K-1:K], test[K-1:0], sum, cout, test[2*K-1:K] + test[K-1:0]);
            end
        end
        #10; 
     $stop;
    end
endmodule