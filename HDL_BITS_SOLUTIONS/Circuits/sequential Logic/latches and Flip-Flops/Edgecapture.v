//Edgecapture
module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    logic [31:0] in_d;
    
    always_ff @ (posedge clk) begin
       in_d <= in;
        if (reset) begin
            out <= 32'b0;
        end
        else begin 
        for (int i =0; i<32; i++) begin
            out [i] <= out [i] | (!in [i] & in_d [i]) ; 
        end
        end 
    end
endmodule
