// instead of adding directly in the always block think in terms of hardware
// which is a flip flop and an adder is reqd create an always block for the
// flip flop and a combinational assign statement that synthesizes into an
// adder
module odd_counter(clk,reset,cnt_o);
input logic clk,reset;
output logic[7:0]cnt_o;

logic [7:0]next_cnt;
// creating the flip flop
always_ff@(posedge clk or posedge reset) begin

	if(reset)
		cnt_o<=8'h1;
	else
		cnt_o<=next_cnt;
end
//the combinational logic part that adds 2 to current o/p
assign next_cnt=cnt_o+8'h2;

endmodule
