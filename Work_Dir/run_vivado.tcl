create_project test_prj ../Work_Dir/pcs_pma -part xczu9eg-ffvb1156-2-i-es2 -force
set_property board_part xilinx.com:zcu102_es2:part0:2.3 [current_project]
add_files -norecurse    ../RTL/gmii_tx.v
add_files -fileset constrs_1 -norecurse ../Constraints/top.xdc
update_compile_order -fileset sources_1
source ../IPI_BDs/system_top.tcl
update_compile_order -fileset sources_1
make_wrapper -files [get_files ../Work_Dir/pcs_pma/test_prj.srcs/sources_1/bd/system_top/system_top.bd] -top
add_files -norecurse ../Work_Dir/pcs_pma/test_prj.srcs/sources_1/bd/system_top/hdl/system_top_wrapper.v
update_compile_order -fileset sources_1
start_gui
