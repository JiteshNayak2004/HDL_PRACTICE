module MUX_41 (
  input  logic [3:0]  data_inputs,  // 4 data inputs
  input  logic [1:0]  select_lines,  // 2 select lines
  output logic output_data  // Output of the mux
);

always_comb
begin 
    case (select_lines)
      2'b00: output_data = data_inputs[0];
      2'b01: output_data = data_inputs[1];
      2'b10: output_data = data_inputs[2];
      2'b11: output_data = data_inputs[3];
      default: output_data = 1'bx;  
    endcase
  end

endmodule
