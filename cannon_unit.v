module cannon_unit(
	input wire clk,
	input wire rst,
	input wire en,
	input wire a_init[7:0],
	input wire b_init[7:0],
	input wire a_in[7:0],
	input wire b_in[7:0],
	output wire a_out[7:0],
	output wire b_out[7:0],
	output reg s[7:0]
);

	reg [7:0] a;
	reg [7:0] b;
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			s <= 0;
			a <= a_init;
			b <= b_init;
		end else begin
			if (en) begin
				s <= s + a_in * b_in;
				a <= a_in;
				b <= b_in;
			end else begin
				s <= s;
				a <= a;
				b <= b;
			end
		end
	end

	assign a_out = a;
	assign b_out = b;

endmodule // cannon_unit