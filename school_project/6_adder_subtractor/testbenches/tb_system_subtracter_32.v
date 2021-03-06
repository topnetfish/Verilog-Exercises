`timescale 1ps / 1ps

module tb_system_subtracter_32;

    reg clk;
    //reg rst_n;

    //Inputs
    reg [31:0] x;
    reg [31:0] y;

    //Outputs
    wire [31:0] s;

    initial begin
        clk = 0;
        x = 32'b111;
        y = 32'b101;
    end
    
    system_subtracter_32 utt(
        //.rst_n (rst_n),
        .CLK (clk),
        .x(x),
        .y(y),
        .s(s)
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;

    initial begin
        //test code here
        repeat (10) #500 begin
            x = x + 500;
            y = y + 100;
        end
        $finish;
    end

endmodule