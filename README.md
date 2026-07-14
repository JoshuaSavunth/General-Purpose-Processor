# COE328---General-Purpose-Processor

## Overview

This project implements a simple general-purpose processor in **VHDL** using **Intel Quartus Prime** and the **DE2 FPGA board**. The processor integrates registers, a finite state machine (FSM), a 4-to-16 decoder, and an arithmetic logic unit (ALU) to execute arithmetic and logical operations.

The project was completed for **COE328 – Digital Systems** and verified through simulation and FPGA implementation.

---

## Features

- 8-bit ALU
- Two 8-bit registers
- Moore FSM control unit
- 4-to-16 decoder
- Seven-segment display output
- Quartus simulation and FPGA verification

---

## ALU Implementations

### ALU 1
Implements fundamental arithmetic and logic operations:
- Addition
- Subtraction
- NOT
- NAND
- NOR
- AND
- XOR
- OR

### ALU 2
Implements custom operations assigned for the lab, including:
- Increment
- Bit shifting
- Rotation
- Minimum value comparison
- Bit reversal
- XOR
- Modified addition

### ALU 3
Extends the processor by incorporating the FSM output into the ALU and modifying the seven-segment display to output **Y/N** based on the assigned condition.

---

## Technologies

- VHDL
- Intel Quartus Prime
- Quartus Simulator
- DE2 FPGA Board

---

## Repository Structure

```
├── ALU1.vhd
├── ALU2.vhd
├── ALU3.vhd
├── Register.vhd
├── FSM.vhd
├── Decoder4x16.vhd
├── SSEG.vhd
├── Top_Level.vhd
└── README.md
```

---

## Learning Outcomes

- Sequential and combinational circuit design
- FSM implementation
- ALU architecture
- Modular VHDL design
- FPGA synthesis and hardware verification
