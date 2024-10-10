
// question : https://github.com/Adrofier/HDLBits-Verilog-Solutions/blob/main/1.%20Verilog%20Language/5.%20More%20Verilog%20Features/01_ConditionalTernaryOperator.v
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    reg [7:0] aa,bb,cc,dd;
    assign aa = (a < b) ? a : b;
    assign cc = (c < aa) ? c : aa;
    assign dd = (d < cc) ? d : cc;
    assign min = dd;
endmodule
