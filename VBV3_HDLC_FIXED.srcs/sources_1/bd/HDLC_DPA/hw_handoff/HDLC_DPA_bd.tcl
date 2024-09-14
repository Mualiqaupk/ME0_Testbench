
################################################################
# This is a generated script based on design: HDLC_DPA
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2017.4
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source HDLC_DPA_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# S_to_diff, F1_F2_FILTER, bitslip_Generator, diff_to_diff, inverse_reverse, AP_Generator, S_to_diff, inverse_reverse

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7k325tffg900-2
   set_property BOARD_PART xilinx.com:kc705:part0:1.0 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name HDLC_DPA

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}


##################################################################
# MIG PRJ FILE TCL PROCs
##################################################################

proc write_mig_file_HDLC_DPA_mig_7series_0_0 { str_mig_prj_filepath } {

   file mkdir [ file dirname "$str_mig_prj_filepath" ]
   set mig_prj_file [open $str_mig_prj_filepath  w+]

   puts $mig_prj_file {<?xml version='1.0' encoding='UTF-8'?>}
   puts $mig_prj_file {<!-- IMPORTANT: This is an internal file that has been generated by the MIG software. Any direct editing or changes made to this file may result in unpredictable behavior or data corruption. It is strongly advised that users do not edit the contents of this file. Re-run the MIG GUI with the required settings if any of the options provided below need to be altered. -->}
   puts $mig_prj_file {<Project NoOfControllers="1" >}
   puts $mig_prj_file {    <ModuleName>HDLC_DPA_mig_7series_0_0</ModuleName>}
   puts $mig_prj_file {    <dci_inouts_inputs>1</dci_inouts_inputs>}
   puts $mig_prj_file {    <dci_inputs>1</dci_inputs>}
   puts $mig_prj_file {    <Debug_En>OFF</Debug_En>}
   puts $mig_prj_file {    <DataDepth_En>1024</DataDepth_En>}
   puts $mig_prj_file {    <LowPower_En>ON</LowPower_En>}
   puts $mig_prj_file {    <XADC_En>Enabled</XADC_En>}
   puts $mig_prj_file {    <TargetFPGA>xc7k325t-ffg900/-2</TargetFPGA>}
   puts $mig_prj_file {    <Version>4.0</Version>}
   puts $mig_prj_file {    <SystemClock>Differential</SystemClock>}
   puts $mig_prj_file {    <ReferenceClock>Use System Clock</ReferenceClock>}
   puts $mig_prj_file {    <SysResetPolarity>ACTIVE HIGH</SysResetPolarity>}
   puts $mig_prj_file {    <BankSelectionFlag>FALSE</BankSelectionFlag>}
   puts $mig_prj_file {    <InternalVref>0</InternalVref>}
   puts $mig_prj_file {    <dci_hr_inouts_inputs>50 Ohms</dci_hr_inouts_inputs>}
   puts $mig_prj_file {    <dci_cascade>1</dci_cascade>}
   puts $mig_prj_file {    <Controller number="0" >}
   puts $mig_prj_file {        <MemoryDevice>DDR3_SDRAM/SODIMMs/MT8JTF12864HZ-1G6</MemoryDevice>}
   puts $mig_prj_file {        <TimePeriod>1665</TimePeriod>}
   puts $mig_prj_file {        <VccAuxIO>1.8V</VccAuxIO>}
   puts $mig_prj_file {        <PHYRatio>4:1</PHYRatio>}
   puts $mig_prj_file {        <InputClkFreq>200.2</InputClkFreq>}
   puts $mig_prj_file {        <UIExtraClocks>1</UIExtraClocks>}
   puts $mig_prj_file {        <MMCM_VCO>600</MMCM_VCO>}
   puts $mig_prj_file {        <MMCMClkOut0> 3.000</MMCMClkOut0>}
   puts $mig_prj_file {        <MMCMClkOut1>5</MMCMClkOut1>}
   puts $mig_prj_file {        <MMCMClkOut2>15</MMCMClkOut2>}
   puts $mig_prj_file {        <MMCMClkOut3>1</MMCMClkOut3>}
   puts $mig_prj_file {        <MMCMClkOut4>1</MMCMClkOut4>}
   puts $mig_prj_file {        <DataWidth>64</DataWidth>}
   puts $mig_prj_file {        <DeepMemory>1</DeepMemory>}
   puts $mig_prj_file {        <DataMask>1</DataMask>}
   puts $mig_prj_file {        <ECC>Disabled</ECC>}
   puts $mig_prj_file {        <Ordering>Normal</Ordering>}
   puts $mig_prj_file {        <BankMachineCnt>4</BankMachineCnt>}
   puts $mig_prj_file {        <CustomPart>FALSE</CustomPart>}
   puts $mig_prj_file {        <NewPartName></NewPartName>}
   puts $mig_prj_file {        <RowAddress>14</RowAddress>}
   puts $mig_prj_file {        <ColAddress>10</ColAddress>}
   puts $mig_prj_file {        <BankAddress>3</BankAddress>}
   puts $mig_prj_file {        <MemoryVoltage>1.5V</MemoryVoltage>}
   puts $mig_prj_file {        <C0_MEM_SIZE>1073741824</C0_MEM_SIZE>}
   puts $mig_prj_file {        <UserMemoryAddressMap>ROW_BANK_COLUMN</UserMemoryAddressMap>}
   puts $mig_prj_file {        <PinSelection>}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AH12" SLEW="" name="ddr3_addr[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AF13" SLEW="" name="ddr3_addr[10]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AE13" SLEW="" name="ddr3_addr[11]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AJ11" SLEW="" name="ddr3_addr[12]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AH11" SLEW="" name="ddr3_addr[13]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AG13" SLEW="" name="ddr3_addr[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AG12" SLEW="" name="ddr3_addr[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AF12" SLEW="" name="ddr3_addr[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AJ12" SLEW="" name="ddr3_addr[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AJ13" SLEW="" name="ddr3_addr[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AJ14" SLEW="" name="ddr3_addr[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AH14" SLEW="" name="ddr3_addr[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AK13" SLEW="" name="ddr3_addr[8]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AK14" SLEW="" name="ddr3_addr[9]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AH9" SLEW="" name="ddr3_ba[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AG9" SLEW="" name="ddr3_ba[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AK9" SLEW="" name="ddr3_ba[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AC11" SLEW="" name="ddr3_cas_n" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15" PADName="AH10" SLEW="" name="ddr3_ck_n[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15" PADName="AG10" SLEW="" name="ddr3_ck_p[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AF10" SLEW="" name="ddr3_cke[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AC12" SLEW="" name="ddr3_cs_n[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="Y16" SLEW="" name="ddr3_dm[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AB17" SLEW="" name="ddr3_dm[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AF17" SLEW="" name="ddr3_dm[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AE16" SLEW="" name="ddr3_dm[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AK5" SLEW="" name="ddr3_dm[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AJ3" SLEW="" name="ddr3_dm[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AF6" SLEW="" name="ddr3_dm[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AC7" SLEW="" name="ddr3_dm[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AA15" SLEW="" name="ddr3_dq[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AC19" SLEW="" name="ddr3_dq[10]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AD17" SLEW="" name="ddr3_dq[11]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AA18" SLEW="" name="ddr3_dq[12]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AB18" SLEW="" name="ddr3_dq[13]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AE18" SLEW="" name="ddr3_dq[14]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AD18" SLEW="" name="ddr3_dq[15]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AG19" SLEW="" name="ddr3_dq[16]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AK19" SLEW="" name="ddr3_dq[17]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AG18" SLEW="" name="ddr3_dq[18]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AF18" SLEW="" name="ddr3_dq[19]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AA16" SLEW="" name="ddr3_dq[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AH19" SLEW="" name="ddr3_dq[20]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AJ19" SLEW="" name="ddr3_dq[21]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AE19" SLEW="" name="ddr3_dq[22]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AD19" SLEW="" name="ddr3_dq[23]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AK16" SLEW="" name="ddr3_dq[24]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AJ17" SLEW="" name="ddr3_dq[25]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AG15" SLEW="" name="ddr3_dq[26]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AF15" SLEW="" name="ddr3_dq[27]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AH17" SLEW="" name="ddr3_dq[28]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AG14" SLEW="" name="ddr3_dq[29]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AC14" SLEW="" name="ddr3_dq[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AH15" SLEW="" name="ddr3_dq[30]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AK15" SLEW="" name="ddr3_dq[31]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AK8" SLEW="" name="ddr3_dq[32]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AK6" SLEW="" name="ddr3_dq[33]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AG7" SLEW="" name="ddr3_dq[34]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AF7" SLEW="" name="ddr3_dq[35]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AF8" SLEW="" name="ddr3_dq[36]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AK4" SLEW="" name="ddr3_dq[37]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AJ8" SLEW="" name="ddr3_dq[38]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AJ6" SLEW="" name="ddr3_dq[39]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AD14" SLEW="" name="ddr3_dq[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AH5" SLEW="" name="ddr3_dq[40]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AH6" SLEW="" name="ddr3_dq[41]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AJ2" SLEW="" name="ddr3_dq[42]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AH2" SLEW="" name="ddr3_dq[43]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AH4" SLEW="" name="ddr3_dq[44]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AJ4" SLEW="" name="ddr3_dq[45]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AK1" SLEW="" name="ddr3_dq[46]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AJ1" SLEW="" name="ddr3_dq[47]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AF1" SLEW="" name="ddr3_dq[48]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AF2" SLEW="" name="ddr3_dq[49]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AA17" SLEW="" name="ddr3_dq[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AE4" SLEW="" name="ddr3_dq[50]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AE3" SLEW="" name="ddr3_dq[51]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AF3" SLEW="" name="ddr3_dq[52]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AF5" SLEW="" name="ddr3_dq[53]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AE1" SLEW="" name="ddr3_dq[54]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AE5" SLEW="" name="ddr3_dq[55]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AC1" SLEW="" name="ddr3_dq[56]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AD3" SLEW="" name="ddr3_dq[57]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AC4" SLEW="" name="ddr3_dq[58]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AC5" SLEW="" name="ddr3_dq[59]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AB15" SLEW="" name="ddr3_dq[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AE6" SLEW="" name="ddr3_dq[60]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AD6" SLEW="" name="ddr3_dq[61]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AC2" SLEW="" name="ddr3_dq[62]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AD4" SLEW="" name="ddr3_dq[63]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AE15" SLEW="" name="ddr3_dq[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="Y15" SLEW="" name="ddr3_dq[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AB19" SLEW="" name="ddr3_dq[8]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AD16" SLEW="" name="ddr3_dq[9]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AC15" SLEW="" name="ddr3_dqs_n[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="Y18" SLEW="" name="ddr3_dqs_n[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AK18" SLEW="" name="ddr3_dqs_n[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AJ16" SLEW="" name="ddr3_dqs_n[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AJ7" SLEW="" name="ddr3_dqs_n[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AH1" SLEW="" name="ddr3_dqs_n[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AG3" SLEW="" name="ddr3_dqs_n[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AD1" SLEW="" name="ddr3_dqs_n[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AC16" SLEW="" name="ddr3_dqs_p[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="Y19" SLEW="" name="ddr3_dqs_p[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AJ18" SLEW="" name="ddr3_dqs_p[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AH16" SLEW="" name="ddr3_dqs_p[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AH7" SLEW="" name="ddr3_dqs_p[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AG2" SLEW="" name="ddr3_dqs_p[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AG4" SLEW="" name="ddr3_dqs_p[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AD2" SLEW="" name="ddr3_dqs_p[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AD8" SLEW="" name="ddr3_odt[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AD9" SLEW="" name="ddr3_ras_n" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="LVCMOS15" PADName="AK3" SLEW="" name="ddr3_reset_n" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AE9" SLEW="" name="ddr3_we_n" IN_TERM="" />}
   puts $mig_prj_file {        </PinSelection>}
   puts $mig_prj_file {        <System_Clock>}
   puts $mig_prj_file {            <Pin PADName="AD12/AD11(CC_P/N)" Bank="33" name="sys_clk_p/n" />}
   puts $mig_prj_file {        </System_Clock>}
   puts $mig_prj_file {        <System_Control>}
   puts $mig_prj_file {            <Pin PADName="No connect" Bank="Select Bank" name="sys_rst" />}
   puts $mig_prj_file {            <Pin PADName="No connect" Bank="Select Bank" name="init_calib_complete" />}
   puts $mig_prj_file {            <Pin PADName="No connect" Bank="Select Bank" name="tg_compare_error" />}
   puts $mig_prj_file {        </System_Control>}
   puts $mig_prj_file {        <TimingParameters>}
   puts $mig_prj_file {            <Parameters twtr="7.5" trrd="6" trefi="7.8" tfaw="30" trtp="7.5" tcke="5" trfc="110" trp="13.75" tras="35" trcd="13.75" />}
   puts $mig_prj_file {        </TimingParameters>}
   puts $mig_prj_file {        <mrBurstLength name="Burst Length" >8 - Fixed</mrBurstLength>}
   puts $mig_prj_file {        <mrBurstType name="Read Burst Type and Length" >Sequential</mrBurstType>}
   puts $mig_prj_file {        <mrCasLatency name="CAS Latency" >9</mrCasLatency>}
   puts $mig_prj_file {        <mrMode name="Mode" >Normal</mrMode>}
   puts $mig_prj_file {        <mrDllReset name="DLL Reset" >No</mrDllReset>}
   puts $mig_prj_file {        <mrPdMode name="DLL control for precharge PD" >Slow Exit</mrPdMode>}
   puts $mig_prj_file {        <emrDllEnable name="DLL Enable" >Enable</emrDllEnable>}
   puts $mig_prj_file {        <emrOutputDriveStrength name="Output Driver Impedance Control" >RZQ/7</emrOutputDriveStrength>}
   puts $mig_prj_file {        <emrMirrorSelection name="Address Mirroring" >Disable</emrMirrorSelection>}
   puts $mig_prj_file {        <emrCSSelection name="Controller Chip Select Pin" >Enable</emrCSSelection>}
   puts $mig_prj_file {        <emrRTT name="RTT (nominal) - On Die Termination (ODT)" >RZQ/6</emrRTT>}
   puts $mig_prj_file {        <emrPosted name="Additive Latency (AL)" >0</emrPosted>}
   puts $mig_prj_file {        <emrOCD name="Write Leveling Enable" >Disabled</emrOCD>}
   puts $mig_prj_file {        <emrDQS name="TDQS enable" >Enabled</emrDQS>}
   puts $mig_prj_file {        <emrRDQS name="Qoff" >Output Buffer Enabled</emrRDQS>}
   puts $mig_prj_file {        <mr2PartialArraySelfRefresh name="Partial-Array Self Refresh" >Full Array</mr2PartialArraySelfRefresh>}
   puts $mig_prj_file {        <mr2CasWriteLatency name="CAS write latency" >7</mr2CasWriteLatency>}
   puts $mig_prj_file {        <mr2AutoSelfRefresh name="Auto Self Refresh" >Enabled</mr2AutoSelfRefresh>}
   puts $mig_prj_file {        <mr2SelfRefreshTempRange name="High Temparature Self Refresh Rate" >Normal</mr2SelfRefreshTempRange>}
   puts $mig_prj_file {        <mr2RTTWR name="RTT_WR - Dynamic On Die Termination (ODT)" >Dynamic ODT off</mr2RTTWR>}
   puts $mig_prj_file {        <PortInterface>AXI</PortInterface>}
   puts $mig_prj_file {        <AXIParameters>}
   puts $mig_prj_file {            <C0_C_RD_WR_ARB_ALGORITHM>RD_PRI_REG</C0_C_RD_WR_ARB_ALGORITHM>}
   puts $mig_prj_file {            <C0_S_AXI_ADDR_WIDTH>30</C0_S_AXI_ADDR_WIDTH>}
   puts $mig_prj_file {            <C0_S_AXI_DATA_WIDTH>32</C0_S_AXI_DATA_WIDTH>}
   puts $mig_prj_file {            <C0_S_AXI_ID_WIDTH>3</C0_S_AXI_ID_WIDTH>}
   puts $mig_prj_file {            <C0_S_AXI_SUPPORTS_NARROW_BURST>0</C0_S_AXI_SUPPORTS_NARROW_BURST>}
   puts $mig_prj_file {        </AXIParameters>}
   puts $mig_prj_file {    </Controller>}
   puts $mig_prj_file {}
   puts $mig_prj_file {</Project>}

   close $mig_prj_file
}
# End of write_mig_file_HDLC_DPA_mig_7series_0_0()



##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: tx_controller
proc create_hier_cell_tx_controller { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_tx_controller() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  # Create pins
  create_bd_pin -dir I BIST_END_0
  create_bd_pin -dir I BIST_OK_0
  create_bd_pin -dir O BIST_START_0
  create_bd_pin -dir O CALIB_ADC_ADDR
  create_bd_pin -dir O -type rst EXT_RST
  create_bd_pin -dir O PS_ADC_ADDR
  create_bd_pin -dir I -type rst aresetn_40MHz
  create_bd_pin -dir I clk_40MHz
  create_bd_pin -dir I -from 7 -to 0 data_in
  create_bd_pin -dir O -from 7 -to 0 data_out
  create_bd_pin -dir I -type rst m_axi_aresetn
  create_bd_pin -dir I -type clk s_axi_aclk

  # Create instance: TX_CONTROLLER_SCURVE_0, and set properties
  set TX_CONTROLLER_SCURVE_0 [ create_bd_cell -type ip -vlnv cern.ch:user:TX_CONTROLLER_SCURVE:2.0 TX_CONTROLLER_SCURVE_0 ]

  # Create instance: axi_clock_converter_1, and set properties
  set axi_clock_converter_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_1 ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_clock_converter_1_M_AXI [get_bd_intf_pins TX_CONTROLLER_SCURVE_0/s00_axi] [get_bd_intf_pins axi_clock_converter_1/M_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M09_AXI [get_bd_intf_pins S_AXI] [get_bd_intf_pins axi_clock_converter_1/S_AXI]

  # Create port connections
  connect_bd_net -net AP_Generator_0_data_out [get_bd_pins data_in] [get_bd_pins TX_CONTROLLER_SCURVE_0/data_in]
  connect_bd_net -net BIST_END_0_1 [get_bd_pins BIST_END_0] [get_bd_pins TX_CONTROLLER_SCURVE_0/BIST_END]
  connect_bd_net -net BIST_OK_0_1 [get_bd_pins BIST_OK_0] [get_bd_pins TX_CONTROLLER_SCURVE_0/BIST_OK]
  connect_bd_net -net CLK_40mhZ [get_bd_pins clk_40MHz] [get_bd_pins TX_CONTROLLER_SCURVE_0/s00_axi_aclk] [get_bd_pins axi_clock_converter_1/m_axi_aclk]
  connect_bd_net -net TX_CONTROLLER_SCURVE_0_BIST_START [get_bd_pins BIST_START_0] [get_bd_pins TX_CONTROLLER_SCURVE_0/BIST_START]
  connect_bd_net -net TX_CONTROLLER_SCURVE_0_CALIB_ADC_ADDR [get_bd_pins CALIB_ADC_ADDR] [get_bd_pins TX_CONTROLLER_SCURVE_0/CALIB_ADC_ADDR]
  connect_bd_net -net TX_CONTROLLER_SCURVE_0_EXT_RST [get_bd_pins EXT_RST] [get_bd_pins TX_CONTROLLER_SCURVE_0/EXT_RST]
  connect_bd_net -net TX_CONTROLLER_SCURVE_0_PS_ADC_ADDR [get_bd_pins PS_ADC_ADDR] [get_bd_pins TX_CONTROLLER_SCURVE_0/PS_ADC_ADDR]
  connect_bd_net -net TX_CONTROLLER_SCURVE_0_data_out [get_bd_pins data_out] [get_bd_pins TX_CONTROLLER_SCURVE_0/data_out]
  connect_bd_net -net aresetn_40MHz_1 [get_bd_pins aresetn_40MHz] [get_bd_pins TX_CONTROLLER_SCURVE_0/s00_axi_aresetn] [get_bd_pins axi_clock_converter_1/m_axi_aresetn]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins s_axi_aclk] [get_bd_pins axi_clock_converter_1/s_axi_aclk]
  connect_bd_net -net proc_sys_reset_1_peripheral_aresetn [get_bd_pins m_axi_aresetn] [get_bd_pins axi_clock_converter_1/s_axi_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: IDELAY_block
proc create_hier_cell_IDELAY_block { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_IDELAY_block() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -from 0 -to 0 bitslip
  create_bd_pin -dir I clk40
  create_bd_pin -dir I -type clk clk_in
  create_bd_pin -dir I -from 0 -to 0 data_in_from_pins
  create_bd_pin -dir I -from 0 -to 0 data_in_from_pins1
  create_bd_pin -dir O -from 7 -to 0 -type data data_in_to_device
  create_bd_pin -dir O -from 7 -to 0 -type data data_in_to_device2
  create_bd_pin -dir I -from 4 -to 0 in_delay_tap_in1
  create_bd_pin -dir I -from 4 -to 0 in_delay_tap_in2
  create_bd_pin -dir I -type rst io_reset
  create_bd_pin -dir I ref_clock

  # Create instance: selectio_wiz_0, and set properties
  set selectio_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:selectio_wiz:5.1 selectio_wiz_0 ]
  set_property -dict [ list \
   CONFIG.BUS_IO_STD {LVCMOS25} \
   CONFIG.CLK_FWD_IO_STD {LVCMOS25} \
   CONFIG.SELIO_BUS_IN_DELAY {VAR_LOADABLE} \
   CONFIG.SELIO_CLK_BUF {MMCM} \
   CONFIG.SELIO_CLK_IO_STD {LVCMOS25} \
   CONFIG.SELIO_INTERFACE_TYPE {NETWORKING} \
   CONFIG.SERIALIZATION_FACTOR {8} \
   CONFIG.SYSTEM_DATA_WIDTH {1} \
   CONFIG.USE_SERIALIZATION {true} \
 ] $selectio_wiz_0

  # Create instance: slave, and set properties
  set slave [ create_bd_cell -type ip -vlnv xilinx.com:ip:selectio_wiz:5.1 slave ]
  set_property -dict [ list \
   CONFIG.BUS_IO_STD {LVCMOS25} \
   CONFIG.CLK_FWD_IO_STD {LVCMOS25} \
   CONFIG.IDELAY_HIGH_PERF_MODE {true} \
   CONFIG.INCLUDE_IDELAYCTRL {true} \
   CONFIG.INCLUDE_IDELAYCTRL_BUFG {false} \
   CONFIG.SELIO_BUS_IN_DELAY {VAR_LOADABLE} \
   CONFIG.SELIO_CLK_BUF {MMCM} \
   CONFIG.SELIO_CLK_IO_STD {LVCMOS25} \
   CONFIG.SELIO_INTERFACE_TYPE {NETWORKING} \
   CONFIG.SERIALIZATION_FACTOR {8} \
   CONFIG.SYSTEM_DATA_WIDTH {1} \
   CONFIG.USE_SERIALIZATION {true} \
 ] $slave

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_1

  # Create port connections
  connect_bd_net -net Net [get_bd_pins selectio_wiz_0/in_delay_data_ce] [get_bd_pins selectio_wiz_0/in_delay_data_inc] [get_bd_pins slave/in_delay_data_ce] [get_bd_pins slave/in_delay_data_inc] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net bitslip_1 [get_bd_pins bitslip] [get_bd_pins selectio_wiz_0/bitslip] [get_bd_pins slave/bitslip]
  connect_bd_net -net clk40_1 [get_bd_pins clk40] [get_bd_pins selectio_wiz_0/clk_div_in] [get_bd_pins slave/clk_div_in]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins ref_clock] [get_bd_pins selectio_wiz_0/ref_clock] [get_bd_pins slave/ref_clock]
  connect_bd_net -net clk_wiz_1_clk_out1 [get_bd_pins clk_in] [get_bd_pins selectio_wiz_0/clk_in] [get_bd_pins slave/clk_in]
  connect_bd_net -net data_in_from_pins1_1 [get_bd_pins data_in_from_pins1] [get_bd_pins slave/data_in_from_pins]
  connect_bd_net -net data_in_from_pins_1 [get_bd_pins data_in_from_pins] [get_bd_pins selectio_wiz_0/data_in_from_pins]
  connect_bd_net -net in_delay_reset1_1 [get_bd_pins selectio_wiz_0/in_delay_reset] [get_bd_pins slave/in_delay_reset] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net in_delay_tap_in1_1 [get_bd_pins in_delay_tap_in1] [get_bd_pins selectio_wiz_0/in_delay_tap_in]
  connect_bd_net -net in_delay_tap_in2_1 [get_bd_pins in_delay_tap_in2] [get_bd_pins slave/in_delay_tap_in]
  connect_bd_net -net selectio_wiz_0_data_in_to_device [get_bd_pins data_in_to_device] [get_bd_pins selectio_wiz_0/data_in_to_device]
  connect_bd_net -net slave_data_in_to_device [get_bd_pins data_in_to_device2] [get_bd_pins slave/data_in_to_device]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins io_reset] [get_bd_pins selectio_wiz_0/io_reset] [get_bd_pins slave/io_reset]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: trigger_logic_block
proc create_hier_cell_trigger_logic_block { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_trigger_logic_block() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  # Create pins
  create_bd_pin -dir I clk_div_in
  create_bd_pin -dir I -type clk clk_in
  create_bd_pin -dir I -from 7 -to 0 data_in_from_pins_n_0
  create_bd_pin -dir I -from 0 -to 0 data_in_from_pins_n_1
  create_bd_pin -dir I -from 7 -to 0 data_in_from_pins_p_0
  create_bd_pin -dir I -from 0 -to 0 data_in_from_pins_p_1
  create_bd_pin -dir I -from 0 -to 0 io_reset_n
  create_bd_pin -dir I -type rst m_axi_aresetn
  create_bd_pin -dir I ref_clock
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn

  # Create instance: TU_TXD_BUS, and set properties
  set TU_TXD_BUS [ create_bd_cell -type ip -vlnv xilinx.com:ip:selectio_wiz:5.1 TU_TXD_BUS ]
  set_property -dict [ list \
   CONFIG.BUS_IO_STD {LVDS_25} \
   CONFIG.BUS_SIG_TYPE {DIFF} \
   CONFIG.CLK_FWD_IO_STD {LVDS_25} \
   CONFIG.CLK_FWD_SIG_TYPE {DIFF} \
   CONFIG.SELIO_BUS_IN_DELAY {VAR_LOADABLE} \
   CONFIG.SELIO_CLK_BUF {MMCM} \
   CONFIG.SELIO_CLK_IO_STD {LVDS_25} \
   CONFIG.SELIO_CLK_SIG_TYPE {DIFF} \
   CONFIG.SELIO_INTERFACE_TYPE {NETWORKING} \
   CONFIG.SERIALIZATION_FACTOR {8} \
   CONFIG.SYSTEM_DATA_WIDTH {8} \
   CONFIG.USE_SERIALIZATION {true} \
 ] $TU_TXD_BUS

  # Create instance: Trigger_Bits_Controller_0, and set properties
  set Trigger_Bits_Controller_0 [ create_bd_cell -type ip -vlnv ULB:user:Trigger_Bits_Controller:1.2 Trigger_Bits_Controller_0 ]

  # Create instance: axi_clock_converter_0, and set properties
  set axi_clock_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_0 ]

  # Create instance: selectio_wiz_0, and set properties
  set selectio_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:selectio_wiz:5.1 selectio_wiz_0 ]
  set_property -dict [ list \
   CONFIG.BUS_IO_STD {LVDS_25} \
   CONFIG.BUS_SIG_TYPE {DIFF} \
   CONFIG.CLK_FWD_IO_STD {LVDS_25} \
   CONFIG.CLK_FWD_SIG_TYPE {DIFF} \
   CONFIG.SELIO_BUS_IN_DELAY {VAR_LOADABLE} \
   CONFIG.SELIO_CLK_BUF {MMCM} \
   CONFIG.SELIO_CLK_IO_STD {LVDS_25} \
   CONFIG.SELIO_CLK_SIG_TYPE {DIFF} \
   CONFIG.SELIO_INTERFACE_TYPE {NETWORKING} \
   CONFIG.SERIALIZATION_FACTOR {8} \
   CONFIG.SYSTEM_DATA_WIDTH {1} \
   CONFIG.USE_SERIALIZATION {true} \
 ] $selectio_wiz_0

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {8} \
 ] $xlconstant_0

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_2

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI] [get_bd_intf_pins axi_clock_converter_0/S_AXI]
  connect_bd_intf_net -intf_net axi_clock_converter_0_M_AXI [get_bd_intf_pins Trigger_Bits_Controller_0/S00_AXI] [get_bd_intf_pins axi_clock_converter_0/M_AXI]

  # Create port connections
  connect_bd_net -net Net [get_bd_pins selectio_wiz_0/in_delay_data_ce] [get_bd_pins selectio_wiz_0/in_delay_data_inc] [get_bd_pins xlconstant_2/dout]
  connect_bd_net -net Net1 [get_bd_pins TU_TXD_BUS/in_delay_data_ce] [get_bd_pins TU_TXD_BUS/in_delay_data_inc] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net Op1_1 [get_bd_pins io_reset_n] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net TU_TXD_BUS_data_in_to_device [get_bd_pins TU_TXD_BUS/data_in_to_device] [get_bd_pins Trigger_Bits_Controller_0/trigger_data_in]
  connect_bd_net -net Trigger_Bits_Controller_0_bitslip_bus [get_bd_pins TU_TXD_BUS/bitslip] [get_bd_pins Trigger_Bits_Controller_0/tu_bitslip]
  connect_bd_net -net Trigger_Bits_Controller_0_bitslip_sot [get_bd_pins Trigger_Bits_Controller_0/sot_bitslip] [get_bd_pins selectio_wiz_0/bitslip]
  connect_bd_net -net Trigger_Bits_Controller_0_delay_tap_bus [get_bd_pins TU_TXD_BUS/in_delay_tap_in] [get_bd_pins Trigger_Bits_Controller_0/delay_tap_tu]
  connect_bd_net -net Trigger_Bits_Controller_0_delay_tap_sot [get_bd_pins Trigger_Bits_Controller_0/delay_tap_sot] [get_bd_pins selectio_wiz_0/in_delay_tap_in]
  connect_bd_net -net clk_div_in_1 [get_bd_pins clk_div_in] [get_bd_pins TU_TXD_BUS/clk_div_in] [get_bd_pins Trigger_Bits_Controller_0/s00_axi_aclk] [get_bd_pins axi_clock_converter_0/m_axi_aclk] [get_bd_pins selectio_wiz_0/clk_div_in]
  connect_bd_net -net clk_in_1 [get_bd_pins clk_in] [get_bd_pins TU_TXD_BUS/clk_in] [get_bd_pins selectio_wiz_0/clk_in]
  connect_bd_net -net data_in_from_pins_n_0_1 [get_bd_pins data_in_from_pins_n_0] [get_bd_pins TU_TXD_BUS/data_in_from_pins_n]
  connect_bd_net -net data_in_from_pins_n_1_1 [get_bd_pins data_in_from_pins_n_1] [get_bd_pins selectio_wiz_0/data_in_from_pins_n]
  connect_bd_net -net data_in_from_pins_p_0_1 [get_bd_pins data_in_from_pins_p_0] [get_bd_pins TU_TXD_BUS/data_in_from_pins_p]
  connect_bd_net -net data_in_from_pins_p_1_1 [get_bd_pins data_in_from_pins_p_1] [get_bd_pins selectio_wiz_0/data_in_from_pins_p]
  connect_bd_net -net m_axi_aresetn_1 [get_bd_pins m_axi_aresetn] [get_bd_pins Trigger_Bits_Controller_0/s00_axi_aresetn] [get_bd_pins axi_clock_converter_0/m_axi_aresetn]
  connect_bd_net -net ref_clock_0_1 [get_bd_pins ref_clock] [get_bd_pins TU_TXD_BUS/ref_clock] [get_bd_pins selectio_wiz_0/ref_clock]
  connect_bd_net -net s_axi_aclk_0_1 [get_bd_pins s_axi_aclk] [get_bd_pins axi_clock_converter_0/s_axi_aclk]
  connect_bd_net -net s_axi_aresetn_0_1 [get_bd_pins s_axi_aresetn] [get_bd_pins axi_clock_converter_0/s_axi_aresetn]
  connect_bd_net -net selectio_wiz_0_data_in_to_device [get_bd_pins Trigger_Bits_Controller_0/data_in_sot] [get_bd_pins selectio_wiz_0/data_in_to_device]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins TU_TXD_BUS/io_reset] [get_bd_pins selectio_wiz_0/io_reset] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins TU_TXD_BUS/in_delay_reset] [get_bd_pins selectio_wiz_0/in_delay_reset] [get_bd_pins xlconstant_1/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB

  # Create pins
  create_bd_pin -dir I LMB_Clk
  create_bd_pin -dir I LMB_Rst

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 lmb_bram ]
  set_property -dict [ list \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Use_RSTB_Pin {true} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]
  connect_bd_net -net proc_sys_reset_1_bus_struct_reset [get_bd_pins LMB_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: dpa_hier
proc create_hier_cell_dpa_hier { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_dpa_hier() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  # Create pins
  create_bd_pin -dir I -from 7 -to 0 M_data
  create_bd_pin -dir I -from 7 -to 0 -type data S_data
  create_bd_pin -dir O -from 4 -to 0 mtap_pre
  create_bd_pin -dir I -type clk s00_axi_aclk
  create_bd_pin -dir I -type rst s00_axi_aresetn
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn
  create_bd_pin -dir O -from 4 -to 0 stap_pre

  # Create instance: axi_clock_converter_1, and set properties
  set axi_clock_converter_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_1 ]

  # Create instance: dpa_controller_v1_0_0, and set properties
  set dpa_controller_v1_0_0 [ create_bd_cell -type ip -vlnv cern.ch:user:dpa_controller_v1_0:1.0 dpa_controller_v1_0_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI] [get_bd_intf_pins axi_clock_converter_1/S_AXI]
  connect_bd_intf_net -intf_net axi_clock_converter_1_M_AXI [get_bd_intf_pins axi_clock_converter_1/M_AXI] [get_bd_intf_pins dpa_controller_v1_0_0/s00_axi]

  # Create port connections
  connect_bd_net -net M_data_1 [get_bd_pins M_data] [get_bd_pins dpa_controller_v1_0_0/M_data]
  connect_bd_net -net S_data_1 [get_bd_pins S_data] [get_bd_pins dpa_controller_v1_0_0/S_data]
  connect_bd_net -net dpa_controller_v1_0_0_mtap_pre [get_bd_pins mtap_pre] [get_bd_pins dpa_controller_v1_0_0/mtap_pre]
  connect_bd_net -net dpa_controller_v1_0_0_stap_pre [get_bd_pins stap_pre] [get_bd_pins dpa_controller_v1_0_0/stap_pre]
  connect_bd_net -net s00_axi_aclk_1 [get_bd_pins s00_axi_aclk] [get_bd_pins axi_clock_converter_1/m_axi_aclk] [get_bd_pins dpa_controller_v1_0_0/s00_axi_aclk]
  connect_bd_net -net s00_axi_aresetn_1 [get_bd_pins s00_axi_aresetn] [get_bd_pins axi_clock_converter_1/m_axi_aresetn] [get_bd_pins dpa_controller_v1_0_0/s00_axi_aresetn]
  connect_bd_net -net s_axi_aclk_1 [get_bd_pins s_axi_aclk] [get_bd_pins axi_clock_converter_1/s_axi_aclk]
  connect_bd_net -net s_axi_aresetn_1 [get_bd_pins s_axi_aresetn] [get_bd_pins axi_clock_converter_1/s_axi_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: TXD
proc create_hier_cell_TXD { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_TXD() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI1
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 S_AXIS

  # Create pins
  create_bd_pin -dir I BIST_END
  create_bd_pin -dir I BIST_OK
  create_bd_pin -dir O BIST_START
  create_bd_pin -dir O CALIB_ADC_ADDR
  create_bd_pin -dir O -type rst EXT_RST
  create_bd_pin -dir O PS_ADC_ADDR
  create_bd_pin -dir I -type rst aresetn_40MHz
  create_bd_pin -dir I -type clk clk_40
  create_bd_pin -dir I -type clk clk_in
  create_bd_pin -dir O -from 7 -to 0 data_out
  create_bd_pin -dir I -type rst rst_n
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir O -from 0 -to 0 txd_n
  create_bd_pin -dir O -from 0 -to 0 txd_p

  # Create instance: AP_Generator_0, and set properties
  set block_name AP_Generator
  set block_cell_name AP_Generator_0
  if { [catch {set AP_Generator_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $AP_Generator_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: SC_try_v1_0_0, and set properties
  set SC_try_v1_0_0 [ create_bd_cell -type ip -vlnv cern.ch:user:SC_try_v1_0:1.0 SC_try_v1_0_0 ]

  # Create instance: S_to_diff_0, and set properties
  set block_name S_to_diff
  set block_cell_name S_to_diff_0
  if { [catch {set S_to_diff_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $S_to_diff_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: TX_SERIALIZER, and set properties
  set TX_SERIALIZER [ create_bd_cell -type ip -vlnv xilinx.com:ip:selectio_wiz:5.1 TX_SERIALIZER ]
  set_property -dict [ list \
   CONFIG.BUS_DIR {OUTPUTS} \
   CONFIG.BUS_IO_STD {LVCMOS25} \
   CONFIG.BUS_SIG_TYPE {SINGLE} \
   CONFIG.CLK_EN {false} \
   CONFIG.CLK_FWD {false} \
   CONFIG.CLK_FWD_IO_STD {LVDS_25} \
   CONFIG.CLK_FWD_SER {false} \
   CONFIG.CLK_FWD_SIG_TYPE {DIFF} \
   CONFIG.CONFIG_CLK_FWD {false} \
   CONFIG.SELIO_BUS_IN_DELAY {NONE} \
   CONFIG.SELIO_CLK_BUF {MMCM} \
   CONFIG.SELIO_CLK_IO_STD {LVCMOS25} \
   CONFIG.SELIO_CLK_SIG_TYPE {SINGLE} \
   CONFIG.SELIO_INTERFACE_TYPE {NETWORKING} \
   CONFIG.SERIALIZATION_FACTOR {8} \
   CONFIG.SYSTEM_DATA_WIDTH {1} \
   CONFIG.USE_SERIALIZATION {true} \
 ] $TX_SERIALIZER

  # Create instance: axis_clock_converter_1, and set properties
  set axis_clock_converter_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_clock_converter:1.1 axis_clock_converter_1 ]

  # Create instance: clock_converter_SC_TRY, and set properties
  set clock_converter_SC_TRY [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 clock_converter_SC_TRY ]

  # Create instance: inverse_reverse_TX, and set properties
  set block_name inverse_reverse
  set block_cell_name inverse_reverse_TX
  if { [catch {set inverse_reverse_TX [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $inverse_reverse_TX eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: tx_controller
  create_hier_cell_tx_controller $hier_obj tx_controller

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_2

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {7} \
   CONFIG.DIN_TO {0} \
   CONFIG.DOUT_WIDTH {8} \
 ] $xlslice_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI1] [get_bd_intf_pins clock_converter_SC_TRY/S_AXI]
  connect_bd_intf_net -intf_net axi_clock_converter_1_M_AXI [get_bd_intf_pins SC_try_v1_0_0/s00_axi] [get_bd_intf_pins clock_converter_SC_TRY/M_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M09_AXI [get_bd_intf_pins S_AXI] [get_bd_intf_pins tx_controller/S_AXI]
  connect_bd_intf_net -intf_net output_fifo_AXI_STR_TXD [get_bd_intf_pins S_AXIS] [get_bd_intf_pins axis_clock_converter_1/S_AXIS]

  # Create port connections
  connect_bd_net -net AP_Generator_0_data_out [get_bd_pins AP_Generator_0/data_out] [get_bd_pins tx_controller/data_in]
  connect_bd_net -net BIST_END_0_1 [get_bd_pins BIST_END] [get_bd_pins tx_controller/BIST_END_0]
  connect_bd_net -net BIST_OK_0_1 [get_bd_pins BIST_OK] [get_bd_pins tx_controller/BIST_OK_0]
  connect_bd_net -net CLK_40mhZ [get_bd_pins clk_40] [get_bd_pins AP_Generator_0/clk] [get_bd_pins SC_try_v1_0_0/s00_axi_aclk] [get_bd_pins TX_SERIALIZER/clk_div_in] [get_bd_pins axis_clock_converter_1/m_axis_aclk] [get_bd_pins clock_converter_SC_TRY/m_axi_aclk] [get_bd_pins inverse_reverse_TX/clk] [get_bd_pins tx_controller/clk_40MHz]
  connect_bd_net -net SC_try_v1_0_0_data_out [get_bd_pins data_out] [get_bd_pins SC_try_v1_0_0/data_out] [get_bd_pins inverse_reverse_TX/data_in]
  connect_bd_net -net S_to_diff_0_out_n [get_bd_pins txd_n] [get_bd_pins S_to_diff_0/out_n]
  connect_bd_net -net S_to_diff_0_out_p [get_bd_pins txd_p] [get_bd_pins S_to_diff_0/out_p]
  connect_bd_net -net TX_SERIALIZER_data_out_to_pins [get_bd_pins S_to_diff_0/sig_in] [get_bd_pins TX_SERIALIZER/data_out_to_pins]
  connect_bd_net -net axis_clock_converter_0_m_axis_tdata [get_bd_pins axis_clock_converter_1/m_axis_tdata] [get_bd_pins xlslice_0/Din]
  connect_bd_net -net axis_clock_converter_0_m_axis_tvalid [get_bd_pins AP_Generator_0/datavalid] [get_bd_pins axis_clock_converter_1/m_axis_tvalid]
  connect_bd_net -net clk_wiz_1_clk_out1 [get_bd_pins clk_in] [get_bd_pins TX_SERIALIZER/clk_in]
  connect_bd_net -net inverse_reverse_TX_data_out [get_bd_pins TX_SERIALIZER/data_out_from_device] [get_bd_pins inverse_reverse_TX/data_out]
  connect_bd_net -net m_axi_aresetn_1 [get_bd_pins aresetn_40MHz] [get_bd_pins AP_Generator_0/rst_n] [get_bd_pins SC_try_v1_0_0/s00_axi_aresetn] [get_bd_pins axis_clock_converter_1/m_axis_aresetn] [get_bd_pins clock_converter_SC_TRY/m_axi_aresetn] [get_bd_pins inverse_reverse_TX/rst_n] [get_bd_pins tx_controller/aresetn_40MHz]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins s_axi_aclk] [get_bd_pins axis_clock_converter_1/s_axis_aclk] [get_bd_pins clock_converter_SC_TRY/s_axi_aclk] [get_bd_pins tx_controller/s_axi_aclk]
  connect_bd_net -net proc_sys_reset_1_peripheral_aresetn [get_bd_pins rst_n] [get_bd_pins axis_clock_converter_1/s_axis_aresetn] [get_bd_pins clock_converter_SC_TRY/s_axi_aresetn] [get_bd_pins tx_controller/m_axi_aresetn]
  connect_bd_net -net tx_controller_data_out [get_bd_pins SC_try_v1_0_0/data_in] [get_bd_pins tx_controller/data_out]
  connect_bd_net -net tx_controller_hier_BIST_START_0 [get_bd_pins BIST_START] [get_bd_pins tx_controller/BIST_START_0]
  connect_bd_net -net tx_controller_hier_CALIB_ADC_ADDR [get_bd_pins CALIB_ADC_ADDR] [get_bd_pins tx_controller/CALIB_ADC_ADDR]
  connect_bd_net -net tx_controller_hier_EXT_RST [get_bd_pins EXT_RST] [get_bd_pins tx_controller/EXT_RST]
  connect_bd_net -net tx_controller_hier_PS_ADC_ADDR [get_bd_pins PS_ADC_ADDR] [get_bd_pins tx_controller/PS_ADC_ADDR]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins axis_clock_converter_1/m_axis_tready] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins inverse_reverse_TX/reverse] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlconstant_2_dout [get_bd_pins inverse_reverse_TX/invert] [get_bd_pins xlconstant_2/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins AP_Generator_0/data_in] [get_bd_pins xlslice_0/Dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: RXD
proc create_hier_cell_RXD { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_RXD() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 M_AXIS
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  # Create pins
  create_bd_pin -dir I RXD_N
  create_bd_pin -dir I RXD_P
  create_bd_pin -dir I bitslip_ena
  create_bd_pin -dir I clk40
  create_bd_pin -dir I -type clk clk_in
  create_bd_pin -dir O -from 7 -to 0 -type data data_in_to_device
  create_bd_pin -dir O -from 7 -to 0 -type data data_in_to_device1
  create_bd_pin -dir I -from 4 -to 0 in_delay_tap_in1
  create_bd_pin -dir I -from 4 -to 0 in_delay_tap_in2
  create_bd_pin -dir I -type rst io_reset
  create_bd_pin -dir I -type clk m_axis_aclk
  create_bd_pin -dir I ref_clock
  create_bd_pin -dir I reverse
  create_bd_pin -dir I -type rst rst_n
  create_bd_pin -dir I -type rst s00_axi_aresetn_40MHz
  create_bd_pin -dir O success

  # Create instance: F1_F2_FILTER, and set properties
  set block_name F1_F2_FILTER
  set block_cell_name F1_F2_FILTER
  if { [catch {set F1_F2_FILTER [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $F1_F2_FILTER eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: IDELAY_block
  create_hier_cell_IDELAY_block $hier_obj IDELAY_block

  # Create instance: axi_clock_converter_1, and set properties
  set axi_clock_converter_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_1 ]

  # Create instance: axis_clock_converter_0, and set properties
  set axis_clock_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_clock_converter:1.1 axis_clock_converter_0 ]
  set_property -dict [ list \
   CONFIG.TDATA_NUM_BYTES {4} \
 ] $axis_clock_converter_0

  # Create instance: bitslip_Generator_Master, and set properties
  set block_name bitslip_Generator
  set block_cell_name bitslip_Generator_Master
  if { [catch {set bitslip_Generator_Master [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $bitslip_Generator_Master eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: diff_to_diff, and set properties
  set block_name diff_to_diff
  set block_cell_name diff_to_diff
  if { [catch {set diff_to_diff [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $diff_to_diff eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: inverse_reverse_master, and set properties
  set block_name inverse_reverse
  set block_cell_name inverse_reverse_master
  if { [catch {set inverse_reverse_master [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $inverse_reverse_master eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: rx_controller_SCURVE, and set properties
  set rx_controller_SCURVE [ create_bd_cell -type ip -vlnv cern.ch:user:rx_controller_v1_0:1.0 rx_controller_SCURVE ]

  # Create instance: xlconstant_2, and set properties
  set xlconstant_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_2

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI] [get_bd_intf_pins axi_clock_converter_1/S_AXI]
  connect_bd_intf_net -intf_net Receiver_logic_M_AXIS [get_bd_intf_pins M_AXIS] [get_bd_intf_pins axis_clock_converter_0/M_AXIS]
  connect_bd_intf_net -intf_net axi_clock_converter_1_M_AXI [get_bd_intf_pins axi_clock_converter_1/M_AXI] [get_bd_intf_pins rx_controller_SCURVE/s00_axi]

  # Create port connections
  connect_bd_net -net CLK_40mhZ [get_bd_pins clk40] [get_bd_pins F1_F2_FILTER/clk40] [get_bd_pins IDELAY_block/clk40] [get_bd_pins axi_clock_converter_1/m_axi_aclk] [get_bd_pins axis_clock_converter_0/s_axis_aclk] [get_bd_pins bitslip_Generator_Master/clk_40MHz] [get_bd_pins inverse_reverse_master/clk] [get_bd_pins rx_controller_SCURVE/s00_axi_aclk]
  connect_bd_net -net F1_F2_IN [get_bd_pins bitslip_Generator_Master/data_in] [get_bd_pins inverse_reverse_master/data_out] [get_bd_pins rx_controller_SCURVE/data_in]
  connect_bd_net -net F1_F2_OUT [get_bd_pins F1_F2_FILTER/d_out] [get_bd_pins axis_clock_converter_0/s_axis_tdata]
  connect_bd_net -net IDELAY_block_data_in_to_device2 [get_bd_pins data_in_to_device1] [get_bd_pins IDELAY_block/data_in_to_device2]
  connect_bd_net -net RXD_N_1 [get_bd_pins RXD_N] [get_bd_pins diff_to_diff/RXD_N_I]
  connect_bd_net -net RXD_P_1 [get_bd_pins RXD_P] [get_bd_pins diff_to_diff/RXD_P_I]
  connect_bd_net -net Receiver_logic_data_in_to_device [get_bd_pins data_in_to_device] [get_bd_pins IDELAY_block/data_in_to_device] [get_bd_pins inverse_reverse_master/data_in]
  connect_bd_net -net Receiver_logic_dv [get_bd_pins F1_F2_FILTER/dv] [get_bd_pins axis_clock_converter_0/s_axis_tvalid]
  connect_bd_net -net Receiver_logic_gpio_io_o1 [get_bd_pins bitslip_ena] [get_bd_pins bitslip_Generator_Master/bitslip_ena]
  connect_bd_net -net bitslip_1 [get_bd_pins IDELAY_block/bitslip] [get_bd_pins bitslip_Generator_Master/bitslip]
  connect_bd_net -net bitslip_Generator_Master_success [get_bd_pins success] [get_bd_pins F1_F2_FILTER/bit_aligned] [get_bd_pins bitslip_Generator_Master/success]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins ref_clock] [get_bd_pins IDELAY_block/ref_clock]
  connect_bd_net -net clk_wiz_1_clk_out1 [get_bd_pins clk_in] [get_bd_pins IDELAY_block/clk_in]
  connect_bd_net -net diff_to_diff_0_RXD_P_O [get_bd_pins IDELAY_block/data_in_from_pins] [get_bd_pins diff_to_diff/RXD_P_O]
  connect_bd_net -net diff_to_diff_RXD_N_O [get_bd_pins IDELAY_block/data_in_from_pins1] [get_bd_pins diff_to_diff/RXD_N_O]
  connect_bd_net -net in_delay_tap_in1_1 [get_bd_pins in_delay_tap_in1] [get_bd_pins IDELAY_block/in_delay_tap_in1]
  connect_bd_net -net in_delay_tap_in2_1 [get_bd_pins in_delay_tap_in2] [get_bd_pins IDELAY_block/in_delay_tap_in2]
  connect_bd_net -net io_reset_1 [get_bd_pins io_reset] [get_bd_pins IDELAY_block/io_reset]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins m_axis_aclk] [get_bd_pins axi_clock_converter_1/s_axi_aclk] [get_bd_pins axis_clock_converter_0/m_axis_aclk]
  connect_bd_net -net proc_sys_reset_1_peripheral_aresetn [get_bd_pins rst_n] [get_bd_pins axi_clock_converter_1/s_axi_aresetn] [get_bd_pins axis_clock_converter_0/m_axis_aresetn]
  connect_bd_net -net rx_controller_v1_0_0_data_out [get_bd_pins F1_F2_FILTER/d_in] [get_bd_pins rx_controller_SCURVE/data_out]
  connect_bd_net -net s00_axi_aresetn_1 [get_bd_pins s00_axi_aresetn_40MHz] [get_bd_pins F1_F2_FILTER/rst_n] [get_bd_pins axi_clock_converter_1/m_axi_aresetn] [get_bd_pins axis_clock_converter_0/s_axis_aresetn] [get_bd_pins bitslip_Generator_Master/rst_n] [get_bd_pins inverse_reverse_master/rst_n] [get_bd_pins rx_controller_SCURVE/s00_axi_aresetn]
  connect_bd_net -net tx_controller_hier_INV_RX [get_bd_pins inverse_reverse_master/invert] [get_bd_pins xlconstant_2/dout]
  connect_bd_net -net xlconstant_3_dout [get_bd_pins reverse] [get_bd_pins inverse_reverse_master/reverse]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR3 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR3 ]
  set gmii [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gmii_rtl:1.0 gmii ]
  set iic_main [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 iic_main ]
  set mdio_mdc [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:mdio_rtl:1.0 mdio_mdc ]
  set rs232_uart [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 rs232_uart ]
  set spi_flash [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 spi_flash ]

  # Create ports
  set BIST_END [ create_bd_port -dir I BIST_END ]
  set BIST_OK [ create_bd_port -dir I BIST_OK ]
  set BIST_START [ create_bd_port -dir O BIST_START ]
  set CALIB_ADC_ADDR [ create_bd_port -dir O CALIB_ADC_ADDR ]
  set EXT_RST [ create_bd_port -dir O EXT_RST ]
  set PS_ADC_ADDR [ create_bd_port -dir O PS_ADC_ADDR ]
  set RXD_N [ create_bd_port -dir I RXD_N ]
  set RXD_P [ create_bd_port -dir I RXD_P ]
  set TU_SOT_N_FROM_VFAT3 [ create_bd_port -dir I -from 0 -to 0 TU_SOT_N_FROM_VFAT3 ]
  set TU_SOT_P_FROM_VFAT3 [ create_bd_port -dir I -from 0 -to 0 TU_SOT_P_FROM_VFAT3 ]
  set TU_TXD_N_FROM_VFAT3 [ create_bd_port -dir I -from 7 -to 0 TU_TXD_N_FROM_VFAT3 ]
  set TU_TXD_P_FROM_VFAT3 [ create_bd_port -dir I -from 7 -to 0 TU_TXD_P_FROM_VFAT3 ]
  set phy_reset_out [ create_bd_port -dir O -from 0 -to 0 -type rst phy_reset_out ]
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset
  set rxclk_n [ create_bd_port -dir O rxclk_n ]
  set rxclk_p [ create_bd_port -dir O rxclk_p ]
  set sys_clk_n [ create_bd_port -dir I sys_clk_n ]
  set sys_clk_p [ create_bd_port -dir I sys_clk_p ]
  set vfat3_txd_n [ create_bd_port -dir O -from 0 -to 0 vfat3_txd_n ]
  set vfat3_txd_p [ create_bd_port -dir O -from 0 -to 0 vfat3_txd_p ]

  # Create instance: FIFO, and set properties
  set FIFO [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_fifo_mm_s:4.1 FIFO ]
  set_property -dict [ list \
   CONFIG.C_AXIS_TDEST_WIDTH {4} \
   CONFIG.C_DATA_INTERFACE_TYPE {1} \
   CONFIG.C_HAS_AXIS_TDEST {false} \
   CONFIG.C_RX_FIFO_DEPTH {32768} \
   CONFIG.C_RX_FIFO_PE_THRESHOLD {2} \
   CONFIG.C_RX_FIFO_PF_THRESHOLD {32763} \
   CONFIG.C_TX_FIFO_DEPTH {131072} \
   CONFIG.C_TX_FIFO_PE_THRESHOLD {2} \
   CONFIG.C_TX_FIFO_PF_THRESHOLD {130000} \
   CONFIG.C_USE_TX_CTRL {0} \
   CONFIG.C_USE_TX_DATA {1} \
 ] $FIFO

  # Create instance: RXD
  create_hier_cell_RXD [current_bd_instance .] RXD

  # Create instance: S_to_diff_1, and set properties
  set block_name S_to_diff
  set block_cell_name S_to_diff_1
  if { [catch {set S_to_diff_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $S_to_diff_1 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: TXD
  create_hier_cell_TXD [current_bd_instance .] TXD

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.0 axi_bram_ctrl_0 ]
  set_property -dict [ list \
   CONFIG.C_SELECT_XPM {0} \
 ] $axi_bram_ctrl_0

  # Create instance: axi_clock_converter_0, and set properties
  set axi_clock_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_clock_converter:2.1 axi_clock_converter_0 ]

  # Create instance: axi_ethernet_0, and set properties
  set axi_ethernet_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_ethernet:7.1 axi_ethernet_0 ]
  set_property -dict [ list \
   CONFIG.ETHERNET_BOARD_INTERFACE {gmii} \
   CONFIG.MDIO_BOARD_INTERFACE {mdio_mdc} \
   CONFIG.PHYRST_BOARD_INTERFACE {phy_reset_out} \
   CONFIG.RXCSUM {Full} \
   CONFIG.RXMEM {32k} \
   CONFIG.TXCSUM {Full} \
   CONFIG.TXMEM {32k} \
   CONFIG.rxnibblebitslice0used {true} \
 ] $axi_ethernet_0

  # Create instance: axi_ethernet_0_dma, and set properties
  set axi_ethernet_0_dma [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_ethernet_0_dma ]
  set_property -dict [ list \
   CONFIG.c_include_mm2s_dre {1} \
   CONFIG.c_include_s2mm_dre {1} \
   CONFIG.c_mm2s_burst_size {32} \
   CONFIG.c_s2mm_burst_size {32} \
   CONFIG.c_sg_use_stsapp_length {1} \
 ] $axi_ethernet_0_dma

  # Create instance: axi_iic_0, and set properties
  set axi_iic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic_0 ]
  set_property -dict [ list \
   CONFIG.IIC_BOARD_INTERFACE {iic_main} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_iic_0

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list \
   CONFIG.M00_HAS_REGSLICE {4} \
   CONFIG.M01_HAS_REGSLICE {4} \
   CONFIG.NUM_MI {2} \
   CONFIG.NUM_SI {5} \
   CONFIG.S00_HAS_DATA_FIFO {2} \
   CONFIG.S00_HAS_REGSLICE {4} \
   CONFIG.S01_HAS_DATA_FIFO {2} \
   CONFIG.S01_HAS_REGSLICE {4} \
   CONFIG.S02_HAS_DATA_FIFO {2} \
   CONFIG.S02_HAS_REGSLICE {4} \
   CONFIG.S03_HAS_DATA_FIFO {2} \
   CONFIG.S03_HAS_REGSLICE {4} \
   CONFIG.S04_HAS_DATA_FIFO {2} \
   CONFIG.S04_HAS_REGSLICE {4} \
   CONFIG.STRATEGY {2} \
   CONFIG.SYNCHRONIZATION_STAGES {2} \
 ] $axi_mem_intercon

  # Create instance: axi_quad_spi_0, and set properties
  set axi_quad_spi_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_quad_spi_0 ]
  set_property -dict [ list \
   CONFIG.QSPI_BOARD_INTERFACE {spi_flash} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_quad_spi_0

  # Create instance: axi_timer_0, and set properties
  set axi_timer_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 axi_timer_0 ]

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property -dict [ list \
   CONFIG.C_BAUDRATE {921600} \
   CONFIG.C_S_AXI_ACLK_FREQ_HZ {150150150} \
   CONFIG.UARTLITE_BOARD_INTERFACE {rs232_uart} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_uartlite_0

  # Create instance: bit_slip, and set properties
  set bit_slip [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 bit_slip ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {1} \
   CONFIG.C_GPIO_WIDTH {1} \
 ] $bit_slip

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_0 ]
  set_property -dict [ list \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Use_RSTB_Pin {true} \
 ] $blk_mem_gen_0

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.4 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {83.329999999999998} \
   CONFIG.CLKOUT1_JITTER {165.993} \
   CONFIG.CLKOUT1_PHASE_ERROR {191.950} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {125} \
   CONFIG.CLKOUT2_JITTER {153.008} \
   CONFIG.CLKOUT2_PHASE_ERROR {191.950} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {200} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {25.000} \
   CONFIG.MMCM_CLKIN1_PERIOD {8.333} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.000} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {8.000} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {5} \
   CONFIG.MMCM_DIVCLK_DIVIDE {3} \
   CONFIG.NUM_OUT_CLKS {2} \
   CONFIG.RESET_BOARD_INTERFACE {reset} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $clk_wiz_0

  # Create instance: clk_wiz_1, and set properties
  set clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.4 clk_wiz_1 ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {83.329999999999998} \
   CONFIG.CLKOUT1_JITTER {102.742} \
   CONFIG.CLKOUT1_PHASE_ERROR {99.820} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {320} \
   CONFIG.CLKOUT2_JITTER {102.742} \
   CONFIG.CLKOUT2_PHASE_ERROR {99.820} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {320} \
   CONFIG.CLKOUT2_REQUESTED_PHASE {0} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_JITTER {154.911} \
   CONFIG.CLKOUT3_PHASE_ERROR {99.820} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {40} \
   CONFIG.CLKOUT3_USED {true} \
   CONFIG.CLKOUT4_JITTER {113.061} \
   CONFIG.CLKOUT4_PHASE_ERROR {99.820} \
   CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {200} \
   CONFIG.CLKOUT4_USED {true} \
   CONFIG.CLK_IN1_BOARD_INTERFACE {Custom} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {8.000} \
   CONFIG.MMCM_CLKIN1_PERIOD {8.333} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.000} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {3.000} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {3} \
   CONFIG.MMCM_CLKOUT1_PHASE {0.000} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {24} \
   CONFIG.MMCM_CLKOUT3_DIVIDE {5} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {4} \
   CONFIG.PRIM_SOURCE {Single_ended_clock_capable_pin} \
   CONFIG.RESET_BOARD_INTERFACE {reset} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $clk_wiz_1

  # Create instance: dpa_hier
  create_hier_cell_dpa_hier [current_bd_instance .] dpa_hier

  # Create instance: idelayctrl_inst, and set properties
  set idelayctrl_inst [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_idelay_ctrl:1.0 idelayctrl_inst ]

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:10.0 microblaze_0 ]
  set_property -dict [ list \
   CONFIG.C_ADDR_TAG_BITS {19} \
   CONFIG.C_AREA_OPTIMIZED {0} \
   CONFIG.C_CACHE_BYTE_SIZE {4096} \
   CONFIG.C_DCACHE_ADDR_TAG {19} \
   CONFIG.C_DCACHE_BYTE_SIZE {4096} \
   CONFIG.C_DCACHE_LINE_LEN {4} \
   CONFIG.C_DCACHE_USE_WRITEBACK {0} \
   CONFIG.C_DCACHE_VICTIMS {0} \
   CONFIG.C_DEBUG_ENABLED {1} \
   CONFIG.C_D_AXI {1} \
   CONFIG.C_ENABLE_DISCRETE_PORTS {0} \
   CONFIG.C_FSL_LINKS {1} \
   CONFIG.C_ICACHE_LINE_LEN {4} \
   CONFIG.C_ICACHE_STREAMS {0} \
   CONFIG.C_ICACHE_VICTIMS {0} \
   CONFIG.C_I_AXI {0} \
   CONFIG.C_MMU_DTLB_SIZE {2} \
   CONFIG.C_MMU_ITLB_SIZE {1} \
   CONFIG.C_MMU_ZONES {2} \
   CONFIG.C_USE_BARREL {1} \
   CONFIG.C_USE_BRANCH_TARGET_CACHE {1} \
   CONFIG.C_USE_DCACHE {1} \
   CONFIG.C_USE_DIV {1} \
   CONFIG.C_USE_EXTENDED_FSL_INSTR {1} \
   CONFIG.C_USE_FPU {2} \
   CONFIG.C_USE_HW_MUL {2} \
   CONFIG.C_USE_ICACHE {1} \
   CONFIG.C_USE_MMU {3} \
   CONFIG.C_USE_MSR_INSTR {1} \
   CONFIG.C_USE_PCMP_INSTR {1} \
   CONFIG.G_TEMPLATE_LIST {3} \
   CONFIG.G_USE_EXCEPTIONS {0} \
 ] $microblaze_0

  # Create instance: microblaze_0_axi_intc, and set properties
  set microblaze_0_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_0_axi_intc ]
  set_property -dict [ list \
   CONFIG.C_HAS_FAST {1} \
 ] $microblaze_0_axi_intc

  # Create instance: microblaze_0_axi_periph, and set properties
  set microblaze_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_0_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {17} \
   CONFIG.NUM_SI {1} \
   CONFIG.SYNCHRONIZATION_STAGES {2} \
 ] $microblaze_0_axi_periph

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory [current_bd_instance .] microblaze_0_local_memory

  # Create instance: microblaze_0_xlconcat, and set properties
  set microblaze_0_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_0_xlconcat ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {6} \
 ] $microblaze_0_xlconcat

  # Create instance: mig_7series_0, and set properties
  set mig_7series_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mig_7series:4.0 mig_7series_0 ]

  # Generate the PRJ File for MIG
  set str_mig_folder [get_property IP_DIR [ get_ips [ get_property CONFIG.Component_Name $mig_7series_0 ] ] ]
  set str_mig_file_name mig_b.prj
  set str_mig_file_path ${str_mig_folder}/${str_mig_file_name}

  write_mig_file_HDLC_DPA_mig_7series_0_0 $str_mig_file_path

  set_property -dict [ list \
   CONFIG.BOARD_MIG_PARAM {Custom} \
   CONFIG.MIG_DONT_TOUCH_PARAM {Custom} \
   CONFIG.RESET_BOARD_INTERFACE {reset} \
   CONFIG.XML_INPUT_FILE {mig_b.prj} \
 ] $mig_7series_0

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: proc_sys_reset_1, and set properties
  set proc_sys_reset_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_1 ]

  # Create instance: success_master, and set properties
  set success_master [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 success_master ]
  set_property -dict [ list \
   CONFIG.C_ALL_INPUTS {1} \
   CONFIG.C_GPIO_WIDTH {1} \
 ] $success_master

  # Create instance: trigger_logic_block
  create_hier_cell_trigger_logic_block [current_bd_instance .] trigger_logic_block

  # Create instance: xlconstant_3, and set properties
  set xlconstant_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_3 ]

  # Create interface connections
  connect_bd_intf_net -intf_net Receiver_logic_M_AXIS [get_bd_intf_pins FIFO/AXI_STR_RXD] [get_bd_intf_pins RXD/M_AXIS]
  connect_bd_intf_net -intf_net S_AXI_1 [get_bd_intf_pins microblaze_0_axi_periph/M16_AXI] [get_bd_intf_pins trigger_logic_block/S_AXI]
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_bram_porta [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_bram_portb [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTB] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTB]
  connect_bd_intf_net -intf_net axi_clock_converter_0_M_AXI [get_bd_intf_pins axi_clock_converter_0/M_AXI] [get_bd_intf_pins bit_slip/S_AXI]
  connect_bd_intf_net -intf_net axi_ethernet_0_dma_m_axi_mm2s [get_bd_intf_pins axi_ethernet_0_dma/M_AXI_MM2S] [get_bd_intf_pins axi_mem_intercon/S04_AXI]
  connect_bd_intf_net -intf_net axi_ethernet_0_dma_m_axi_s2mm [get_bd_intf_pins axi_ethernet_0_dma/M_AXI_S2MM] [get_bd_intf_pins axi_mem_intercon/S03_AXI]
  connect_bd_intf_net -intf_net axi_ethernet_0_dma_m_axi_sg [get_bd_intf_pins axi_ethernet_0_dma/M_AXI_SG] [get_bd_intf_pins axi_mem_intercon/S02_AXI]
  connect_bd_intf_net -intf_net axi_ethernet_0_dma_m_axis_cntrl [get_bd_intf_pins axi_ethernet_0/s_axis_txc] [get_bd_intf_pins axi_ethernet_0_dma/M_AXIS_CNTRL]
  connect_bd_intf_net -intf_net axi_ethernet_0_dma_m_axis_mm2s [get_bd_intf_pins axi_ethernet_0/s_axis_txd] [get_bd_intf_pins axi_ethernet_0_dma/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_ethernet_0_gmii [get_bd_intf_ports gmii] [get_bd_intf_pins axi_ethernet_0/gmii]
  connect_bd_intf_net -intf_net axi_ethernet_0_m_axis_rxd [get_bd_intf_pins axi_ethernet_0/m_axis_rxd] [get_bd_intf_pins axi_ethernet_0_dma/S_AXIS_S2MM]
  connect_bd_intf_net -intf_net axi_ethernet_0_m_axis_rxs [get_bd_intf_pins axi_ethernet_0/m_axis_rxs] [get_bd_intf_pins axi_ethernet_0_dma/S_AXIS_STS]
  connect_bd_intf_net -intf_net axi_ethernet_0_mdio1 [get_bd_intf_ports mdio_mdc] [get_bd_intf_pins axi_ethernet_0/mdio]
  connect_bd_intf_net -intf_net axi_iic_0_IIC [get_bd_intf_ports iic_main] [get_bd_intf_pins axi_iic_0/IIC]
  connect_bd_intf_net -intf_net axi_mem_intercon_m00_axi [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins mig_7series_0/S_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_m01_axi [get_bd_intf_pins axi_bram_ctrl_0/S_AXI] [get_bd_intf_pins axi_mem_intercon/M01_AXI]
  connect_bd_intf_net -intf_net axi_quad_spi_0_SPI_0 [get_bd_intf_ports spi_flash] [get_bd_intf_pins axi_quad_spi_0/SPI_0]
  connect_bd_intf_net -intf_net axi_uartlite_0_uart [get_bd_intf_ports rs232_uart] [get_bd_intf_pins axi_uartlite_0/UART]
  connect_bd_intf_net -intf_net mdm_1_MBDEBUG_0 [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DC [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins microblaze_0/M_AXI_DC]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_IC [get_bd_intf_pins axi_mem_intercon/S01_AXI] [get_bd_intf_pins microblaze_0/M_AXI_IC]
  connect_bd_intf_net -intf_net microblaze_0_axi_dp [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M05_AXI [get_bd_intf_pins FIFO/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M07_AXI [get_bd_intf_pins axi_iic_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M07_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M08_AXI [get_bd_intf_pins FIFO/S_AXI_FULL] [get_bd_intf_pins microblaze_0_axi_periph/M08_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M09_AXI [get_bd_intf_pins TXD/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M09_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M10_AXI [get_bd_intf_pins axi_clock_converter_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M10_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M11_AXI [get_bd_intf_pins RXD/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M11_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M12_AXI [get_bd_intf_pins axi_quad_spi_0/AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M12_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M13_AXI [get_bd_intf_pins dpa_hier/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M13_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M14_AXI [get_bd_intf_pins TXD/S_AXI1] [get_bd_intf_pins microblaze_0_axi_periph/M14_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M15_AXI [get_bd_intf_pins microblaze_0_axi_periph/M15_AXI] [get_bd_intf_pins success_master/S_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_m01_axi [get_bd_intf_pins axi_timer_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_m02_axi [get_bd_intf_pins axi_uartlite_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_m03_axi [get_bd_intf_pins axi_ethernet_0_dma/S_AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_m04_axi [get_bd_intf_pins axi_ethernet_0/s_axi] [get_bd_intf_pins microblaze_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_0_intc_axi [get_bd_intf_pins microblaze_0_axi_intc/s_axi] [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_interrupt [get_bd_intf_pins microblaze_0/INTERRUPT] [get_bd_intf_pins microblaze_0_axi_intc/interrupt]
  connect_bd_intf_net -intf_net mig_7series_0_ddr3 [get_bd_intf_ports DDR3] [get_bd_intf_pins mig_7series_0/DDR3]
  connect_bd_intf_net -intf_net output_fifo_AXI_STR_TXD [get_bd_intf_pins FIFO/AXI_STR_TXD] [get_bd_intf_pins TXD/S_AXIS]

  # Create port connections
  connect_bd_net -net BIST_END_0_1 [get_bd_ports BIST_END] [get_bd_pins TXD/BIST_END]
  connect_bd_net -net BIST_OK_0_1 [get_bd_ports BIST_OK] [get_bd_pins TXD/BIST_OK]
  connect_bd_net -net RXD_N_0_1 [get_bd_ports RXD_N] [get_bd_pins RXD/RXD_N]
  connect_bd_net -net RXD_P_0_1 [get_bd_ports RXD_P] [get_bd_pins RXD/RXD_P]
  connect_bd_net -net RXD_data_in_to_device [get_bd_pins RXD/data_in_to_device] [get_bd_pins dpa_hier/M_data]
  connect_bd_net -net RXD_success [get_bd_pins RXD/success] [get_bd_pins success_master/gpio_io_i]
  connect_bd_net -net Receiver_logic_gpio_io_o1 [get_bd_pins RXD/bitslip_ena] [get_bd_pins bit_slip/gpio_io_o]
  connect_bd_net -net S_data_1 [get_bd_pins RXD/data_in_to_device1] [get_bd_pins dpa_hier/S_data]
  connect_bd_net -net S_to_diff_0_out_n [get_bd_ports vfat3_txd_n] [get_bd_pins TXD/txd_n]
  connect_bd_net -net S_to_diff_0_out_p [get_bd_ports vfat3_txd_p] [get_bd_pins TXD/txd_p]
  connect_bd_net -net S_to_diff_1_out_n [get_bd_ports rxclk_n] [get_bd_pins S_to_diff_1/out_n]
  connect_bd_net -net S_to_diff_1_out_p [get_bd_ports rxclk_p] [get_bd_pins S_to_diff_1/out_p]
  connect_bd_net -net axi_ethernet_0_dma_mm2s_cntrl_reset_out_n [get_bd_pins axi_ethernet_0/axi_txc_arstn] [get_bd_pins axi_ethernet_0_dma/mm2s_cntrl_reset_out_n]
  connect_bd_net -net axi_ethernet_0_dma_mm2s_introut [get_bd_pins axi_ethernet_0_dma/mm2s_introut] [get_bd_pins microblaze_0_xlconcat/In2]
  connect_bd_net -net axi_ethernet_0_dma_mm2s_prmry_reset_out_n [get_bd_pins axi_ethernet_0/axi_txd_arstn] [get_bd_pins axi_ethernet_0_dma/mm2s_prmry_reset_out_n]
  connect_bd_net -net axi_ethernet_0_dma_s2mm_introut [get_bd_pins axi_ethernet_0_dma/s2mm_introut] [get_bd_pins microblaze_0_xlconcat/In1]
  connect_bd_net -net axi_ethernet_0_dma_s2mm_prmry_reset_out_n [get_bd_pins axi_ethernet_0/axi_rxd_arstn] [get_bd_pins axi_ethernet_0_dma/s2mm_prmry_reset_out_n]
  connect_bd_net -net axi_ethernet_0_dma_s2mm_sts_reset_out_n [get_bd_pins axi_ethernet_0/axi_rxs_arstn] [get_bd_pins axi_ethernet_0_dma/s2mm_sts_reset_out_n]
  connect_bd_net -net axi_ethernet_0_interrupt [get_bd_pins axi_ethernet_0/interrupt] [get_bd_pins microblaze_0_xlconcat/In0]
  connect_bd_net -net axi_ethernet_0_phy_rst_n [get_bd_ports phy_reset_out] [get_bd_pins axi_ethernet_0/phy_rst_n]
  connect_bd_net -net axi_iic_0_iic2intc_irpt [get_bd_pins axi_iic_0/iic2intc_irpt] [get_bd_pins microblaze_0_xlconcat/In5]
  connect_bd_net -net axi_timer_0_interrupt [get_bd_pins axi_timer_0/interrupt] [get_bd_pins microblaze_0_xlconcat/In4]
  connect_bd_net -net axi_uartlite_0_interrupt [get_bd_pins axi_uartlite_0/interrupt] [get_bd_pins microblaze_0_xlconcat/In3]
  connect_bd_net -net clk_320MHz [get_bd_pins RXD/clk_in] [get_bd_pins S_to_diff_1/sig_in] [get_bd_pins TXD/clk_in] [get_bd_pins clk_wiz_1/clk_out1] [get_bd_pins trigger_logic_block/clk_in]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins axi_ethernet_0/gtx_clk] [get_bd_pins axi_quad_spi_0/ext_spi_clk] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net clk_wiz_0_clk_out2 [get_bd_pins RXD/ref_clock] [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins idelayctrl_inst/ref_clk] [get_bd_pins trigger_logic_block/ref_clock]
  connect_bd_net -net data_in_from_pins_n_0_1 [get_bd_ports TU_TXD_N_FROM_VFAT3] [get_bd_pins trigger_logic_block/data_in_from_pins_n_0]
  connect_bd_net -net data_in_from_pins_n_1_1 [get_bd_ports TU_SOT_N_FROM_VFAT3] [get_bd_pins trigger_logic_block/data_in_from_pins_n_1]
  connect_bd_net -net data_in_from_pins_p_0_1 [get_bd_ports TU_TXD_P_FROM_VFAT3] [get_bd_pins trigger_logic_block/data_in_from_pins_p_0]
  connect_bd_net -net data_in_from_pins_p_1_1 [get_bd_ports TU_SOT_P_FROM_VFAT3] [get_bd_pins trigger_logic_block/data_in_from_pins_p_1]
  connect_bd_net -net dpa_hier_mtap_pre [get_bd_pins RXD/in_delay_tap_in1] [get_bd_pins dpa_hier/mtap_pre]
  connect_bd_net -net in_delay_tap_in2_1 [get_bd_pins RXD/in_delay_tap_in2] [get_bd_pins dpa_hier/stap_pre]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins proc_sys_reset_1/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins FIFO/s_axi_aclk] [get_bd_pins RXD/m_axis_aclk] [get_bd_pins TXD/s_axi_aclk] [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_clock_converter_0/s_axi_aclk] [get_bd_pins axi_ethernet_0/axis_clk] [get_bd_pins axi_ethernet_0/s_axi_lite_clk] [get_bd_pins axi_ethernet_0_dma/m_axi_mm2s_aclk] [get_bd_pins axi_ethernet_0_dma/m_axi_s2mm_aclk] [get_bd_pins axi_ethernet_0_dma/m_axi_sg_aclk] [get_bd_pins axi_ethernet_0_dma/s_axi_lite_aclk] [get_bd_pins axi_iic_0/s_axi_aclk] [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/M01_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_mem_intercon/S01_ACLK] [get_bd_pins axi_mem_intercon/S02_ACLK] [get_bd_pins axi_mem_intercon/S03_ACLK] [get_bd_pins axi_mem_intercon/S04_ACLK] [get_bd_pins axi_quad_spi_0/s_axi_aclk] [get_bd_pins axi_timer_0/s_axi_aclk] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins dpa_hier/s_axi_aclk] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_intc/processor_clk] [get_bd_pins microblaze_0_axi_intc/s_axi_aclk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/M02_ACLK] [get_bd_pins microblaze_0_axi_periph/M03_ACLK] [get_bd_pins microblaze_0_axi_periph/M04_ACLK] [get_bd_pins microblaze_0_axi_periph/M05_ACLK] [get_bd_pins microblaze_0_axi_periph/M06_ACLK] [get_bd_pins microblaze_0_axi_periph/M07_ACLK] [get_bd_pins microblaze_0_axi_periph/M08_ACLK] [get_bd_pins microblaze_0_axi_periph/M09_ACLK] [get_bd_pins microblaze_0_axi_periph/M10_ACLK] [get_bd_pins microblaze_0_axi_periph/M11_ACLK] [get_bd_pins microblaze_0_axi_periph/M12_ACLK] [get_bd_pins microblaze_0_axi_periph/M13_ACLK] [get_bd_pins microblaze_0_axi_periph/M14_ACLK] [get_bd_pins microblaze_0_axi_periph/M15_ACLK] [get_bd_pins microblaze_0_axi_periph/M16_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins mig_7series_0/ui_clk] [get_bd_pins proc_sys_reset_1/slowest_sync_clk] [get_bd_pins success_master/s_axi_aclk] [get_bd_pins trigger_logic_block/s_axi_aclk]
  connect_bd_net -net microblaze_0_intr [get_bd_pins microblaze_0_axi_intc/intr] [get_bd_pins microblaze_0_xlconcat/dout]
  connect_bd_net -net mig_7series_0_mmcm_locked [get_bd_pins mig_7series_0/mmcm_locked] [get_bd_pins proc_sys_reset_0/dcm_locked] [get_bd_pins proc_sys_reset_1/dcm_locked]
  connect_bd_net -net mig_7series_0_ui_addn_clk_0 [get_bd_pins axi_ethernet_0/ref_clk] [get_bd_pins mig_7series_0/ui_addn_clk_0]
  connect_bd_net -net mig_7series_0_ui_addn_clk_1 [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins clk_wiz_1/clk_in1] [get_bd_pins mig_7series_0/ui_addn_clk_1]
  connect_bd_net -net mig_7series_0_ui_addn_clk_2 [get_bd_pins RXD/clk40] [get_bd_pins TXD/clk_40] [get_bd_pins axi_clock_converter_0/m_axi_aclk] [get_bd_pins bit_slip/s_axi_aclk] [get_bd_pins dpa_hier/s00_axi_aclk] [get_bd_pins mig_7series_0/ui_addn_clk_2] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins trigger_logic_block/clk_div_in]
  connect_bd_net -net mig_7series_0_ui_clk_sync_rst [get_bd_pins mig_7series_0/ui_clk_sync_rst] [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins proc_sys_reset_1/ext_reset_in]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins RXD/s00_axi_aresetn_40MHz] [get_bd_pins TXD/aresetn_40MHz] [get_bd_pins axi_clock_converter_0/m_axi_aresetn] [get_bd_pins bit_slip/s_axi_aresetn] [get_bd_pins dpa_hier/s00_axi_aresetn] [get_bd_pins proc_sys_reset_0/interconnect_aresetn] [get_bd_pins trigger_logic_block/m_axi_aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins trigger_logic_block/io_reset_n]
  connect_bd_net -net proc_sys_reset_0_peripheral_reset [get_bd_pins RXD/io_reset] [get_bd_pins idelayctrl_inst/rst] [get_bd_pins proc_sys_reset_0/peripheral_reset]
  connect_bd_net -net proc_sys_reset_1_bus_struct_reset [get_bd_pins microblaze_0_local_memory/LMB_Rst] [get_bd_pins proc_sys_reset_1/bus_struct_reset]
  connect_bd_net -net proc_sys_reset_1_interconnect_aresetn [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins proc_sys_reset_1/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_1_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins microblaze_0_axi_intc/processor_rst] [get_bd_pins proc_sys_reset_1/mb_reset]
  connect_bd_net -net proc_sys_reset_1_peripheral_aresetn [get_bd_pins FIFO/s_axi_aresetn] [get_bd_pins RXD/rst_n] [get_bd_pins TXD/rst_n] [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axi_clock_converter_0/s_axi_aresetn] [get_bd_pins axi_ethernet_0/s_axi_lite_resetn] [get_bd_pins axi_ethernet_0_dma/axi_resetn] [get_bd_pins axi_iic_0/s_axi_aresetn] [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/M01_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_mem_intercon/S01_ARESETN] [get_bd_pins axi_mem_intercon/S02_ARESETN] [get_bd_pins axi_mem_intercon/S03_ARESETN] [get_bd_pins axi_mem_intercon/S04_ARESETN] [get_bd_pins axi_quad_spi_0/s_axi_aresetn] [get_bd_pins axi_timer_0/s_axi_aresetn] [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins dpa_hier/s_axi_aresetn] [get_bd_pins microblaze_0_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M02_ARESETN] [get_bd_pins microblaze_0_axi_periph/M03_ARESETN] [get_bd_pins microblaze_0_axi_periph/M04_ARESETN] [get_bd_pins microblaze_0_axi_periph/M05_ARESETN] [get_bd_pins microblaze_0_axi_periph/M06_ARESETN] [get_bd_pins microblaze_0_axi_periph/M07_ARESETN] [get_bd_pins microblaze_0_axi_periph/M08_ARESETN] [get_bd_pins microblaze_0_axi_periph/M09_ARESETN] [get_bd_pins microblaze_0_axi_periph/M10_ARESETN] [get_bd_pins microblaze_0_axi_periph/M11_ARESETN] [get_bd_pins microblaze_0_axi_periph/M12_ARESETN] [get_bd_pins microblaze_0_axi_periph/M13_ARESETN] [get_bd_pins microblaze_0_axi_periph/M14_ARESETN] [get_bd_pins microblaze_0_axi_periph/M15_ARESETN] [get_bd_pins microblaze_0_axi_periph/M16_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins mig_7series_0/aresetn] [get_bd_pins proc_sys_reset_1/peripheral_aresetn] [get_bd_pins success_master/s_axi_aresetn] [get_bd_pins trigger_logic_block/s_axi_aresetn]
  connect_bd_net -net reset_1 [get_bd_ports reset] [get_bd_pins clk_wiz_0/reset] [get_bd_pins clk_wiz_1/reset] [get_bd_pins mig_7series_0/sys_rst]
  connect_bd_net -net sys_clk_n_1 [get_bd_ports sys_clk_n] [get_bd_pins mig_7series_0/sys_clk_n]
  connect_bd_net -net sys_clk_p_1 [get_bd_ports sys_clk_p] [get_bd_pins mig_7series_0/sys_clk_p]
  connect_bd_net -net tx_controller_hier_BIST_START_0 [get_bd_ports BIST_START] [get_bd_pins TXD/BIST_START]
  connect_bd_net -net tx_controller_hier_CALIB_ADC_ADDR [get_bd_ports CALIB_ADC_ADDR] [get_bd_pins TXD/CALIB_ADC_ADDR]
  connect_bd_net -net tx_controller_hier_EXT_RST [get_bd_ports EXT_RST] [get_bd_pins TXD/EXT_RST]
  connect_bd_net -net tx_controller_hier_PS_ADC_ADDR [get_bd_ports PS_ADC_ADDR] [get_bd_pins TXD/PS_ADC_ADDR]
  connect_bd_net -net xlconstant_3_dout [get_bd_pins RXD/reverse] [get_bd_pins xlconstant_3/dout]

  # Create address segments
  create_bd_addr_seg -range 0x00010000 -offset 0xC0000000 [get_bd_addr_spaces axi_ethernet_0_dma/Data_SG] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x00010000 -offset 0xC0000000 [get_bd_addr_spaces axi_ethernet_0_dma/Data_MM2S] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x00010000 -offset 0xC0000000 [get_bd_addr_spaces axi_ethernet_0_dma/Data_S2MM] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces axi_ethernet_0_dma/Data_SG] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces axi_ethernet_0_dma/Data_MM2S] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces axi_ethernet_0_dma/Data_S2MM] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x00010000 -offset 0x44A00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs FIFO/S_AXI/Mem0] SEG_FIFO_Mem0
  create_bd_addr_seg -range 0x00010000 -offset 0x44A10000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs FIFO/S_AXI_FULL/Mem1] SEG_FIFO_Mem1
  create_bd_addr_seg -range 0x00010000 -offset 0x44A20000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs TXD/SC_try_v1_0_0/s00_axi/reg0] SEG_SC_try_v1_0_0_reg0
  create_bd_addr_seg -range 0x00010000 -offset 0x44A50000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs TXD/tx_controller/TX_CONTROLLER_SCURVE_0/s00_axi/reg0] SEG_TX_CONTROLLER_SCURVE_0_reg0
  create_bd_addr_seg -range 0x00010000 -offset 0x44A70000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs trigger_logic_block/Trigger_Bits_Controller_0/S00_AXI/S00_AXI_reg] SEG_Trigger_Bits_Controller_0_S00_AXI_reg
  create_bd_addr_seg -range 0x00010000 -offset 0xC0000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x00010000 -offset 0xC0000000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x00040000 -offset 0x40C00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_ethernet_0/s_axi/Reg0] SEG_axi_ethernet_0_Reg0
  create_bd_addr_seg -range 0x00010000 -offset 0x41E00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_ethernet_0_dma/S_AXI_LITE/Reg] SEG_axi_ethernet_0_dma_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40800000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_iic_0/S_AXI/Reg] SEG_axi_iic_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A40000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_quad_spi_0/AXI_LITE/Reg] SEG_axi_quad_spi_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41C00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_timer_0/S_AXI/Reg] SEG_axi_timer_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40600000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40040000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs bit_slip/S_AXI/Reg] SEG_bit_slip_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x00000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00010000 -offset 0x44A60000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs dpa_hier/dpa_controller_v1_0_0/s00_axi/reg0] SEG_dpa_controller_v1_0_0_reg0
  create_bd_addr_seg -range 0x00010000 -offset 0x00000000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00010000 -offset 0x41200000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_axi_intc/S_AXI/Reg] SEG_microblaze_0_axi_intc_Reg
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x00010000 -offset 0x44A30000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs RXD/rx_controller_SCURVE/s00_axi/reg0] SEG_rx_controller_SCURVE_reg0
  create_bd_addr_seg -range 0x00010000 -offset 0x40010000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs success_master/S_AXI/Reg] SEG_success_master_Reg


  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


