module beep_control (
    input clk,
    input rst_n,

    input key_value,
    input key_flag,

    output reg beep
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
           beep <= 1;
        end else begin
           if (key_flag && key_value == 0) begin
                beep <= ~beep;
           end else begin
                beep <= beep;
           end  
        end
    end

endmodule