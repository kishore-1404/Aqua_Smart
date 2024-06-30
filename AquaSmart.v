module smart_aqua(
    input clk,
    input reset,
    input Liters5,
    input Liters10,
    input [1:0] in,
    output reg out1,
    output reg out2,
    output reg [3:0] change,
    output reg [2:0] Digit0,
    output reg [2:0] Digit1  
);

parameter state0 = 2'b00;
parameter state1 = 2'b01;
parameter state2 = 2'b10;
parameter state3 = 2'b11;
parameter state4 = 3'b101;

reg [1:0] c_state, n_state;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        c_state <= state0;
        n_state <= state0;
        out1 <= 0;
        out2 <= 0;
        change <= 4'b0000;
        Digit0 <= 3'b000;
        Digit1 <= 3'b000;
    end else begin
        c_state <= n_state;
    end

    if (Liters5) begin
        case(c_state)
            state0: begin
                if (in == 2'b00) begin
                    n_state <= state0;
                    out1 <= 0;
                    change <= 4'b0000;
                end else if (in == 2'b01) begin
                    n_state <= state1;
                    out1 <= 0;
                    change <= 4'b0000;
                end else if (in == 2'b10) begin
                    n_state <= state2;
                    out1 <= 0;
                    change <= 4'b0000;
                end
            end
            state1: begin
                if (in == 2'b00) begin
                    n_state <= state0;
                    out1 <= 0;
                    change <= 4'b0001;  // Change = 5 Rs
                end else if (in == 2'b01) begin
                    n_state <= state2;
                    out1 <= 0;
                    change <= 4'b0000;
                end else if (in == 2'b10) begin
                    n_state <= state0;
                    out1 <= 1;
                    change <= 4'b0000;  // Complete transaction
                end
            end
            state2: begin
                if (in == 2'b00) begin
                    n_state <= state0;
                    out1 <= 0;
                    change <= 4'b0010;  // Change = 10 Rs
                end else if (in == 2'b01) begin
                    n_state <= state0;
                    out1 <= 1;
                    change <= 4'b0000;  // Complete transaction
                end else if (in == 2'b10) begin
                    n_state <= state0;
                    out1 <= 1;
                    change <= 4'b0001;  // Change = 5 Rs
                end
            end
        endcase
    end

    if (Liters10) begin
        case(c_state)
            state0: begin
                if (in == 2'b00) begin
                    n_state <= state0;
                    out2 <= 0;
                    change <= 4'b0000;
                end else if (in == 2'b01) begin
                    n_state <= state1;
                    out2 <= 0;
                    change <= 4'b0000;
                end else if (in == 2'b10) begin
                    n_state <= state2;
                    out2 <= 0;
                    change <= 4'b0000;
                end
            end
            state1: begin
                if (in == 2'b00) begin
                    n_state <= state0;
                    out2 <= 0;
                    change <= 4'b0001;  // Change = 5 Rs
                end else if (in == 2'b01) begin
                    n_state <= state2;
                    out2 <= 0;
                    change <= 4'b0000;
                end else if (in == 2'b10) begin
                    n_state <= state3;
                    out2 <= 0;
                    change <= 4'b0000;
                end
            end
            state2: begin
                if (in == 2'b00) begin
                    n_state <= state0;
                    out2 <= 0;
                    change <= 4'b0010;  // Change = 10 Rs
                end else if (in == 2'b01) begin
                    n_state <= state3;
                    out2 <= 0;
                    change <= 4'b0000;
                end else if (in == 2'b10) begin
                    n_state <= state4;
                    out2 <= 0;
                    change <= 4'b0000;
                end
            end
            state3: begin
                if (in == 2'b00) begin
                    n_state <= state0;
                    out2 <= 0;
                    change <= 4'b0100;  // Change = 15 Rs
                end else if (in == 2'b01) begin
                    n_state <= state4;
                    out2 <= 0;
                    change <= 4'b0000;
                end
            end
        endcase
    end
end
endmodule
