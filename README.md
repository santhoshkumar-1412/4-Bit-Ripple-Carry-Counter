
# 🔢 4-Bit Ripple Carry Counter Using Verilog HDL

<p align="center">
  <b>RTL Design | Sequential Logic Design | Functional Verification</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Language-Verilog-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Design-Ripple%20Counter-orange?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Simulation-Synopsys%20VCS-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Debugging-Synopsys%20Verdi-purple?style=for-the-badge" />
</p>

## 📌 1. Project Overview

This project implements a **4-bit Ripple Carry Counter** using Verilog Hardware Description Language (HDL).

A Ripple Carry Counter is an asynchronous counter in which the output of one flip-flop acts as the clock input for the next flip-flop.

This design uses four T Flip-Flops implemented using D Flip-Flops to create a 4-bit binary counter.

The counter counts from **0000 to 1111 (0 to 15)** and then repeats the counting sequence.

An asynchronous active-high reset is used to reset the counter output to 0000.

The design is simulated using Synopsys VCS, and waveform analysis is performed using Synopsys Verdi.

## 🎯 2. Design Specifications

| Parameter | Description |
|---|---|
| Design Name | 4-Bit Ripple Carry Counter |
| Design Type | Sequential Circuit |
| Counter Type | Asynchronous Counter |
| Counter Modulus | 16 |
| Number of Flip-Flops | 4 |
| Flip-Flop Type | T Flip-Flop using D Flip-Flop |
| Clock Edge | Negative Edge |
| Reset Type | Active-High Asynchronous Reset |
| Input Signals | Clock, Reset |
| Output Signals | 4-bit Counter Output |
| HDL | Verilog |
| Simulator | Synopsys VCS |
| Waveform Viewer | Synopsys Verdi |
| Waveform Format | VCD |

## ⚙️ 3. Design Methodology

The 4-bit Ripple Carry Counter is constructed using four cascaded T Flip-Flops.

### 3.1 D Flip-Flop Operation

The D Flip-Flop stores the input data at the active clock edge.

In this project, the D Flip-Flop operates on the negative edge of the clock.

**RTL Implementation:**

```verilog
always @(negedge clk or posedge rst)
begin
    if(rst)
        q <= 1'b0;
    else
        q <= d;
end
```

The reset is asynchronous and active HIGH.

### 3.2 T Flip-Flop Operation

A T Flip-Flop toggles its output whenever the clock is triggered.

It is implemented using a D Flip-Flop with an inverter in the feedback path.

**Characteristic Equation:**

```text
D = NOT Q
```

**RTL Implementation:**

```verilog
not n1(din,q);
dff dff0 (q,qb,din,clk,rst);
```

Therefore, the output toggles at every active clock edge.

### 3.3 Ripple Counter Architecture

The counter consists of four T Flip-Flops connected in cascade.

- TFF0 receives the external clock.
- TFF1 receives Q0 as its clock.
- TFF2 receives Q1 as its clock.
- TFF3 receives Q2 as its clock.
- Each flip-flop toggles on the negative edge of its respective clock input.

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

## 🔌 4. Module Interface

| Signal | Direction | Width | Description |
|---|---|---|---|
| `clk` | Input | 1 bit | External clock |
| `rst` | Input | 1 bit | Active-high asynchronous reset |
| `q` | Output | 4 bits | Counter output |

## 🔄 5. Counting Sequence

The counter follows the 4-bit binary counting sequence.

| Decimal | Binary Output |
|---|---|
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

**Counter Modulus:**

```text
MOD = 2^n

MOD = 2^4 = 16
```

## 📂 6. Repository Structure

```text
4-Bit-Ripple-Carry-Counter/
│
├── bit4rcc.v
│   └── Counter RTL design
│
├── bit4rcc_tb.v
│   └── Functional verification testbench
│
├── 4bitccdump.vcd
│   └── Simulation waveform database
│
├── screenshots/
│   └── verdi_waveform.png
│
├── README.md
│
└── .gitignore
```

Generated simulation files such as compiled executables and intermediate simulation directories can be maintained locally rather than committed to GitHub.

## 🧪 7. Testbench and Functional Verification

A Verilog testbench is developed to verify the functionality of the 4-bit Ripple Carry Counter.

### 7.1 Testbench Features

- Generates a clock signal using `always #10 clk = ~clk`.
- Applies an active-high reset initially.
- Deasserts reset after 21 ns.
- Applies reset again during simulation.
- Uses `$monitor` to display counter output.
- Uses `$dumpfile` to generate a VCD file.
- Uses `$dumpvars` to record waveform signals.
- Uses `$finish` to terminate simulation.

### 7.2 Clock Generation

```verilog
always #10 clk = ~clk;
```

**Clock Period:**

```text
Tclk = 10 ns + 10 ns = 20 ns
```

**Clock Frequency:**

```text
f = 1 / Tclk = 50 MHz
```

### 7.3 Reset Timing

| Time | Reset | Operation |
|---|---|---|
| 0 ns | 1 | Counter reset |
| 21 ns | 0 | Counting starts |
| 170 ns | 1 | Counter reset |
| 181 ns | 0 | Counting resumes |
| 200 ns | - | Simulation ends |

The asynchronous reset clears all flip-flop outputs independently of the clock.

## 💻 8. Simulation Environment

The design is simulated using Synopsys VCS, and waveform analysis is performed using Synopsys Verdi.

### 8.1 Simulation Workflow

```text
       Verilog RTL Design
               |
               v
        Verilog Testbench
               |
               v
         Synopsys VCS
               |
               v
         RTL Simulation
               |
               v
          VCD Database
               |
               v
        Synopsys Verdi
               |
               v
        Waveform Analysis
```

### 8.2 VCS Compilation

Compile the RTL source and testbench using:

```bash
vcs -full64 -kdb -debug_access+all \
bit4rcc.v bit4rcc_tb.v
```

### 8.3 Execute Simulation

```bash
./simv
```

The simulation executes the testbench and generates the VCD waveform when the dump commands are enabled.

### 8.4 VCD Waveform Generation

Add the following commands inside the testbench:

```verilog
initial
begin
    $dumpfile("4bitccdump.vcd");
    $dumpvars(0, bit4rcc_tb);
end
```

### 8.5 Open Waveform in Synopsys Verdi

```bash
verdi -ssf 4bitccdump.vcd &
```

The generated waveform can be inspected using the Verdi waveform viewer.

## 📊 9. Waveform Analysis

The simulation waveform is analyzed using Synopsys Verdi.

The following signals are observed:

| Signal | Width | Description |
|---|---|---|
| `clk` | 1 bit | External clock |
| `rst` | 1 bit | Asynchronous reset |
| `q[3:0]` | 4 bits | Counter output |

**Waveform Observations:**

- The counter operates using negative-edge-triggered flip-flops.
- The initial reset clears the counter output to 0000.
- The counter increments from 0000 to 1111.
- The counter repeats after reaching 1111.
- The asynchronous reset clears the counter independently of the clock.
- The waveform demonstrates the binary counting sequence and reset functionality.

### 🖼️ Simulation Waveform

![4-Bit Ripple Carry Counter Waveform](screenshots/verdi_waveform.png)

## 🛠️ 10. Tools and Technologies

| Tool / Technology | Purpose |
|---|---|
| Verilog HDL | RTL design implementation |
| Synopsys VCS | RTL compilation and simulation |
| Synopsys Verdi | Waveform visualization and debugging |
| VCD | Simulation waveform database |
| Git | Version control |
| GitHub | Source code management and documentation |

## 🎓 11. Key Learning Outcomes

Through this project, the following concepts are explored:

- Sequential digital circuit design.
- D Flip-Flop implementation.
- T Flip-Flop implementation using D Flip-Flops.
- Negative-edge-triggered sequential logic.
- Asynchronous active-high reset.
- Ripple counter architecture.
- 4-bit binary counting.
- Verilog testbench development.
- RTL simulation using Synopsys VCS.
- Waveform analysis using Synopsys Verdi.

## 🚀 12. Future Enhancements

Potential extensions to this project include:

- Designing 8-bit and 16-bit ripple counters.
- Implementing synchronous counters.
- Designing up/down counters.
- Comparing synchronous and asynchronous counter architectures.
- Performing RTL synthesis and area analysis.
- Analyzing propagation delay.
- Implementing parameterized counters.

## 👨‍💻 13. Author

**SANTHOSH KUMAR N A**

RTL Design | Digital Design | VLSI Engineering

- GitHub: [Your GitHub Profile](https://github.com/your-username)
- LinkedIn: [Your LinkedIn Profile](https://linkedin.com/in/your-profile)

## 📜 14. License

This project is intended for educational and learning purposes.

You are welcome to explore, modify, and extend the implementation with appropriate attribution.

---

<p align="center">
  <b>Designed with Verilog HDL | Simulated with Synopsys VCS | Debugged with Synopsys Verdi</b>
</p>

<p align="center">
  ⭐ If you find this project useful, consider starring the repository!
</p>

---

## 🏷️ GitHub Topics

verilog · verilog-hdl · ripple-counter · asynchronous-counter · 4-bit-counter · t-flip-flop · d-flip-flop · sequential-circuits · digital-design · rtl-design · vlsi · synopsys-vcs · synopsys-verdi · waveform-analysis
