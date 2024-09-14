# additional constraints
create_clock -period 5.000 -name sys_clk_pin [get_ports sys_clk_p]

# Set clock-specific jitter on a primary or virtual clock
set_input_jitter [get_clocks sys_clk_p] 0.05

create_pblock pblock_i
add_cells_to_pblock [get_pblocks pblock_i] [get_cells -quiet [list HDLC_DPA_i]]
resize_pblock [get_pblocks pblock_i] -add {CLOCKREGION_X0Y0:CLOCKREGION_X1Y3}

# Create a pblock for the IDELAYCTRL instance if needed
#create_pblock pblock_idelayctrl
#add_cells_to_pblock [get_pblocks pblock_idelayctrl] [get_cells -hierarchical "dlyctrl"}]

# Assign the IODELAY_GROUP to the IDELAYCTRL instance
set_property IODELAY_GROUP HDLC_DPA_combined_group [get_cells HDLC_DPA_i/idelayctrl_inst/inst/dlyctrl]

# Assign the IODELAY_GROUP to all relevant IODELAY instances
set_property IODELAY_GROUP HDLC_DPA_combined_group [get_cells {HDLC_DPA_i/trigger_logic_block/TU_TXD_BUS/inst/pins[0].idelaye2_bus}]
set_property IODELAY_GROUP HDLC_DPA_combined_group [get_cells {HDLC_DPA_i/trigger_logic_block/TU_TXD_BUS/inst/pins[1].idelaye2_bus}]
set_property IODELAY_GROUP HDLC_DPA_combined_group [get_cells {HDLC_DPA_i/trigger_logic_block/TU_TXD_BUS/inst/pins[2].idelaye2_bus}]
set_property IODELAY_GROUP HDLC_DPA_combined_group [get_cells {HDLC_DPA_i/trigger_logic_block/TU_TXD_BUS/inst/pins[3].idelaye2_bus}]
set_property IODELAY_GROUP HDLC_DPA_combined_group [get_cells {HDLC_DPA_i/trigger_logic_block/TU_TXD_BUS/inst/pins[4].idelaye2_bus}]
set_property IODELAY_GROUP HDLC_DPA_combined_group [get_cells {HDLC_DPA_i/trigger_logic_block/TU_TXD_BUS/inst/pins[5].idelaye2_bus}]
set_property IODELAY_GROUP HDLC_DPA_combined_group [get_cells {HDLC_DPA_i/trigger_logic_block/TU_TXD_BUS/inst/pins[6].idelaye2_bus}]
set_property IODELAY_GROUP HDLC_DPA_combined_group [get_cells {HDLC_DPA_i/trigger_logic_block/TU_TXD_BUS/inst/pins[7].idelaye2_bus}]
set_property IODELAY_GROUP HDLC_DPA_combined_group [get_cells {HDLC_DPA_i/trigger_logic_block/selectio_wiz_0/inst/pins[0].idelaye2_bus}]
set_property IODELAY_GROUP HDLC_DPA_combined_group [get_cells {HDLC_DPA_i/RXD/IDELAY_block/slave/inst/pins[0].idelaye2_bus}]
set_property IODELAY_GROUP HDLC_DPA_combined_group [get_cells {HDLC_DPA_i/RXD/IDELAY_block/selectio_wiz_0/inst/pins[0].idelaye2_bus}]



#set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
#set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
#set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
#connect_debug_port dbg_hub/clk [get_nets clk]




# PINs assignments and IO level constraints

set_property PACKAGE_PIN AD11 [get_ports sys_clk_n]
set_property PACKAGE_PIN AD12 [get_ports sys_clk_p]
set_property PACKAGE_PIN AB7 [get_ports reset]
set_property IOSTANDARD LVCMOS15 [get_ports reset]

set_property IBUF_LOW_PWR FALSE [get_ports sys_clk_p]
set_property IOSTANDARD LVDS [get_ports sys_clk_p]
set_property IOSTANDARD LVDS [get_ports sys_clk_n]

# VFAT3 trandmit pins are connected with receiver pins of kit
set_property PACKAGE_PIN AB30 [get_ports RXD_N]
set_property PACKAGE_PIN AB29 [get_ports RXD_P]
set_property IOSTANDARD LVDS_25 [get_ports RXD_P]
set_property IOSTANDARD LVDS_25 [get_ports RXD_N]

# VFAT3 RXD pins are connected with TXD pins of kit
set_property PACKAGE_PIN AC30 [get_ports {vfat3_txd_n[0]}]
set_property PACKAGE_PIN AC29 [get_ports {vfat3_txd_p[0]}]
set_property IOSTANDARD LVDS_25 [get_ports {vfat3_txd_p[0]}]
set_property IOSTANDARD LVDS_25 [get_ports {vfat3_txd_n[0]}]

# VFAT3 RXCLK (input) pins are connected with TXCLK pins of kit
set_property PACKAGE_PIN AA30 [get_ports rxclk_n]
set_property PACKAGE_PIN Y30 [get_ports rxclk_p]
set_property IOSTANDARD LVDS_25 [get_ports rxclk_p]
set_property IOSTANDARD LVDS_25 [get_ports rxclk_n]


#FOR VBV3 HYBRID I2C pins
set_property PACKAGE_PIN AG23 [get_ports iic_main_scl_io]
set_property PACKAGE_PIN AF22 [get_ports iic_main_sda_io]

set_property PACKAGE_PIN AF25 [get_ports BIST_OK]
set_property PACKAGE_PIN AC22 [get_ports BIST_START]
set_property IOSTANDARD LVCMOS25 [get_ports BIST_OK]
set_property IOSTANDARD LVCMOS25 [get_ports BIST_START]
set_property PACKAGE_PIN AC25 [get_ports BIST_END]
set_property IOSTANDARD LVCMOS25 [get_ports BIST_END]

#KIT outputs disconnected on VBV3 address is hard wired
set_property PACKAGE_PIN AF20 [get_ports PS_ADC_ADDR]
set_property PACKAGE_PIN AF21 [get_ports CALIB_ADC_ADDR]
set_property IOSTANDARD LVCMOS25 [get_ports PS_ADC_ADDR]
set_property IOSTANDARD LVCMOS25 [get_ports CALIB_ADC_ADDR]


set_property PACKAGE_PIN AD24 [get_ports EXT_RST]
set_property IOSTANDARD LVCMOS25 [get_ports EXT_RST]


set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]


set_property PACKAGE_PIN AD29 [get_ports {TU_TXD_P_FROM_VFAT3[7]}]
set_property PACKAGE_PIN AE30 [get_ports {TU_TXD_P_FROM_VFAT3[6]}]
set_property PACKAGE_PIN AE28 [get_ports {TU_TXD_P_FROM_VFAT3[5]}]
set_property PACKAGE_PIN AG30 [get_ports {TU_TXD_P_FROM_VFAT3[4]}]
set_property PACKAGE_PIN AC26 [get_ports {TU_TXD_P_FROM_VFAT3[3]}]
set_property PACKAGE_PIN AG27 [get_ports {TU_TXD_P_FROM_VFAT3[2]}]
set_property PACKAGE_PIN AJ27 [get_ports {TU_TXD_P_FROM_VFAT3[1]}]
set_property PACKAGE_PIN AJ26 [get_ports {TU_TXD_P_FROM_VFAT3[0]}]

set_property PACKAGE_PIN AF26 [get_ports {TU_SOT_P_FROM_VFAT3[0]}]
# adding TU_SOT_P_FROM_VFAT3[0] signal to TU_TXD bus will help us to used same IDELAY controller for this signal
#set_property PACKAGE_PIN AF26 [get_ports {TU_TXD_P_FROM_VFAT3[8]}]



set_property BITSTREAM.CONFIG.CONFIGRATE 6 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
