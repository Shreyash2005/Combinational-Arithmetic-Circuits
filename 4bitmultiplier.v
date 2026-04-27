four_bit_multiplier.v
*Implements the array multiplier. It generates four partial products using AND operations, then uses
chained full adders to sum the aligned results.*
module four_bit_multiplier (
input [3:0] A, B,
output [7:0] P
);
wire [3:0] pp0, pp1, pp2, pp3;
wire [7:0] sum1, sum2, sum3;
wire [7:0] carry1, carry2, carry3;
assign pp0 = A & {4{B[0]}};
assign pp1 = A & {4{B[1]}};
assign pp2 = A & {4{B[2]}};
assign pp3 = A & {4{B[3]}};
assign P[0] = pp0[0];
full_adder fa1_0 (.a(pp0[1]), .b(pp1[0]), .cin(1'b0), .sum(sum1[0]), .cout(carry1[0]));
full_adder fa1_1 (.a(pp0[2]), .b(pp1[1]), .cin(carry1[0]), .sum(sum1[1]), .cout(carry1[1]));
full_adder fa1_2 (.a(pp0[3]), .b(pp1[2]), .cin(carry1[1]), .sum(sum1[2]), .cout(carry1[2]));
full_adder fa1_3 (.a(1'b0), .b(pp1[3]), .cin(carry1[2]), .sum(sum1[3]), .cout(carry1[3]));
assign P[1] = sum1[0];
full_adder fa2_0 (.a(sum1[1]), .b(pp2[0]), .cin(1'b0), .sum(sum2[0]), .cout(carry2[0]));
full_adder fa2_1 (.a(sum1[2]), .b(pp2[1]), .cin(carry2[0]), .sum(sum2[1]), .cout(carry2[1]));
full_adder fa2_2 (.a(sum1[3]), .b(pp2[2]), .cin(carry2[1]), .sum(sum2[2]), .cout(carry2[2]));
full_adder fa2_3 (.a(carry1[3]), .b(pp2[3]), .cin(carry2[2]), .sum(sum2[3]), .cout(carry2[3]));
assign P[2] = sum2[0];
full_adder fa3_0 (.a(sum2[1]), .b(pp3[0]), .cin(1'b0), .sum(sum3[0]), .cout(carry3[0]));
full_adder fa3_1 (.a(sum2[2]), .b(pp3[1]), .cin(carry3[0]), .sum(sum3[1]), .cout(carry3[1]));
full_adder fa3_2 (.a(sum2[3]), .b(pp3[2]), .cin(carry3[1]), .sum(sum3[2]), .cout(carry3[2]));
full_adder fa3_3 (.a(carry2[3]), .b(pp3[3]), .cin(carry3[2]), .sum(sum3[3]), .cout(carry3[3]));
assign P[3] = sum3[0];
assign P[4] = sum3[1];
assign P[5] = sum3[2];
assign P[6] = sum3[3];
assign P[7] = carry3[3];
endmodule
