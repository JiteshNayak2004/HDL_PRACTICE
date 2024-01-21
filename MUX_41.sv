// dataflow model from a 4:1 mux

module MUX_41 (
    D,S,Y
);
input logic D[3:0];
input logic S[1:0];
output logic Y;

assign Y= {(~S[0])&(~S[1])&D[0]} | {(S[0])&(~S[1])&D[1]} |{(~S[0])&(S[1])&D[2]} | {(S[0])&(S[1])&D[3]}

endmodule