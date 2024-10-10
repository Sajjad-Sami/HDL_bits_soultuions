//Adder100
module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    reg [100:0] procs;
assign procs = a + b + cin;
    assign sum = procs [99:0];
    assign cout = procs [100];
endmodule

