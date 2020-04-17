module dns_unit(
	input wire clk,
	input wire rst,
	input wire broadx[7:0],
	input wire broady[7:0],
	input wire broadz[7:0],

	output reg a[7:0],
	output reg b[7:0],
	output reg s[7:0]
);

parameter COPYA = 0;
parameter COPYB = 1;
parameter BROAD = 1;
parameter MUL = 3;
parameter SUM  = 4;

always @(posedge clk) begin
	case (state)
		COPYA: begin
			state <= COPYB;
			a <= broadz;
		end
		COPYB: begin
			state <= BROAD;
			b <= broadz;
		end
		BROAD: begin
			state <= MUL;
			a <= broady;
			b <= broadx;
		end
		MUL: begin
			state <= SUM;
			s <= a * b;
		end
		SUM: begin
			if (rst) begin
				state <= COPYA;
			end else begin
				state <= SUM;
			end
		end
		default: state <= COPYA;
	endcase	
end


endmodule // dns_unit