//Adder100i
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    
    addr_module inst0 (.a(a[0]), .b(b[0]), .cin(cin), .cout(cout[0]), .sum (sum[0]) );
  genvar x;
  generate
      for (x = 1; x <100; x++) begin : adding
          addr_module instn (.a (a[x]), .b(b[x]), .cin(cout[x-1]), .cout(cout[x]), .sum (sum[x]));   
      end
  endgenerate

endmodule
module addr_module( 
    input a, b, cin,
    output cout, sum );

    assign sum  = a + b + cin;
    assign cout = (a&b) | (a&cin) | (b&cin);
endmodule
