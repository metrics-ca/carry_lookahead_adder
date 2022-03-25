#!/bin/bash
aurora execute 'dvhcom -F filelist_VHDL.txt'
aurora execute 'dvlcom -F filelist_SV.txt'
aurora execute 'dsim -genimage image +acc+b -lib work -top carry_lookahead_adder_tb'
aurora execute 'dsim -image image -waves waves.vcd'