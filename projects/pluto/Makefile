####################################################################################
## Copyright (c) 2018 - 2023 Analog Devices, Inc.
### SPDX short identifier: BSD-1-Clause
## Auto-generated, do not modify!
####################################################################################

PROJECT_NAME := pluto


M_DEPS += ../../library/util_cdc/sync_bits.v
M_DEPS += ../../library/common/util_pulse_gen.v
M_DEPS += ../../library/common/ad_iobuf.v
M_DEPS += ../../library/common/ad_bus_mux.v
M_DEPS += ../../library/axi_ad9361/axi_ad9361_delay.tcl
# hyojun: add our hls make to package our IP.
M_DEPS += hls_cores

LIB_DEPS += axi_ad9361
LIB_DEPS += axi_dmac

include ../scripts/project-xilinx.mk

# hyojun: add our hls make to package our IP.
hls_cores:
	$(MAKE) -C ../../hls

.PHONY: hls_cores