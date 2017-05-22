`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2017 03:25:27 PM
// Design Name: 
// Module Name: clkdiv
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clkdiv(clkin,rst,clkout);
parameter WIDTH = 4;
parameter CLK_DIVISOR = 20;
input clkin,rst;
output clkout;
reg [WIDTH-1:0]r_cnt;
wire [WIDTH-1:0]cnt;
reg r_clk;

always@(posedge clkin or posedge rst)begin
    if(rst) begin
        r_cnt <= 0;
        r_clk <= 0;
    end else if(cnt == CLK_DIVISOR/2) begin
        r_cnt <= 0;
        r_clk <= ~r_clk;
    end else
        r_cnt <= cnt;
    end
assign cnt = r_cnt + 1;
assign clkout = r_clk;
endmodule
