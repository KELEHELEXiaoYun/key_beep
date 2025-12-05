module top_beep (
    input clk,
    input rst_n,

    input key,
    
    output beep
);

    wire key_value;
    wire key_flag;
    
    key_debounce u_key_debounce (
        .clk(clk),
        .rst_n(rst_n),

        .key(key),
        .key_value(key_value),
        .key_flag(key_flag)
    );

    beep_control u_beep_control (
        .clk(clk),
        .rst_n(rst_n),

        .key_value(key_value),
        .key_flag(key_flag),
        .beep(beep)
    );
endmodule