################################################################
# This is a generated script based on design: system_top
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source system_top_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# gmii_tx

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xczu9eg-ffvb1156-2-i-es2
   set_property BOARD_PART xilinx.com:zcu102_es2:part0:2.3 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name system_top

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:gig_ethernet_pcs_pma:16.1\
xilinx.com:ip:ila:6.2\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:vio:3.0\
"

   set list_ips_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\ 
gmii_tx\
"

   set list_mods_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_msg_id "BD_TCL-008" "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_msg_id "BD_TCL-1003" "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set mgt [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 mgt ]
  set sfp [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:sfp_rtl:1.0 sfp ]
  set user_si570_sysclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 user_si570_sysclk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {300000000} \
   ] $user_si570_sysclk

  # Create ports
  set sfp_tx_disable [ create_bd_port -dir O -from 0 -to 0 sfp_tx_disable ]
  set sys_rst [ create_bd_port -dir I -type rst sys_rst ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $sys_rst

  # Create instance: gmii_tx_0, and set properties
  set block_name gmii_tx
  set block_cell_name gmii_tx_0
  if { [catch {set gmii_tx_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $gmii_tx_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {33.330000000000005} \
   CONFIG.CLKOUT1_JITTER {116.415} \
   CONFIG.CLKOUT1_PHASE_ERROR {77.836} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50} \
   CONFIG.CLKOUT2_JITTER {88.577} \
   CONFIG.CLKOUT2_PHASE_ERROR {77.836} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {200.000} \
   CONFIG.CLKOUT2_USED {false} \
   CONFIG.CLK_IN1_BOARD_INTERFACE {user_si570_sysclk} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {4.000} \
   CONFIG.MMCM_CLKIN1_PERIOD {3.333} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {24.000} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {1} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {1} \
   CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
   CONFIG.USE_BOARD_FLOW {true} \
   CONFIG.USE_PHASE_ALIGNMENT {true} \
 ] $clk_wiz_0

  # Create instance: gig_ethernet_pcs_pma_0, and set properties
  set gig_ethernet_pcs_pma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:gig_ethernet_pcs_pma:16.1 gig_ethernet_pcs_pma_0 ]
  set_property -dict [ list \
   CONFIG.Auto_Negotiation {false} \
   CONFIG.DrpClkRate {50} \
   CONFIG.EMAC_IF_TEMAC {TEMAC} \
   CONFIG.Ext_Management_Interface {false} \
   CONFIG.GT_Location {X1Y12} \
   CONFIG.GTinEx {false} \
   CONFIG.LvdsRefClk {125} \
   CONFIG.Management_Interface {false} \
   CONFIG.Physical_Interface {Transceiver} \
   CONFIG.RefClkRate {156.25} \
   CONFIG.RxGmiiClkSrc {TXOUTCLK} \
   CONFIG.Standard {1000BASEX} \
   CONFIG.SupportLevel {Include_Shared_Logic_in_Core} \
   CONFIG.TransceiverControl {false} \
 ] $gig_ethernet_pcs_pma_0

  # Create instance: ila_0, and set properties
  set ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_0 ]
  set_property -dict [ list \
   CONFIG.C_ENABLE_ILA_AXI_MON {false} \
   CONFIG.C_MONITOR_TYPE {Native} \
   CONFIG.C_NUM_OF_PROBES {7} \
   CONFIG.C_PROBE2_WIDTH {8} \
   CONFIG.C_PROBE5_WIDTH {8} \
   CONFIG.C_PROBE6_WIDTH {16} \
 ] $ila_0

  # Create instance: rst_ps8_0_99M, and set properties
  set rst_ps8_0_99M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps8_0_99M ]
  set_property -dict [ list \
   CONFIG.RESET_BOARD_INTERFACE {reset} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $rst_ps8_0_99M

  # Create instance: vio_0, and set properties
  set vio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:vio:3.0 vio_0 ]
  set_property -dict [ list \
   CONFIG.C_EN_PROBE_IN_ACTIVITY {1} \
   CONFIG.C_NUM_PROBE_IN {6} \
   CONFIG.C_NUM_PROBE_OUT {4} \
   CONFIG.C_PROBE_OUT0_INIT_VAL {0001} \
   CONFIG.C_PROBE_OUT1_WIDTH {5} \
   CONFIG.C_PROBE_OUT2_INIT_VAL {0x1} \
 ] $vio_0

  # Create interface connections
  connect_bd_intf_net -intf_net gig_ethernet_pcs_pma_0_sfp [get_bd_intf_ports sfp] [get_bd_intf_pins gig_ethernet_pcs_pma_0/sfp]
  connect_bd_intf_net -intf_net gtrefclk_in_0_1 [get_bd_intf_ports mgt] [get_bd_intf_pins gig_ethernet_pcs_pma_0/gtrefclk_in]
  connect_bd_intf_net -intf_net user_si570_sysclk_1 [get_bd_intf_ports user_si570_sysclk] [get_bd_intf_pins clk_wiz_0/CLK_IN1_D]

  # Create port connections
  connect_bd_net -net gmii_tx_0_gmii_tx_en [get_bd_pins gmii_tx_0/gmii_tx_en] [get_bd_pins gig_ethernet_pcs_pma_0/gmii_tx_en] [get_bd_pins ila_0/probe3]
  connect_bd_net -net gmii_tx_0_gmii_tx_er [get_bd_pins gmii_tx_0/gmii_tx_er] [get_bd_pins gig_ethernet_pcs_pma_0/gmii_tx_er] [get_bd_pins ila_0/probe4]
  connect_bd_net -net gmii_tx_0_gmii_txd [get_bd_pins gmii_tx_0/gmii_txd] [get_bd_pins gig_ethernet_pcs_pma_0/gmii_txd] [get_bd_pins ila_0/probe5]
  connect_bd_net -net gig_ethernet_pcs_pma_0_gmii_isolate [get_bd_pins gig_ethernet_pcs_pma_0/gmii_isolate] [get_bd_pins vio_0/probe_in4]
  connect_bd_net -net gig_ethernet_pcs_pma_0_gmii_rx_dv [get_bd_pins gig_ethernet_pcs_pma_0/gmii_rx_dv] [get_bd_pins ila_0/probe0]
  connect_bd_net -net gig_ethernet_pcs_pma_0_gmii_rx_er [get_bd_pins gig_ethernet_pcs_pma_0/gmii_rx_er] [get_bd_pins ila_0/probe1]
  connect_bd_net -net gig_ethernet_pcs_pma_0_gmii_rxd [get_bd_pins gig_ethernet_pcs_pma_0/gmii_rxd] [get_bd_pins ila_0/probe2]
  connect_bd_net -net gig_ethernet_pcs_pma_0_gtpowergood [get_bd_pins gig_ethernet_pcs_pma_0/gtpowergood] [get_bd_pins vio_0/probe_in0]
  connect_bd_net -net gig_ethernet_pcs_pma_0_mmcm_locked_out [get_bd_pins gig_ethernet_pcs_pma_0/mmcm_locked_out] [get_bd_pins vio_0/probe_in3]
  connect_bd_net -net gig_ethernet_pcs_pma_0_pma_reset_out [get_bd_pins gig_ethernet_pcs_pma_0/pma_reset_out] [get_bd_pins vio_0/probe_in2]
  connect_bd_net -net gig_ethernet_pcs_pma_0_resetdone [get_bd_pins gig_ethernet_pcs_pma_0/resetdone] [get_bd_pins vio_0/probe_in1]
  connect_bd_net -net gig_ethernet_pcs_pma_0_status_vector [get_bd_pins gig_ethernet_pcs_pma_0/status_vector] [get_bd_pins ila_0/probe6] [get_bd_pins vio_0/probe_in5]
  connect_bd_net -net gig_ethernet_pcs_pma_0_userclk2_out [get_bd_pins gmii_tx_0/clk] [get_bd_pins gig_ethernet_pcs_pma_0/userclk2_out] [get_bd_pins ila_0/clk]
  connect_bd_net -net rst_ps8_0_99M_peripheral_aresetn [get_bd_pins gmii_tx_0/rst_n] [get_bd_pins rst_ps8_0_99M/peripheral_aresetn]
  connect_bd_net -net rst_ps8_0_99M_peripheral_reset [get_bd_pins gig_ethernet_pcs_pma_0/reset] [get_bd_pins rst_ps8_0_99M/peripheral_reset]
  connect_bd_net -net sys_rst_1 [get_bd_ports sys_rst] [get_bd_pins clk_wiz_0/reset] [get_bd_pins rst_ps8_0_99M/ext_reset_in]
  connect_bd_net -net vio_0_probe_out0 [get_bd_ports sfp_tx_disable] [get_bd_pins vio_0/probe_out0]
  connect_bd_net -net vio_0_probe_out1 [get_bd_pins gig_ethernet_pcs_pma_0/configuration_vector] [get_bd_pins vio_0/probe_out1]
  connect_bd_net -net vio_0_probe_out2 [get_bd_pins gig_ethernet_pcs_pma_0/signal_detect] [get_bd_pins vio_0/probe_out2]
  connect_bd_net -net vio_0_probe_out3 [get_bd_pins gmii_tx_0/tx_en] [get_bd_pins vio_0/probe_out3]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_clk1 [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins gig_ethernet_pcs_pma_0/independent_clock_bufg] [get_bd_pins rst_ps8_0_99M/slowest_sync_clk] [get_bd_pins vio_0/clk]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


