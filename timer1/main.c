#include <stdint.h>
#include "../include/stm32l4x2.h"
#include "serial.h"
#include "timer1_spwm.h"
// GREEN LED ON PB3
void delay(volatile unsigned dly)
{
    while(dly--);
}

int main()
{
     // Turn on GPIOB 
    RCC->AHB2ENR |= BIT1;
    GPIOB->MODER |= BIT6;
    GPIOB->MODER &= ~BIT7;
    initUART2(9600);
	initTimer();
	enable_interrupts();
    while(1)
    {
		
		
    }
}
