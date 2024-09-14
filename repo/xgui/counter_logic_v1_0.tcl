# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "CALPULSE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LV1A" -parent ${Page_0}


}

proc update_PARAM_VALUE.CALPULSE { PARAM_VALUE.CALPULSE } {
	# Procedure called to update CALPULSE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CALPULSE { PARAM_VALUE.CALPULSE } {
	# Procedure called to validate CALPULSE
	return true
}

proc update_PARAM_VALUE.LV1A { PARAM_VALUE.LV1A } {
	# Procedure called to update LV1A when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LV1A { PARAM_VALUE.LV1A } {
	# Procedure called to validate LV1A
	return true
}


proc update_MODELPARAM_VALUE.LV1A { MODELPARAM_VALUE.LV1A PARAM_VALUE.LV1A } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LV1A}] ${MODELPARAM_VALUE.LV1A}
}

proc update_MODELPARAM_VALUE.CALPULSE { MODELPARAM_VALUE.CALPULSE PARAM_VALUE.CALPULSE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CALPULSE}] ${MODELPARAM_VALUE.CALPULSE}
}

