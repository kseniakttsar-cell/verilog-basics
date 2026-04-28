module fsm_led(
    input clk,
    input rst,
    input btn,
    output reg led
);

reg state;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        state <= 0;
        led <= 0;
    end
    else begin
        case(state)
            0: begin
                if(btn) state <= 1;
                led <= 0;
            end
            1: begin
                led <= 1;
                state <= 0;
            end
        endcase
    end
end

endmodule
