//Edgedetect
module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] in_q;
    always @ (posedge clk) begin
     in_q <= in;
        pedge <= in & (~in_q);
    end

endmodule
