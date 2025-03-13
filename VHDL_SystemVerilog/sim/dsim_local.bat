@echo off
REM dsim_local.bat
REM Windows command script to simulate design with Altair® DSim™ on local machine

REM Set up environment
set WAVE_FILE=waves.mxd

REM Compile standard libraries
dlib rm -lib ieee
dlib map -lib ieee "%STD_LIBS%/ieee93"

REM Analyze separately, Elaborate and Run in one step.
dvhcom -lib dut -F filelist_VHDL.txt
dvlcom ../testbench/carry_lookahead_adder_directed_tb.sv
dsim -top work.carry_lookahead_adder_tb -L dut +acc+b -waves %WAVE_FILE%
