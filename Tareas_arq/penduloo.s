;=========================================== ; pendulo.asm - Sintaxis AVRASM para Proteus (ATmega328P) 
;============================================
.include "m328Pdef.inc" 
.cseg 
.org 0x0000 
rjmp RESET 
RESET: 
; Configurar PB0, PB1 y PB2 como salidas (0b00000111 = 0x07) 
ldi r16, 0x07 
out DDRB, r16 
MAIN_LOOP: 
; Paso 1: Encender D1 (PB0) 
ldi r16, 0b00000001 
out PORTB, r16 
rcall DELAY 
; Paso 2: Encender D2 (PB1) 
ldi r16, 0b00000010 
out PORTB, r16 
rcall DELAY 
; Paso 3: Encender D3 (PB2) 
ldi r16, 0b00000100 
out PORTB, r16 
rcall DELAY 
; Paso 4: Regresar a D2 (PB1) para completar el balanceo 
ldi r16, 0b00000010 
out PORTB, r16 
rcall DELAY 
rjmp MAIN_LOOP 
; Subrutina de retardo 
DELAY: 
ldi R18, 0x20 
DELAY1: 
ldi R19, 0xFF 
DELAY2: 
ldi R20, 0xFF 
DELAY3: 
subi R20, 1 
brne DELAY3 
subi R19, 1 
brne DELAY2 
subi R18, 1 
brne DELAY1 
    ret
