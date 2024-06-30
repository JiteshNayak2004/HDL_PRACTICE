module mux21_tb();

logic [7:0]a_i;
logic [7:0]b_i;
logic sel_i;

logic [7:0]y_o;

mux21 dut(a_i,b_i,sel_i,y_o);

initial begin
	$dumpfile("day1.vcd");
	$dumpvars(0,mux21_tb);
	for(int i=0;i<10;i++) begin
	a_i=$urandom_range(0,8'hFF);
	b_i=$urandom_range(0,8'hFF);
	sel_i=$random%2;
	#5;
	end

end





endmodule
