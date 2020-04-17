module dns(
	input wire clk,
	input wire rst,
	input wire A[3:0][3:0][7:0],
	input wire B[3:0][3:0][7:0],
	output wire S[3:0][3:0][7:0],
	output reg finished
);

reg [7:0] a[3:0][3:0][3:0];
reg [7:0] b[3:0][3:0][3:0];
reg [7:0] c[3:0][3:0][3:0];

parameter IDLE = 0;
parameter COPYZ = 1;
parameter COPYA = 2;
parameter COPYB = 3;
parameter MUL = 4;
parameter SUM  = 5;

reg [3:0] state;

integer i, j, k;

always @(posedge clk) begin
	case (state)
		IDLE: begin
			state <= COPYZ;
			a[0][3:0][3:0][7:0] <= A;
			b[0][3:0][3:0][7:0] <= B;
			finished <= 0;
		end
		COPYZ: begin
			state <= COPYA;
			for (i = 1; i < 4; i+=1) begin
				a[i][3:0][3:0][7:0] <= a[0][3:0][3:0][7:0];
				b[i][3:0][3:0][7:0] <= b[0][3:0][3:0][7:0];
			end
		end
		COPYA: begin
			state <= COPYB;
			for (i = 0; i < 4; i+=1) begin
				for (j = 0; j < 4; j+=1) begin
					a[i][0][j][7:0] <= a[i][0][i][7:0];
					a[i][1][j][7:0] <= a[i][1][i][7:0];
					a[i][2][j][7:0] <= a[i][2][i][7:0];
					a[i][3][j][7:0] <= a[i][3][i][7:0];
				end
			end
		end
		COPYB: begin
			state <= MUL;
			for (i = 0; i < 4; i+=1) begin
				for (j = 0; j < 4; j+=1) begin
					b[i][j][3:0][7:0] <= b[i][i][3:0][7:0];
				end
			end
		end
		MUL: begin
			state <= SUM;
			for (i = 0; i < 4; i+=1) begin
				for (j = 0; j < 4; j+=1) begin
					for (k = 0; k < 4; k+=1) begin
						c[i][j][k][7:0] <= a[i][j][k][7:0] * b[i][j][k][7:0];
					end
				end
			end
		end
		SUM: begin
			if (finished) begin
				if (rst) begin
					state <= IDLE;
				end else begin
					state <= SUM;
				end
			end else begin
				for (i = 0; i < 4; i+=1) begin
					for (j = 0; j < 4; j+=1) begin
						c[0][i][j][7:0] <= c[0][i][j][7:0] + c[1][i][j][7:0] + c[2][i][j][7:0] + c[3][i][j][7:0];
					end
				end
				finished = 1;
			end
		end
		default: state <= IDLE;
	endcase
end

assign S = c[0][i][j][7:0];


endmodule // dns