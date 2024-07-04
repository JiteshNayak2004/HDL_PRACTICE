/* description of what design does
Scenario:

    The input signal d starts as low (0).
    It transitions to high (1) between clock pulses.

Timesteps:

    Before Clock Pulse:
        d: 0
        a_ff (previous value): 0 (from prior clock cycle)
        Outputs: rising_edge_o, falling_edge_o: Both low (0)

    Clock Pulse Arrival:
        clk goes high (positive edge).
        a_ff captures the current d value, which is now high (1) due to the recent transition.

    Edge Detection:
        Combinational logic instantly sees d as high (1) and a_ff (previous) as low (0).
        This satisfies the rising edge condition (~a_ff & d).
        rising_edge_o goes high (1) for this one clock cycle only.

    After Clock Pulse:
        clk goes low (negative edge).
        rising_edge_o goes back to low (0) as the edge has been detected.
        a_ff keeps the current d value (high - 1).

In short:

    Clock captures the input value.
    Combinational logic instantly checks for edges based on current and previous values.
    Edge detection outputs signal the event for one clock cycle.

*/





module edge_detect(clk,reset,d,rising_edge_o,falling_edge_o);
input logic clk,reset;
input logic d;

output logic rising_edge_o;
output logic falling_edge_o;

logic a_ff;

always_ff@(posedge clk or posedge reset) begin
	if (reset)
	a_ff<=1'b0;
	else
	a_ff<=d;
end

// when a_ff=0 and d=1 
assign rising_edge_o=~a_ff & d;
// when a_ff=1 and d=0 
assign falling_edge_o=a_ff & ~d;


endmodule
