#Read All Files
read_file -format verilog  QR_CORDIC.v
current_design QR_CORDIC
link

#Setting Clock Constraints
source -echo -verbose QR_CORDIC.sdc
check_design
set high_fanout_net_threshold 0
uniquify
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]

#Synthesis all design
#compile -map_effort high -area_effort high
#compile -map_effort high -area_effort high -inc
compile

write -format ddc     -hierarchy -output "QR_CORDIC_syn.ddc"
write_sdf -version 1.0  QR_CORDIC_syn.sdf
write -format verilog -hierarchy -output QR_CORDIC_syn.v
report_area > area.log
report_timing > timing.log
report_qor   >  QR_CORDIC_syn.qor
