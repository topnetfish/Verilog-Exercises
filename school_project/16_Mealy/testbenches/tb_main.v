`timescale 1ps / 1ps

module tb_main;

    reg clk;
    reg rst;

    //Inputs
    reg [7:0] din;
    reg read;
    reg btnclk;

    //Outputs
    wire ldclk;
    wire ldres;
    wire ldrst;

    initial begin
        din = 8'b0100_1011;
        btnclk = 1'b0;
        clk = 1'b0;
        rst = 1'b1;
    end
    
    main #(0) utt (
        din,
        read,
        rst,
        clk,
        btnclk,
        ldrst,
        ldclk,
        ldres
    );

    localparam CLK_PERIOD = 10;
    always #(CLK_PERIOD/2) 
        clk=~clk;

    initial begin
        //test code here
        read = 1'b1;

        //按一次模拟时钟按键，重置
        repeat (1*2) #CLK_PERIOD
            btnclk = ~btnclk;
        #3
        rst = 1'b0;

        //按一次模拟时钟按键，读取输入序列
        repeat (1*2) #CLK_PERIOD
            btnclk = ~btnclk;
        #CLK_PERIOD

        read = 1'b0;

        //按下八次模拟时钟按键，进行状态转换
        repeat(8*2) #CLK_PERIOD
            btnclk = ~btnclk;
        
        #(CLK_PERIOD*2)

        $finish;
    end

endmodule