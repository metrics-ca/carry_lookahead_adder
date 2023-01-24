To send a command to DSim Cloud, use
> mdc <DSim command> -a '[options]'
See this article for details:
https://support.metrics.ca/hc/en-us/articles/10166809979789-User-Guide-DSim-Cloud-CLI-Tool-simulator-commands

DSim supports different ways to compile and run a simulation.
Please refer to the DSim User Manual for more information:
https://support.metrics.ca/hc/en-us/articles/360061975232-User-Guide-DSim-User-Manual

Compile and Run Simulation
Since this is a mixed language environment, VHDL Design + Verilog Testbench, we must Analyze separately, while Elaborate and Run can be together or separate.
Depending on your previous experience and preference, you can choose one of the following methods to achieve the same purpose.

1. 2-step Method: Analyze separately, Elaborate and Run in one step.
> mdc dvhcom -a '-F filelist_VHDL.txt'
> mdc dvlcom -a '-F filelist_SV.txt'
> mdc dsim -a '-top work.carry_lookahead_adder_tb +acc+b -waves waves.vcd'

2. 3-step Method: Analyze separately, Elaborate and Run in two steps. These are perfect for "compile-once, run-many" simulations with different random seed flows.
> mdc dvhcom -a '-F filelist_VHDL.txt'
> mdc dvlcom -a '-F filelist_SV.txt'
> mdc dsim -a '-genimage myimage -top work.carry_lookahead_adder_tb +acc+b'
> mdc dsim -a '-image myimage -waves waves.vcd'

Conclusion:
1. To send a command to DSim Cloud, use:
> mdc <DSim command> -a '[options]'

2. There are different ways to compile and run a simulation using DSim. Please refer to the User Manual.

3. In Verilog/SystemVerilog, you need to specify the required library through the '-L <lib>' switch.
