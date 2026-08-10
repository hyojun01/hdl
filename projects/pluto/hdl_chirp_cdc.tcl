###############################################################################
# Project-level AXI4-Lite CDC constraints for HDL_Chirp_ip_0.
#
# This script runs immediately before opt_design.  At that point the OOC DUT
# netlist has been linked and all top-level/generated clocks exist.  It replaces
# the disabled HDL Coder-generated XDC and supports the /1-/2 DUT clock mux by
# conservatively using the shortest period of every clock reaching each probe.
###############################################################################

set hdl_chirp_cdc_name_pattern "*/HDL_Chirp_ip_0/inst/*"

set hdl_chirp_sync_cells [get_cells -hier -quiet -filter \
  "NAME =~ $hdl_chirp_cdc_name_pattern && \
   cdc_info == synchronizer_false_path"]
if {[llength $hdl_chirp_sync_cells] == 0} {
  error "HDL_Chirp AXI CDC synchronizer cells were not found"
}

set hdl_chirp_sync_d_pins [get_pins -quiet -of_objects \
  $hdl_chirp_sync_cells -filter {REF_PIN_NAME == D}]
if {[llength $hdl_chirp_sync_d_pins] == 0} {
  error "HDL_Chirp AXI CDC synchronizer D pins were not found"
}
set_false_path -to $hdl_chirp_sync_d_pins

set hdl_chirp_axi_to_ip_start [get_cells -hier -quiet -filter \
  "NAME =~ $hdl_chirp_cdc_name_pattern && \
   cdc_info == max_delay_startpoint_axi_to_ip"]
set hdl_chirp_axi_to_ip_end [get_cells -hier -quiet -filter \
  "NAME =~ $hdl_chirp_cdc_name_pattern && \
   cdc_info == max_delay_endpoint_axi_to_ip"]
set hdl_chirp_axi_to_ip_clock_probe [get_cells -hier -quiet -filter \
  "NAME =~ $hdl_chirp_cdc_name_pattern && \
   cdc_info == max_delay_clk_axi_to_ip"]

if {[llength $hdl_chirp_axi_to_ip_start] == 0 ||
    [llength $hdl_chirp_axi_to_ip_end] == 0 ||
    [llength $hdl_chirp_axi_to_ip_clock_probe] == 0} {
  error "HDL_Chirp AXI-to-IP CDC endpoints were not found"
}

set hdl_chirp_axi_to_ip_clocks \
  [get_clocks -quiet -of_objects $hdl_chirp_axi_to_ip_clock_probe]
if {[llength $hdl_chirp_axi_to_ip_clocks] == 0} {
  error "No clock reaches the HDL_Chirp AXI-to-IP CDC clock probe"
}
set hdl_chirp_axi_to_ip_period [lindex \
  [lsort -real [get_property PERIOD $hdl_chirp_axi_to_ip_clocks]] 0]
set_max_delay -from $hdl_chirp_axi_to_ip_start \
  -to $hdl_chirp_axi_to_ip_end \
  -datapath_only $hdl_chirp_axi_to_ip_period

set hdl_chirp_ip_to_axi_start [get_cells -hier -quiet -filter \
  "NAME =~ $hdl_chirp_cdc_name_pattern && \
   cdc_info == max_delay_startpoint_ip_to_axi"]
set hdl_chirp_ip_to_axi_end [get_cells -hier -quiet -filter \
  "NAME =~ $hdl_chirp_cdc_name_pattern && \
   cdc_info == max_delay_endpoint_ip_to_axi"]
set hdl_chirp_ip_to_axi_clock_probe [get_cells -hier -quiet -filter \
  "NAME =~ $hdl_chirp_cdc_name_pattern && \
   cdc_info == max_delay_clk_ip_to_axi"]

if {[llength $hdl_chirp_ip_to_axi_start] == 0 ||
    [llength $hdl_chirp_ip_to_axi_end] == 0 ||
    [llength $hdl_chirp_ip_to_axi_clock_probe] == 0} {
  error "HDL_Chirp IP-to-AXI CDC endpoints were not found"
}

set hdl_chirp_ip_to_axi_clocks \
  [get_clocks -quiet -of_objects $hdl_chirp_ip_to_axi_clock_probe]
if {[llength $hdl_chirp_ip_to_axi_clocks] == 0} {
  error "No clock reaches the HDL_Chirp IP-to-AXI CDC clock probe"
}
set hdl_chirp_ip_to_axi_period [lindex \
  [lsort -real [get_property PERIOD $hdl_chirp_ip_to_axi_clocks]] 0]
set_max_delay -from $hdl_chirp_ip_to_axi_start \
  -to $hdl_chirp_ip_to_axi_end \
  -datapath_only $hdl_chirp_ip_to_axi_period

puts "HDL_Chirp CDC constraints applied: AXI-to-IP ${hdl_chirp_axi_to_ip_period} ns, IP-to-AXI ${hdl_chirp_ip_to_axi_period} ns"
