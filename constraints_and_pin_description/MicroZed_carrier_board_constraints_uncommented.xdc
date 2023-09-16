## This file is a general .xdc for the MicroZed development carrier board, Rev. 4
## https://github.com/viktor-nikolov/MicroZed-carrier-board
##
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

############  LEDs and switches  ############
set_property -dict { PACKAGE_PIN C20 IOSTANDARD LVCMOS33 } [get_ports { LED1    }];
set_property -dict { PACKAGE_PIN J15 IOSTANDARD LVCMOS33 } [get_ports { LED2    }];
set_property -dict { PACKAGE_PIN B20 IOSTANDARD LVCMOS33 } [get_ports { SWITCH1 }];
set_property -dict { PACKAGE_PIN G14 IOSTANDARD LVCMOS33 } [get_ports { SWITCH2 }];

############  50 MHz oscillator input  ############
set_property -dict { PACKAGE_PIN N18 IOSTANDARD LVCMOS33 } [get_ports { OSC_50MHZ }];

############  PMOD1  ############
## Beware that output of PMOD1 is shifted to 5V!
set_property -dict { PACKAGE_PIN G19 IOSTANDARD LVCMOS33 } [get_ports { PMOD1_1 }];
set_property -dict { PACKAGE_PIN G20 IOSTANDARD LVCMOS33 } [get_ports { PMOD1_2 }];
set_property -dict { PACKAGE_PIN K14 IOSTANDARD LVCMOS33 } [get_ports { PMOD1_3 }];
set_property -dict { PACKAGE_PIN J14 IOSTANDARD LVCMOS33 } [get_ports { PMOD1_4 }];
set_property -dict { PACKAGE_PIN N15 IOSTANDARD LVCMOS33 } [get_ports { PMOD1_5 }];
set_property -dict { PACKAGE_PIN N16 IOSTANDARD LVCMOS33 } [get_ports { PMOD1_6 }];
set_property -dict { PACKAGE_PIN M14 IOSTANDARD LVCMOS33 } [get_ports { PMOD1_7 }];
set_property -dict { PACKAGE_PIN M15 IOSTANDARD LVCMOS33 } [get_ports { PMOD1_8 }];

############  PMOD2  ############
## Beware that output of PMOD2 is shifted to 5V!
set_property -dict { PACKAGE_PIN M17 IOSTANDARD LVCMOS33 } [get_ports { PMOD2_1 }];
set_property -dict { PACKAGE_PIN M18 IOSTANDARD LVCMOS33 } [get_ports { PMOD2_2 }];
set_property -dict { PACKAGE_PIN L16 IOSTANDARD LVCMOS33 } [get_ports { PMOD2_3 }];
set_property -dict { PACKAGE_PIN L17 IOSTANDARD LVCMOS33 } [get_ports { PMOD2_4 }];
set_property -dict { PACKAGE_PIN H16 IOSTANDARD LVCMOS33 } [get_ports { PMOD2_5 }];
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports { PMOD2_6 }];
set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS33 } [get_ports { PMOD2_7 }];
set_property -dict { PACKAGE_PIN G18 IOSTANDARD LVCMOS33 } [get_ports { PMOD2_8 }];

############  PMOD3  ############
set_property -dict { PACKAGE_PIN P16 IOSTANDARD LVCMOS33 } [get_ports { PMOD3_1 }];
set_property -dict { PACKAGE_PIN P15 IOSTANDARD LVCMOS33 } [get_ports { PMOD3_2 }];
set_property -dict { PACKAGE_PIN W19 IOSTANDARD LVCMOS33 } [get_ports { PMOD3_3 }];
set_property -dict { PACKAGE_PIN W18 IOSTANDARD LVCMOS33 } [get_ports { PMOD3_4 }];
set_property -dict { PACKAGE_PIN R18 IOSTANDARD LVCMOS33 } [get_ports { PMOD3_5 }];
set_property -dict { PACKAGE_PIN T17 IOSTANDARD LVCMOS33 } [get_ports { PMOD3_6 }];
set_property -dict { PACKAGE_PIN W16 IOSTANDARD LVCMOS33 } [get_ports { PMOD3_7 }];
set_property -dict { PACKAGE_PIN V16 IOSTANDARD LVCMOS33 } [get_ports { PMOD3_8 }];

############  J3  ############
set_property -dict { PACKAGE_PIN T19 IOSTANDARD LVCMOS33 } [get_ports { J3_01 }];
set_property -dict { PACKAGE_PIN R19 IOSTANDARD LVCMOS33 } [get_ports { J3_02 }];
set_property -dict { PACKAGE_PIN T11 IOSTANDARD LVCMOS33 } [get_ports { J3_03 }];
set_property -dict { PACKAGE_PIN T10 IOSTANDARD LVCMOS33 } [get_ports { J3_04 }];
set_property -dict { PACKAGE_PIN T12 IOSTANDARD LVCMOS33 } [get_ports { J3_05 }];
set_property -dict { PACKAGE_PIN U12 IOSTANDARD LVCMOS33 } [get_ports { J3_06 }];
set_property -dict { PACKAGE_PIN V12 IOSTANDARD LVCMOS33 } [get_ports { J3_07 }];
set_property -dict { PACKAGE_PIN W13 IOSTANDARD LVCMOS33 } [get_ports { J3_08 }];
set_property -dict { PACKAGE_PIN T16 IOSTANDARD LVCMOS33 } [get_ports { J3_09 }];
set_property -dict { PACKAGE_PIN U17 IOSTANDARD LVCMOS33 } [get_ports { J3_10 }];
set_property -dict { PACKAGE_PIN P14 IOSTANDARD LVCMOS33 } [get_ports { J3_11 }];
set_property -dict { PACKAGE_PIN R14 IOSTANDARD LVCMOS33 } [get_ports { J3_12 }];
set_property -dict { PACKAGE_PIN W14 IOSTANDARD LVCMOS33 } [get_ports { J3_13 }];
set_property -dict { PACKAGE_PIN Y14 IOSTANDARD LVCMOS33 } [get_ports { J3_14 }];
set_property -dict { PACKAGE_PIN U14 IOSTANDARD LVCMOS33 } [get_ports { J3_15 }];
set_property -dict { PACKAGE_PIN U15 IOSTANDARD LVCMOS33 } [get_ports { J3_16 }];
set_property -dict { PACKAGE_PIN V15 IOSTANDARD LVCMOS33 } [get_ports { J3_17 }];
set_property -dict { PACKAGE_PIN W15 IOSTANDARD LVCMOS33 } [get_ports { J3_18 }];
set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports { J3_19 }];
set_property -dict { PACKAGE_PIN U19 IOSTANDARD LVCMOS33 } [get_ports { J3_20 }];
set_property -dict { PACKAGE_PIN N20 IOSTANDARD LVCMOS33 } [get_ports { J3_21 }];
set_property -dict { PACKAGE_PIN P20 IOSTANDARD LVCMOS33 } [get_ports { J3_22 }];
set_property -dict { PACKAGE_PIN V20 IOSTANDARD LVCMOS33 } [get_ports { J3_23 }];
set_property -dict { PACKAGE_PIN W20 IOSTANDARD LVCMOS33 } [get_ports { J3_24 }];
set_property -dict { PACKAGE_PIN  T9 IOSTANDARD LVCMOS33 } [get_ports { J3_26 }]; /*MicroZed 7020 only*/
set_property -dict { PACKAGE_PIN V13 IOSTANDARD LVCMOS33 } [get_ports { J3_27 }];
set_property -dict { PACKAGE_PIN T14 IOSTANDARD LVCMOS33 } [get_ports { J3_28 }];
set_property -dict { PACKAGE_PIN T15 IOSTANDARD LVCMOS33 } [get_ports { J3_29 }];
set_property -dict { PACKAGE_PIN Y16 IOSTANDARD LVCMOS33 } [get_ports { J3_30 }];
set_property -dict { PACKAGE_PIN Y17 IOSTANDARD LVCMOS33 } [get_ports { J3_31 }];
set_property -dict { PACKAGE_PIN T20 IOSTANDARD LVCMOS33 } [get_ports { J3_32_UART_RX }];
set_property -dict { PACKAGE_PIN U20 IOSTANDARD LVCMOS33 } [get_ports { J3_33_UART_TX }];
set_property -dict { PACKAGE_PIN Y18 IOSTANDARD LVCMOS33 } [get_ports { J3_34 }];
set_property -dict { PACKAGE_PIN Y19 IOSTANDARD LVCMOS33 } [get_ports { J3_35 }];
set_property -dict { PACKAGE_PIN R16 IOSTANDARD LVCMOS33 } [get_ports { J3_36 }];
set_property -dict { PACKAGE_PIN R17 IOSTANDARD LVCMOS33 } [get_ports { J3_37 }];
set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports { J3_38 }];
set_property -dict { PACKAGE_PIN V18 IOSTANDARD LVCMOS33 } [get_ports { J3_39 }];
set_property -dict { PACKAGE_PIN N17 IOSTANDARD LVCMOS33 } [get_ports { J3_40 }];
set_property -dict { PACKAGE_PIN P18 IOSTANDARD LVCMOS33 } [get_ports { J3_41 }];
set_property -dict { PACKAGE_PIN  U7 IOSTANDARD LVCMOS33 } [get_ports { J3_42 }]; /*MicroZed 7020 only*/
set_property -dict { PACKAGE_PIN  V7 IOSTANDARD LVCMOS33 } [get_ports { J3_43 }]; /*MicroZed 7020 only*/
set_property -dict { PACKAGE_PIN  V8 IOSTANDARD LVCMOS33 } [get_ports { J3_44 }]; /*MicroZed 7020 only*/
set_property -dict { PACKAGE_PIN  W8 IOSTANDARD LVCMOS33 } [get_ports { J3_45 }]; /*MicroZed 7020 only*/
set_property         PACKAGE_PIN  K9                       [get_ports { J3_46 }]; /*analog input XADC_VP*/
set_property         PACKAGE_PIN L10                       [get_ports { J3_47 }]; /*analog input XADC_VN*/
set_property -dict { PACKAGE_PIN U10 IOSTANDARD LVCMOS33 } [get_ports { J3_48 }]; /*MicroZed 7020 only*/
set_property -dict { PACKAGE_PIN  T5 IOSTANDARD LVCMOS33 } [get_ports { J3_49 }]; /*MicroZed 7020 only*/
#J3_50 and J3_51 are temperature-sensing diode pins not usable by PL (see UG475, Table1-12)
set_property -dict { PACKAGE_PIN  U5 IOSTANDARD LVCMOS33 } [get_ports { J3_52 }]; /*MicroZed 7020 only*/

############  J4  ############
set_property -dict { PACKAGE_PIN J19 IOSTANDARD LVCMOS33 } [get_ports { J4_01 }];
set_property -dict { PACKAGE_PIN K19 IOSTANDARD LVCMOS33 } [get_ports { J4_02 }];
set_property -dict { PACKAGE_PIN M20 IOSTANDARD LVCMOS33 } [get_ports { J4_03 }];
set_property -dict { PACKAGE_PIN M19 IOSTANDARD LVCMOS33 } [get_ports { J4_04 }];
set_property -dict { PACKAGE_PIN F17 IOSTANDARD LVCMOS33 } [get_ports { J4_05 }];
set_property -dict { PACKAGE_PIN F16 IOSTANDARD LVCMOS33 } [get_ports { J4_06 }];
set_property -dict { PACKAGE_PIN D20 IOSTANDARD LVCMOS33 } [get_ports { J4_07 }];
set_property -dict { PACKAGE_PIN D19 IOSTANDARD LVCMOS33 } [get_ports { J4_08 }];
set_property -dict { PACKAGE_PIN A20 IOSTANDARD LVCMOS33 } [get_ports { J4_09 }];
set_property -dict { PACKAGE_PIN B19 IOSTANDARD LVCMOS33 } [get_ports { J4_10 }];
set_property -dict { PACKAGE_PIN E19 IOSTANDARD LVCMOS33 } [get_ports { J4_11 }];
set_property -dict { PACKAGE_PIN E18 IOSTANDARD LVCMOS33 } [get_ports { J4_12 }];
set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports { J4_13 }];
set_property -dict { PACKAGE_PIN E17 IOSTANDARD LVCMOS33 } [get_ports { J4_14 }];
set_property -dict { PACKAGE_PIN L20 IOSTANDARD LVCMOS33 } [get_ports { J4_16 }];
set_property -dict { PACKAGE_PIN L19 IOSTANDARD LVCMOS33 } [get_ports { J4_17 }];
set_property -dict { PACKAGE_PIN Y12 IOSTANDARD LVCMOS33 } [get_ports { J4_18 }]; /*MicroZed 7020 only*/
set_property -dict { PACKAGE_PIN Y13 IOSTANDARD LVCMOS33 } [get_ports { J4_19 }]; /*MicroZed 7020 only*/
set_property -dict { PACKAGE_PIN K17 IOSTANDARD LVCMOS33 } [get_ports { J4_20 }];
set_property -dict { PACKAGE_PIN K18 IOSTANDARD LVCMOS33 } [get_ports { J4_21 }];
set_property -dict { PACKAGE_PIN J18 IOSTANDARD LVCMOS33 } [get_ports { J4_22 }];
set_property -dict { PACKAGE_PIN H18 IOSTANDARD LVCMOS33 } [get_ports { J4_23 }];
set_property -dict { PACKAGE_PIN F19 IOSTANDARD LVCMOS33 } [get_ports { J4_24 }];
set_property -dict { PACKAGE_PIN F20 IOSTANDARD LVCMOS33 } [get_ports { J4_25 }];
set_property -dict { PACKAGE_PIN J20 IOSTANDARD LVCMOS33 } [get_ports { J4_26 }];
set_property -dict { PACKAGE_PIN H20 IOSTANDARD LVCMOS33 } [get_ports { J4_27 }];
set_property -dict { PACKAGE_PIN H15 IOSTANDARD LVCMOS33 } [get_ports { J4_28 }];
set_property -dict { PACKAGE_PIN G15 IOSTANDARD LVCMOS33 } [get_ports { J4_29 }];
set_property -dict { PACKAGE_PIN L14 IOSTANDARD LVCMOS33 } [get_ports { J4_30 }];
set_property -dict { PACKAGE_PIN L15 IOSTANDARD LVCMOS33 } [get_ports { J4_31 }];
set_property -dict { PACKAGE_PIN K16 IOSTANDARD LVCMOS33 } [get_ports { J4_32 }];
set_property -dict { PACKAGE_PIN J16 IOSTANDARD LVCMOS33 } [get_ports { J4_33 }];
set_property -dict { PACKAGE_PIN V11 IOSTANDARD LVCMOS33 } [get_ports { J4_34 }]; /*MicroZed 7020 only*/
set_property -dict { PACKAGE_PIN V10 IOSTANDARD LVCMOS33 } [get_ports { J4_35 }]; /*MicroZed 7020 only*/
set_property -dict { PACKAGE_PIN  V5 IOSTANDARD LVCMOS33 } [get_ports { J4_36 }]; /*MicroZed 7020 only*/
set_property -dict { PACKAGE_PIN  W6 IOSTANDARD LVCMOS33 } [get_ports { J4_37 }]; /*MicroZed 7020 only*/
set_property -dict { PACKAGE_PIN  V6 IOSTANDARD LVCMOS33 } [get_ports { J4_38 }]; /*MicroZed 7020 only*/
