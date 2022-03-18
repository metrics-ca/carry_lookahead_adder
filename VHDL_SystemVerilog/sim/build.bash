#!/bin/bash
dvhcom -F filelist_VHDL.txt
dvlcom -F filelist_SV.txt
dsim -genimage image +acc+b -lib work -top carry_lookahead_adder_tb