# Processor

A functional CPU described in Verilog

## Table of Contents

- [Processor](#processor)
  - [Table of Contents](#table-of-contents)
  - [Instruction Set](#instruction-set)
  - [Instruction Formats](#instruction-formats)
    - [Format #01](#format-01)
    - [Format #02](#format-02)
    - [Format #03](#format-03)
    - [Format #04](#format-04)
    - [Format #05](#format-05)
    - [Format #06](#format-06)
    - [Format #07](#format-07)
    - [Format #08](#format-08)
  - [Instruction Addressing Modes](#instruction-addressing-modes)
    - [Register Mode](#register-mode)
    - [Indexed Addressing Mode](#indexed-addressing-mode)
    - [Immediate Mode](#immediate-mode)

## Instruction Set

| #     | Name  | Assembly Format | Processor Operation                      |
| :---: | :---: | :-------------: | :--------------------------------------: |
| 0     | ADD   | add RS, RT, RD  | RFILE[RS] ← RFILE[RT] + RFILE[RD]        |
| 1     | SUB   | sub RS, RT, RD  | RFILE[RS] ← RFILE[RT] - RFILE[RD]        |
| 2     | MULT  | mult RS, RT, RD | RFILE[RS] ← RFILE[RT] * RFILE[RD]        |
| 3     | DIV   | div RS, RT, RD  | RFILE[RS] ← RFILE[RT] / RFILE[RD]        |
| 4     | MOD   | mod RS, RT, RD  | RFILE[RS] ← RFILE[RT] % RFILE[RD]        |
| 5     | LSH   | lsh RS, RT, RD  | RFILE[RS] ← RFILE[RT] << RFILE[RD]       |
| 6     | RSH   | rsh RS, RT, RD  | RFILE[RS] ← RFILE[RT] >> RFILE[RD]       |
| 7     | AND   | and RS, RT, RD  | RFILE[RS] ← RFILE[RT] && RFILE[RD]       |
| 8     | OR    | or RS, RT, RD   | RFILE[RS] ← RFILE[RT] ∥ RFILE[RD]        |
| 9     | NOT   | not RS, RT      | RFILE[RS] ← !RFILE[RT]                   |
| 10    | EQ    | eq RS, RT, RD   | RFILE[RS] ← RFILE[RT] = RFILE[RD]        |
| 11    | NEQ   | neq RS, RT, RD  | RFILE[RS] ← RFILE[RT] ≠ RFILE[RD]        |
| 12    | LT    | lt RS, RT, RD   | RFILE[RS] ← RFILE[RT] < RFILE[RD]        |
| 13    | LTE   | lte RS, RT, RD  | RFILE[RS] ← RFILE[RT] ≤ RFILE[RD]        |
| 14    | MOV   | mov RT, RD      | RFILE[RT] ← RFILE[RD]                    |
| 15    | LW    | lw RS, RD, IM11 | RFILE[RS] ← DATAMEM[RFILE[RD] + IM11]    |
| 16    | SW    | sw RT, RD, IM11 | DATAMEM[RFILE[RD] + IM11] ← RFILE[RT]    |
| 17    | LDI   | ldi RS, IM21    | RFILE[RS] ← IM21                         |
| 18    | IN    | in RS           | RFILE[RS] ← SS                           |
| 19    | OUT   | out RT          | DD7 ← RFILE[RT] and SLED ← RFILE[RT[31]] |
| 20    | JMP   | jmp RT          | PC ← RFILE[RT]                           |
| 21    | BEQZ  | beqz RT, RD     | PC ← (!RFILE[RD]) ? RFILE[RT] : PC + 1   |
| 22    | HLT   | hlt             | PC ← PC                                  |
| 23    | NOP   | nop             | PC ← PC + 1                              |

Where:

- RS, RT and RD are register addresses (5 bits data length);
- IM11 is the immediate address (11 bits data length);
- IM21 is the immediate data (21 bits data length);
- PC is the program counter (11 bits data length);
- DD7 is the set of 4 seven segment digital displays to display data;
- SLED is the LED (Light Emitting Diode) to display data signal (whether a value is positive or negative);
- SS is the set of 11 slide switches to input data;
- RFILE is the register file (32 bits data length x 32 positions data depth);
- INSTMEM is the instruction memory (32 bits data length x 8096 positions data depth);
- DATAMEM is the data memory (32 bits data length x 2048 positions data depth);
- IN and OUT instructions always need a NOP instruction after executing it to ensure clock mode safe transition;
- All instructions (excluding IN and OUT) use system clock mode to perform the associated processor operations. These other ones (IN and OUT) use manual clock mode to perform the associated processor operations.

## Instruction Formats

### Format #01

| OPCODE | RS    | RT    | RD    | VOID  |
| :----: | :---: | :---: | :---: | :---: |
| 31:26  | 25:21 | 20:16 | 15:11 | 10:0  |

Where:

- OPCODE is the instruction operation code (6 bits data length);
- RS, RT and RD are register addresses (5 bits data length);
- VOID are the useless bits.

Instructions:

- From 0 (ADD) to 13 (LTE)

### Format #02

| OPCODE | VOID  | RT    | RD    | VOID  |
| :----: | :---: | :---: | :---: | :---: |
| 31:26  | 25:21 | 20:16 | 15:11 | 10:0  |

Where:

- OPCODE is the instruction operation code (6 bits data length);
- RT and RD are register addresses (5 bits data length);
- VOID are the useless bits.

Instructions:

- 14 (MOV)
- 21 (BEQZ)

### Format #03

| OPCODE | RS    | VOID  | RD    | IM11  |
| :----: | :---: | :---: | :---: | :---: |
| 31:26  | 25:21 | 20:16 | 15:11 | 10:0  |

Where:

- OPCODE is the instruction operation code (6 bits data length);
- RS and RD are register addresses (5 bits data length);
- IM11 is the immediate address (11 bits data length);
- VOID are the useless bits.

Instructions:

- 15 (LW)

### Format #04

| OPCODE | VOID  | RT    | RD    | IM11  |
| :----: | :---: | :---: | :---: | :---: |
| 31:26  | 25:21 | 20:16 | 15:11 | 10:0  |

Where:

- OPCODE is the instruction operation code (6 bits data length);
- RT and RD are register addresses (5 bits data length);
- IM11 is the immediate address (11 bits data length);
- VOID are the useless bits.

Instructions:

- 16 (SW)

### Format #05

| OPCODE | RS    | IM21  |
| :----: | :---: | :---: |
| 31:26  | 25:21 | 20:0  |

Where:

- OPCODE is the instruction operation code (6 bits data length);
- RS is the register address (5 bits data length);
- IM21 is the immediate data (21 bits data length).

Instructions:

- 17 (LDI)

### Format #06

| OPCODE | RS    | VOID  |
| :----: | :---: | :---: |
| 31:26  | 25:21 | 20:0  |

Where:

- OPCODE is the instruction operation code (6 bits data length);
- RS is the register address (5 bits data length);
- VOID are the useless bits.

Instructions:

- 18 (IN)

### Format #07

| OPCODE | VOID  | RT    | VOID  |
| :----: | :---: | :---: | :---: |
| 31:26  | 25:21 | 20:16 | 15:0  |

Where:

- OPCODE is the instruction operation code (6 bits data length);
- RT is the register address (5 bits data length);
- VOID are the useless bits.

Instructions:

- 19 (OUT)
- 20 (JMP)

### Format #08

| OPCODE | VOID  |
| :----: | :---: |
| 31:26  | 25:0  |

Where:

- OPCODE is the instruction operation code (6 bits data length);
- VOID are the useless bits;

Instructions:

- 22 (HLT)
- 23 (NOP)

## Instruction Addressing Modes

### Register Mode

Instructions:

- From 0 (ADD) to 14 (MOV)
- From 18 (IN) to 21 (BEQZ)

### Indexed Addressing Mode

Instructions:

- 15 (LW)
- 16 (SW)

### Immediate Mode

Instructions:

- 17 (LDI)