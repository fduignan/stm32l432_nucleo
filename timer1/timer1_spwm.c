/*
 * On the STM32L031 Nucleo 32 board
 * TIM1_CH1 = PA8 *  AF1 
 * TIM1_CH1N = PA7 * AF1 
 * TIM1_CH2 = PA9 *  AF1  
 * TIM1_CH2N = PB0 * AF1
 * TIM1_CH3 = PA10 * AF1
 * TIM1_CH3N = PB1 * AF1
 * 
 */

#include <stdint.h>
#include "../include/stm32l4x2.h"

#include "lookup.h"
const uint32_t SampleCount = sizeof(SineArray)/sizeof(uint16_t);
volatile uint32_t SampleCounter1 = 0;
volatile uint32_t SampleCounter2 = (SampleCount/4); // start SampleCounter2 a quarter cycle (90) ahead of SampleCounter1


void initTimer()
{
    // This function initializes TIM1 such that it produces output for Channels 0 and 1.  Inverted outputs are also enabled.
	// The base clock frequency is 80MHz.
    // Upper limit of audio is 20kHz
    // If PWM resolution is 8 bits then the switching
    // frequency will be 80^6/256 = 312500Hz.
	
   
    RCC->APB2ENR |= BIT11;  // turn on clock for TIM1
    RCC->AHB2ENR |= BIT0 + BIT1;   // turn on clock for GPIOA and GPIOB    
    // Select Alternate function for PA7,PA8,PA9
    GPIOA->MODER &= ~(BIT19+BIT18+BIT17+BIT16+BIT15+BIT14);
	GPIOA->MODER |=  (BIT19+     +BIT17      +BIT15);
    GPIOA->OSPEEDR |= (BIT19+BIT18+BIT17+BIT16+BIT15+BIT14); // Maximum speed on these pins
	// Select AF1
	GPIOA->AFRL &= ~(0xf0000000);
	GPIOA->AFRL |=  (0x10000000);
	GPIOA->AFRH &= ~(0x00000fff);
	GPIOA->AFRH |=  (0x00000111);
	
	// Select Alternate function for PA7,PA8,PA9
	GPIOB->MODER &= ~(BIT1 + BIT0);
	GPIOB->MODER |=  (BIT1);
    GPIOB->OSPEEDR |= (BIT1 + BIT0); // Maximum speed on these pins
	// Select AF1
	GPIOB->AFRL &=~(0x0000000f);
	GPIOB->AFRL |= (0x00000001);
	
    TIM1->ARR = ScaleFactor;
    TIM1->CCR1 = 0;
    TIM1->CCR2 = 0;
	
    TIM1->CCMR1_Output = BIT14 + BIT13 + BIT11 + BIT10 + BIT6 + BIT5 + BIT3 + BIT2; // PWM mode 1 for CH1,CH2, Fast mode enable, preload enable
    TIM1->CCER |= BIT0 + BIT4 + BIT2 + BIT6;    // Enable OC1,OC2 outputs and their inverses
    TIM1->BDTR |= BIT15;// + 0x08; // Main output enable
    TIM1->CR1 |= BIT7 + BIT2; // Set the ARPE bit
    TIM1->EGR |= BIT0; // Force update of registers    
    TIM1->CR1 &= ~BIT1; // clear update disable bit 
    TIM1->DIER |= BIT0; // enable update events
    NVIC->ISER0 |= BIT25; // enable update events interrupt in NVIC
    TIM1->OR2=0;
	TIM1->OR3=0;
	TIM1->PSC = 9; // Divide the 80MHz clock down to 8MHz
    TIM1->CR1 |= BIT0; // enable the timer
    
}
void TIM1_UE_Handler(void)
{
/*
 * Warning: it is really important to do something that consumes a few clock cycles in this ISR after the interrupt flags are cleared 
 * see : https://developer.arm.com/documentation/ka003795/latest
 */
	
	TIM1->SR =0; // 
	TIM1->CCR1 = SineArray[SampleCounter1];
	SampleCounter1++;
	if (SampleCounter1 >= sizeof(SineArray)/2)
	{
		SampleCounter1 = 0;
	}
	TIM1->CCR2 = SineArray[SampleCounter2];
	SampleCounter2++;
	if (SampleCounter2 >= sizeof(SineArray)/2)
	{
		SampleCounter2 = 0;
	}
	GPIOB->ODR ^= BIT3; // Toggle green LED	
	
}
