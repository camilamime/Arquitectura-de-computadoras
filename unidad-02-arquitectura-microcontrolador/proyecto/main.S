#include <avr/io.h>

.section .text
.global main

main:
CASO1:
    ldi r16, 0x7F
    ldi r17, 0x01
    add r16, r17 
CASO2:  
    ldi r16, 0xFF
    ldi r17, 0x01
    add r16, r17 
CASO3:
    ldi r16, 0x10
    ldi r17, 0x20
    add r16,r17
END:
    rjmp END


;target remote localhost:1234
;file build/main.elf