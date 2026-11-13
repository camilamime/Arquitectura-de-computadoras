#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdint.h>

volatile uint16_t Contador_ms = 0;

ISR(TIMER1_COMPA_vect) {
    Contador_ms++;
    if (Contador_ms >= 500) {
        PORTD ^= (1 << PD4);
        Contador_ms = 0;
    }
}

int main(void) {
    DDRD |= (1 << DDD4);

    TCCR1A = 0;
    TCCR1B = 0;
    TCNT1  = 0;
    OCR1A  = 249;

    TCCR1B |= (1 << WGM12);                
    TCCR1B |= (1 << CS11) | (1 << CS10);       

    TIMSK1 |= (1 << OCIE1A);
    sei();

    while (1);
}
