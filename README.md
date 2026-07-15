# COE328 – General-Purpose Processor

## Overview

This project implements a simple general-purpose processor in **VHDL** using **Intel Quartus Prime** and the **DE2 FPGA Board**. The processor combines registers, a finite state machine (FSM), a 4-to-16 decoder, and an arithmetic logic unit (ALU) to perform arithmetic and logical operations.

The project was completed for **COE328 – Digital Systems** and verified through simulation and FPGA implementation.

---

## Features

- 8-bit Arithmetic Logic Unit (ALU)
- Two 8-bit registers for data storage
- Moore Finite State Machine (FSM)
- 4-to-16 decoder for opcode generation
- Seven-segment display output
- Functional simulation and FPGA hardware verification

---

## Processor Architecture

The processor integrates the following components into a complete datapath and control unit:

- Registers A & B
- Arithmetic Logic Unit (ALU)
- Moore FSM
- 4-to-16 Decoder
- Seven-segment Display

<p align="center">
  <img src="images/processor_block_diagram.png" width="700" alt="Processor Block Diagram">
</p>

---

## ALU Implementations

### ALU 1
Implements the processor's core arithmetic and logical operations:

- Addition
- Subtraction
- NOT
- NAND
- NOR
- AND
- XOR
- OR

### ALU 2
Implements a modified instruction set including:

- Increment
- Bit shifting
- Bit rotation
- Minimum value comparison
- Bit reversal
- XOR
- Modified addition

### ALU 3
Extends the processor by incorporating the FSM output into the ALU and modifying the seven-segment display to output **Y/N** based on the assigned condition.

---

## Hardware Demonstration

The processor was successfully implemented on the DE2 FPGA board.

<p align="center">
  <img src="images/fpga_demo_1.jpg" width="350">
  <img src="images/fpga_demo_2.jpg" width="350">
</p>

---

## Simulation Results

Functional simulations were performed in Quartus to verify correct processor operation before FPGA implementation.

<p align="center">
  <img src="images/simulation_waveform.png" width="750" alt="Simulation Waveform">
</p>

---

## Technologies

- VHDL
- Intel Quartus Prime
- Quartus Simulator
- DE2 FPGA Board

---

## Repository Structure

```text
├── ALU1.vhd
├── ALU2.vhd
├── ALU3.vhd
├── Register.vhd
├── FSM.vhd
├── Decoder4x16.vhd
├── SSEG.vhd
├── Top_Level.vhd
├── images/
└── README.md
```

---

## How to Run

1. Open the project in **Intel Quartus Prime**.
2. Compile the design.
3. Run a functional simulation (optional).
4. Program the design onto the **DE2 FPGA Board** using Quartus Programmer.
5. Observe the processor outputs on the seven-segment displays.

---

## Key Takeaways

This project provided hands-on experience designing and integrating a simple processor in VHDL. It reinforced concepts in digital logic, finite state machines, modular hardware design, FPGA implementation, and hardware verification through simulation and testing on the DE2 board.
