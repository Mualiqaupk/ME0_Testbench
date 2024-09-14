

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "trigger_formatter" "NUM_INSTANCES" "DEVICE_ID"  "C_S00_AXI_BASEADDR" "C_S00_AXI_HIGHADDR"
}
