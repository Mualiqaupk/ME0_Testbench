webtalk_init -webtalk_dir D:\\practical_work\\CERN_Related\\VFAT3_Testbench\\ME0\\VBV3_ME0_Flash1\\VBV3_HDLC_FIXED.sdk\\webtalk
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "2024-09-10 13:03:47" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "SDK v2017.4" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2017.4" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "amd64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "210713503_174110358_210770452_626" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "SDK" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "false" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "qv9c32g8c6g9ca99qjspi837eq" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "2017.4_46" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "46" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Microsoft Windows 8 or later , 64-bit" -context "user_environment"
webtalk_add_data -client project -key os_release -value "major release  (build 9200)" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "AMD Ryzen 7 5825U with Radeon Graphics         " -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "1996 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "41.690 GB" -context "user_environment"
webtalk_register_client -client sdk
webtalk_add_data -client sdk -key uid -value "1725955265093" -context "sdk\\\\hardware/1725955265093"
webtalk_add_data -client sdk -key isZynq -value "false" -context "sdk\\\\hardware/1725955265093"
webtalk_add_data -client sdk -key isZynqMP -value "false" -context "sdk\\\\hardware/1725955265093"
webtalk_add_data -client sdk -key Processors -value "1" -context "sdk\\\\hardware/1725955265093"
webtalk_add_data -client sdk -key VivadoVersion -value "2017.4" -context "sdk\\\\hardware/1725955265093"
webtalk_add_data -client sdk -key Arch -value "kintex7" -context "sdk\\\\hardware/1725955265093"
webtalk_add_data -client sdk -key Device -value "7k325t" -context "sdk\\\\hardware/1725955265093"
webtalk_add_data -client sdk -key IsHandoff -value "true" -context "sdk\\\\hardware/1725955265093"
webtalk_add_data -client sdk -key os -value "NA" -context "sdk\\\\hardware/1725955265093"
webtalk_add_data -client sdk -key apptemplate -value "NA" -context "sdk\\\\hardware/1725955265093"
webtalk_add_data -client sdk -key RecordType -value "HWCreation" -context "sdk\\\\hardware/1725955265093"
webtalk_add_data -client sdk -key uid -value "NA" -context "sdk\\\\bsp/1725955427712"
webtalk_add_data -client sdk -key RecordType -value "ToolUsage" -context "sdk\\\\bsp/1725955427712"
webtalk_add_data -client sdk -key BootgenCount -value "0" -context "sdk\\\\bsp/1725955427712"
webtalk_add_data -client sdk -key DebugCount -value "0" -context "sdk\\\\bsp/1725955427712"
webtalk_add_data -client sdk -key PerfCount -value "0" -context "sdk\\\\bsp/1725955427712"
webtalk_add_data -client sdk -key FlashCount -value "0" -context "sdk\\\\bsp/1725955427712"
webtalk_add_data -client sdk -key CrossTriggCount -value "0" -context "sdk\\\\bsp/1725955427712"
webtalk_add_data -client sdk -key QemuDebugCount -value "0" -context "sdk\\\\bsp/1725955427712"
webtalk_transmit -clientid 158293214 -regid "210713503_174110358_210770452_626" -xml D:\\practical_work\\CERN_Related\\VFAT3_Testbench\\ME0\\VBV3_ME0_Flash1\\VBV3_HDLC_FIXED.sdk\\webtalk\\usage_statistics_ext_sdk.xml -html D:\\practical_work\\CERN_Related\\VFAT3_Testbench\\ME0\\VBV3_ME0_Flash1\\VBV3_HDLC_FIXED.sdk\\webtalk\\usage_statistics_ext_sdk.html -wdm D:\\practical_work\\CERN_Related\\VFAT3_Testbench\\ME0\\VBV3_ME0_Flash1\\VBV3_HDLC_FIXED.sdk\\webtalk\\sdk_webtalk.wdm -intro "<H3>SDK Usage Report</H3><BR>"
webtalk_terminate
