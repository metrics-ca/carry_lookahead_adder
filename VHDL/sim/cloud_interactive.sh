#!/bin/bash
# cloud_interactive.sh
# Bash script to simulate design with Altair® DSim™ Cloud

# Set up environment
WAVE_FILE=waves.mxd
set -e

# Analyze separately, Elaborate and Run in one step.
mdc dvhcom -a '-lib dut -F filelist_VHDL.txt'
mdc dvhcom -a '../testbench/carry_lookahead_adder_directed_tb.vhd'
mdc dsim -a "-top work.carry_lookahead_adder_tb -L dut +acc+b -waves $WAVE_FILE"
