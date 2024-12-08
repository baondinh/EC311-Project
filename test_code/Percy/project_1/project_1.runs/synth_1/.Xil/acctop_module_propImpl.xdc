set_property SRC_FILE_INFO {cfile:X:/EC311-Project/test_code/Bao/accelerometer/const_accelerometer.xdc rfile:../../../../../Bao/accelerometer/const_accelerometer.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:2 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports {  iclk }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
set_property src_info {type:XDC file:1 line:6 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { tilt_y[0] }]; #IO_L18P_T2_A24_15 Sch=led[0]
set_property src_info {type:XDC file:1 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { tilt_y[1] }]; #IO_L24P_T3_RS1_15 Sch=led[1]
set_property src_info {type:XDC file:1 line:12 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E15   IOSTANDARD LVCMOS33 } [get_ports { miso }]; #IO_L11P_T1_SRCC_15 Sch=acl_miso
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN F14   IOSTANDARD LVCMOS33 } [get_ports { mosi }]; #IO_L5N_T0_AD9N_15 Sch=acl_mosi
set_property src_info {type:XDC file:1 line:14 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN F15   IOSTANDARD LVCMOS33 } [get_ports { sclk }]; #IO_L14P_T2_SRCC_15 Sch=acl_sclk
set_property src_info {type:XDC file:1 line:15 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D15   IOSTANDARD LVCMOS33 } [get_ports {cs}]; #IO_L12P_T1_MRCC_15 Sch=acl_csn
