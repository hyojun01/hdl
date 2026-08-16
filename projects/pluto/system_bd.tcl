###############################################################################
## Copyright (C) 2014-2024 Analog Devices, Inc. All rights reserved.
### SPDX short identifier: ADIBSD
###############################################################################

# DUT IP core from Simulink HDL Coder is integrated into the custom reference design.
set ip_repo_paths [get_property ip_repo_paths [current_fileset]]
lappend ip_repo_paths [file normalize ../../../../hdl_prj/ipcore]
set_property ip_repo_paths $ip_repo_paths [current_fileset]
update_ip_catalog

# default ports

create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 ddr
create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 fixed_io

create_bd_port -dir O spi0_csn_2_o
create_bd_port -dir O spi0_csn_1_o
create_bd_port -dir O spi0_csn_0_o
create_bd_port -dir I spi0_csn_i
create_bd_port -dir I spi0_clk_i
create_bd_port -dir O spi0_clk_o
create_bd_port -dir I spi0_sdo_i
create_bd_port -dir O spi0_sdo_o
create_bd_port -dir I spi0_sdi_i

create_bd_port -dir I -from 17 -to 0 gpio_i
create_bd_port -dir O -from 17 -to 0 gpio_o
create_bd_port -dir O -from 17 -to 0 gpio_t

create_bd_port -dir O spi_csn_o
create_bd_port -dir I spi_csn_i
create_bd_port -dir I spi_clk_i
create_bd_port -dir O spi_clk_o
create_bd_port -dir I spi_sdo_i
create_bd_port -dir O spi_sdo_o
create_bd_port -dir I spi_sdi_i

# instance: sys_ps7

ad_ip_instance processing_system7 sys_ps7

# ps7 settings

ad_ip_parameter sys_ps7 CONFIG.PCW_PRESET_BANK0_VOLTAGE {LVCMOS 1.8V}
ad_ip_parameter sys_ps7 CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V}
ad_ip_parameter sys_ps7 CONFIG.PCW_PACKAGE_NAME clg225
# ad_ip_parameter sys_ps7 CONFIG.PCW_USE_S_AXI_HP1 1
# ad_ip_parameter sys_ps7 CONFIG.PCW_USE_S_AXI_HP2 1
# ad_ip_parameter sys_ps7 CONFIG.PCW_S_AXI_HP1_DATA_WIDTH 32
# ad_ip_parameter sys_ps7 CONFIG.PCW_S_AXI_HP2_DATA_WIDTH 32
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_CLK1_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_EN_RST1_PORT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ 100.0
ad_ip_parameter sys_ps7 CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ 200.0
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_EMIO_GPIO_IO 18
ad_ip_parameter sys_ps7 CONFIG.PCW_SPI1_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_I2C0_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_UART1_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UART1_UART1_IO {MIO 12 .. 13}
ad_ip_parameter sys_ps7 CONFIG.PCW_I2C1_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_QSPI_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_SD0_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_SPI0_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_SPI0_SPI0_IO EMIO
ad_ip_parameter sys_ps7 CONFIG.PCW_TTC0_PERIPHERAL_ENABLE 0
ad_ip_parameter sys_ps7 CONFIG.PCW_USE_FABRIC_INTERRUPT 1
ad_ip_parameter sys_ps7 CONFIG.PCW_USB0_PERIPHERAL_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_MIO_GPIO_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_GPIO_MIO_GPIO_IO MIO
ad_ip_parameter sys_ps7 CONFIG.PCW_USB0_RESET_IO {MIO 52}
ad_ip_parameter sys_ps7 CONFIG.PCW_USB0_RESET_ENABLE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_IRQ_F2P_INTR 1
ad_ip_parameter sys_ps7 CONFIG.PCW_IRQ_F2P_MODE REVERSE
ad_ip_parameter sys_ps7 CONFIG.PCW_MIO_0_PULLUP {enabled}
ad_ip_parameter sys_ps7 CONFIG.PCW_MIO_9_PULLUP {enabled}
ad_ip_parameter sys_ps7 CONFIG.PCW_MIO_10_PULLUP {enabled}
ad_ip_parameter sys_ps7 CONFIG.PCW_MIO_11_PULLUP {enabled}
ad_ip_parameter sys_ps7 CONFIG.PCW_MIO_48_PULLUP {enabled}
ad_ip_parameter sys_ps7 CONFIG.PCW_MIO_49_PULLUP {disabled}
ad_ip_parameter sys_ps7 CONFIG.PCW_MIO_53_PULLUP {enabled}

# DDR MT41K256M16 HA-125 (32M, 16bit, 8banks)

ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41K256M16 RE-125}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {16 Bit}
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF 0
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE 1
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 0.048
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 0.050
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 0.241
ad_ip_parameter sys_ps7 CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 0.240

ad_ip_instance xlconcat sys_concat_intc
ad_ip_parameter sys_concat_intc CONFIG.NUM_PORTS 16

ad_ip_instance proc_sys_reset sys_rstgen
ad_ip_parameter sys_rstgen CONFIG.C_EXT_RST_WIDTH 1

# system reset/clock definitions

# add external spi

ad_ip_instance axi_quad_spi axi_spi
ad_ip_parameter axi_spi CONFIG.C_USE_STARTUP 0
ad_ip_parameter axi_spi CONFIG.C_NUM_SS_BITS 1
ad_ip_parameter axi_spi CONFIG.C_SCK_RATIO 8

ad_connect  sys_cpu_clk sys_ps7/FCLK_CLK0
ad_connect  sys_200m_clk sys_ps7/FCLK_CLK1
ad_connect  sys_cpu_reset sys_rstgen/peripheral_reset
ad_connect  sys_cpu_resetn sys_rstgen/peripheral_aresetn
ad_connect  sys_cpu_clk sys_rstgen/slowest_sync_clk
ad_connect  sys_rstgen/ext_reset_in sys_ps7/FCLK_RESET0_N

# interface connections

ad_connect  ddr sys_ps7/DDR
ad_connect  gpio_i sys_ps7/GPIO_I
ad_connect  gpio_o sys_ps7/GPIO_O
ad_connect  gpio_t sys_ps7/GPIO_T
ad_connect  fixed_io sys_ps7/FIXED_IO

# ps7 spi connections

ad_connect  spi0_csn_2_o sys_ps7/SPI0_SS2_O
ad_connect  spi0_csn_1_o sys_ps7/SPI0_SS1_O
ad_connect  spi0_csn_0_o sys_ps7/SPI0_SS_O
ad_connect  spi0_csn_i sys_ps7/SPI0_SS_I
ad_connect  spi0_clk_i sys_ps7/SPI0_SCLK_I
ad_connect  spi0_clk_o sys_ps7/SPI0_SCLK_O
ad_connect  spi0_sdo_i sys_ps7/SPI0_MOSI_I
ad_connect  spi0_sdo_o sys_ps7/SPI0_MOSI_O
ad_connect  spi0_sdi_i sys_ps7/SPI0_MISO_I

# axi spi connections

ad_connect  sys_cpu_clk  axi_spi/ext_spi_clk
ad_connect  spi_csn_i  axi_spi/ss_i
ad_connect  spi_csn_o  axi_spi/ss_o
ad_connect  spi_clk_i  axi_spi/sck_i
ad_connect  spi_clk_o  axi_spi/sck_o
ad_connect  spi_sdo_i  axi_spi/io0_i
ad_connect  spi_sdo_o  axi_spi/io0_o
ad_connect  spi_sdi_i  axi_spi/io1_i

# interrupts

ad_connect  sys_concat_intc/dout sys_ps7/IRQ_F2P
ad_connect  sys_concat_intc/In15 GND
ad_connect  sys_concat_intc/In14 GND
ad_connect  sys_concat_intc/In13 GND
ad_connect  sys_concat_intc/In12 GND
ad_connect  sys_concat_intc/In11 GND
ad_connect  sys_concat_intc/In10 GND
ad_connect  sys_concat_intc/In9 GND
ad_connect  sys_concat_intc/In8 GND
ad_connect  sys_concat_intc/In7 GND
ad_connect  sys_concat_intc/In6 GND
ad_connect  sys_concat_intc/In5 GND
ad_connect  sys_concat_intc/In4 GND
ad_connect  sys_concat_intc/In3 GND
ad_connect  sys_concat_intc/In2 GND
ad_connect  sys_concat_intc/In1 GND
ad_connect  sys_concat_intc/In0 GND

# iic

create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 iic_main

ad_ip_instance axi_iic axi_iic_main

ad_connect  iic_main axi_iic_main/iic
ad_cpu_interconnect 0x41600000 axi_iic_main
ad_cpu_interrupt ps-15 mb-15 axi_iic_main/iic2intc_irpt

# ad9361

create_bd_port -dir I rx_clk_in
create_bd_port -dir I rx_frame_in
create_bd_port -dir I -from 11 -to 0 rx_data_in

create_bd_port -dir O tx_clk_out
create_bd_port -dir O tx_frame_out
create_bd_port -dir O -from 11 -to 0 tx_data_out

create_bd_port -dir O enable
create_bd_port -dir O txnrx
create_bd_port -dir I up_enable
create_bd_port -dir I up_txnrx

# ad9361 core(s)

ad_ip_instance axi_ad9361 axi_ad9361
ad_ip_parameter axi_ad9361 CONFIG.ID 0
ad_ip_parameter axi_ad9361 CONFIG.CMOS_OR_LVDS_N 1
# In this version, we use 1R1T mode, because we set AD9364.
ad_ip_parameter axi_ad9361 CONFIG.MODE_1R1T 1
ad_ip_parameter axi_ad9361 CONFIG.ADC_INIT_DELAY 21
# Custom reference design doesn't need tdd.
ad_ip_parameter axi_ad9361 CONFIG.TDD_DISABLE 1
ad_ip_parameter axi_ad9361 CONFIG.DAC_DATA_SEL_INIT 2

##################################################################################
# instance for custom reference design

ad_ip_instance util_clkdiv util_ad9361_divclk
ad_ip_parameter util_ad9361_divclk CONFIG.SEL_0_DIV 1

# reset synchronized to sample clock.
ad_ip_instance proc_sys_reset util_ad9361_divclk_reset

ad_ip_instance util_wfifo util_ad9361_adc_fifo
ad_ip_parameter util_ad9361_adc_fifo CONFIG.NUM_OF_CHANNELS 2
ad_ip_parameter util_ad9361_adc_fifo CONFIG.DIN_ADDRESS_WIDTH 4
ad_ip_parameter util_ad9361_adc_fifo CONFIG.DIN_DATA_WIDTH 16
ad_ip_parameter util_ad9361_adc_fifo CONFIG.DOUT_DATA_WIDTH 16

ad_ip_instance util_rfifo util_ad9361_dac_fifo
ad_ip_parameter util_ad9361_dac_fifo CONFIG.NUM_OF_CHANNELS 2
ad_ip_parameter util_ad9361_dac_fifo CONFIG.DIN_ADDRESS_WIDTH 4
ad_ip_parameter util_ad9361_dac_fifo CONFIG.DIN_DATA_WIDTH 16
ad_ip_parameter util_ad9361_dac_fifo CONFIG.DOUT_DATA_WIDTH 16

ad_ip_instance HDL_DUT_ip HDL_Target_Generator

##################################################################################

# connections

ad_connect  rx_clk_in axi_ad9361/rx_clk_in
ad_connect  rx_frame_in axi_ad9361/rx_frame_in
ad_connect  rx_data_in axi_ad9361/rx_data_in
ad_connect  tx_clk_out axi_ad9361/tx_clk_out
ad_connect  tx_frame_out axi_ad9361/tx_frame_out
ad_connect  tx_data_out axi_ad9361/tx_data_out
ad_connect  enable axi_ad9361/enable
ad_connect  txnrx axi_ad9361/txnrx
ad_connect  up_enable axi_ad9361/up_enable
ad_connect  up_txnrx axi_ad9361/up_txnrx

ad_connect  axi_ad9361/tdd_sync GND
ad_connect  sys_200m_clk axi_ad9361/delay_clk
ad_connect  axi_ad9361/l_clk axi_ad9361/clk

##################################################################################
# connections for custom reference design

ad_connect axi_ad9361/l_clk util_ad9361_divclk/clk
ad_connect GND util_ad9361_divclk/clk_sel

ad_connect sys_rstgen/peripheral_aresetn util_ad9361_divclk_reset/ext_reset_in
ad_connect util_ad9361_divclk/clk_out util_ad9361_divclk_reset/slowest_sync_clk

ad_connect axi_ad9361/l_clk util_ad9361_adc_fifo/din_clk
ad_connect axi_ad9361/rst util_ad9361_adc_fifo/din_rst
ad_connect util_ad9361_divclk/clk_out util_ad9361_adc_fifo/dout_clk
ad_connect util_ad9361_divclk_reset/peripheral_aresetn util_ad9361_adc_fifo/dout_rstn
ad_connect axi_ad9361/adc_data_i0 util_ad9361_adc_fifo/din_data_0
ad_connect axi_ad9361/adc_data_q0 util_ad9361_adc_fifo/din_data_1
ad_connect axi_ad9361/adc_valid_i0 util_ad9361_adc_fifo/din_valid_0
ad_connect axi_ad9361/adc_valid_q0 util_ad9361_adc_fifo/din_valid_1
ad_connect axi_ad9361/adc_enable_i0 util_ad9361_adc_fifo/din_enable_0
ad_connect axi_ad9361/adc_enable_q0 util_ad9361_adc_fifo/din_enable_1
ad_connect util_ad9361_adc_fifo/din_ovf axi_ad9361/adc_dovf
ad_connect util_ad9361_adc_fifo/dout_ovf GND

ad_connect util_ad9361_divclk/clk_out util_ad9361_dac_fifo/din_clk
ad_connect util_ad9361_divclk_reset/peripheral_aresetn util_ad9361_dac_fifo/din_rstn
ad_connect axi_ad9361/l_clk util_ad9361_dac_fifo/dout_clk
ad_connect axi_ad9361/rst util_ad9361_dac_fifo/dout_rst
ad_connect util_ad9361_dac_fifo/dout_data_0 axi_ad9361/dac_data_i0
ad_connect util_ad9361_dac_fifo/dout_data_1 axi_ad9361/dac_data_q0
ad_connect axi_ad9361/dac_valid_i0 util_ad9361_dac_fifo/dout_valid_0
ad_connect axi_ad9361/dac_valid_q0 util_ad9361_dac_fifo/dout_valid_1
ad_connect axi_ad9361/dac_enable_i0 util_ad9361_dac_fifo/dout_enable_0
ad_connect axi_ad9361/dac_enable_q0 util_ad9361_dac_fifo/dout_enable_1
ad_connect util_ad9361_dac_fifo/dout_unf axi_ad9361/dac_dunf
ad_connect util_ad9361_dac_fifo/din_unf GND

ad_connect util_ad9361_divclk/clk_out HDL_Target_Generator/IPCORE_CLK
ad_connect util_ad9361_divclk_reset/peripheral_aresetn HDL_Target_Generator/IPCORE_RESETN
ad_connect util_ad9361_adc_fifo/dout_data_0 HDL_Target_Generator/Rx_Data_I_In
ad_connect util_ad9361_adc_fifo/dout_data_1 HDL_Target_Generator/Rx_Data_Q_In
ad_connect util_ad9361_adc_fifo/dout_valid_0 HDL_Target_Generator/Rx_Valid_In
ad_connect HDL_Target_Generator/Tx_Data_I_Out util_ad9361_dac_fifo/din_data_0
ad_connect HDL_Target_Generator/Tx_Data_Q_Out util_ad9361_dac_fifo/din_data_1
ad_connect HDL_Target_Generator/Tx_Valid_Out util_ad9361_dac_fifo/din_valid_in_0
ad_connect HDL_Target_Generator/Tx_Valid_Out util_ad9361_dac_fifo/din_valid_in_1

##################################################################################

# interconnects

ad_cpu_interconnect 0x79020000 axi_ad9361
ad_cpu_interconnect 0x7C430000 axi_spi

##################################################################################
# cpu interconnect for custom reference design

# ad_cpu_interconnect 0x40400000 axi_dma_0 S_AXI_LITE
ad_cpu_interconnect 0x43c00000 HDL_Target_Generator AXI4_Lite

##################################################################################


##################################################################################
# DDR interconnect for custom reference design

# ad_mem_hp1_interconnect sys_cpu_clk sys_ps7/S_AXI_HP1
# ad_mem_hp1_interconnect sys_cpu_clk axi_dma_0/M_AXI_MM2S

# ad_mem_hp2_interconnect sys_cpu_clk sys_ps7/S_AXI_HP2
# ad_mem_hp2_interconnect sys_cpu_clk axi_dma_0/M_AXI_S2MM

##################################################################################

# interrupts

ad_cpu_interrupt ps-11 mb-11 axi_spi/ip2intc_irpt

##################################################################################
# interrupt for custom reference design

# ad_cpu_interrupt ps-13 mb-13 axi_dma_0/s2mm_introut
# ad_cpu_interrupt ps-12 mb-12 axi_dma_0/mm2s_introut

##################################################################################
