###############################################################################
## Copyright (C) 2014-2023 Analog Devices, Inc. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

source ../../scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project_xilinx.tcl
source $ad_hdl_dir/projects/scripts/adi_board.tcl

adi_project_create pluto 0 {} "xc7z010clg225-1"

adi_project_files pluto [list \
  "system_top.v" \
  "system_constr.xdc" \
  "$ad_hdl_dir/library/common/ad_iobuf.v"]

set_property is_enabled false [get_files  *system_sys_ps7_0.xdc]
set dut_cdc_xdc \
  [get_files -all *HDL_DUT_ip_src_HDL_DUT_interface_constraints.xdc]

if {[llength $dut_cdc_xdc] != 1} {
  error "Expected one HDL DUT CDC XDC, found [llength $dut_cdc_xdc]"
}

set_property PROCESSING_ORDER LATE $dut_cdc_xdc
adi_project_run pluto
source $ad_hdl_dir/library/axi_ad9361/axi_ad9361_delay.tcl

