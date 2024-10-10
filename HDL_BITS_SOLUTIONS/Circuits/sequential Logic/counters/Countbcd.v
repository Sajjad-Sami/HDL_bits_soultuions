module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    // BCD digits
    wire [3:0] ones   = q[3:0];
    wire [3:0] tens   = q[7:4];
    wire [3:0] hundreds = q[11:8];
    wire [3:0] thousands = q[15:12];

    always @(posedge clk) begin
        if (reset) begin
            q <= 16'b0;   // Reset counter to 0000
        end else begin
            // Increment ones digit
            if (ones == 4'd9) begin
                q[3:0] <= 4'd0;
            end else begin
                q[3:0] <= ones + 1'b1;
            end

            // Increment tens digit
            if (ena[1]) begin
                if (tens == 4'd9) begin
                    q[7:4] <= 4'd0;
                end else begin
                    q[7:4] <= tens + 1'b1;
                end
            end

            // Increment hundreds digit
            if (ena[2]) begin
                if (hundreds == 4'd9) begin
                    q[11:8] <= 4'd0;
                end else begin
                    q[11:8] <= hundreds + 1'b1;
                end
            end

            // Increment thousands digit
            if (ena[3]) begin
                if (thousands == 4'd9) begin
                    q[15:12] <= 4'd0;  // Roll over to 0000
                end else begin
                    q[15:12] <= thousands + 1'b1;
                end
            end
        end
    end
   assign ena [1] = (q [3:0] == 4'd9)  ? 1'b1 : 1'b0;
    assign ena [2] = ( (q [7:4] == 4'd9) && (q [3:0] == 4'd9) )  ? 1'b1 : 1'b0;
    assign ena [3] = ( (q [11:8] == 4'd9) && (q [7:4] == 4'd9) && (q [3:0] == 4'd9) ) ? 1'b1 : 1'b0 ;
endmodule

