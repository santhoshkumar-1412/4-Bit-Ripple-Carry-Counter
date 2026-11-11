
# 🔢 4-Bit Ripple Carry Counter Using Verilog HDL

## 📌 Project Overview

This project implements a **4-bit Ripple Carry Counter** using Verilog HDL.

A Ripple Carry Counter is an asynchronous counter in which the output of one flip-flop acts as the clock input for the next flip-flop.

This design uses four T Flip-Flops implemented using D Flip-Flops to create a 4-bit binary counter.

The counter counts from **0000 to 1111 (0 to 15)** and then repeats the counting sequence.

An asynchronous active-high reset is used to reset the counter output to 0000.

## ✨ Features

- 🔢 4-bit binary counter
- 💻 Designed using Verilog HDL
- 🔄 Implemented using T Flip-Flops
- ⚡ Built using D Flip-Flops
- ⏱️ Negative-edge triggered operation
- 🔁 Asynchronous active-high reset
- 📈 Counts from 0 to 15
- 🧪 Includes a Verilog testbench
- 📊 Generates VCD waveform for simulation analysis

## 🛠️ Tools Used

- Verilog HDL
- Synopsys VCS / ModelSim / QuestaSim
- Synopsys Verdi
- VCD Waveform Viewer

## 📂 Project Structure

```text
4-Bit-Ripple-Carry-Counter/
|
|-- bit4rcc.v          # Counter Design
|-- bit4rcc_tb.v       # Testbench
|-- 4bitccdump.vcd     # Simulation Waveform
|-- screenshot.png     # Verdi Waveform Screenshot
|-- README.md          # Project Documentation
```

## ⚙️ Working Principle

The 4-bit Ripple Carry Counter is constructed using four T Flip-Flops.

### 1️⃣ D Flip-Flop

The D Flip-Flop stores the input data at the active clock edge.

In this project, the D Flip-Flop is triggered at the negative edge of the clock.

```verilog
always @ (negedge clk or posedge rst)
    if(rst)
        q <= 1'b0;
    else
        q <= d;
```

The reset is asynchronous and active HIGH.

### 2️⃣ T Flip-Flop

A T Flip-Flop toggles its output whenever the clock is triggered.

It is implemented using a D Flip-Flop with an inverter in the feedback path.

```verilog
not n1(din,q);
dff dff0 (q,qb,din,clk,rst);
```

The input equation is:

D = NOT Q

Therefore, the output toggles at every active clock edge.

### 3️⃣ Ripple Counter Architecture

The counter consists of four T Flip-Flops connected in cascade.

- TFF0 receives the external clock.
- TFF1 receives Q0 as its clock.
- TFF2 receives Q1 as its clock.
- TFF3 receives Q2 as its clock.

Each flip-flop toggles on the negative edge of its clock input.

### 🔌 Block Diagram

```text
          ┌───────┐
CLK ─────►│ TFF0  │──── Q0
          └───────┘      |
                         ▼
                    ┌───────┐
                    │ TFF1  │──── Q1
                    └───────┘      |
                                   ▼
                              ┌───────┐
                              │ TFF2  │──── Q2
                              └───────┘      |
                                             ▼
                                        ┌───────┐
                                        │ TFF3  │──── Q3
                                        └───────┘

             Common Asynchronous Reset
```

## 🔌 Module Interface

| Signal | Direction | Width | Description |
|--------|-----------|-------|-------------|
| clk | Input | 1-bit | External clock |
| rst | Input | 1-bit | Active-high asynchronous reset |
| q | Output | 4-bit | Counter output |

## 🔄 Counting Sequence

The counter follows the 4-bit binary counting sequence.

| Decimal | Binary Output |
|---------|---------------|
| 0 | 0000 |
| 1 | 0001 |
| 2 | 0010 |
| 3 | 0011 |
| 4 | 0100 |
| 5 | 0101 |
| 6 | 0110 |
| 7 | 0111 |
| 8 | 1000 |
| 9 | 1001 |
| 10 | 1010 |
| 11 | 1011 |
| 12 | 1100 |
| 13 | 1101 |
| 14 | 1110 |
| 15 | 1111 |
| 0 | 0000 |

After reaching 1111, the counter returns to 0000 and repeats the sequence.

## 🧪 Testbench and Verification

The testbench verifies the functionality of the 4-bit Ripple Carry Counter.

### 📋 Testbench Features

- Generates a clock signal using `always #10 clk=~clk`.
- Applies an active-high reset initially.
- Deasserts reset after 21 ns.
- Applies reset again during simulation.
- Uses `$monitor` to display counter output.
- Uses `$dumpfile` to generate a VCD file.
- Uses `$dumpvars` to record waveform signals.
- Uses `$finish` to terminate simulation.

### ⏱️ Reset Timing

| Time | Reset | Operation |
|------|-------|-----------|
| 0 ns | 1 | Counter reset |
| 21 ns | 0 | Counting starts |
| 170 ns | 1 | Counter reset |
| 181 ns | 0 | Counting resumes |
| 200 ns | - | Simulation ends |

## ▶️ Simulation Steps

### Step 1: Compile the Verilog Files

Using Synopsys VCS Verdi:

```bash
vcs -full64 -kdb -debug_access+all bit4rcc.v bit4rcc_tb.v
```

### Step 2: Run Simulation

```bash
./simv
```

### Step 3: View Waveform

```bash
4bitccdump.vcd
```

The waveform can also be viewed using Synopsys Verdi.

## 📊 Simulation Waveform

The waveform shows the counter output (`q[3:0]`), clock (`clk`), and reset (`rst`).

It demonstrates the binary counting sequence and asynchronous reset operation.

### Verdi Simulation Output

![4-Bit Ripple Carry Counter Waveform](screenshot.png)

## 💡 Applications

- 🔢 Digital counters
- ⏱️ Frequency dividers
- 🕒 Digital clocks
- 🧮 Sequential digital circuits
- 🔬 VLSI Design
- 💻 Digital system design

## 🎯 Conclusion

The 4-bit Ripple Carry Counter was successfully designed and simulated using Verilog HDL.

The design uses four cascaded T Flip-Flops implemented using D Flip-Flops. Each flip-flop toggles on the negative edge of its respective clock signal.

The counter successfully performs 4-bit binary counting from 0000 to 1111 and supports asynchronous active-high reset.

The simulation waveform verifies the counting sequence and reset functionality.

## 👨‍💻 Author

**SANTHOSH KUMAR N A**

## 📖 Project Details

- 📌 Project Name: 4-Bit Ripple Carry Counter
- 💻 Language: Verilog HDL
- 🔧 Domain: Digital Electronics / VLSI Design
- 📊 Simulation Tool: Synopsys Verdi
- ⭐ Project Type: Sequential Circuit Design
