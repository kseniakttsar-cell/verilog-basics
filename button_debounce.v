module button_debounce(
    input clk,
    input rst,
    input button,
    output reg button_clean
);

reg [15:0] counter;
reg button_sync;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 0;
        button_sync <= 0;
        button_clean <= 0;
    end
    else begin
        button_sync <= button;

        if (button_sync == button_clean)
            counter <= 0;
        else begin
            counter <= counter + 1;
            if (counter == 16'hFFFF)
                button_clean <= button_sync;
        end
    end
end

endmodule
