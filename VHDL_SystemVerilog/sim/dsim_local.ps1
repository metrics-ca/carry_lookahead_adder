# dsim_local.ps1
# PowerShell script to simulate design with Altair® DSim™ on local machine

# Set up environment
$WAVE_FILE = "waves.mxd"

# Compile standard libraries
dlib rm -lib ieee
dlib map -lib ieee $Env:STD_LIBS/ieee93

# Analyze separately, Elaborate and Run in one step.
dvhcom -lib dut -F filelist_VHDL.txt
dvlcom ../testbench/carry_lookahead_adder_directed_tb.sv
dsim -top work.carry_lookahead_adder_tb -L dut +acc+b -waves $WAVE_FILE
