module Four_multiplier(

input [3:0]a
input [3:0]b
output[7:0]P
 );
 wire [10:0]carry;
 wire  [7:1]Y;
 wire [7:1}x;
 wire [7:1]z;
 wire [7:1]w ; 
 
 //p0
 and (P[0],a[0],b[0]);
 
 //p1
 and (Y[1],a[1],b[0]);
 and (x[1],a[0],b[1]);
 full_adder FA1(.a(y[1]),.b(x[1]),.ci(1'b0),.s(p[1]),.co(carry[0]));
 
 //p2
 and (Y[2],a[2],b[0]);
 and (x[2],a[1],b[1]);
 wire p2';
 full_adder FA1(.a(y[1]),.b(x[1]),.ci(carry[0]),.s(p2'),.co(carry[1]));
 and (z[3],a[0],b[2]);
 full_adder FA1(.a(z[3]),.b(p2'),.ci(1'b0),.s(p[2]),.co(carry[3]));
 
 
 
 