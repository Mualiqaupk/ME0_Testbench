# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "DECODE_DATA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FINISH_DECODING" -parent ${Page_0}
  ipgui::add_param $IPINST -name "HOLD_DONE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IDLE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LOOK_HEADER" -parent ${Page_0}
  ipgui::add_param $IPINST -name "POPULATE_DATA" -parent ${Page_0}


}

proc update_PARAM_VALUE.DECODE_DATA { PARAM_VALUE.DECODE_DATA } {
	# Procedure called to update DECODE_DATA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DECODE_DATA { PARAM_VALUE.DECODE_DATA } {
	# Procedure called to validate DECODE_DATA
	return true
}

proc update_PARAM_VALUE.FINISH_DECODING { PARAM_VALUE.FINISH_DECODING } {
	# Procedure called to update FINISH_DECODING when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FINISH_DECODING { PARAM_VALUE.FINISH_DECODING } {
	# Procedure called to validate FINISH_DECODING
	return true
}

proc update_PARAM_VALUE.HOLD_DONE { PARAM_VALUE.HOLD_DONE } {
	# Procedure called to update HOLD_DONE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.HOLD_DONE { PARAM_VALUE.HOLD_DONE } {
	# Procedure called to validate HOLD_DONE
	return true
}

proc update_PARAM_VALUE.IDLE { PARAM_VALUE.IDLE } {
	# Procedure called to update IDLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IDLE { PARAM_VALUE.IDLE } {
	# Procedure called to validate IDLE
	return true
}

proc update_PARAM_VALUE.LOOK_HEADER { PARAM_VALUE.LOOK_HEADER } {
	# Procedure called to update LOOK_HEADER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LOOK_HEADER { PARAM_VALUE.LOOK_HEADER } {
	# Procedure called to validate LOOK_HEADER
	return true
}

proc update_PARAM_VALUE.POPULATE_DATA { PARAM_VALUE.POPULATE_DATA } {
	# Procedure called to update POPULATE_DATA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.POPULATE_DATA { PARAM_VALUE.POPULATE_DATA } {
	# Procedure called to validate POPULATE_DATA
	return true
}


proc update_MODELPARAM_VALUE.IDLE { MODELPARAM_VALUE.IDLE PARAM_VALUE.IDLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IDLE}] ${MODELPARAM_VALUE.IDLE}
}

proc update_MODELPARAM_VALUE.LOOK_HEADER { MODELPARAM_VALUE.LOOK_HEADER PARAM_VALUE.LOOK_HEADER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LOOK_HEADER}] ${MODELPARAM_VALUE.LOOK_HEADER}
}

proc update_MODELPARAM_VALUE.POPULATE_DATA { MODELPARAM_VALUE.POPULATE_DATA PARAM_VALUE.POPULATE_DATA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.POPULATE_DATA}] ${MODELPARAM_VALUE.POPULATE_DATA}
}

proc update_MODELPARAM_VALUE.DECODE_DATA { MODELPARAM_VALUE.DECODE_DATA PARAM_VALUE.DECODE_DATA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DECODE_DATA}] ${MODELPARAM_VALUE.DECODE_DATA}
}

proc update_MODELPARAM_VALUE.FINISH_DECODING { MODELPARAM_VALUE.FINISH_DECODING PARAM_VALUE.FINISH_DECODING } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FINISH_DECODING}] ${MODELPARAM_VALUE.FINISH_DECODING}
}

proc update_MODELPARAM_VALUE.HOLD_DONE { MODELPARAM_VALUE.HOLD_DONE PARAM_VALUE.HOLD_DONE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.HOLD_DONE}] ${MODELPARAM_VALUE.HOLD_DONE}
}

