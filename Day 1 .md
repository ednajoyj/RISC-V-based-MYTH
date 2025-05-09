
# Day 1: Introduction to RISC-V ISA and GNU Compiler Toolchain

## RV-D1SK1 - Introduction to RISC-V Basic Keywords

### RV_D1SK1_L1_Introduction
1. Overview of the RISC-V Instruction Set Architecture (ISA).
2. RISC-V Architecture (C) → Implementation (RTL, e.g., PicoRV32 core) → Layout (qflow for hardware).
3. Layer mapping: Application layer → System software → Hardware layer.

### RV_D1SK1_L2_From Apps To Hardware
1. Software stack:  
   - Applications → System Software → OS → High-level languages (C, C++, Java, VB) → Compiler → ISA → Assembler  
2. Hardware flow:  
   - RTL snippet (understands instructions like `add x6, x10, ...`) → Synthesized netlist → Physical design implementation.    

---

## RV-D1SK2 - Labwork for RISC-V Software Toolchain

### RV_D1SK2_L1: C Program to Compute Sum from 1 to N
<img width="699" alt="RV - lab day 1 (1)" src="https://github.com/user-attachments/assets/8ae028d8-907a-4968-a5e4-e3569686a57b" />


```c
#include <stdio.h>

int main() {
    int i, sum = 0, n = 5;
    for (i = 0; i <= n; i++) {
        sum += i;
    }
    printf("Sum of 1 to %d is %d", n, sum);
    return 0;
}
```

Compile and run natively:
```bash
gcc sum1ton.c
./a.out
```
<img width="491" alt="RV - lab day 1 (2)" src="https://github.com/user-attachments/assets/e0e6fd41-d715-4ec2-a5a2-cf0aa798f552" />


### RV_D1SK2_L2: RISC-V GCC Compile and Disassemble
<img width="566" alt="RV - lab day 1 (3) disassemble" src="https://github.com/user-attachments/assets/f356dc1f-b4ba-4b9e-8264-733f1650a469" />


Compile for RISC-V:
```bash
riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o sum1ton.o sum1ton.c
riscv64-unknown-elf-objdump -d sum1ton.o | less
```
<img width="569" alt="RV - lab day 1 (4) disassemble" src="https://github.com/user-attachments/assets/e24e8bda-1924-4d15-9b24-047a6f413a71" />


- Searching in `main()` reveals ~15 instructions.

<img width="561" alt="RV - lab day 1 (5) disassemble" src="https://github.com/user-attachments/assets/d98343d2-7173-4bbe-8a9f-1ddd01594644" />



- With `-Ofast` optimization:
<img width="562" alt="RV - lab day 1 (6) dissasemble" src="https://github.com/user-attachments/assets/6dda7d6e-d555-4b55-9e84-3c605327fcc4" />


```bash
riscv64-unknown-elf-gcc -Ofast -mabi=lp64 -march=rv64i -o sum1ton.o sum1ton.c
```


### RV_D1SK2_L3: Spike Simulation and Debug
- Run on Spike:
  ```bash
  spike pk sum1ton.o
  ```
<img width="370" alt="RV - lab day 1 (8) simulate and debug" src="https://github.com/user-attachments/assets/54eaceaf-fb40-437e-ab27-c119929fa6e7" />


- Start Spike debugger:
  ```bash
  spike -d pk sum1ton.o
  ```
- Example debugger commands:
  ```
  :until pc 0x0100b0   # Stop before main()
  :reg a2             # View register a2
  ```
 
<img width="373" alt="RV - lab day 1 (7) simulate and debug" src="https://github.com/user-attachments/assets/de8b8df0-3d46-46f9-a8f8-8ebfd73b9c99" />


---

## RV-D1SK3 - Integer Number Representation

### RV_D1SK3_L1: 64-bit Unsigned Numbers
- **Double Word (64-bit):** Range 0 to 2^64 - 1.

### RV_D1SK3_L2: 64-bit Signed Numbers
- MSB = 0 → positive; MSB = 1 → negative.
- Two's complement procedure:
  1. Binary representation.
  2. Invert bits (1's complement).
  3. Add 1.
---
