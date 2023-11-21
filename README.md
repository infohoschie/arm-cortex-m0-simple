# Simple ARM Cortex M0 Example

Dieses Projekt wird im Rahmen der Vorlesung "Systemnahe Programmierung" an der DHBW Ravensburg verwendet.

Die Assembler Datei *simple.s* enthält einen minimalen Rumpf um ein paar
Befehle auszuführen.

## Vorraussetzungen
 - Arm Cross-Compiler
 - Arm QEMU System Emulator
 - Arm (Multi-Arch) Debugger GDB

### Installation Windows
 - [Arm Cross Toolchain](https://gnutoolchains.com/arm-eabi/)
   Enthält, GCC, Binutils und GDB
 - [Arm Qemu fow Windows](https://www.qemu.org/download/#windows)
   Die Native Version oder MSYS Anleitung

### Installation Linux
 - Arm Cross Compiler Paket: _gcc-arm-none-eabi_
 - QEMU Arm Paket: _qemu-system-arm_
 - GDB (Multi-Arch) Paket: _gdb-multiarch_

Bei SUSE scheint der standard GDB ein GDB-Multiarch zu sein.

### Installation MacOS
TODO

## Compilieren und Linken
 - Compilieren:
   `arm-none-eabi-gcc -c -mcpu=cortex-m0 -nostdlib -g -o Simple.o Simple.S`
 - Linken:
   `arm-none-eabi-gcc --specs=nosys.specs -nostartfiles -o Simple.elf Simple.o -Ttext 0 -e Reset_Handler`
 - ELF-File in Binary konvertieren (optional):
   `arm-none-eabi-objcopy Simple.elf -O binary Simple.bin`

## Generiertes Output analysieren (optional)
 - ELF-Sections anzeige:
   `arm-none-eabi-objdump -x Simple.elf`
 - ELF-File disassemblieren (mit Quellcode-Verknüpfung):
   `arm-none-eabi-objdump -d Simple.elf`
   `arm-none-eabi-objdump -d -S Simple.elf`

## QEMU Emulator starten und mit GDB verbinden
QEMU und GDB müssen in unterschiedlichen Konsolen (Shells) gestartet werden.
 - QEMU Emlation Starten:
   `qemu-system-arm -M microbit -device loader,file=simple.elf -nographic -S -s`
 - GDB zu WEMU verbinden:
   `gdb-multiarch simple.elf -ex "target extended-remote localhost:1234" -ex "load"`

Hilfreiche GDB Befehele:
 - _help_ und _apropos_
 - _step_ und _next_
 - _info all-registers_
