## 12 MHz Clock
set_property -dict {PACKAGE_PIN F14 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 83.333 -name clk12mhz [get_ports clk]
## Switches
set_property -dict {PACKAGE_PIN H14 IOSTANDARD LVCMOS33} [get_ports {sw[0]}]
set_property -dict {PACKAGE_PIN H18 IOSTANDARD LVCMOS33} [get_ports {sw[1]}]
set_property -dict {PACKAGE_PIN G18 IOSTANDARD LVCMOS33} [get_ports {sw[2]}]
set_property -dict {PACKAGE_PIN M5 IOSTANDARD SSTL135} [get_ports {sw[3]}]

## Buttons
set_property -dict {PACKAGE_PIN G15 IOSTANDARD LVCMOS33} [get_ports btn_write]
set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33} [get_ports btn_single]
set_property -dict {PACKAGE_PIN J16 IOSTANDARD LVCMOS33} [get_ports btn_double]

## LEDs
set_property -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS33} [get_ports led_single]
set_property -dict {PACKAGE_PIN F13 IOSTANDARD LVCMOS33} [get_ports led_double]
set_property -dict {PACKAGE_PIN E13 IOSTANDARD LVCMOS33} [get_ports led_status]
set_property -dict {PACKAGE_PIN H15 IOSTANDARD LVCMOS33} [get_ports led_data]
set_property INTERNAL_VREF 0.675 [get_iobanks 34]