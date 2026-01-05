## Clock
set_property PACKAGE_PIN W5 [get_ports clk100MHz]
set_property IOSTANDARD LVCMOS33 [get_ports clk100MHz]
create_clock -period 10.000 -name sys_clk [get_ports clk100MHz]

## Buttons
## Reset button (BTNC)
set_property PACKAGE_PIN U18 [get_ports reset]
set_property IOSTANDARD LVCMOS33 [get_ports reset]

## Pedestrian button (BTNU)
set_property PACKAGE_PIN T18 [get_ports ped_btn]
set_property IOSTANDARD LVCMOS33 [get_ports ped_btn]

## LEDs
## LD0 = Green
set_property PACKAGE_PIN U16 [get_ports {leds[0]}]
## LD1 = Yellow
set_property PACKAGE_PIN E19 [get_ports {leds[1]}]
## LD2 = Red
set_property PACKAGE_PIN U19 [get_ports {leds[2]}]
## LD3 = Pedestrian LED (RIGHTMOST LED)
set_property PACKAGE_PIN V19 [get_ports ped_led]
## All LEDs use 3.3V
set_property IOSTANDARD LVCMOS33 [get_ports {leds[*] ped_led}]

## 7-Segment Display
## Segments a–g
set_property PACKAGE_PIN W7 [get_ports {seg[0]}]
set_property PACKAGE_PIN W6 [get_ports {seg[1]}]
set_property PACKAGE_PIN U8 [get_ports {seg[2]}]
set_property PACKAGE_PIN V8 [get_ports {seg[3]}]
set_property PACKAGE_PIN U5 [get_ports {seg[4]}]
set_property PACKAGE_PIN V5 [get_ports {seg[5]}]
set_property PACKAGE_PIN U7 [get_ports {seg[6]}]

set_property IOSTANDARD LVCMOS33 [get_ports {seg[*]}]

## Anodes
set_property PACKAGE_PIN U2 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]

set_property IOSTANDARD LVCMOS33 [get_ports {an[*]}]
