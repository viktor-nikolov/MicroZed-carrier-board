/*****************************************************************************************
This is the demo program for the MicroZed development carrier board
(https://github.com/viktor-nikolov/MicroZed-carrier-board).

It assumes the HW specification as exported to board_demo/board_demo_MicroZed_7010_hw/system_wrapper.xsa

The demo does the following:

- Board's LED1 and LED2 blink with 2.5 Hz frequency.

- Board's SWITCH1 disables blinking of LED1. SWITCH2 disables LED2.

- Testing serial output is provided on the UART Micro-USB connector.
  - Connect your computer to the board's UART Micro-USB connector. A new COM port should became
    available in the operating system. Connect a terminal program (e.g. PuTTY) to given COM port,
    set the speed to 9600 baud. You then shall see increasing series of numbers in the terminal (25 lines per second).
  - Activity of the board's serial output is also indicated by fast blinking yellow TX LED on the board.

- J3_1 provides the 3.3 V square wave signal of frequency 5 kHz, which is exactly ten thousand times
  de-scaled 50 MHz frequency signal from the oscillator X1.

- Other pins with odd pin number on J3, J4 and PMODs provide the square wave signal
  of frequency 166.6 Hz (5 V on PMOD1 and PMOD2, 3.3 V on other connectors).

- Pins with even pin number on J3, J4 and PMODs provide the square wave signal of frequency 80.6 Hz.

Following pins are NOT USED by the demo:
- J3_32_UART_RX   - serial receive pin from the USB-to-UART chip.
- J3_46 and J3_47 - analog input ports XADC VP/VN.
- J3_50 and J3_51 - temperature-sensing diode pins not usable by PL (see 7 Series Pinout UG475, Table1-12).

- Following pins DO NOTHING when using MicroZed 7010, because respective Zynq pins simply don't
  exist on the 7010 chip:
  - J3_26
  - J3_42..45
  - J3_48..49
  - J3_52
  - J4_18..19
  - J4_34..38

 -------------------------------------------------------------------------------
 | UART TYPE                      BAUD RATE                                    |
 -------------------------------------------------------------------------------
   ps7_uart                        115200 (configured by bootrom/bsp)
   UART on Micro-USB on the board    9600 (configured on the AXI UART Lite IP)


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

#include <vector>
#include "xil_printf.h"
#include "xgpiops.h"
#include "sleep.h"

#define PS_LED_PIN   47  //MIO pin 47 = PS LED on MicroZed

#define PL_LED_PIN   54  //= EMIO pin 0, connected to LEDs on the carrier board
#define PL_EVEN_PIN  55  //= EMIO pin 1, connected to even pins on the carrier board
#define PL_ODD_PIN   56  //= EMIO pin 2, connected to odd pins on the carrier board

XGpioPs GpioInstance;

int initialiseGPIO()
{
	XGpioPs_Config *GpioConfig;

	GpioConfig = XGpioPs_LookupConfig(XPAR_PS7_GPIO_0_DEVICE_ID);
	if(GpioConfig == NULL) {
		print("XGpioPs_LookupConfig failed\r\n");
		return XST_FAILURE;
	}

	int Status = XGpioPs_CfgInitialize(&GpioInstance, GpioConfig, GpioConfig->BaseAddr);
	if(Status != XST_SUCCESS) {
		print("XGpioPs_CfgInitialize failed\r\n");
		return XST_FAILURE;
	}

  //configure output pins
	const std::vector<int> outputPins = { PS_LED_PIN, PL_LED_PIN, PL_EVEN_PIN, PL_ODD_PIN  };
	for( auto p : outputPins ) {
		XGpioPs_SetDirectionPin(&GpioInstance, p, 1 /*output*/);
		XGpioPs_SetOutputEnablePin(&GpioInstance, p, 1 /*enable*/);
	}

    return XST_SUCCESS;
}


int main()
{
    print("***** MicroZed carrier board demo started *****\n\r");

    if( initialiseGPIO() != XST_SUCCESS )
    	return XST_FAILURE;

    const unsigned SLEEP_INTERVAL{100},
                   LED_TICKS{1999},     //  2.5 Hz
                   EVEN_PIN_TICKS{61},  // 80.6 Hz
                   ODD_PIN_TICKS{29};   //166.6 Hz
    unsigned LEDTickCounter{0}, EvenPinTickCounter{0}, OddPinTickCounter{0};
    unsigned LEDState{0}, EvenPinState{0}, OddPinState{0};

    while(1) {
        if( LEDTickCounter == LED_TICKS ) {
        	LEDTickCounter = 0;
        	LEDState = !LEDState;
        	XGpioPs_WritePin( &GpioInstance, PS_LED_PIN, LEDState );
        	XGpioPs_WritePin( &GpioInstance, PL_LED_PIN, LEDState );
        }
        else
        	LEDTickCounter++;

        if( EvenPinTickCounter == EVEN_PIN_TICKS ) {
        	EvenPinTickCounter = 0;
        	EvenPinState = !EvenPinState;
        	XGpioPs_WritePin( &GpioInstance, PL_EVEN_PIN, EvenPinState );
        }
        else
        	EvenPinTickCounter++;

        if( OddPinTickCounter == ODD_PIN_TICKS ) {
        	OddPinTickCounter = 0;
        	OddPinState = !OddPinState;
        	XGpioPs_WritePin( &GpioInstance, PL_ODD_PIN, OddPinState );
        }
        else
        	OddPinTickCounter++;

    	usleep( SLEEP_INTERVAL );
    }

    return 0; //never reaches to here
}
