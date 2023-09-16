# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\MicroZed_projects\board_demo\board_demo_MicroZed_7010_Vitis_workspace\system\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\MicroZed_projects\board_demo\board_demo_MicroZed_7010_Vitis_workspace\system\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {system}\
-hw {C:\MicroZed_projects\board_demo\board_demo_MicroZed_7010_hw\system_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -out {C:/MicroZed_projects/board_demo/board_demo_MicroZed_7010_Vitis_workspace}

platform write
platform generate -domains 
platform active {system}
platform generate
bsp reload
domain active {zynq_fsbl}
bsp reload
platform active {system}
platform generate
platform active {system}
platform active {system}
platform generate -domains 
platform generate
platform clean
platform generate
platform active {system}
platform config -updatehw {C:/MicroZed_projects/board_demo/board_demo_MicroZed_7010_hw/system_wrapper.xsa}
platform generate
platform active {system}
platform config -updatehw {C:/MicroZed_projects/board_demo/board_demo_MicroZed_7010_hw/system_wrapper.xsa}
platform generate -domains 
platform active {system}
platform config -updatehw {C:/MicroZed_projects/board_demo/board_demo_MicroZed_7010_hw/system_wrapper.xsa}
platform generate -domains 
platform clean
platform generate
platform active {system}
platform config -updatehw {C:/MicroZed_projects/board_demo/board_demo_MicroZed_7020_hw/system_wrapper.xsa}
platform generate -domains 
platform active {system}
platform config -updatehw {C:/MicroZed_projects/board_demo/board_demo_MicroZed_7020_hw/system_wrapper.xsa}
platform generate -domains 
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform clean
platform generate
platform generate -domains standalone_domain,zynq_fsbl 
platform clean
