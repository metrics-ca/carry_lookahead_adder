#!/usr/bin/env bash
# dsim_local.sh
# Bash script to simulate design with Altair® DSim™ on local machine

# Set up environment
WAVE_FILE=waves.mxd

# Compile standard libraries
dlib rm -lib ieee
dlib map -lib ieee "${STD_LIBS}/ieee93"

# Analyze separately, Elaborate and Run in one step.
dvhcom -lib dut -F filelist_VHDL.txt
dvhcom ../testbench/carry_lookahead_adder_directed_tb.vhd
dsim -top work.carry_lookahead_adder_tb -L dut +acc+b -waves $WAVE_FILE
