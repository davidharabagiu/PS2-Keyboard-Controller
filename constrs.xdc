#clock
set_property PACKAGE_PIN W5 [get_ports C]							
set_property IOSTANDARD LVCMOS33 [get_ports C]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports C]

#LEDs
set_property PACKAGE_PIN W7 [get_ports Q[6]]					
set_property IOSTANDARD LVCMOS33 [get_ports Q[6]]
set_property PACKAGE_PIN W6 [get_ports Q[4]]                    
set_property IOSTANDARD LVCMOS33 [get_ports Q[4]]
set_property PACKAGE_PIN U8 [get_ports Q[1]]                    
set_property IOSTANDARD LVCMOS33 [get_ports Q[1]]
set_property PACKAGE_PIN V8 [get_ports Q[0]]                    
set_property IOSTANDARD LVCMOS33 [get_ports Q[0]]
set_property PACKAGE_PIN U5 [get_ports Q[2]]                    
set_property IOSTANDARD LVCMOS33 [get_ports Q[2]]
set_property PACKAGE_PIN V5 [get_ports Q[5]]                    
set_property IOSTANDARD LVCMOS33 [get_ports Q[5]]
set_property PACKAGE_PIN U7 [get_ports Q[3]]                    
set_property IOSTANDARD LVCMOS33 [get_ports Q[3]]

#DOT LED
set_property PACKAGE_PIN V7 [get_ports Q[7]]							
set_property IOSTANDARD LVCMOS33 [get_ports Q[7]]

#LEDs enable        
set_property PACKAGE_PIN U2 [get_ports AN[0]]					
set_property IOSTANDARD LVCMOS33 [get_ports AN[0]]
set_property PACKAGE_PIN U4 [get_ports AN[1]]                    
set_property IOSTANDARD LVCMOS33 [get_ports AN[1]]
set_property PACKAGE_PIN V4 [get_ports AN[2]]                    
set_property IOSTANDARD LVCMOS33 [get_ports AN[2]]
set_property PACKAGE_PIN W4 [get_ports AN[3]]                    
set_property IOSTANDARD LVCMOS33 [get_ports AN[3]]

#keyboard       
set_property PACKAGE_PIN C17 [get_ports KB_CLOCK]						
set_property IOSTANDARD LVCMOS33 [get_ports KB_CLOCK]
set_property PULLUP true [get_ports KB_CLOCK]
set_property PACKAGE_PIN B17 [get_ports KB_DATA]                    
set_property IOSTANDARD LVCMOS33 [get_ports KB_DATA]    
set_property PULLUP true [get_ports KB_DATA]

#clear button          
set_property PACKAGE_PIN U18 [get_ports CLR]						
set_property IOSTANDARD LVCMOS33 [get_ports CLR]