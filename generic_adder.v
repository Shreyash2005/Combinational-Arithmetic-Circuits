`define K 
module generic_Add (
 input [K-1:0]a
 input [K-1:0]b
 output[K-1:0]sum
output cout   
 
);
reg [K-1:0]sum;
wire [K-1:0]carry;
reg cout;
always @(*) begin
    genvar i;
    generate
        for(i=0;i<K;i = i+1) begin
            full_adder FA(.a(a[i]),.b(b[i]),.cin(carry[i]),.sum(sum[i]),.cout(carry[i+1]));
        end 
    endgenerate

    assign cout = carry[k];

    
end
endmodule