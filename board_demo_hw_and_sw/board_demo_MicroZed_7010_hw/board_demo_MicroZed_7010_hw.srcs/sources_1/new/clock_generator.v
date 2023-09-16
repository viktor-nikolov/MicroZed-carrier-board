/*****************************************************************************************
This is simple frequency descaling module
******************************************************************************************/

`timescale 1ns / 1ps

module clock_generator
#( parameter TICS_IN_PERID=10 ) //number of sys_clk tics in the out_clk period
(                               //example: for 100 MHz sys_clk, set TICS_IN_PERID=100E6 of 1 Hz out_clk  
    input sys_clk,
    output out_clk
);

reg [31:0] count = 0;
reg clk = 0;

assign out_clk = clk;

always @ (posedge(sys_clk))
begin
  if(count == TICS_IN_PERID / 2 - 1) begin
    clk <= ~clk;
    count <= 0;
  end
  else
    count <= count + 1;
end

endmodule
