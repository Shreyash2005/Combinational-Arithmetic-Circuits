The testbench was used to verify the multiplier using a loop that cycles through all 256 combinations of
4-bit A x 4-bit B.*
`timescale 1ns / 1ps
module tb_partII;
reg [3:0] A, B;
wire [7:0] P;
four_bit_multiplier uut (
.A(A),
.B(B),
.P(P)
);
initial begin
$display("Starting simulation...");
$monitor("Time=%0t | A=%d B=%d => P=%d", $time, A, B, P);
A = 4'd0; B = 4'd0; #10;
A = 4'd1; B = 4'd1; #10;
A = 4'd3; B = 4'd5; #10;
A = 4'd4; B = 4'd7; #10;
A = 4'd9; B = 4'd2; #10;
A = 4'd15; B = 4'd15; #10;
$finish;
end
endmodule
