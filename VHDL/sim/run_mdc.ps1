# run_mdc.ps1
# PowerShell script to simulate design with Metrics DSim Cloud

# Analyze separately, Elaborate and Run in one step.
mdc dvhcom -a '-F filelist.txt'
mdc dsim -a '-top work.carry_lookahead_adder_tb +acc+b -waves waves.vcd'
