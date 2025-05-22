# carry_lookahead_adder

This repository contains a simple RTL design and testbench for a carry-lookahead adder. It is used as an example in Altair&reg; DSim&trade; tutorials to help new users learn to use our tools.

There are 3 examples of the design and testbench under 3 separate folders:

## SystemVerilog

- A Verilog implementation of the carry-lookahead adder RTL, with a SystemVerilog testbench.

## VHDL

- A VHDL implementation of the carry-lookahead adder RTL, with a VHDL testbench.

## VHDL_SystemVerilog

- A VHDL implementation of the carry-lookahead adder RTL, with a SystemVerilog testbench. 


The SystemVerilog, VHDL, and VHDL_SystemVerilog examples are meant to be simulated independently. All designs produce the same results. The same testbench is used in the SystemVerilog and VHDL_SystemVerilog examples.

Within each example:

### design

- Contains the synthesizable hardware description of the carry-lookahead adder (in VHDL or Verilog).

### sim

- Contains scripts which encapsulate the commands needed to run a simulation using the Altair&reg; DSim&trade; tools. 
- Simulations should be launched from this directory so that simulation artifacts (logfile, waveform, etc.) will be written here.

### testbench

- Contains behavioural code written to verify the operation of the adder circuit. The testbench is "self-checking", meaning that no external file or application is required to verify correct behaviour.

## Job Files

Under the root folder, there are several job files named *carry_lookahead_adder_\*.yml* that use the SystemVerilog example to demonstrate how to write YAML files to submit jobs to be simulated in DSim Cloud. See this article for details:
https://help.metrics.ca/support/solutions/articles/154000141096-jobs-overview

For more information about Altair&reg; DSim&trade; products, please visit our website: [Altair&reg; DSim&trade;](https://altair.com/dsim)
