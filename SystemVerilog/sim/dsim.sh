#!/bin/bash
# dsim.sh
# Bash script to simulate design with Altair® DSim™ on eng-1 or local machine

# Set up environment
WAVE_FILE=waves.mxd
set -e

# Compile standard libraries
dlib rm -lib ieee
dlib map -lib ieee ${STD_LIBS}/ieee93

# Analyze separately, Elaborate and Run in one step.
dvlcom -lib dut -F filelist_V.txt
dvlcom ../testbench/carry_lookahead_adder_directed_tb.sv
dsim -top work.carry_lookahead_adder_tb -L dut +acc+b -waves $WAVE_FILE
