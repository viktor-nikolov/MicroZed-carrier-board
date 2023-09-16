/*****************************************************************************************
Purpose of this module is to make sending strings of character to AXI UART Lite IP easier.

Input to the module is a register holding up to 16 characters (including characters marking 
end of a line). String legth of 16 characters matches size of AXI UART Lite IP buffer.

After setting the input signal i_charsArrayValid to high for one clock, the module sends 
specified number of characters over AXI Lite (assumption that AXI UART Lite IP is connected
as slave to the AXI Lite).

WARNING: The module doesn't provide any feedback that the serial data transfer over UART has
finished. The code using this module must make sure that strings are not written too often (depending
on baud rate set in the UART Lite IP configuration and legnth of the strings.

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

module write_to_uart(
  input  [4:0] i_numOfChars,        //number of chars to be sent, max. 16 (AXI UART Lite IP has buffer of 16 chars)
  input  [(16*8-1):0] i_charsArray, //data to be sent
  input  i_charsArrayValid,         //high for 1 clock -> data are ready to be sent

  //AXI Master signals:
  // System Signals
  input wire M_AXI_ACLK,
  input wire M_AXI_ARESETN,

  // Master Interface Write Address
  output wire [3:0] M_AXI_AWADDR,
  output wire [3-1:0] M_AXI_AWPROT,
  output wire M_AXI_AWVALID,
  input wire M_AXI_AWREADY,

  // Master Interface Write Data
  output wire [32-1:0] M_AXI_WDATA,
  output wire [32/8-1:0] M_AXI_WSTRB,
  output wire M_AXI_WVALID,
  input wire M_AXI_WREADY,

  // Master Interface Write Response
  input wire [2-1:0] M_AXI_BRESP,
  input wire M_AXI_BVALID,
  output wire M_AXI_BREADY,

  // Master Interface Read Address
  output wire [3:0] M_AXI_ARADDR,
  output wire [3-1:0] M_AXI_ARPROT,
  output wire M_AXI_ARVALID,
  input wire M_AXI_ARREADY,

  // Master Interface Read Data
  input wire [32-1:0] M_AXI_RDATA,
  input wire [2-1:0] M_AXI_RRESP,
  input wire M_AXI_RVALID,
  output wire M_AXI_RREADY );

//States
localparam IN_RESET           = 0, //initial reset state
           WAIT_FOR_DV        = 1, //waiting for i_charsArrayValid to go high
           WAIT_FOR_AXI_WRITE = 2, //waiting between writes to the AXI
           AXI_WRITE          = 3; //writing to the AXI
reg [$clog2(4)-1:0] state = IN_RESET;

//module logic signals 
reg [1 : 0] waitCounter = 0;
reg [4 : 0] charsSent = 0; //number of characters sent

// AXI4 signals
reg          awvalid;
reg [32-1:0] wdata;
reg          wvalid;
reg          bready;
reg [3:0] 	 araddr;
reg          arvalid;
reg          rready;
assign M_AXI_AWADDR  = 4;        //for writing to UART Lite IP the address must be 4
assign M_AXI_AWPROT  = 3'h0;
assign M_AXI_AWVALID = awvalid;
assign M_AXI_WDATA   = wdata;
assign M_AXI_WSTRB   = 4'b1111;   //all byte strobes
assign M_AXI_WVALID  = wvalid;
assign M_AXI_BREADY  = bready;
assign M_AXI_ARADDR  = araddr;
assign M_AXI_ARPROT  = 3'b0;
assign M_AXI_ARVALID = arvalid;
assign M_AXI_RREADY  = rready;

always @ (posedge M_AXI_ACLK)
begin
  case( state )
    IN_RESET: begin //we start in reset
      if( M_AXI_ARESETN ) //0 == we are in reset
        state <= WAIT_FOR_DV;
    end

    WAIT_FOR_DV: begin
      //waiting for input character string to be valid
      if( i_charsArrayValid )
        state <= WAIT_FOR_AXI_WRITE;
    end

    WAIT_FOR_AXI_WRITE: begin
      //Waiting for next AXI writ
      if( M_AXI_AWREADY ) //the slave has read axi_awaddr 
        awvalid <= 0;
      if( M_AXI_WREADY ) //the slave has read s_axi_wdata 
        wvalid <= 0;
      if( M_AXI_BVALID ) //value axi_bresp (slave response) is valid
        bready <= 0;
        
      waitCounter <= waitCounter + 1;
      if( waitCounter == 3 ) //Min. 3 clocks are required between AXI writes
        state <= AXI_WRITE;
    end

    AXI_WRITE: begin
      if( charsSent < i_numOfChars ) begin
          wdata[7:0] <= i_charsArray[ (16-charsSent)*8-1 -:8]; 
            /*syntax: 
              [M -: N]  // negative offset from bit index M, N bit result 
              [M +: N]  // positive offset from bit index M, N bit result */
          awvalid <= 1;
          wvalid  <= 1;
          bready  <= 1;
          charsSent <= charsSent + 1;
          waitCounter <= 0;
          state <= WAIT_FOR_AXI_WRITE;
      end
      else begin
        waitCounter <= 0;
        charsSent <= 0;
        state <= WAIT_FOR_DV;
      end
    end

  endcase  
end //always @ (posedge M_AXI_ACLK)

endmodule
