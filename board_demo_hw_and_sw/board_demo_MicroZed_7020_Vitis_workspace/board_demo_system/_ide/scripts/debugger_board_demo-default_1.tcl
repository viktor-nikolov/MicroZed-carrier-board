# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\MicroZed_projects\board_demo\board_demo_MicroZed_7020_Vitis_workspace\board_demo_system\_ide\scripts\debugger_board_demo-default_1.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\MicroZed_projects\board_demo\board_demo_MicroZed_7020_Vitis_workspace\board_demo_system\_ide\scripts\debugger_board_demo-default_1.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Platform Cable USB II 00001d9a023001" && level==0 && jtag_device_ctx=="jsn-DLC10-00001d9a023001-23727093-0"}
fpga -file C:/MicroZed_projects/board_demo/board_demo_MicroZed_7020_Vitis_workspace/board_demo/_ide/bitstream/system_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw C:/MicroZed_projects/board_demo/board_demo_MicroZed_7020_Vitis_workspace/system/export/system/hw/system_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source C:/MicroZed_projects/board_demo/board_demo_MicroZed_7020_Vitis_workspace/board_demo/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow C:/MicroZed_projects/board_demo/board_demo_MicroZed_7020_Vitis_workspace/board_demo/Release/board_demo.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con
