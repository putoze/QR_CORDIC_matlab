###################################################################

# Created by write_sdc on Mon Dec  5 15:01:24 2022

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions slow -library slow
set_wire_load_model -name tsmc13_wl10 -library slow
set_load -pin_load 1 [get_ports out_vallid]
set_load -pin_load 1 [get_ports {out[51]}]
set_load -pin_load 1 [get_ports {out[50]}]
set_load -pin_load 1 [get_ports {out[49]}]
set_load -pin_load 1 [get_ports {out[48]}]
set_load -pin_load 1 [get_ports {out[47]}]
set_load -pin_load 1 [get_ports {out[46]}]
set_load -pin_load 1 [get_ports {out[45]}]
set_load -pin_load 1 [get_ports {out[44]}]
set_load -pin_load 1 [get_ports {out[43]}]
set_load -pin_load 1 [get_ports {out[42]}]
set_load -pin_load 1 [get_ports {out[41]}]
set_load -pin_load 1 [get_ports {out[40]}]
set_load -pin_load 1 [get_ports {out[39]}]
set_load -pin_load 1 [get_ports {out[38]}]
set_load -pin_load 1 [get_ports {out[37]}]
set_load -pin_load 1 [get_ports {out[36]}]
set_load -pin_load 1 [get_ports {out[35]}]
set_load -pin_load 1 [get_ports {out[34]}]
set_load -pin_load 1 [get_ports {out[33]}]
set_load -pin_load 1 [get_ports {out[32]}]
set_load -pin_load 1 [get_ports {out[31]}]
set_load -pin_load 1 [get_ports {out[30]}]
set_load -pin_load 1 [get_ports {out[29]}]
set_load -pin_load 1 [get_ports {out[28]}]
set_load -pin_load 1 [get_ports {out[27]}]
set_load -pin_load 1 [get_ports {out[26]}]
set_load -pin_load 1 [get_ports {out[25]}]
set_load -pin_load 1 [get_ports {out[24]}]
set_load -pin_load 1 [get_ports {out[23]}]
set_load -pin_load 1 [get_ports {out[22]}]
set_load -pin_load 1 [get_ports {out[21]}]
set_load -pin_load 1 [get_ports {out[20]}]
set_load -pin_load 1 [get_ports {out[19]}]
set_load -pin_load 1 [get_ports {out[18]}]
set_load -pin_load 1 [get_ports {out[17]}]
set_load -pin_load 1 [get_ports {out[16]}]
set_load -pin_load 1 [get_ports {out[15]}]
set_load -pin_load 1 [get_ports {out[14]}]
set_load -pin_load 1 [get_ports {out[13]}]
set_load -pin_load 1 [get_ports {out[12]}]
set_load -pin_load 1 [get_ports {out[11]}]
set_load -pin_load 1 [get_ports {out[10]}]
set_load -pin_load 1 [get_ports {out[9]}]
set_load -pin_load 1 [get_ports {out[8]}]
set_load -pin_load 1 [get_ports {out[7]}]
set_load -pin_load 1 [get_ports {out[6]}]
set_load -pin_load 1 [get_ports {out[5]}]
set_load -pin_load 1 [get_ports {out[4]}]
set_load -pin_load 1 [get_ports {out[3]}]
set_load -pin_load 1 [get_ports {out[2]}]
set_load -pin_load 1 [get_ports {out[1]}]
set_load -pin_load 1 [get_ports {out[0]}]
set_max_fanout 20 [get_ports clk]
set_max_fanout 20 [get_ports rst_n]
set_max_fanout 20 [get_ports valid]
set_max_fanout 20 [get_ports {in[51]}]
set_max_fanout 20 [get_ports {in[50]}]
set_max_fanout 20 [get_ports {in[49]}]
set_max_fanout 20 [get_ports {in[48]}]
set_max_fanout 20 [get_ports {in[47]}]
set_max_fanout 20 [get_ports {in[46]}]
set_max_fanout 20 [get_ports {in[45]}]
set_max_fanout 20 [get_ports {in[44]}]
set_max_fanout 20 [get_ports {in[43]}]
set_max_fanout 20 [get_ports {in[42]}]
set_max_fanout 20 [get_ports {in[41]}]
set_max_fanout 20 [get_ports {in[40]}]
set_max_fanout 20 [get_ports {in[39]}]
set_max_fanout 20 [get_ports {in[38]}]
set_max_fanout 20 [get_ports {in[37]}]
set_max_fanout 20 [get_ports {in[36]}]
set_max_fanout 20 [get_ports {in[35]}]
set_max_fanout 20 [get_ports {in[34]}]
set_max_fanout 20 [get_ports {in[33]}]
set_max_fanout 20 [get_ports {in[32]}]
set_max_fanout 20 [get_ports {in[31]}]
set_max_fanout 20 [get_ports {in[30]}]
set_max_fanout 20 [get_ports {in[29]}]
set_max_fanout 20 [get_ports {in[28]}]
set_max_fanout 20 [get_ports {in[27]}]
set_max_fanout 20 [get_ports {in[26]}]
set_max_fanout 20 [get_ports {in[25]}]
set_max_fanout 20 [get_ports {in[24]}]
set_max_fanout 20 [get_ports {in[23]}]
set_max_fanout 20 [get_ports {in[22]}]
set_max_fanout 20 [get_ports {in[21]}]
set_max_fanout 20 [get_ports {in[20]}]
set_max_fanout 20 [get_ports {in[19]}]
set_max_fanout 20 [get_ports {in[18]}]
set_max_fanout 20 [get_ports {in[17]}]
set_max_fanout 20 [get_ports {in[16]}]
set_max_fanout 20 [get_ports {in[15]}]
set_max_fanout 20 [get_ports {in[14]}]
set_max_fanout 20 [get_ports {in[13]}]
set_max_fanout 20 [get_ports {in[12]}]
set_max_fanout 20 [get_ports {in[11]}]
set_max_fanout 20 [get_ports {in[10]}]
set_max_fanout 20 [get_ports {in[9]}]
set_max_fanout 20 [get_ports {in[8]}]
set_max_fanout 20 [get_ports {in[7]}]
set_max_fanout 20 [get_ports {in[6]}]
set_max_fanout 20 [get_ports {in[5]}]
set_max_fanout 20 [get_ports {in[4]}]
set_max_fanout 20 [get_ports {in[3]}]
set_max_fanout 20 [get_ports {in[2]}]
set_max_fanout 20 [get_ports {in[1]}]
set_max_fanout 20 [get_ports {in[0]}]
create_clock [get_ports clk]  -period 12  -waveform {0 6}
set_clock_latency 0.5  [get_clocks clk]
set_clock_uncertainty 0.1  [get_clocks clk]
set_max_delay 12  -from [list [get_ports clk] [get_ports rst_n] [get_ports valid] [get_ports    \
{in[51]}] [get_ports {in[50]}] [get_ports {in[49]}] [get_ports {in[48]}]       \
[get_ports {in[47]}] [get_ports {in[46]}] [get_ports {in[45]}] [get_ports      \
{in[44]}] [get_ports {in[43]}] [get_ports {in[42]}] [get_ports {in[41]}]       \
[get_ports {in[40]}] [get_ports {in[39]}] [get_ports {in[38]}] [get_ports      \
{in[37]}] [get_ports {in[36]}] [get_ports {in[35]}] [get_ports {in[34]}]       \
[get_ports {in[33]}] [get_ports {in[32]}] [get_ports {in[31]}] [get_ports      \
{in[30]}] [get_ports {in[29]}] [get_ports {in[28]}] [get_ports {in[27]}]       \
[get_ports {in[26]}] [get_ports {in[25]}] [get_ports {in[24]}] [get_ports      \
{in[23]}] [get_ports {in[22]}] [get_ports {in[21]}] [get_ports {in[20]}]       \
[get_ports {in[19]}] [get_ports {in[18]}] [get_ports {in[17]}] [get_ports      \
{in[16]}] [get_ports {in[15]}] [get_ports {in[14]}] [get_ports {in[13]}]       \
[get_ports {in[12]}] [get_ports {in[11]}] [get_ports {in[10]}] [get_ports      \
{in[9]}] [get_ports {in[8]}] [get_ports {in[7]}] [get_ports {in[6]}]           \
[get_ports {in[5]}] [get_ports {in[4]}] [get_ports {in[3]}] [get_ports         \
{in[2]}] [get_ports {in[1]}] [get_ports {in[0]}]]  -to [list [get_ports out_vallid] [get_ports {out[51]}] [get_ports {out[50]}]  \
[get_ports {out[49]}] [get_ports {out[48]}] [get_ports {out[47]}] [get_ports   \
{out[46]}] [get_ports {out[45]}] [get_ports {out[44]}] [get_ports {out[43]}]   \
[get_ports {out[42]}] [get_ports {out[41]}] [get_ports {out[40]}] [get_ports   \
{out[39]}] [get_ports {out[38]}] [get_ports {out[37]}] [get_ports {out[36]}]   \
[get_ports {out[35]}] [get_ports {out[34]}] [get_ports {out[33]}] [get_ports   \
{out[32]}] [get_ports {out[31]}] [get_ports {out[30]}] [get_ports {out[29]}]   \
[get_ports {out[28]}] [get_ports {out[27]}] [get_ports {out[26]}] [get_ports   \
{out[25]}] [get_ports {out[24]}] [get_ports {out[23]}] [get_ports {out[22]}]   \
[get_ports {out[21]}] [get_ports {out[20]}] [get_ports {out[19]}] [get_ports   \
{out[18]}] [get_ports {out[17]}] [get_ports {out[16]}] [get_ports {out[15]}]   \
[get_ports {out[14]}] [get_ports {out[13]}] [get_ports {out[12]}] [get_ports   \
{out[11]}] [get_ports {out[10]}] [get_ports {out[9]}] [get_ports {out[8]}]     \
[get_ports {out[7]}] [get_ports {out[6]}] [get_ports {out[5]}] [get_ports      \
{out[4]}] [get_ports {out[3]}] [get_ports {out[2]}] [get_ports {out[1]}]       \
[get_ports {out[0]}]]
set_input_delay -clock clk  6  [get_ports clk]
set_input_delay -clock clk  0  [get_ports rst_n]
set_input_delay -clock clk  6  [get_ports valid]
set_input_delay -clock clk  6  [get_ports {in[51]}]
set_input_delay -clock clk  6  [get_ports {in[50]}]
set_input_delay -clock clk  6  [get_ports {in[49]}]
set_input_delay -clock clk  6  [get_ports {in[48]}]
set_input_delay -clock clk  6  [get_ports {in[47]}]
set_input_delay -clock clk  6  [get_ports {in[46]}]
set_input_delay -clock clk  6  [get_ports {in[45]}]
set_input_delay -clock clk  6  [get_ports {in[44]}]
set_input_delay -clock clk  6  [get_ports {in[43]}]
set_input_delay -clock clk  6  [get_ports {in[42]}]
set_input_delay -clock clk  6  [get_ports {in[41]}]
set_input_delay -clock clk  6  [get_ports {in[40]}]
set_input_delay -clock clk  6  [get_ports {in[39]}]
set_input_delay -clock clk  6  [get_ports {in[38]}]
set_input_delay -clock clk  6  [get_ports {in[37]}]
set_input_delay -clock clk  6  [get_ports {in[36]}]
set_input_delay -clock clk  6  [get_ports {in[35]}]
set_input_delay -clock clk  6  [get_ports {in[34]}]
set_input_delay -clock clk  6  [get_ports {in[33]}]
set_input_delay -clock clk  6  [get_ports {in[32]}]
set_input_delay -clock clk  6  [get_ports {in[31]}]
set_input_delay -clock clk  6  [get_ports {in[30]}]
set_input_delay -clock clk  6  [get_ports {in[29]}]
set_input_delay -clock clk  6  [get_ports {in[28]}]
set_input_delay -clock clk  6  [get_ports {in[27]}]
set_input_delay -clock clk  6  [get_ports {in[26]}]
set_input_delay -clock clk  6  [get_ports {in[25]}]
set_input_delay -clock clk  6  [get_ports {in[24]}]
set_input_delay -clock clk  6  [get_ports {in[23]}]
set_input_delay -clock clk  6  [get_ports {in[22]}]
set_input_delay -clock clk  6  [get_ports {in[21]}]
set_input_delay -clock clk  6  [get_ports {in[20]}]
set_input_delay -clock clk  6  [get_ports {in[19]}]
set_input_delay -clock clk  6  [get_ports {in[18]}]
set_input_delay -clock clk  6  [get_ports {in[17]}]
set_input_delay -clock clk  6  [get_ports {in[16]}]
set_input_delay -clock clk  6  [get_ports {in[15]}]
set_input_delay -clock clk  6  [get_ports {in[14]}]
set_input_delay -clock clk  6  [get_ports {in[13]}]
set_input_delay -clock clk  6  [get_ports {in[12]}]
set_input_delay -clock clk  6  [get_ports {in[11]}]
set_input_delay -clock clk  6  [get_ports {in[10]}]
set_input_delay -clock clk  6  [get_ports {in[9]}]
set_input_delay -clock clk  6  [get_ports {in[8]}]
set_input_delay -clock clk  6  [get_ports {in[7]}]
set_input_delay -clock clk  6  [get_ports {in[6]}]
set_input_delay -clock clk  6  [get_ports {in[5]}]
set_input_delay -clock clk  6  [get_ports {in[4]}]
set_input_delay -clock clk  6  [get_ports {in[3]}]
set_input_delay -clock clk  6  [get_ports {in[2]}]
set_input_delay -clock clk  6  [get_ports {in[1]}]
set_input_delay -clock clk  6  [get_ports {in[0]}]
set_output_delay -clock clk  6  [get_ports out_vallid]
set_output_delay -clock clk  6  [get_ports {out[51]}]
set_output_delay -clock clk  6  [get_ports {out[50]}]
set_output_delay -clock clk  6  [get_ports {out[49]}]
set_output_delay -clock clk  6  [get_ports {out[48]}]
set_output_delay -clock clk  6  [get_ports {out[47]}]
set_output_delay -clock clk  6  [get_ports {out[46]}]
set_output_delay -clock clk  6  [get_ports {out[45]}]
set_output_delay -clock clk  6  [get_ports {out[44]}]
set_output_delay -clock clk  6  [get_ports {out[43]}]
set_output_delay -clock clk  6  [get_ports {out[42]}]
set_output_delay -clock clk  6  [get_ports {out[41]}]
set_output_delay -clock clk  6  [get_ports {out[40]}]
set_output_delay -clock clk  6  [get_ports {out[39]}]
set_output_delay -clock clk  6  [get_ports {out[38]}]
set_output_delay -clock clk  6  [get_ports {out[37]}]
set_output_delay -clock clk  6  [get_ports {out[36]}]
set_output_delay -clock clk  6  [get_ports {out[35]}]
set_output_delay -clock clk  6  [get_ports {out[34]}]
set_output_delay -clock clk  6  [get_ports {out[33]}]
set_output_delay -clock clk  6  [get_ports {out[32]}]
set_output_delay -clock clk  6  [get_ports {out[31]}]
set_output_delay -clock clk  6  [get_ports {out[30]}]
set_output_delay -clock clk  6  [get_ports {out[29]}]
set_output_delay -clock clk  6  [get_ports {out[28]}]
set_output_delay -clock clk  6  [get_ports {out[27]}]
set_output_delay -clock clk  6  [get_ports {out[26]}]
set_output_delay -clock clk  6  [get_ports {out[25]}]
set_output_delay -clock clk  6  [get_ports {out[24]}]
set_output_delay -clock clk  6  [get_ports {out[23]}]
set_output_delay -clock clk  6  [get_ports {out[22]}]
set_output_delay -clock clk  6  [get_ports {out[21]}]
set_output_delay -clock clk  6  [get_ports {out[20]}]
set_output_delay -clock clk  6  [get_ports {out[19]}]
set_output_delay -clock clk  6  [get_ports {out[18]}]
set_output_delay -clock clk  6  [get_ports {out[17]}]
set_output_delay -clock clk  6  [get_ports {out[16]}]
set_output_delay -clock clk  6  [get_ports {out[15]}]
set_output_delay -clock clk  6  [get_ports {out[14]}]
set_output_delay -clock clk  6  [get_ports {out[13]}]
set_output_delay -clock clk  6  [get_ports {out[12]}]
set_output_delay -clock clk  6  [get_ports {out[11]}]
set_output_delay -clock clk  6  [get_ports {out[10]}]
set_output_delay -clock clk  6  [get_ports {out[9]}]
set_output_delay -clock clk  6  [get_ports {out[8]}]
set_output_delay -clock clk  6  [get_ports {out[7]}]
set_output_delay -clock clk  6  [get_ports {out[6]}]
set_output_delay -clock clk  6  [get_ports {out[5]}]
set_output_delay -clock clk  6  [get_ports {out[4]}]
set_output_delay -clock clk  6  [get_ports {out[3]}]
set_output_delay -clock clk  6  [get_ports {out[2]}]
set_output_delay -clock clk  6  [get_ports {out[1]}]
set_output_delay -clock clk  6  [get_ports {out[0]}]
set_drive 0.1  [get_ports clk]
set_drive 0.1  [get_ports rst_n]
set_drive 0.1  [get_ports valid]
set_drive 0.1  [get_ports {in[51]}]
set_drive 0.1  [get_ports {in[50]}]
set_drive 0.1  [get_ports {in[49]}]
set_drive 0.1  [get_ports {in[48]}]
set_drive 0.1  [get_ports {in[47]}]
set_drive 0.1  [get_ports {in[46]}]
set_drive 0.1  [get_ports {in[45]}]
set_drive 0.1  [get_ports {in[44]}]
set_drive 0.1  [get_ports {in[43]}]
set_drive 0.1  [get_ports {in[42]}]
set_drive 0.1  [get_ports {in[41]}]
set_drive 0.1  [get_ports {in[40]}]
set_drive 0.1  [get_ports {in[39]}]
set_drive 0.1  [get_ports {in[38]}]
set_drive 0.1  [get_ports {in[37]}]
set_drive 0.1  [get_ports {in[36]}]
set_drive 0.1  [get_ports {in[35]}]
set_drive 0.1  [get_ports {in[34]}]
set_drive 0.1  [get_ports {in[33]}]
set_drive 0.1  [get_ports {in[32]}]
set_drive 0.1  [get_ports {in[31]}]
set_drive 0.1  [get_ports {in[30]}]
set_drive 0.1  [get_ports {in[29]}]
set_drive 0.1  [get_ports {in[28]}]
set_drive 0.1  [get_ports {in[27]}]
set_drive 0.1  [get_ports {in[26]}]
set_drive 0.1  [get_ports {in[25]}]
set_drive 0.1  [get_ports {in[24]}]
set_drive 0.1  [get_ports {in[23]}]
set_drive 0.1  [get_ports {in[22]}]
set_drive 0.1  [get_ports {in[21]}]
set_drive 0.1  [get_ports {in[20]}]
set_drive 0.1  [get_ports {in[19]}]
set_drive 0.1  [get_ports {in[18]}]
set_drive 0.1  [get_ports {in[17]}]
set_drive 0.1  [get_ports {in[16]}]
set_drive 0.1  [get_ports {in[15]}]
set_drive 0.1  [get_ports {in[14]}]
set_drive 0.1  [get_ports {in[13]}]
set_drive 0.1  [get_ports {in[12]}]
set_drive 0.1  [get_ports {in[11]}]
set_drive 0.1  [get_ports {in[10]}]
set_drive 0.1  [get_ports {in[9]}]
set_drive 0.1  [get_ports {in[8]}]
set_drive 0.1  [get_ports {in[7]}]
set_drive 0.1  [get_ports {in[6]}]
set_drive 0.1  [get_ports {in[5]}]
set_drive 0.1  [get_ports {in[4]}]
set_drive 0.1  [get_ports {in[3]}]
set_drive 0.1  [get_ports {in[2]}]
set_drive 0.1  [get_ports {in[1]}]
set_drive 0.1  [get_ports {in[0]}]
