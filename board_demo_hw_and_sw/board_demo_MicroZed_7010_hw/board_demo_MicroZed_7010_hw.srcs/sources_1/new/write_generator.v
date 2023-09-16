/*****************************************************************************************
This module generates testing serial output for the demo of MicroZed development carrier board
(https://github.com/viktor-nikolov/MicroZed-carrier-board).

The module needs to be connected to the write_to_uart module.
Series of increasing numbers from 00000 to 16383 is being generated to the output.

Frequnency of output generation is controlled by value of TICS_IN_PERID parameter
clock_generator module instance.

BSD 2-Clause License

Copyright (c) 2023, Viktor Nikolov

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
******************************************************************************************/

`timescale 1ns / 1ps

module write_generator(
  input clk,
  input rst,
  output [4:0] o_numOfChars,        //number of chars to be sent, max. 16 (AXI UART Lite IP has buffer of 16 chars)
  output [(16*8-1):0] o_charsArray, //data to be sent
  output o_charsArrayValid          //high for 1 clock -> data are ready to be sent
);

//States
localparam IN_RESET = 0,
           WRITE = 1,
           WAIT = 2;
reg [$clog2(3)-1:0] state = IN_RESET;

//Output signals
localparam NUM_OF_CHARS = 5+2; //number of characters characters we sent
reg [ (16*8-1):0 ] data = { "12345", 8'd13, 8'd10 /*\r\n*/, /*filling rest of register to 16 chars:*/"123456789" };
reg r_charsArrayValid;
assign o_numOfChars = NUM_OF_CHARS;
assign o_charsArray = data;
assign o_charsArrayValid = r_charsArrayValid;

wire slowClk;
reg previous_slowClk = 0;

reg [13:0] t0, t1, t2, t3, t4;
reg [13:0] printedNum = 0;

always @ (posedge clk)
begin
  case( state )
    IN_RESET: begin //we start in reset
      if( rst ) //0 == we are in reset
        state <= WAIT;
    end

    WAIT: begin
      r_charsArrayValid <= 0;

      //waiting for raising edge of slowClk 
      if( !previous_slowClk && slowClk ) begin //we have raising edge of slowClk
        t4 = (printedNum/14'd10000) % 14'd10;
        t3 = (printedNum/14'd1000)  % 14'd10;
        t2 = (printedNum/14'd100)   % 14'd10;
        t1 = (printedNum/14'd10)    % 14'd10;
        t0 = printedNum % 14'd10;
        data[ 12*8-1 -:8] = "0" + t0;
        data[ 13*8-1 -:8] = "0" + t1;
        data[ 14*8-1 -:8] = "0" + t2;
        data[ 15*8-1 -:8] = "0" + t3;
        data[ 16*8-1 -:8] = "0" + t4;
        printedNum <= printedNum + 1;
        
        state <= WRITE;
      end
    end

    WRITE: begin
      r_charsArrayValid <= 1;
      state <= WAIT;
    end
 
  endcase
  
  previous_slowClk <= slowClk;
end //always @ (posedge clk)

/*****************************************************************************************
Frequnency of output generation is controlled by value of TICS_IN_PERID parameter of the
clock_generator module instance.
Be aware that the write_to_uart we are sending data to doesn't provide any feedback that 
the serial data transfer over UART has finished.
The code in this module must therefore make sure that strings are not written too often
(depending on baud rate set in the UART Lite IP configuration).

In this demo for the MicroZed development carrier board baud rate of UART Lite IP is set
to 9600. Therefore output frequency must be kept fairly low.

In my other projects I achieved max. transfer frequency of 7 char strings of 3333 strings 
per second by setting UART Lite IP baud rate to 230400 and TICS_IN_PERID to 30000.
This however requires very fast computer. Otherwise the terminal prograram running
on the computer doesn't manage to actually process such fast UART input.
******************************************************************************************/
//clock_generator #(.TICS_IN_PERID( 2000000 )) clkgen ( //50 Hz 
clock_generator #(.TICS_IN_PERID( 4000000 )) clkgen ( //25 Hz 
  .sys_clk( clk ),
  .out_clk( slowClk )
);

endmodule
