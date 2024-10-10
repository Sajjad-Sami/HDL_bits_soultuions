module top_module( 
    input [254:0] in,
    output [7:0] out );
    reg [7:0] count1 = 8'b0;
    always @ (*) begin
        out = 8'd0;
        for (int i =0; i < 255; i++) begin
            if (in[i] == 1'b1) begin
               out = out + 1'b1; 
            end
            else 
                out = out + 8'd0;
        end        

    end
  //  assign out = count1;
endmodule
