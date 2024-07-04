
module ff_tb();
logic clk;
logic [7:0]d;
logic reset;
logic [7:0]q_norst;
logic [7:0]q_syncrst;
logic [7:0]q_asyncrst;

ff dut (d,clk,reset,q_norst,q_syncrst,q_asyncrst);

// generating clk 
always begin
	clk=1'b0;
	#5;
	clk=1'b1;
	#5;
end


initial begin
	$dumpfile("ff.vcd");
	$dumpvars(0,ff_tb);
	
	reset=1'b1;// initially reset=1
	d=8'hab; // data is hex ab

	#10

	@(posedge clk);
	reset=1'b0;
	// ab must be the output for all 3 muxes 
	
	#10

	@(posedge clk);
	reset=1'b1;
	d=8'hbc;
	// output must be 0
	

	@(posedge clk);
	reset=1'b0;
	// output must now be bc

	$finish;

end


endmodule
