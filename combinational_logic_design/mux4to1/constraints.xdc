# Basic I/O standards (if targeting hardware)
set_property IOSTANDARD LVCMOS33 [get_ports {D[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports {S[*]}]
set_property IOSTANDARD LVCMOS33 [get_ports Y]

# Prevent optimization of unused signals 
set_property KEEP true [get_nets {D[*] S[*] Y}]
