module odd_counter_tb();
logic clk,reset;
logic[7:0]cnt_o;
logic [7:0]next_cnt;

odd_counter dut (clk,reset,cnt_o);


always begin
	clk=1'b0;
	#5;
	clk=1'b1;
	#5;
end

initial begin
	$dumpfile("odd_counter.vcd");
	$dumpvars(0,odd_counter_tb);
	reset=1'b1;
	@(posedge clk);
	@(posedge clk);
	@(posedge clk);
	reset=1'b0;
	for(int i=0;i<20;i++) begin
		@(posedge clk); // waiting for a clk cycle
	end

	$finish();
end



endmodule
