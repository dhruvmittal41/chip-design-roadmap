# Day 1 — [Tool Verification + SV data types + first simulations]

**Phase:** [SV Foundations] | **Date:** 01/06/2026 | **Hours spent:** 8 hrs

---

## What I studied today

### Morning
- Verify and install all tools: Verified all the tools installations and working and explored the software interfaces.
- SV intro: SystemVerilog
an extension of verilog designed to improve the verification of DUT(Design Under Test) or DUV(Design under Verification)
- Data Types : SV data types like reg(register-stores value), Wire(To make connections), logic (can be both reg or  wire,can be procedural or continuous assignment),Packed Arrays(Single bit data type arrays,contiguous),unpacked arrays(can be of any data type,may or may not be contiguous).
- X and Z in simulation - X means not sure or a dont' care as we study in digital logic, in simulation when its not defined what the output is, it is assigned as X or when there is a conflict of values in a connection(making it both 0 and 1).
Z means high impedence or a floating point if any input is left open or unconnected then it is assigned as Z (and the respective floating point value is given to it).
- HDLbits - Solved five basics section problem to understand the data types and wire connections.

### Afternoon
- [What you built/coded]
- [Any problems you ran into and how you solved them]

### Evening
- [W&H Chapter X, pp. Y–Z]: [key insight from reading in 2-3 sentences]
- [Any other reading]

---

## What I built

[Describe the module/project in plain English. What does it do? 
What design decisions did you make? What was the hardest part?]

---

## Key concepts I now understand

- **[Concept 1]:** [Explain it as if to a junior student — if you can explain it, you understand it]
- **[Concept 2]:** [Same]
- **[Concept 3]:** [Same]

---

## Code highlights

```verilog
// paste the most interesting 10-15 lines from today's code
// the part that taught you the most or was hardest to get right
```

---

## Simulation result / synthesis result

[Screenshot description or paste a text table]
[e.g., "Synthesized parametrized FIFO (depth=16, width=32) — 
  LUT: 124, FF: 82, Fmax: 287 MHz on Artix-7 (xc7a35t)"]

---

## W&H Reading Summary

**Chapter X — [Chapter title], pp. Y–Z**

[3–5 sentences: what was the main idea, what surprised you, 
how does it connect to the RTL/FPGA work you're doing]

---

## Tomorrow's plan

- [ ] [Task 1 for Day N+1]
- [ ] [Task 2]
- [ ] [Task 3]

---

## Resources used today

| Resource | What I used it for |
|---|---|
| Nandland FPGA-101 | SV data types reference |
| HDLBits | Solved 8 problems in Basics section |
| W&H Ch.1 pp.1–30 | VLSI design hierarchy |