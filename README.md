# Single-Cycle Processor

## Main Modules

### Datapath
Used to connect different modules and creates path the instruction takes through the processor.
You can find the pdf [here](https://github.com/w8ste/Single-Cycle-Processor/blob/main/.images/datapath.pdf).
### Decoder
Part of the Control Unit. It is used to set different flags depending on the instruction, that is suppposed to be executed.

<img src="https://github.com/w8ste/Single-Cycle-Processor/blob/main/.images/decoder.png" width="600" height="500" />

You can find the pdf [here](https://github.com/w8ste/Single-Cycle-Processor/blob/main/.images/decoder.png).
## Building blocks
The block folder contains the associated files. 

#### Adder
The [adder module](https://github.com/w8ste/Single-Cycle-Processor/blob/main/blocks/adder.sv) is fairly straight forward. The adder has two data inputs,
adds them together and outputs the result.

<img src="https://github.com/w8ste/Single-Cycle-Processor/blob/main/.images/adder.png" width="500" height="400" />

### Multiplexer 
The [mux module](https://github.com/w8ste/Single-Cycle-Processor/blob/main/blocks/multiplexer.sv) is also quite simple. It has one parameter, which determines the width of the data inputs (d0, d1) and output.
| input logic s    | output logic y     |
|------------------|--------------------|
| 0                |    d0              |
| 1                |    d1              |

<img src="https://github.com/w8ste/Single-Cycle-Processor/blob/main/.images/mux.png" width="500" height="600" />

### Register File
The [register file module](https://github.com/Single-Cycle-Processor/main/blocks/multiplexer.sv) is used by digitial system to store temporary variables. In arm 32-bit, we have 15 32-bit register.
You can find the synthesiis of the code [here](https://github.com/w8ste/Single-Cycle-Processor/blob/main/.images/registerFile.pdf).

### Resetable Flip-Flip

<img src="https://github.com/w8ste/Single-Cycle-Processor/blob/main/.images/reset_ff.png" width="500" height="600" />

### Resetable Flip-Flip wit enable signal

<img src="https://github.com/w8ste/Single-Cycle-Processor/blob/main/.images/reset_enable_ff.png" width="500" height="600" />

### Extender
The [extender module](https://github.com/w8ste/Single-Cycle-Processor/blob/main/blocks/extender.sv) is used to extend different bit-widths. Here is how this functions:
| Imm Src         | Ext Imm           |
|-----------------|-------------------|
| 00              |  Imm {24x0} instr_7:0  |
| 01              | {20x0} instr_11:0  |
| 10              | {6xinstr_23} instr_23:0  |

<img src="https://github.com/w8ste/Single-Cycle-Processor/blob/main/.images/extender.png" width="500" height="600" />

You can find the pdf [here.](https://github.com/w8ste/Single-Cycle-Processor/blob/main/.images/extender.pdf)

### ALU
The ALU is used to execute various arithmetic calculations. You can find the synthesis [here.](https://github.com/w8ste/Single-Cycle-Processor/blob/main/.images/alu.pdf)

## Appendix
- This project is based on the book `Digital Design
and Computer Architecture` by Harris & Harris and their implementation of a Single-Cycle-Processor.
- Im only learning how to optimize with [yosys](https://github.com/YosysHQ/yosys), which is why it is possible, that the synthesized product is a bit blown out of proportion.
