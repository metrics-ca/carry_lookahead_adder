Mixed Language Simulation using DSim Cloud

To send a command to DSim Cloud, use
> mdc <DSim command> -a '[options]'
See this article for details:
https://help.metrics.ca/support/solutions/articles/154000141108-user-guide-dsim-cloud-cli-simulator-commands

DSim supports different ways to compile and run a simulation.
Please refer to the DSim User Manual for more information:
https://help.metrics.ca/support/solutions/articles/154000141193-user-guide-dsim-user-manual

Compile and Run Simulation
Depending on your previous experience and preference, you can choose one of the following methods to achieve the same purpose.

1. 1-step Method: Analyze, Elaborate, and Run in one step.
> mdc dsim -a '-F filelist.txt +acc+b -waves waves.mxd'

2. 2-step Method: Analyze and Elaborate in one step, Run in a second step. These are perfect for "compile-once, run many" simulations with random seed flows.
> mdc dsim -a '-genimage myimage -F filelist.txt +acc+b'
> mdc dsim -a '-image myimage -waves waves.mxd'

3. 3-step Method: Analyze, Elaborate and Run in 3 separate steps. These are best suited for VHDL and mixed language flows.
> mdc dvlcom -a '-F filelist.txt'
> mdc dsim -a '-genimage myimage -top work.carry_lookahead_adder_tb +acc+b'
> mdc dsim -a '-image myimage -waves waves.mxd'

Note: Tutorial Walkthrough is using 1-step Method:
https://help.metrics.ca/support/solutions/articles/154000141143-tutorial-dsim-cloud-walkthrough

Conclusion:
1. To send a command to DSim Cloud, use:
> mdc <DSim command> -a '[options]'

2. There are different ways to compile and run a simulation using DSim. Please refer to the User Manual.

3. In Verilog/SystemVerilog, you need to specify the required library through the '-L <lib>' switch.

To perform mixed language simulation using DSim or DSim Studio:
https://help.metrics.ca/support/solutions/articles/154000141119-how-to-simulate-mixed-language-designs
