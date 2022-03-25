#!/bin/bash
dvhcom -F filelist_VHDL.txt
dvlcom -F filelist_SV.txt
dsim -top work.carry_lookahead_adder_tb +acc+b -waves waves.vcd
