module alu_tb();
logic [7:0]   a_i;  //First 8-bit input vector
logic [7:0]   b_i;  //Second 8-bit input vector
logic [2:0]   op_i; //Encoded operation

logic [7:0]   alu_o; //ALU output

alu dut (a_i,b_i,op_i,alu_o);

initial begin
	$dumpfile("alu.vcd");
	$dumpvars(0,alu_tb);

	for(int i=0;i<=7;i++) begin
		for(int j=0;j<7;j++) begin
			
			a_i=$urandom_range(0,8'hFF);
			b_i=$urandom_range(0,8'hFF);
			op_i=3'(i);
			#5;

		end
	end

end
endmodule
