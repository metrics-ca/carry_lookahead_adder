To send a command to Aurora Verification Cloud, use 
> aurora execute '<your command>'

DSim supports different ways to compile and run a simulation.
Depending on your previous experience and preference, you can choose one of the following steps to achieve the same purpose.
Please refer to DSim User Guide for more information

Limitation: Since this is a mixed languages design (VHDL and Verilog), we must use the tool dvhcom, dvlcom to analyze the code.

1. Analyze separately, Compile and Run Simulation in 1-step. 
> aurora execute 'dvhcom -F filelist_VHDL.txt'
> aurora execute 'dvlcom -F filelist_SV.txt'
> aurora execute 'dsim -top work.carry_lookahead_adder_tb +acc+b -waves waves.vcd'

2. Analyze separately, Elaborate and Run separately. These are perfect for compile-once, run many simulation with random seed flow.
> aurora execute 'dvhcom -F filelist_VHDL.txt'
> aurora execute 'dvlcom -F filelist_SV.txt'
> aurora execute 'dsim -genimage myimage -top work.carry_lookahead_adder_tb +acc+b'
> aurora execute 'dsim -image myimage -waves waves.vcd'


Conclusion:
1. To send a command to Aurora Verification Cloud, use:
> aurora execute '<your command>'

2. There are different ways to compile and run a simulation using DSim. Please refer to the DSim User Guide