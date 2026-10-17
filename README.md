# 4-Bit ALU in Verilog

## Overview

This project is a 4-bit Arithmetic Logic Unit (ALU) built using Verilog. It takes two 4-bit inputs and performs addition, subtraction, bitwise AND, or bitwise OR depending on the selected operation.

I used EDA Playground and Icarus Verilog to simulate the design and test its functionality. The goal was to get hands-on experience with digital logic, Verilog, and hardware verification.

## Operations

The ALU supports four operations, selected using a 2-bit opcode.

**00 – Addition:** Adds A and B.

**01 – Subtraction:** Subtracts B from A.

**10 – AND:** Performs a bitwise AND operation on A and B.

**11 – OR:** Performs a bitwise OR operation on A and B.

Since the ALU uses a 4-bit output, arithmetic results are limited to 4 bits. Any carry or borrow beyond those 4 bits is not included in the output.

## Design

The ALU uses a combinational `always` block with a `case` statement to determine which operation to perform.

The design has three inputs:

- `A`: First 4-bit operand
- `B`: Second 4-bit operand
- `op`: 2-bit selector that determines the operation

The output, `result`, is a 4-bit value containing the result of the selected operation.

## Testing

I wrote a Verilog testbench to check the ALU's output for different input combinations. The testbench loops through all possible values of A and B (0–15) for each of the four operations.

This gives a total of 1,024 test cases.

**Simulation results:**

- Tests completed: 1,024
- Errors found: 0
- All tests passed

The testbench compares each result with an expected value calculated using Verilog operators.

## Tools Used

- Verilog HDL
- Icarus Verilog 12.0
- EDA Playground

## Files

- `alu_4bit.v` — Contains the ALU design
- `testbench.v` — Tests the ALU across all input combinations

## Running the Project

The project can be simulated using Icarus Verilog or EDA Playground.

To run it locally with Icarus Verilog:

```bash
iverilog -g2012 -o alu_sim alu_4bit.v testbench.v
vvp alu_sim
```

The simulation prints the number of tests completed and reports any errors.

## Possible Improvements

Possible next steps include adding more operations, such as bitwise XOR and shifting, along with carry and overflow flags to provide more information about arithmetic results.
