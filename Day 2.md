# Day 2: Introduction to ABI and Basic Verification Flow

## RV-D2SK1 - Application Binary Interface (ABI)

### RV-D2SK1_L1: Introduction to ABI
The **Application Binary Interface (ABI)** defines the low-level interface between application code and the underlying hardware or operating system. It specifies:
- Calling conventions (how functions receive parameters and return values).
- Register usage and conventions.
- Memory layout and data type sizes.

In a typical software-to-hardware flow:
```
Applications Layer → Standard Libraries → Operating System (OS) → Instruction Set Architecture (RISC-V/ARM/x86) → Hardware (RTL)
```
Each arrow represents an interface layer (APIs, ABIs/System Call Interface, ISAs, RTL).

![Screenshot from 2025-05-06 20-31-02](https://github.com/user-attachments/assets/fd002c77-34db-4e31-903f-a2126a042e03)



RISC-V provides **32 integer registers** accessed via ABI names.  
- **XLEN** determines register width: 32-bit for RV32, 64-bit for RV64.

### RV-D2SK1_L2: Memory Allocation for Double Words
On RV64 (XLEN=64), double words (64-bit values) can be:
1. Stored directly in a 64-bit register.
2. Stored in memory across eight consecutive bytes (`m[0]` holds LSB, `m[7]` holds MSB in little-endian order).

For an array of three double words:
```
Bytes 0–7   → First double word
Bytes 8–15  → Second double word
Bytes 16–23 → Third double word
```
To load the third double word (bytes 16–23) into register `x8` using base register `x23`:
```assembly
ld x8, 16(x23)
```

## RV-D2SK2 - Lab Work: Custom Sum Algorithm in Assembly

### RV-D2SK2_L1: C Program with Assembly Function
The main C program passes parameters in registers `a0` and `a1` to an external assembly function `load`, which computes the sum from 1 to *n* and returns the result in `a0`.

**1to9_custom.c**
```c
#include <stdio.h>
extern int load(int x, int y);

int main() {
    int count = 9;
    int result = load(0x0, count + 1);
    printf("Sum from 1 to %d is %d\n", count, result);
    return 0;
}
```

<img width="678" alt="RV - lab day 2 (1)" src="https://github.com/user-attachments/assets/d6923b7e-4b37-4440-b8d9-552245748405" />


**load.S**
```assembly
    .section .text
    .global load
    .type load, @function
load:
    add a4, a0, zero     
    add a2, a0, a1        
    add a3, a0, zero      
loop:
    add a4, a3, a4       
    addi a3, a3, 1        
    blt a3, a2, loop      
    add a0, a4, zero      
    ret                  
```

<img width="678" alt="RV - lab day 2 (2)" src="https://github.com/user-attachments/assets/15c3bc29-0842-4071-b16c-c615cd6bed9b" />

### RV-D2SK2_L2: Compilation and Simulation

```bash
# Run on Spike simulator
spike pk 1to9_custom.o
```

<img width="404" alt="RV - lab day 2 (3)" src="https://github.com/user-attachments/assets/de8a1647-9cad-4cbd-8858-8f189be92646" />

---

## RV-D2SK3 - Basic Verification Flow using Icarus Verilog (iverilog)

In this lab, we run our C-generated program on a RISC-V CPU core written in Verilog (e.g., PicoRV32) and verify its execution.

### Setup and Execution
1. **Clone Verification Collaterals**  
   ```bash
   git clone https://github.com/kunalg123/riscv_workshop_collaterals.git
   cd riscv_workshop_collaterals/labs
   ```
   
<img width="583" alt="RV - lab day 2 (4)" src="https://github.com/user-attachments/assets/d9f1ad81-4ab5-4351-b794-b5a866b29d5a" />


2. **Inspect and Prepare Files**  
   ```bash
   ls -ltr
   vim picorv32.v       # RISC-V CPU core implementation
   vim testbench.v      # Testbench for simulation
   vim rv32im.sh        # Shell script to assemble and run tests
   ```
   *Snippet of testbench.v*
<img width="580" alt="RV - lab day 2 (6) (testbench v)" src="https://github.com/user-attachments/assets/536d311d-c5fa-4780-9835-78fbd38da0df" />

    *Snippet of rv32im.sh*
<img width="579" alt="RV - lab day 2 (7) rv32im" src="https://github.com/user-attachments/assets/768e32db-7f38-4953-8f03-c17a8115b201" />

4. **Run Verification Script**  
   ```bash
   chmod +x rv32im.sh
   ./rv32im.sh
   ```
      
   This script compiles the CPU core and testbench with `iverilog`, runs the simulation, and displays outputs for analysis.

<img width="442" alt="RV - lab day 2 (8)" src="https://github.com/user-attachments/assets/cf667b4a-22dd-46d4-986a-e19eb860a511" />

