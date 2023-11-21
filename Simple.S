/**
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * Thomas Vogt, thomas@thomas-vogt.de
 * Sven Reis 
 **/

.section .text

.long 0x20000000
.long Reset_Handler
.byte 0xde, 0xea, 0xd0

.align 2

.global Reset_Handler
.type Reset_Handler, %function
Reset_Handler:
MOV R0, #4
MOV R1, #6
ADD R2, R0, R1
NOP

LDR R3, =Reset_Handler
BX R3

