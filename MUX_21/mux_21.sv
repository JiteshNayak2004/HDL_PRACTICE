module mux21(a_i,b_i,sel_i,y_o);
input logic [7:0]a_i;
input logic [7:0]b_i;
input logic sel_i;

output logic [7:0]y_o;


always_comb begin

y_o=sel_i?b_i:a_i;


end

endmodule
