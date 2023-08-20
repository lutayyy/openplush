# OpenPlush
Проект по созданию открытого ПК на Verilog HDL, который включает в себя:
- **PlushUnit**: 32-битный ЦП с собственной register-memory архитектурой команд
- **PlushASM**: Ассемблер для PlushUnit

### [Чат в телеграме](https://t.me/openplushchat)

## Цели проекта
Главная задача: переместить PlushUnit на кусок текстолита(при должном интересе к проекту и на кремний:D) с SMD транзисторами, и следовательно, технический процесс будет равен размеру этого самого SMD транзистора.

## Небольшой экскурс
Перед показом ISA стоит объяснить что здесь и как. PlushUnit - процессор с гарвардской архитектурой, из этого вытекает:
- *flash_instr.v* - 32-битная флеш память для инструкций с 256 ячейками. Из чего имеем 4096 бит памяти и 8-битный адрес.
- *flash_data.v* - 32-битная память для данных. 4096 бит памяти и 8-битный адрес.
  
Кроме этого:
- *ram.v* - 32-битная оперативная память. 4096 бит памяти и 8-битный адрес.
- *regf.v* - 32-битные регистры в количестве 32 штук.

Для того чтобы декодер инструкций понял, какой дальше следует адрес (Адрес регистра или адрес в ОЗУ) или вовсе число,
был введен `memory register`. Сейчас инструкции занимают 23 бита памяти, а не 32. Это нужно, чтобы была возможность увеличить
память в процессе развития архитектуры.

## ISA v0.3

**Memory register**

- `11` - An address is a register address

- `00` - An address is a ram address

- `10` - It is not an address, it is a number


**Instruction bits(Little Endian)**

`0 1 2` - Opcode

`3 4` - Memory register

`5 6 7 8 9 10 11 12` - Address

`13 14` - Memory register

`15 16 17 18 19 20 21 22` - Address

`23 24 25 26 27 28 29 30 31` - Free

**Instruction bits(Big Endian)**

`31 30 29` - Opcode

`28 27` - Memory register

`26 25 24 23 22 21 20 19` - Address

`18 17` - Memory register

`16 15 14 13 12 11 10 9` - Address

`8 7 6 5 4 3 2 1 0` - Free

**Registers mapping**

`r0` - Temporary data

***Do not write any info to r[0] it will be freed!***

`r1 <-> r32` - Free


**Opcodes**
```
000 - NOP

001 - ADD

010 - SUB

011 - MOV

100 - JMP

101 - JZ
```

**Ram mapping**

`0 <-> 32` - Temporary data (Addres 0)

***Do not write any info to ram[0] it will be freed!***

`32 <-> 4096` - Free

## Example

**An Instruction**

`mov r1 [00000001]`
  
**In binary**

`00111000010000000000001`

**Translation**
```
001 - Opcode

11 - Memory register

00001000 - Register address

00 - Memory register

00000001 - Ram address
```
