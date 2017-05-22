`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2017 03:26:50 PM
// Design Name: 
// Module Name: spi_master_tb
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


module spi_master_tb(
	// Inputs
output reg clk,
output reg rst,
output reg [6:0] data_in,
output reg MISO,
output reg send,

// Outputs
output wire MOSI,
output wire SCLK,
output wire SS,
output wire done
);

// Instantiate the Unit Under Test (UUT)
spi_master uut (
    .clk(clk), 
    .rst(rst), 
    .data_in(data_in), 
    .MISO(MISO), 
    .send(send), 
    .MOSI(MOSI), 
    .SCLK(SCLK), 
    .SS(SS), 
    .done(done)
);

initial begin
    // Initialize Inputs
    clk = 0;
    rst = 0;
    data_in = 7'h31;
    MISO = 1;
    send = 0;
    
    // Add stimulus here
    #6 send = 1;
    #6 send = 0;
    #120 $stop;
end

always begin
    #3 clk = ~clk;
end

endmodule
