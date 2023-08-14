# OpenPlush
Проект по созданию открытой виртуальной платформы на Verilog HDL, который включает в себя:
- **PlushUnit**: 32-битный ЦП с собственной архитектурой команд и встроенный GPU
- **PlushIO**: Средство коммутации оборудования хоста с OpenPlush
# Для чего?
Этот проект позиционирует себя как универсальная платформа для некоторого количества плат разработки на основе микроконтроллеров, который можно собрать в обычный исполняемый файл с помощью Verilator.
# ISA v0.3

**An Instruction**

- *mov r1 [00000001]*

mov -> 003 - Opcode

r1 -> 11 - Memory register; 00001000 - Register address

[00000001] -> 00 - Memory register; 00000001 - Ram address


**Memory register**

11 - An address is a register address

00 - An address is a ram address

10 - It is not an address, it is a number


**Instruction bits**

0 1 2 - Opcode

3 4 - Memory register

5 6 7 8 9 10 11 12 - Address

(5 6 7 8 9 - Register address)

13 14 - Memory register

15 16 17 18 19 20 21 22 - Address

(15 16 17 18 19 - Register addres)

Finally: 23 bits


**Registers mapping**

r0 - Temporary data

Do not write any info to r[0] it will be freed!

r1 - r32 - Free


**Opcodes**

000 - NOP

001 - ADD

002 - SUB

003 - MOV

004 - JMP


**Ram mapping**

0 <-> 32 - Temporary data (Addres 0)

Do not write any info to ram[0] it will be freed!

32 <-> 4096 - Free
