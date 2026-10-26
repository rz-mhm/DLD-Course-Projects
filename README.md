# Digital Systems 1 - Computer Assignments

Course assignments and digital design projects for **Digital Systems 1** (University of Tehran, Spring 1405 / 2026).

**Author:** Reza Mohammadi  
**Tools Used:** ModelSim / QuestaSim, Intel Quartus Prime, Yosys Open-Source Synthesis  

---

## 📁 Repository Overview

```
computer-assignments/
├── CA1&2/                     # Computer Assignments 1 & 2: Zero Counters
│   ├── verilog codes/         # Verilog source files & testbenches (3-, 7-, 15-input ZC)
│   └── report.pdf             # Assignment report (PDF)
│
├── CA3/                       # Computer Assignment 3: 16-bit ALU
│   ├── behavioral/            # Behavioral SystemVerilog model & testbench
│   ├── structural/            # Structural SystemVerilog model & submodules
│   ├── constants/             # Shared ALU operation opcode constants
│   ├── synthesis/             # Yosys synthesis scripts, cell library, and netlists
│   └── report.pdf             # Assignment report
│
├── CA4_5/                     # Computer Assignments 4 & 5: Radix-4 Multiplier
│   └── radix4_multiplier/
│       ├── rtl/               # Datapath, Controller, and Top-level RTL
│       ├── tb/                # Testbenches for Datapath, Controller, and Top module
│       ├── quartus/           # Quartus Prime project files & BDF schematics
│       ├── synthesis/         # Yosys synthesis script, 45nm library, and netlist
│       └── docs/              # Assignment report
│
├── .gitignore                 # EDA & build-artifact ignore rules
└── README.md                  # Project documentation
```

---

## 📌 Projects Breakdown

### 🔹 CA1 & CA2: Zero Counters (ZC)
- **Objective:** Design, hierarchical composition, and verification of zero-counter circuits counting the number of `'0'`s in multi-bit binary inputs.
- **Implementations:**
  - **3-input ZC (`ZC.v`):** Basic counting block with gate delay models.
  - **7-input & 15-input ZC:** Hierarchical tree implementations using 3-input ZC cells and adders.
  - Explored design styles: Primitive gates, assigned primitives, complex gate expressions, and justification analysis.
- **Verification:** Self-checking and comparative testbenches (`seven_input_zc_comparativeTb.v`, etc.).

---

### 🔹 CA3: 16-bit ALU (Behavioral & Structural)
- **Objective:** Design, synthesis, and gate-level verification of a signed 16-bit Arithmetic Logic Unit (ALU).
- **Supported Operations:**
  | Opcode (`opc`) | Operation | Description |
  | :--- | :--- | :--- |
  | `3'b000` | `OP_ADD` | Addition with carry (`inM + inN + inC`) |
  | `3'b001` | `OP_DIV3` | Division by 3 approximation (`inM + inN/3`) |
  | `3'b010` | `OP_INC` | Increment (`inM + 1`) |
  | `3'b011` | `OP_MUL3` | Multiply by 3 (`inM * 3`) |
  | `3'b100` | `OP_AND` | Bitwise AND (`inM & inN`) |
  | `3'b101` | `OP_OR` | Bitwise OR (`inM \| inN`) |
  | `3'b110` | `OP_NOT` | Bitwise NOT (`~inM`) |
  | `3'b111` | `OP_NOP` | High Impedance (`16'bz`) |
- **Architectures:**
  - **Behavioral Model (`behavioral/alu_behav.sv`):** High-level algorithmic model.
  - **Structural Model (`structural/alu_struct.sv`):** Composed of 16-bit adder, bitwise logic unit, and multiplexers.
- **Logic Synthesis:** Synthesized using **Yosys** and mapped to standard cells (`mycells.lib`), followed by gate-level netlist verification.

---

### 🔹 CA4 & CA5: 16-bit Radix-4 Multiplier
- **Objective:** Design, synthesis, and verification of a high-performance 16-bit signed Radix-4 multiplier with dedicated Datapath and Control Unit (FSM).
- **Architecture:**
  - **Datapath (`multiplierDp.sv`):**
    - `AshiftReg.sv`: Multiplier register with 2-bit shifting and Radix-4 recoding.
    - `Bregister.sv`: Multiplicand register.
    - `PshiftReg.sv`: Accumulator / Partial product shift register.
    - `Alu.sv`: Partial product addition/subtraction unit.
    - `coutner.sv`: Iteration step counter.
  - **Controller (`controller.sv`):** Finite State Machine orchestrating initialization, addition/subtraction, shifting, and handshaking (`start`, `ready`).
  - **Top Module (`radix4_multiplier.sv`):** Connects datapath and controller.
- **EDA & Synthesis:**
  - **Intel Quartus Prime:** Includes project file (`.qpf`), settings (`.qsf`), block symbol (`.bsf`), and schematic diagram (`.bdf`).
  - **Yosys Synthesis:** Synthesized with Nangate 45nm Open Cell Library (`library.lib`), producing gate-level netlist `synth_radix4_multiplier_top.v`.
- **Verification:**
  - Unit testbenches for datapath (`tb_datapath.sv`), controller (`tb_controller.sv`), and top-level multiplier (`tb_top.sv`).
  - Post-synthesis gate-level simulation (`tb_synth_radix4_multiplier_top.sv`).

---

## 🛠️ Simulation & Synthesis

### Simulation (ModelSim / QuestaSim)
To compile and simulate any of the testbenches:
```bash
# Example: Simulating the Radix-4 Multiplier
vlib work
vlog -sv rtl/*.sv tb/tb_top.sv
vsim -c tb_top -do "run -all; quit -f"
```

### Synthesis (Yosys)
To synthesize designs using the included synthesis scripts:
```bash
# Example: Synthesizing CA3 structural ALU
cd CA3/synthesis
yosys synth_struct.ys

# Example: Synthesizing CA4_5 Radix-4 Multiplier
cd CA4_5/radix4_multiplier/synthesis
yosys synth_script.ys
```
