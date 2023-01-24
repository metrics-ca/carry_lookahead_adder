#!/bin/bash
# run_mdc.sh
# Bash script to simulate design with Metrics DSim Cloud

# Analyze separately, Elaborate and Run in one step.
mdc dvhcom -a '-F filelist_VHDL.txt'
mdc dvlcom -a '-F filelist_SV.txt'
mdc dsim -a '-top work.carry_lookahead_adder_tb +acc+b -waves waves.vcd'
