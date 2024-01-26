module d_ff_tb;
    // Testbench signals
    logic clk_tb;
    logic d_tb;
    logic q_tb;

    // Instantiate the DUT (Device Under Test)
    d_ff dut (
        .clk(clk_tb),
        .d(d_tb),
        .q(q_tb)
    );

    // Testbench code (initial block, stimulus, etc.) goes here

always
    begin
        clk_tb=1;
        #5;
        clk_tb=0;
        #5;
    end

initial
    begin
        d_tb=0; #10;
        $display("the output of q is %b",q_tb);
        d_tb=1; #10;
        $display("the output of q is %b",q_tb);
    end

    
endmodule