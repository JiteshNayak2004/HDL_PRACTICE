

module edge_tb();

logic clk,reset;
logic d;
logic rising_edge_o;
logic falling_edge_o;

edge_detect dut(clk,reset,d,rising_edge_o,falling_edge_o);

//clk signal
always begin
	clk=1'b0;
	#10;
	clk=1'b1;
	#10;
end

initial begin
	$dumpfile("edge.vcd");
	$dumpvars(0,edge_tb);

//here @(posedge clk) delays the next line by one clock cyle 



	// initialising 
	reset=1'b1;
	d=1'b0;
	//disabling reset
	@(posedge clk);
	reset<=1'b0;
	//changing d	
	@(posedge clk);

	// in an iteration d is assigned a random value for an interval of one
	// clk cycle this is done by using $random and  @(posedge clk) which
	// delays the next iteration by 1 clk cycle
	for(int i=0;i<32;i++) begin
	// $random gives a 32 bit value but modulo with 2 leads to a remainder
	// of either 0 or 1
	d<=$random%2;
	@(posedge clk);
	end
	$finish;
end



endmodule
