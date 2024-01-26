module MUX_41_test();

  logic [3:0] D;
  logic [1:0] S;
  logic Y;

  MUX_41 dut(D[3:0],S[1:0],Y);

  initial begin
    D = 4'b1101;
    S = 2'b01;
    #10;
    $display("the op is %b", Y);

    D = 4'b0001;
    S = 2'b01;
    #10;
    $display("the op is %b",Y );

    $finish;
  end
endmodule
