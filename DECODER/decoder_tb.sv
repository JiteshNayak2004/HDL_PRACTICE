`timescale 1ns/1ps
module decoder_tb
#(parameter N=5)
();
logic [N-1:0] a_tb;
logic [2**N-1:0] y_tb;

decoder dut(
    .a(a_tb),
    .y(y_tb)
);

initial begin
    
a_tb=5'b00000;#10;
  $display("the op for ip being 00000 %b",y_tb);
#10;
a_tb=5'b00001;#10;
  $display("the op for ip being 00001 %b",y_tb);
#10;
a_tb=5'b00010;#10
  $display("the op for ip being 00010 %b",y_tb);
#10
$finish;
    
end




endmodule