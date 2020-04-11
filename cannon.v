module cannon(
	input wire clk,
	input wire rst,
	input wire A[3:0][3:0][7:0],
	input wire B[3:0][3:0][7:0],
	output wire S[3:0][3:0][7:0],
	output reg finished
);

	reg rst_unit, en;
	wire [7:0] ac[3:0][3:0];
	wire [7:0] bc[3:0][3:0];
	cannon_unit m00(clk, rst_unit, en, A[0][0], B[0][0], ac[0][0], bc[0][0], ac[0][3], bc[3][0], S[0][0]);
	cannon_unit m01(clk, rst_unit, en, A[0][1], B[1][1], ac[0][1], bc[0][1], ac[0][0], bc[3][1], S[0][1]);
	cannon_unit m02(clk, rst_unit, en, A[0][2], B[2][2], ac[0][2], bc[0][2], ac[0][1], bc[3][2], S[0][2]);
	cannon_unit m03(clk, rst_unit, en, A[0][3], B[3][3], ac[0][3], bc[0][3], ac[0][2], bc[3][3], S[0][3]);

	cannon_unit m10(clk, rst_unit, en, A[1][1], B[1][0], ac[1][0], bc[1][0], ac[1][3], bc[0][0], S[1][0]);
	cannon_unit m11(clk, rst_unit, en, A[1][2], B[2][1], ac[1][1], bc[1][1], ac[1][0], bc[0][1], S[1][1]);
	cannon_unit m12(clk, rst_unit, en, A[1][3], B[3][2], ac[1][2], bc[1][2], ac[1][1], bc[0][2], S[1][2]);
	cannon_unit m13(clk, rst_unit, en, A[1][0], B[0][3], ac[1][3], bc[1][3], ac[1][2], bc[0][3], S[1][3]);

	cannon_unit m20(clk, rst_unit, en, A[2][2], B[2][0], ac[2][0], bc[2][0], ac[2][3], bc[1][0], S[2][0]);
	cannon_unit m21(clk, rst_unit, en, A[2][3], B[3][1], ac[2][1], bc[2][1], ac[2][0], bc[1][1], S[2][1]);
	cannon_unit m22(clk, rst_unit, en, A[2][0], B[1][2], ac[2][2], bc[2][2], ac[2][1], bc[1][2], S[2][2]);
	cannon_unit m23(clk, rst_unit, en, A[2][1], B[0][3], ac[2][3], bc[2][3], ac[2][2], bc[1][3], S[2][3]);

	cannon_unit m30(clk, rst_unit, en, A[3][3], B[3][0], ac[3][0], bc[3][0], ac[3][3], bc[2][0], S[3][0]);
	cannon_unit m31(clk, rst_unit, en, A[3][0], B[0][1], ac[3][1], bc[3][1], ac[3][0], bc[2][1], S[3][1]);
	cannon_unit m32(clk, rst_unit, en, A[3][1], B[1][2], ac[3][2], bc[3][2], ac[3][1], bc[2][2], S[3][2]);
	cannon_unit m33(clk, rst_unit, en, A[3][2], B[2][3], ac[3][3], bc[3][3], ac[3][2], bc[2][3], S[3][3]);

	parameter IDLE = 0;
	parameter LOAD = 1;
	parameter CALC = 2;
	parameter END  = 3;
	reg [1:0] state;
	reg [1:0] calc_cnt;
	always @(posedge clk or posedge rst) begin
		case (state)
			IDLE: begin 
				state <= LOAD;
				rst_unit <= 1'b0;
				en <= 1'b0;
				finished <= 1'b0;
			end
			LOAD: begin
				state <= CLAC;
				rst_unit <= 1'b1;
				en <= 1'b1;
				finished <= 1'b0;
			end
			CALC: begin
				if (calc_cnt == 2'b11) begin
					state <= END;
					calc_cnt <= 2'b0;
				end else begin
					state <= CALC;
					calc_cnt <= calc_cnt + 1;
				end
				rst_unit <= 1'b0;
				en <= 1'b1;
				finished <= 1'b0;
			end
			END: begin
				if (rst) begin
					state <= LOAD;
				end else begin
					state <= END;
				end
				rst_unit <= 1'b0;
				en <= 1'b0;
				finished <= 1'b1;
			end
		endcase
	end

endmodule // cannon
