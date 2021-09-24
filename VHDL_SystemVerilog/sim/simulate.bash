#!/bin/bash
mds exec 'dvhcom -F filelist_VHDL.txt'
mds exec 'dvlcom -F filelist_SV.txt'
mds exec 'dsim -genimage image +acc+b -lib work -top carry_lookahead_adder_tb'
mds exec 'dsim -image image -waves waves.vcd'
