`timescale 1ns / 1ps

module smart_aqua_tb();

    reg clk;
    reg reset;
    reg Liters5;
    reg Liters10;
    reg [1:0] in;
    wire out1;
    wire out2;
    wire [3:0] change;
    wire [2:0] Digit0;
    wire [2:0] Digit1;
    
    // Instantiate the smart_aqua module
    smart_aqua uut (
        .clk(clk),
        .reset(reset),
        .Liters5(Liters5),
        .Liters10(Liters10),
        .in(in),
        .out1(out1),
        .out2(out2),
        .change(change),
        .Digit0(Digit0),
        .Digit1(Digit1)
    );
    
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        Liters5 = 0;
        Liters10 = 0;
        in = 2'b00;
        
        // Apply reset
        #5 reset = 0;
        
        // Test 5 Liters with 15 Rs
        Liters5 = 1;
        #10 in = 2'b01; // 5 Rs
        #10 in = 2'b10; // 10 Rs
        #10 Liters5 = 0;
        
        // Test 10 Liters with 30 Rs
        Liters10 = 1;
        #10 in = 2'b10; // 10 Rs
        #10 in = 2'b10; // 10 Rs
        #10 in = 2'b10; // 10 Rs
        #10 Liters10 = 0;
        
        // Add more tests as needed
    end
    
    // Clock generation
    always #5 clk = ~clk;
    
endmodule
