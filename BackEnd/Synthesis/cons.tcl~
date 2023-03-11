
####################################################################################
# Constraints
# ----------------------------------------------------------------------------
#
# 0. Design Compiler variables
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 0 : DC Variables ####
           #########################################################
#################################################################################### 

# Prevent assign statements in the generated netlist (must be applied before compile command)
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs  

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions

###################################perameters#######################################
#uart clk
set uart_clk UART_CLK
set uart_per 1085
#ref clk
set ref_clk  REF_CLK
set ref_per 20


####################################################################################

create_clock -period $uart_per -name $uart_clk -waveform "0 [expr $uart_per/2]" [get_ports UART_CLK ]
create_clock -period $ref_per  -name $ref_clk  -waveform "0 [expr  $ref_per/2]"  [get_ports REF_CLK]

##########latency#####################
set latency 0
set_clock_latency $latency [get_clocks [list $uart_clk $ref_clk]] 

##########uncertainty################
set clk_setup_skew 0.2
set clk_hold_skew  0.1

set_clock_uncertainty -setup $clk_setup_skew [get_clocks [list $uart_clk $ref_clk]]
set_clock_uncertainty -hold  $clk_setup_skew [get_clocks [list $uart_clk $ref_clk]]

#########clk transition#############
set clk_rise_transition 0.05
set clk_fall_transition 0.05

set_clock_transition -rise $clk_rise_transition [get_clocks [list $uart_clk $ref_clk]]
set_clock_transition -fall $clk_fall_transition [get_clocks [list $uart_clk $ref_clk]]

####################################################################################
           #########################################################
             #### Section 2 : Clocks Relationship ####
           #########################################################
####################################################################################
create_generated_clock -master_clock $uart_clk -source [get_ports UART_CLK] -name "clk_div"     -divide_by 8 [get_ports U0_ClkDiv/i_ref_clk]
create_generated_clock -master_clock $ref_clk  -source [get_ports REF_CLK]  -name "clk_gating"  -divide_by 1 [get_ports U0_CLK_GATE/CLK]

#########asynchronous##################
set_clock_groups -asynchronous -group [get_clocks "$ref_clk clk_gating"]  \
                               -group [get_clocks "$uart_clk clk_div"]  
###################don't touch##########################
set_dont_touch_network [list $uart_clk $ref_clk]
set_dont_touch_network [get_ports RST_N] 
####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################
set uart_delay "[expr 0.2*$uart_per]"

set_input_delay  $uart_delay -clock $uart_clk [get_ports UART_RX_IN] 

set_output_delay $uart_delay -clock $uart_clk [get_ports UART_TX_O] 
set_output_delay $uart_delay -clock $uart_clk [get_ports parity_error] 
set_output_delay $uart_delay -clock $uart_clk [get_ports framing_error] 
####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port UART_RX_IN]


####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################
set load_value 0.5
set_load $load_value [get_ports [list UART_TX_O parity_error framing_error]]


####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################


