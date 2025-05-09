# Digital Logic with TL-Verilog and Makerchip
## 1) Combinational logic in TL-Verilog using Makerchip
### L1. Introduction to Logic Gates
1.**Logic Gates** are *fundamental building blocks* for digital circuits which take one or more inputs (1s or 0s) and give an output based on the logic.

  ![Screenshot 2025-04-25 170303](https://github.com/user-attachments/assets/3f92dc6f-33c9-4a0f-9b03-8a252eae09dd)

2.**Combinational circuits** are complex digital circuits that rely on fundamental building blocks, such as logic gates (AND, OR, NOT, XOR, etc.). They determine their outputs solely based on current inputs, without utilizing any memory or feedback mechanisms.

  ![Screenshot 2025-04-25 172211](https://github.com/user-attachments/assets/f4268b47-d086-498d-9542-12d643ac77d3)   ![Screenshot 2025-04-25 172855](https://github.com/user-attachments/assets/b28965fa-1fe0-44cf-9161-e1fc141d7ce4)

*Example*: Full Adder (adds 3 bits together) :
- Inputs: A, B, Cin (carry-in)  
- Outputs: S (sum), Cout (carry-out)

3.**Boolean Operators** are logical connectors used to evaluate conditions in programming and digital logic.

   ![Screenshot 2025-04-25 173724](https://github.com/user-attachments/assets/8b003fb5-b129-4331-b1c3-59c4c27970ca)

---

### L2. Basic Mux Implementation And Introduction To Makerchip
- A **MUX (Multiplexer)** selects one of multiple inputs and forwards it to a single output based on control signals. It's like a data switch!
- Its Verilog syntex is : assign f = s ? X1 : X2;

### L3.1  Labs for Cominational Logic
#### Inverter
<img width="960" alt="RV - lab day 3 (1) inverter" src="https://github.com/user-attachments/assets/9aaae375-841d-44b5-808a-01f31ec86ea9" />

#### Other logic : Boolean operators ( && , || , ^ )
   <img width="959" alt="RV - lab day 3 (2) boolean" src="https://github.com/user-attachments/assets/8bd7ce26-184f-4afb-8205-26cd5056a4b7" />

### L3.2  Vectors
**Vectors of 5 bits**
  <img width="960" alt="RV - lab day 3 (3) vector of 5 bits" src="https://github.com/user-attachments/assets/5926c1f5-91ad-4359-873f-e22c923f7823" />
  
### L3.3  Mux
**1.[ 2:0 ] Mux**
<img width="960" alt="RV - lab day 3 (4) mux" src="https://github.com/user-attachments/assets/a7b7a7f6-b16f-4238-ab7a-0afc4f3a4f94" />
 
### L3.4  Combinational Calculator
   <img width="949" alt="RV - lab day 3 (5) combinational calci" src="https://github.com/user-attachments/assets/7dfe32f0-74d9-49f8-8822-7868e8d16490" />
   
---

## 2) Sequential Logic 
### L1.  Introduction to Sequential Logic and Counter Lab 
Sequential logic is sequenced by a clock signal.
Example: D-flip-flop transition next state to current state on a rising clock edge
The circuit is constructed to enter a known state in response to a reset signal.

#### Fibonacci Series LAB
-Next value is sum of previous two: 1,1,2,3,5,8,13... { $num[31:0] = $reset ? 1 : >>1$num + >>2$num; }
 <img width="959" alt="RV - lab day 3 (6) fibbanocci" src="https://github.com/user-attachments/assets/17435776-3fee-4dcc-9f1d-c5ebbcffac3a" />
 
#### Counter LAB
   <img width="960" alt="RV - lab day 3 (7) counter" src="https://github.com/user-attachments/assets/b11d38f9-6e3f-480e-bc0b-c05015c5d32a" />

### L2.  Sequential Calculator Lab
Values in Verilog
eg: 16'hFO where 16 - 16-bits; h - hexadecimal; FO - value 
   ![Screenshot 2025-04-25 212255](https://github.com/user-attachments/assets/34e5ae43-4bef-43de-b794-83e59d33b8a8)
 <img width="960" alt="RV - lab day 3 (8) sequesntial calculator" src="https://github.com/user-attachments/assets/74089335-9fa1-4d91-a8e2-f03c1cbc1d95" />

---

## 3)  Pipelined logic
### L1. Pipelined Logic And Re-Timing
- **Pipeline logic** refers to the structured approach of breaking down a process into sequential stages, where each stage processes data and passes it to the       next. This technique is widely used to improve efficiency and throughput.
- In the comparison between **SystemVerilog and TL-Verilog**, the code reduction property of TL-Verilog offers a significant advantage over SystemVerilog. This reduction minimizes bugs and accelerates the design process, making development more efficient.

### L2. Pipeline Logic Advantages And Demo In Platform
- Pipeline logic enhances efficiency by breaking tasks into stages, enabling parallel execution.
- It speeds up processing, optimizes resource use, reduces latency, improves scalability, and supports automation in workflows.

### L3. Lab On Error Conditions Within Computation Pipeline
- **Identifier Type Determination** – The type of an identifier is defined by its symbol prefix and case/delimitation style.
- **Example Breakdown** – `$pipe_signal`  
   - **Symbol Prefix:** `$`  
   - **Delimitation Style:** `_`  
   - **Tokens:** `pipe`, `signal`
- **Delimitation Styles Based on First Token:**  
   - `$lower_case` → pipe signal  
   - `$CamelCase` → state signal  
   - `$UPPER_CASE` → keyword signal  
- **Numbers Affect Tokens:**  
   - `$base64_value` is valid  
   - `$bad_name_5` is invalid
- **Numeric Identifiers:**  
   - `>>1` represents "ahead by 1".
<img width="960" alt="RV - lab day 3 (9) error condition within computation pipeline" src="https://github.com/user-attachments/assets/c0370541-8a6b-4f67-8931-8bcaca4c1393" />

### L4. Lab On 2-Cycle Calculator

<img width="960" alt="RV - lab day 3 (11) 2 cycle calculator1" src="https://github.com/user-attachments/assets/ece750da-0495-472b-8881-1527612d3cff" />

---

## 4)  Validity
### L1. Introduction To Validity And Its Advantages
### L2. Lab On Validity And Valid When Condition

<img width="960" alt="RV - lab day 3 (12) validity" src="https://github.com/user-attachments/assets/e83d2acc-f972-4182-ba76-7a857c858e3d" />

### L3. Lab To Compute Total Distance

<img width="960" alt="RV - lab day 3 (13) compute total distance" src="https://github.com/user-attachments/assets/75ab5bff-d809-4dba-913b-d00004487540" />

### L4. Lab on 2-cycle Calculator with Validity

  ![Screenshot 2025-04-25 231907](https://github.com/user-attachments/assets/79b34ad7-70ed-4cfc-8c9b-1df48cf0efa3)

### L5. Calulator Single Value Memory Lab

<img width="960" alt="RV - lab day 3 (15) calculator single value memory" src="https://github.com/user-attachments/assets/52dafcd5-4348-47ae-84ad-9aee038a9124" />
