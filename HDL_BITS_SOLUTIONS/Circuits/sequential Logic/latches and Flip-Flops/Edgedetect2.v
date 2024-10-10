//Edgedetect2
module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
);
     reg [7:0] in_q;
    reg [7:0] pedge;
    reg [7:0] nedge;
    always @ (posedge clk) begin
     in_q <= in;
        pedge <= in & (~in_q);
        nedge <= (~in) & in_q;
    end
assign anyedge = pedge | nedge;

endmodule
