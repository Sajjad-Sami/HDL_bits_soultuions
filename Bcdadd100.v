//Bcdadd100
module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    reg [100:0] carr;
genvar i;
    bcd_fadd inst0 (.a (a[3:0]), .b (b[3:0]), .cin (cin), .cout (carr[1]), .sum (sum[3:0]) );
generate
    for (i = 2; i <101; i++) begin: inst1to99
        bcd_fadd instn (.a (a[(i*4)-1 : (i-1)*4]), .b (b[(i*4)-1 : (i-1)*4]), .cin (carr[i-1]), .cout (carr[i]), .sum (sum[(i*4)-1 : (i-1)*4]) ); 
    end
endgenerate
             assign cout = carr [100];
endmodule

