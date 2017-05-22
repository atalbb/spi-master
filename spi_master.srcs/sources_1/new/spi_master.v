`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2017 03:26:19 PM
// Design Name: 
// Module Name: spi_master
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


module spi_master(
    input wire clk, rst,
    input wire [6:0] data_in,
    input wire MISO, send,
    output wire MOSI, SCLK, SS, done
);
    wire shift_en, load;
    
    PISO P1(
        .clk(clk), 
        .rst(rst), 
        .shift_en(shift_en), 
        .load(load), 
        .shift_in(MISO), 
        .data_in(data_in), 
        .s_out(MOSI)
    );
    
    spi_ctrl ctrl(
        .clk(clk),
        .rst(rst),
        .send(send),
        .shift_en(shift_en),
        .done(done),
		.load(load),
        .SCLK(SCLK),
        .SS(SS)
    );

endmodule
