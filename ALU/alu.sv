module alu(a_i,b_i,op_i,alu_o);
input     logic [7:0]   a_i;  //First 8-bit input vector
input     logic [7:0]   b_i;  //Second 8-bit input vector
input     logic [2:0]   op_i; //Encoded operation

output    logic [7:0]   alu_o; //ALU output

  localparam  OP_ADD = 3'b000;
  localparam  OP_SUB = 3'b001;
  localparam  OP_SLL = 3'b010;
  localparam  OP_LSR = 3'b011;
  localparam  OP_AND = 3'b100;
  localparam  OP_OR  = 3'b101;
  localparam  OP_XOR = 3'b110;
  localparam  OP_EQL = 3'b111;

  logic carry;

always_comb begin
	case(op_i)
		//add
		OP_ADD: begin
			{carry,alu_o}={1'b0,a_i}+{1'b0,b_i};

		end
		//sub
		OP_SUB: begin
			alu_o=a_i-b_i;
		end
		//sll
		OP_SLL: begin
			alu_o[7:0]=a_i<<b_i[2:0];
		end
		//lsr
		OP_LSR: begin
			alu_o[7:0]=a_i>>b_i[2:0];
		end

		//and
		OP_AND: begin
			alu_o=a_i&b_i;
		end
		//or
		OP_OR: begin
			alu_o=a_i | b_i;
		end
		//xor
		OP_XOR: begin
			alu_o=a_i^b_i;
		end

		//eql
		OP_EQL: begin
			if(a_i==b_i)
			alu_o=8'b1;
			else
			alu_o=8'b0;
		end
	

	endcase	

end

endmodule
