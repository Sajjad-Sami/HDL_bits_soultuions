module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always @ (posedge clk) begin
        if (reset || (slowena & q == 4'd9) ) begin
           q <= 4'd0; 
        end
        else if (slowena)
                q <= q + 1'b1;
        else 
            q <= q;
    end
endmodule
