module key_debounce (
    input clk,
    input rst_n,

    input key,
    
    output reg key_value,
    output reg key_flag
);
    reg [19:0] cnt;
    reg key_reg;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            key_reg <= 1;
        end else begin
            key_reg <= key;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= 0;
        end else if (key_reg != key) begin
                cnt <= 0;
        end else begin
            if (cnt == 20'd999_999) begin
                cnt <= 0;
            end else begin
                cnt <= cnt + 1'b1;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
           key_value <= 1;
           key_flag <= 0;
        end else begin
           if (cnt == 20'd999_998) begin
                key_flag <= 1'b1;
                key_value <= key;
           end else begin
                key_flag <= 0;
                key_value <= key_value;
           end
        end
    end
    
endmodule