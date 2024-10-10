module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    reg [2:0] carr;
    
    bcd_fadd inst0 (.a (a[3:0]),   .b (b[3:0]),  .cin (cin), .cout (carr [0]), .sum (sum[3:0]) );
    bcd_fadd inst1 (.a (a[7:4]),   .b (b[7:4]),  .cin (carr [0]), .cout (carr [1]), .sum (sum[7:4]) );
    bcd_fadd inst2 (.a (a[11:8]),  .b (b[11:8]), .cin (carr [1]), .cout (carr [2]), .sum (sum[11:8]) );
    bcd_fadd inst3 (.a (a[15:12]), .b (b[15:12]),.cin (carr [2]), .cout (cout), .sum (sum[15:12]) );
    
endmodule
