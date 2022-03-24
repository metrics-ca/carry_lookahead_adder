To send a command to Aurora Verification Cloud, use 
> aurora execute '<your command>'

DSim supports different ways to compile and run a simulation.
Depending on your previous experience and preference, you can choose one of the following steps to achieve the same purpose.
Please refer to DSim User Guide for more information

Note: Tutorial walkthrough is using Step 1.

1. Compile and Run Simulation in 1-step. 
> aurora execute 'dsim -F filelist.txt +acc+b -waves waves.vcd'

2. Compile and Run in 2-steps. These are perfect for compile-once, run many simulation with random seed flow.
> aurora execute 'dsim -genimage myimage -F filelist.txt +acc+b'
> aurora execute 'dsim -image myimage -waves waves.vcd'

3. Analyze, Elaborate and Run in 3-steps. These are best suited for VHDL and mixed language flow.
> aurora execute 'dvlcom -F filelist.txt'
> aurora execute 'dsim -genimage myimage -top work.carry_lookahead_adder_tb +acc+b'
> aurora execute 'dsim -image myimage -waves waves.vcd'


Conclusion:
1. To send a command to Aurora Verification Cloud, use:
> aurora execute '<your command>'

2. There are different ways to compile and run a simulation using DSim. Please refer to the User Guide 