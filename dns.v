module dns(
	input wire clk,
	input wire rst,
	input wire A[3:0][3:0][7:0],
	input wire B[3:0][3:0][7:0],
	output reg S[3:0][3:0][7:0],
	output reg finished
);

reg [7:0] broadx[3:0][3:0];
reg [7:0] broady[3:0][3:0];
reg [7:0] broadz[3:0][3:0];

wire [7:0] a[3:0][3:0][3:0];
wire [7:0] b[3:0][3:0][3:0];
wire [7:0] s[3:0][3:0][3:0];

wire clk_unit = ~clk;
wire rst_unit = rst & finished;

dns_unit m000(clk_unit, rst_unit, broadx[0][0], broady[0][0], broadz[0][0], a[0][0][0], b[0][0][0], s[0][0][0]);
dns_unit m001(clk_unit, rst_unit, broadx[0][0], broady[0][1], broadz[1][0], a[0][0][1], b[0][0][1], s[0][0][1]);
dns_unit m002(clk_unit, rst_unit, broadx[0][0], broady[0][2], broadz[2][0], a[0][0][2], b[0][0][2], s[0][0][2]);
dns_unit m003(clk_unit, rst_unit, broadx[0][0], broady[0][3], broadz[3][0], a[0][0][3], b[0][0][3], s[0][0][3]);
dns_unit m010(clk_unit, rst_unit, broadx[1][0], broady[0][0], broadz[0][1], a[0][1][0], b[0][1][0], s[0][1][0]);
dns_unit m011(clk_unit, rst_unit, broadx[1][0], broady[0][1], broadz[1][1], a[0][1][1], b[0][1][1], s[0][1][1]);
dns_unit m012(clk_unit, rst_unit, broadx[1][0], broady[0][2], broadz[2][1], a[0][1][2], b[0][1][2], s[0][1][2]);
dns_unit m013(clk_unit, rst_unit, broadx[1][0], broady[0][3], broadz[3][1], a[0][1][3], b[0][1][3], s[0][1][3]);
dns_unit m020(clk_unit, rst_unit, broadx[2][0], broady[0][0], broadz[0][2], a[0][2][0], b[0][2][0], s[0][2][0]);
dns_unit m021(clk_unit, rst_unit, broadx[2][0], broady[0][1], broadz[1][2], a[0][2][1], b[0][2][1], s[0][2][1]);
dns_unit m022(clk_unit, rst_unit, broadx[2][0], broady[0][2], broadz[2][2], a[0][2][2], b[0][2][2], s[0][2][2]);
dns_unit m023(clk_unit, rst_unit, broadx[2][0], broady[0][3], broadz[3][2], a[0][2][3], b[0][2][3], s[0][2][3]);
dns_unit m030(clk_unit, rst_unit, broadx[3][0], broady[0][0], broadz[0][3], a[0][3][0], b[0][3][0], s[0][3][0]);
dns_unit m031(clk_unit, rst_unit, broadx[3][0], broady[0][1], broadz[1][3], a[0][3][1], b[0][3][1], s[0][3][1]);
dns_unit m032(clk_unit, rst_unit, broadx[3][0], broady[0][2], broadz[2][3], a[0][3][2], b[0][3][2], s[0][3][2]);
dns_unit m033(clk_unit, rst_unit, broadx[3][0], broady[0][3], broadz[3][3], a[0][3][3], b[0][3][3], s[0][3][3]);

dns_unit m100(clk_unit, rst_unit, broadx[0][1], broady[1][0], broadz[0][0], a[1][0][0], b[1][0][0], s[1][0][0]);
dns_unit m101(clk_unit, rst_unit, broadx[0][1], broady[1][1], broadz[1][0], a[1][0][1], b[1][0][1], s[1][0][1]);
dns_unit m102(clk_unit, rst_unit, broadx[0][1], broady[1][2], broadz[2][0], a[1][0][2], b[1][0][2], s[1][0][2]);
dns_unit m103(clk_unit, rst_unit, broadx[0][1], broady[1][3], broadz[3][0], a[1][0][3], b[1][0][3], s[1][0][3]);
dns_unit m110(clk_unit, rst_unit, broadx[1][1], broady[1][0], broadz[0][1], a[1][1][0], b[1][1][0], s[1][1][0]);
dns_unit m111(clk_unit, rst_unit, broadx[1][1], broady[1][1], broadz[1][1], a[1][1][1], b[1][1][1], s[1][1][1]);
dns_unit m112(clk_unit, rst_unit, broadx[1][1], broady[1][2], broadz[2][1], a[1][1][2], b[1][1][2], s[1][1][2]);
dns_unit m113(clk_unit, rst_unit, broadx[1][1], broady[1][3], broadz[3][1], a[1][1][3], b[1][1][3], s[1][1][3]);
dns_unit m120(clk_unit, rst_unit, broadx[2][1], broady[1][0], broadz[0][2], a[1][2][0], b[1][2][0], s[1][2][0]);
dns_unit m121(clk_unit, rst_unit, broadx[2][1], broady[1][1], broadz[1][2], a[1][2][1], b[1][2][1], s[1][2][1]);
dns_unit m122(clk_unit, rst_unit, broadx[2][1], broady[1][2], broadz[2][2], a[1][2][2], b[1][2][2], s[1][2][2]);
dns_unit m123(clk_unit, rst_unit, broadx[2][1], broady[1][3], broadz[3][2], a[1][2][3], b[1][2][3], s[1][2][3]);
dns_unit m130(clk_unit, rst_unit, broadx[3][1], broady[1][0], broadz[0][3], a[1][3][0], b[1][3][0], s[1][3][0]);
dns_unit m131(clk_unit, rst_unit, broadx[3][1], broady[1][1], broadz[1][3], a[1][3][1], b[1][3][1], s[1][3][1]);
dns_unit m132(clk_unit, rst_unit, broadx[3][1], broady[1][2], broadz[2][3], a[1][3][2], b[1][3][2], s[1][3][2]);
dns_unit m133(clk_unit, rst_unit, broadx[3][1], broady[1][3], broadz[3][3], a[1][3][3], b[1][3][3], s[1][3][3]);

dns_unit m200(clk_unit, rst_unit, broadx[0][2], broady[2][0], broadz[0][0], a[2][0][0], b[2][0][0], s[2][0][0]);
dns_unit m201(clk_unit, rst_unit, broadx[0][2], broady[2][1], broadz[1][0], a[2][0][1], b[2][0][1], s[2][0][1]);
dns_unit m202(clk_unit, rst_unit, broadx[0][2], broady[2][2], broadz[2][0], a[2][0][2], b[2][0][2], s[2][0][2]);
dns_unit m203(clk_unit, rst_unit, broadx[0][2], broady[2][3], broadz[3][0], a[2][0][3], b[2][0][3], s[2][0][3]);
dns_unit m210(clk_unit, rst_unit, broadx[1][2], broady[2][0], broadz[0][1], a[2][1][0], b[2][1][0], s[2][1][0]);
dns_unit m211(clk_unit, rst_unit, broadx[1][2], broady[2][1], broadz[1][1], a[2][1][1], b[2][1][1], s[2][1][1]);
dns_unit m212(clk_unit, rst_unit, broadx[1][2], broady[2][2], broadz[2][1], a[2][1][2], b[2][1][2], s[2][1][2]);
dns_unit m213(clk_unit, rst_unit, broadx[1][2], broady[2][3], broadz[3][1], a[2][1][3], b[2][1][3], s[2][1][3]);
dns_unit m220(clk_unit, rst_unit, broadx[2][2], broady[2][0], broadz[0][2], a[2][2][0], b[2][2][0], s[2][2][0]);
dns_unit m221(clk_unit, rst_unit, broadx[2][2], broady[2][1], broadz[1][2], a[2][2][1], b[2][2][1], s[2][2][1]);
dns_unit m222(clk_unit, rst_unit, broadx[2][2], broady[2][2], broadz[2][2], a[2][2][2], b[2][2][2], s[2][2][2]);
dns_unit m223(clk_unit, rst_unit, broadx[2][2], broady[2][3], broadz[3][2], a[2][2][3], b[2][2][3], s[2][2][3]);
dns_unit m230(clk_unit, rst_unit, broadx[3][2], broady[2][0], broadz[0][3], a[2][3][0], b[2][3][0], s[2][3][0]);
dns_unit m231(clk_unit, rst_unit, broadx[3][2], broady[2][1], broadz[1][3], a[2][3][1], b[2][3][1], s[2][3][1]);
dns_unit m232(clk_unit, rst_unit, broadx[3][2], broady[2][2], broadz[2][3], a[2][3][2], b[2][3][2], s[2][3][2]);
dns_unit m233(clk_unit, rst_unit, broadx[3][2], broady[2][3], broadz[3][3], a[2][3][3], b[2][3][3], s[2][3][3]);

dns_unit m300(clk_unit, rst_unit, broadx[0][3], broady[3][0], broadz[0][0], a[3][0][0], b[3][0][0], s[3][0][0]);
dns_unit m301(clk_unit, rst_unit, broadx[0][3], broady[3][1], broadz[1][0], a[3][0][1], b[3][0][1], s[3][0][1]);
dns_unit m302(clk_unit, rst_unit, broadx[0][3], broady[3][2], broadz[2][0], a[3][0][2], b[3][0][2], s[3][0][2]);
dns_unit m303(clk_unit, rst_unit, broadx[0][3], broady[3][3], broadz[3][0], a[3][0][3], b[3][0][3], s[3][0][3]);
dns_unit m310(clk_unit, rst_unit, broadx[1][3], broady[3][0], broadz[0][1], a[3][1][0], b[3][1][0], s[3][1][0]);
dns_unit m311(clk_unit, rst_unit, broadx[1][3], broady[3][1], broadz[1][1], a[3][1][1], b[3][1][1], s[3][1][1]);
dns_unit m312(clk_unit, rst_unit, broadx[1][3], broady[3][2], broadz[2][1], a[3][1][2], b[3][1][2], s[3][1][2]);
dns_unit m313(clk_unit, rst_unit, broadx[1][3], broady[3][3], broadz[3][1], a[3][1][3], b[3][1][3], s[3][1][3]);
dns_unit m320(clk_unit, rst_unit, broadx[2][3], broady[3][0], broadz[0][2], a[3][2][0], b[3][2][0], s[3][2][0]);
dns_unit m321(clk_unit, rst_unit, broadx[2][3], broady[3][1], broadz[1][2], a[3][2][1], b[3][2][1], s[3][2][1]);
dns_unit m322(clk_unit, rst_unit, broadx[2][3], broady[3][2], broadz[2][2], a[3][2][2], b[3][2][2], s[3][2][2]);
dns_unit m323(clk_unit, rst_unit, broadx[2][3], broady[3][3], broadz[3][2], a[3][2][3], b[3][2][3], s[3][2][3]);
dns_unit m330(clk_unit, rst_unit, broadx[3][3], broady[3][0], broadz[0][3], a[3][3][0], b[3][3][0], s[3][3][0]);
dns_unit m331(clk_unit, rst_unit, broadx[3][3], broady[3][1], broadz[1][3], a[3][3][1], b[3][3][1], s[3][3][1]);
dns_unit m332(clk_unit, rst_unit, broadx[3][3], broady[3][2], broadz[2][3], a[3][3][2], b[3][3][2], s[3][3][2]);
dns_unit m333(clk_unit, rst_unit, broadx[3][3], broady[3][3], broadz[3][3], a[3][3][3], b[3][3][3], s[3][3][3]);

parameter COPYA = 0;
parameter COPYB = 1;
parameter BROAD = 1;
parameter MUL = 3;
parameter SUM  = 4;

reg [3:0] state;

integer i, j;

always @(posedge clk) begin
	case (state)
		COPYA: begin
			state <= COPYB;
			for (i = 0; i < 4; i += 1) begin
				for (j = 0; j < 4; j += 1) begin
					broadz[i][j] <= A[i][j];
				end
			end
			finished <= 0;
		end
		COPYB: begin
			state <= BROAD;
			for (i = 0; i < 4; i += 1) begin
				for (j = 0; j < 4; j += 1) begin
					broadz[i][j] <= B[i][j];
				end
			end
		end
		BROAD: begin
			state <= MUL;
			for (i = 0; i < 4; i += 1) begin
				for (j = 0; j < 4; j += 1) begin
					broady[i][j] <= a[i][i][j];
				end
			end
			for (i = 0; i < 4; i += 1) begin
				for (j = 0; j < 4; j += 1) begin
					broadx[i][j] <= b[j][i][j];
				end
			end
		end
		MUL: begin
			state <= SUM;
		end
		SUM: begin
			if (finished) begin
				if (rst) begin
					state <= COPYA;
				end else begin
					state <= SUM;
				end
			end else begin
			state <= SUM;
			for (i = 0; i < 4; i += 1) begin
				for (j = 0; j < 4; j += 1) begin
					S[i][j] <= s[0][j][i] + s[1][j][i] + s[2][j][i] + s[3][j][i];
				end
			end
			finished <= 1;
		end
		default: state <= COPYA;
	endcase	
end

endmodule // dns