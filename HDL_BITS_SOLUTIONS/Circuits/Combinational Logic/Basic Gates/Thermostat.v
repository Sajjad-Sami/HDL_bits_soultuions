module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
    always @ (*) begin
        heater = 1'b0; aircon = 1'b0;
        if (mode) begin
            if (too_cold) begin
                heater = 1'b1;
            end
        end
        else begin
            if (too_hot) begin
                aircon =1'b1;
            end
        end
    end
    assign fan = (heater | aircon | fan_on) ? 1'b1 : 1'b0;
endmodule
