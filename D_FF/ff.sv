module ff(d,clk,reset,q_norst,q_syncrst,q_asyncrst);
input logic clk;
input logic [7:0]d;
input logic reset;

output logic [7:0]q_norst;
output logic [7:0]q_syncrst;
output logic [7:0]q_asyncrst;

//d_ff with no reset
always_ff @(posedge clk) begin
	q_norst<=d;
end

// d_ff with sync reset
always_ff @(posedge clk) begin
	if(reset)
	q_syncrst<=0;
	else
	q_syncrst<=d;
	
end


// d_ff with async reset
always_ff @(posedge clk or posedge reset) begin
	if(reset)
	q_asyncrst<=0;
	else
	q_asyncrst<=d;
end

endmodule

