#include "stm32l432.h"
#include <math.h>

// GREEN LED ON PB3
void delay(unsigned dly)
{
    while(dly--);
}
int main()
{
    // Turn on GPIOB 
    RCC_AHB2ENR |= BIT1;
    GPIOB_MODER |= BIT6;
    GPIOB_MODER &= ~BIT7;
        while(1)
    {
        GPIOB_ODR |= BIT3;  // Turn on green led
        delay(100000);
        GPIOB_ODR &= ~BIT3; // Turn off green led
        delay(100000);
    }

}
