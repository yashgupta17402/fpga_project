
# Clock signal
set_property PACKAGE_PIN W5 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports clock]
create_clock -add -name sys_clock_pin -period 10.00 -waveform {0 5} [get_ports clock]

######################################################### sel_modules  #######################################################
set_property PACKAGE_PIN V17 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

set_property PACKAGE_PIN V16 [get_ports {sel_module[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sel_module[0]}]

set_property PACKAGE_PIN W16 [get_ports {sel_module[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sel_module[1]}]


set_property PACKAGE_PIN W14 [get_ports {val[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {val[0]}]
set_property PACKAGE_PIN W13 [get_ports {val[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {val[1]}]

set_property PACKAGE_PIN V2 [get_ports {val[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {val[2]}]


set_property PACKAGE_PIN T3 [get_ports {val[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {val[3]}]
set_property PACKAGE_PIN T2 [get_ports {val[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {val[4]}]
set_property PACKAGE_PIN R3 [get_ports {val[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {val[5]}]
set_property PACKAGE_PIN W2 [get_ports {val[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {val[6]}]
set_property PACKAGE_PIN U1 [get_ports {val[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {val[7]}]

##VGA Connector
set_property PACKAGE_PIN G19 [get_ports {red[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[0]}]
set_property PACKAGE_PIN H19 [get_ports {red[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[1]}]
set_property PACKAGE_PIN J19 [get_ports {red[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[2]}]
set_property PACKAGE_PIN N19 [get_ports {red[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {red[3]}]
set_property PACKAGE_PIN N18 [get_ports {blue[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[0]}]
set_property PACKAGE_PIN L18 [get_ports {blue[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[1]}]
set_property PACKAGE_PIN K18 [get_ports {blue[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[2]}]
set_property PACKAGE_PIN J18 [get_ports {blue[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {blue[3]}]
set_property PACKAGE_PIN J17 [get_ports {green[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[0]}]
set_property PACKAGE_PIN H17 [get_ports {green[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[1]}]
set_property PACKAGE_PIN G17 [get_ports {green[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[2]}]
set_property PACKAGE_PIN D17 [get_ports {green[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {green[3]}]
set_property PACKAGE_PIN P19 [get_ports hsync]
set_property IOSTANDARD LVCMOS33 [get_ports hsync]
set_property PACKAGE_PIN R19 [get_ports vsync]
set_property IOSTANDARD LVCMOS33 [get_ports vsync]




set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
