//Mt2015 q4
module top_module (input x, input y, output z);
reg A1,B1,A2,B2,w1,w2;
    cktA insta1 (.c (x), .d (y), .x (A1) );
    cktB instb1 (.a (x), .b (y), .y (B1) );
    cktA insta2 (.c (x), .d (y), .x (A2) );
    cktB instb2 (.a (x), .b (y), .y (B2) );
    
    assign w1 = A1 | B1;
    assign w2 = A2 & B2;
    
    assign z = w1 ^ w2;
endmodule
module cktA (input c, input d, output x);
    assign x = (c^d) & c;
endmodule

module cktB (input a,b,
             output y);
    assign y = ~(a^b);
    
    endmodule
