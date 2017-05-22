`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2017 03:24:51 PM
// Design Name: 
// Module Name: PISO
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


module PISO(
    input wire clk, rst,
input wire shift_en, load, shift_in,
input wire [6:0] data_in,
output wire s_out
);
reg [7:0] data;
assign s_out = data[7];

always @(negedge clk or posedge rst) begin
    if (rst)
        data = 8'b0;
    else if(load)
        data = {1'b0, data_in};
    else if (shift_en)
        data = {data[6:0], shift_in};
    else
        data = data;
end

endmodule
