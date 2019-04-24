#set_property DONT_TOUCH true [get_cells <design_1_i/output_arbiter_0/inst/out_arb_fifo_1_i_1>]

#CPU RESET PUSHBUTTON
set_property PACKAGE_PIN AM13    [get_ports "sys_rst"]
set_property IOSTANDARD LVCMOS33 [get_ports "sys_rst"]

#SFP0
set_property PACKAGE_PIN D1      [get_ports "sfp_rxn"]
set_property PACKAGE_PIN D2      [get_ports "sfp_rxp"]
set_property PACKAGE_PIN E3      [get_ports "sfp_txn"]
set_property PACKAGE_PIN E4      [get_ports "sfp_txp"]

set_property PACKAGE_PIN A12     [get_ports "sfp_tx_disable"]
set_property IOSTANDARD LVCMOS33 [get_ports "sfp_tx_disable"]

#MGTH 230 SFP0 I/F
set_property PACKAGE_PIN C8         [get_ports "mgt_clk_p"]
set_property PACKAGE_PIN C7         [get_ports "mgt_clk_n"]

# create_clock -name gt_clk -period 8.000 [get_ports mgt_clk_p]

