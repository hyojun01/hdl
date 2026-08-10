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

# HDL Coder packages its CDC constraints inside the IP.  They are read before
# the top-level clocks exist and assume that each CDC clock probe has exactly
# one clock.  Replace them with a project-level implementation hook, which is
# evaluated after the OOC IP netlist and all design clocks have been loaded.
set hdl_chirp_generated_cdc_xdc \
  [get_files -quiet *HDL_Chirp_ip_src_HDL_DUT_interface_constraints.xdc]
if {[llength $hdl_chirp_generated_cdc_xdc] == 0} {
  error "HDL_Chirp generated CDC constraint file was not found"
}
set_property is_enabled false $hdl_chirp_generated_cdc_xdc

set hdl_chirp_cdc_hook [file normalize "hdl_chirp_cdc.tcl"]
if {![file exists $hdl_chirp_cdc_hook]} {
  error "Project-level HDL_Chirp CDC hook was not found"
}
set_property STEPS.OPT_DESIGN.TCL.PRE $hdl_chirp_cdc_hook [get_runs impl_1]

adi_project_run pluto
source $ad_hdl_dir/library/axi_ad9361/axi_ad9361_delay.tcl
