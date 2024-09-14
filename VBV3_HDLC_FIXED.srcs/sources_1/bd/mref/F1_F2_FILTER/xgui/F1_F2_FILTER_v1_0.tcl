# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "F1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "F10" -parent ${Page_0}
  ipgui::add_param $IPINST -name "F11" -parent ${Page_0}
  ipgui::add_param $IPINST -name "F12" -parent ${Page_0}
  ipgui::add_param $IPINST -name "F13" -parent ${Page_0}
  ipgui::add_param $IPINST -name "F14" -parent ${Page_0}
  ipgui::add_param $IPINST -name "F15" -parent ${Page_0}
  ipgui::add_param $IPINST -name "F16" -parent ${Page_0}
  ipgui::add_param $IPINST -name "F2" -parent ${Page_0}
  ipgui::add_param $IPINST -name "F3" -parent ${Page_0}
  ipgui::add_param $IPINST -name "F4" -parent ${Page_0}
  ipgui::add_param $IPINST -name "F5" -parent ${Page_0}
  ipgui::add_param $IPINST -name "F6" -parent ${Page_0}
  ipgui::add_param $IPINST -name "F7" -parent ${Page_0}
  ipgui::add_param $IPINST -name "F8" -parent ${Page_0}
  ipgui::add_param $IPINST -name "F9" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FILTER_DATA" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H0A" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H0B" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H1A" -parent ${Page_0}
  ipgui::add_param $IPINST -name "H1B" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IDLE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUM_BYTES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SEND_PACKET" -parent ${Page_0}


}

proc update_PARAM_VALUE.F1 { PARAM_VALUE.F1 } {
	# Procedure called to update F1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.F1 { PARAM_VALUE.F1 } {
	# Procedure called to validate F1
	return true
}

proc update_PARAM_VALUE.F10 { PARAM_VALUE.F10 } {
	# Procedure called to update F10 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.F10 { PARAM_VALUE.F10 } {
	# Procedure called to validate F10
	return true
}

proc update_PARAM_VALUE.F11 { PARAM_VALUE.F11 } {
	# Procedure called to update F11 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.F11 { PARAM_VALUE.F11 } {
	# Procedure called to validate F11
	return true
}

proc update_PARAM_VALUE.F12 { PARAM_VALUE.F12 } {
	# Procedure called to update F12 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.F12 { PARAM_VALUE.F12 } {
	# Procedure called to validate F12
	return true
}

proc update_PARAM_VALUE.F13 { PARAM_VALUE.F13 } {
	# Procedure called to update F13 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.F13 { PARAM_VALUE.F13 } {
	# Procedure called to validate F13
	return true
}

proc update_PARAM_VALUE.F14 { PARAM_VALUE.F14 } {
	# Procedure called to update F14 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.F14 { PARAM_VALUE.F14 } {
	# Procedure called to validate F14
	return true
}

proc update_PARAM_VALUE.F15 { PARAM_VALUE.F15 } {
	# Procedure called to update F15 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.F15 { PARAM_VALUE.F15 } {
	# Procedure called to validate F15
	return true
}

proc update_PARAM_VALUE.F16 { PARAM_VALUE.F16 } {
	# Procedure called to update F16 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.F16 { PARAM_VALUE.F16 } {
	# Procedure called to validate F16
	return true
}

proc update_PARAM_VALUE.F2 { PARAM_VALUE.F2 } {
	# Procedure called to update F2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.F2 { PARAM_VALUE.F2 } {
	# Procedure called to validate F2
	return true
}

proc update_PARAM_VALUE.F3 { PARAM_VALUE.F3 } {
	# Procedure called to update F3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.F3 { PARAM_VALUE.F3 } {
	# Procedure called to validate F3
	return true
}

proc update_PARAM_VALUE.F4 { PARAM_VALUE.F4 } {
	# Procedure called to update F4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.F4 { PARAM_VALUE.F4 } {
	# Procedure called to validate F4
	return true
}

proc update_PARAM_VALUE.F5 { PARAM_VALUE.F5 } {
	# Procedure called to update F5 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.F5 { PARAM_VALUE.F5 } {
	# Procedure called to validate F5
	return true
}

proc update_PARAM_VALUE.F6 { PARAM_VALUE.F6 } {
	# Procedure called to update F6 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.F6 { PARAM_VALUE.F6 } {
	# Procedure called to validate F6
	return true
}

proc update_PARAM_VALUE.F7 { PARAM_VALUE.F7 } {
	# Procedure called to update F7 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.F7 { PARAM_VALUE.F7 } {
	# Procedure called to validate F7
	return true
}

proc update_PARAM_VALUE.F8 { PARAM_VALUE.F8 } {
	# Procedure called to update F8 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.F8 { PARAM_VALUE.F8 } {
	# Procedure called to validate F8
	return true
}

proc update_PARAM_VALUE.F9 { PARAM_VALUE.F9 } {
	# Procedure called to update F9 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.F9 { PARAM_VALUE.F9 } {
	# Procedure called to validate F9
	return true
}

proc update_PARAM_VALUE.FILTER_DATA { PARAM_VALUE.FILTER_DATA } {
	# Procedure called to update FILTER_DATA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FILTER_DATA { PARAM_VALUE.FILTER_DATA } {
	# Procedure called to validate FILTER_DATA
	return true
}

proc update_PARAM_VALUE.H0A { PARAM_VALUE.H0A } {
	# Procedure called to update H0A when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H0A { PARAM_VALUE.H0A } {
	# Procedure called to validate H0A
	return true
}

proc update_PARAM_VALUE.H0B { PARAM_VALUE.H0B } {
	# Procedure called to update H0B when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H0B { PARAM_VALUE.H0B } {
	# Procedure called to validate H0B
	return true
}

proc update_PARAM_VALUE.H1A { PARAM_VALUE.H1A } {
	# Procedure called to update H1A when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H1A { PARAM_VALUE.H1A } {
	# Procedure called to validate H1A
	return true
}

proc update_PARAM_VALUE.H1B { PARAM_VALUE.H1B } {
	# Procedure called to update H1B when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.H1B { PARAM_VALUE.H1B } {
	# Procedure called to validate H1B
	return true
}

proc update_PARAM_VALUE.IDLE { PARAM_VALUE.IDLE } {
	# Procedure called to update IDLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IDLE { PARAM_VALUE.IDLE } {
	# Procedure called to validate IDLE
	return true
}

proc update_PARAM_VALUE.NUM_BYTES { PARAM_VALUE.NUM_BYTES } {
	# Procedure called to update NUM_BYTES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_BYTES { PARAM_VALUE.NUM_BYTES } {
	# Procedure called to validate NUM_BYTES
	return true
}

proc update_PARAM_VALUE.SEND_PACKET { PARAM_VALUE.SEND_PACKET } {
	# Procedure called to update SEND_PACKET when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SEND_PACKET { PARAM_VALUE.SEND_PACKET } {
	# Procedure called to validate SEND_PACKET
	return true
}


proc update_MODELPARAM_VALUE.IDLE { MODELPARAM_VALUE.IDLE PARAM_VALUE.IDLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IDLE}] ${MODELPARAM_VALUE.IDLE}
}

proc update_MODELPARAM_VALUE.FILTER_DATA { MODELPARAM_VALUE.FILTER_DATA PARAM_VALUE.FILTER_DATA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILTER_DATA}] ${MODELPARAM_VALUE.FILTER_DATA}
}

proc update_MODELPARAM_VALUE.SEND_PACKET { MODELPARAM_VALUE.SEND_PACKET PARAM_VALUE.SEND_PACKET } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SEND_PACKET}] ${MODELPARAM_VALUE.SEND_PACKET}
}

proc update_MODELPARAM_VALUE.F1 { MODELPARAM_VALUE.F1 PARAM_VALUE.F1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.F1}] ${MODELPARAM_VALUE.F1}
}

proc update_MODELPARAM_VALUE.F2 { MODELPARAM_VALUE.F2 PARAM_VALUE.F2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.F2}] ${MODELPARAM_VALUE.F2}
}

proc update_MODELPARAM_VALUE.F3 { MODELPARAM_VALUE.F3 PARAM_VALUE.F3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.F3}] ${MODELPARAM_VALUE.F3}
}

proc update_MODELPARAM_VALUE.F4 { MODELPARAM_VALUE.F4 PARAM_VALUE.F4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.F4}] ${MODELPARAM_VALUE.F4}
}

proc update_MODELPARAM_VALUE.F5 { MODELPARAM_VALUE.F5 PARAM_VALUE.F5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.F5}] ${MODELPARAM_VALUE.F5}
}

proc update_MODELPARAM_VALUE.F6 { MODELPARAM_VALUE.F6 PARAM_VALUE.F6 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.F6}] ${MODELPARAM_VALUE.F6}
}

proc update_MODELPARAM_VALUE.F7 { MODELPARAM_VALUE.F7 PARAM_VALUE.F7 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.F7}] ${MODELPARAM_VALUE.F7}
}

proc update_MODELPARAM_VALUE.F8 { MODELPARAM_VALUE.F8 PARAM_VALUE.F8 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.F8}] ${MODELPARAM_VALUE.F8}
}

proc update_MODELPARAM_VALUE.F9 { MODELPARAM_VALUE.F9 PARAM_VALUE.F9 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.F9}] ${MODELPARAM_VALUE.F9}
}

proc update_MODELPARAM_VALUE.F10 { MODELPARAM_VALUE.F10 PARAM_VALUE.F10 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.F10}] ${MODELPARAM_VALUE.F10}
}

proc update_MODELPARAM_VALUE.F11 { MODELPARAM_VALUE.F11 PARAM_VALUE.F11 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.F11}] ${MODELPARAM_VALUE.F11}
}

proc update_MODELPARAM_VALUE.F12 { MODELPARAM_VALUE.F12 PARAM_VALUE.F12 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.F12}] ${MODELPARAM_VALUE.F12}
}

proc update_MODELPARAM_VALUE.F13 { MODELPARAM_VALUE.F13 PARAM_VALUE.F13 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.F13}] ${MODELPARAM_VALUE.F13}
}

proc update_MODELPARAM_VALUE.F14 { MODELPARAM_VALUE.F14 PARAM_VALUE.F14 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.F14}] ${MODELPARAM_VALUE.F14}
}

proc update_MODELPARAM_VALUE.F15 { MODELPARAM_VALUE.F15 PARAM_VALUE.F15 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.F15}] ${MODELPARAM_VALUE.F15}
}

proc update_MODELPARAM_VALUE.F16 { MODELPARAM_VALUE.F16 PARAM_VALUE.F16 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.F16}] ${MODELPARAM_VALUE.F16}
}

proc update_MODELPARAM_VALUE.H0A { MODELPARAM_VALUE.H0A PARAM_VALUE.H0A } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H0A}] ${MODELPARAM_VALUE.H0A}
}

proc update_MODELPARAM_VALUE.H0B { MODELPARAM_VALUE.H0B PARAM_VALUE.H0B } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H0B}] ${MODELPARAM_VALUE.H0B}
}

proc update_MODELPARAM_VALUE.H1A { MODELPARAM_VALUE.H1A PARAM_VALUE.H1A } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H1A}] ${MODELPARAM_VALUE.H1A}
}

proc update_MODELPARAM_VALUE.H1B { MODELPARAM_VALUE.H1B PARAM_VALUE.H1B } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.H1B}] ${MODELPARAM_VALUE.H1B}
}

proc update_MODELPARAM_VALUE.NUM_BYTES { MODELPARAM_VALUE.NUM_BYTES PARAM_VALUE.NUM_BYTES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_BYTES}] ${MODELPARAM_VALUE.NUM_BYTES}
}

