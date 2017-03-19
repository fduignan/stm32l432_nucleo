#include "stm32l432.h"
#include "serial.h"

// GREEN LED ON PB3
void delay(unsigned dly)
{
    while(dly--);
}
void initClocks()
{
	// Initialize the clock system to a higher speed.
	// At boot time, the clock is derived from the MSI clock 
	// which defaults to 4MHz.  Will set it to 80MHz
	// See chapter 6 of the reference manual (RM0393)
	RCC_CR &= ~BIT24; // Make sure PLL is off
	
	// PLL Input clock = MSI so BIT1 = 1, BIT 0 = 0
	// PLLM = Divisor for input clock : set = 1 so BIT6,5,4 = 0
	// PLL-VCO speed = PLL_N x PLL Input clock
	// This must be < 344MHz
	// PLL Input clock = 4MHz from MSI
	// PLL_N can range from 8 to 86.  
	// Will use 80 for PLL_N as 80 * 4 = 320MHz
	// Put value 80 into bits 14:8 (being sure to clear bits as necessary)
	// PLLSAI3 : Serial audio interface : not using leave BIT16 = 0
	// PLLP : Must pick a value that divides 320MHz down to <= 80MHz
	// If BIT17 = 1 then divisor is 17; 320/17 = 18.82MHz : ok (PLLP used by SAI)
	// PLLQEN : Don't need this so set BIT20 = 0
	// PLLQ : Must divide 320 down to value <=80MHz.  
	// Set BIT22,21 to 1 to get a divisor of 8 : ok
	// PLLREN : This enables the PLLCLK output of the PLL
	// I think we need this so set to 1. BIT24 = 1 
	// PLLR : Pick a value that divides 320 down to <= 80MHz
	// Choose 4 to give an 80MHz output.  
	// BIT26 = 0; BIT25 = 1
	// All other bits reserved and zero at reset
	RCC_PLLCFGR = BIT25 + BIT24 + BIT22 + BIT21 + \
				  BIT17 + (80 << 8) + BIT0;	
	RCC_CR |= BIT24; // Turn PLL on
	while( (RCC_CR & BIT25)== 0); // Wait for PLL to be ready
	// configure flash for 4 wait states (required at 80MHz)
	FLASH_ACR &= ~(BIT2+BIT1+BIT0);
	FLASH_ACR |= BIT2; 
	RCC_CFGR |= BIT1+BIT0; // Select PLL as system clock
}
void configPins()
{

    // Turn on GPIOB 
    RCC_AHB2ENR |= BIT1;
    GPIOB_MODER |= BIT6;
    GPIOB_MODER &= ~BIT7;

}
int main()
{
    char buf[20];
    initClocks();
    configPins();
    initUART(9600); 
    eputs("Ready.  Type some text and press enter\r\n");
    while(1)
    {                       
        if (available())
        {
            egets(buf,20);
            GPIOB_ODR |= BIT3;  // Turn on green led                        
            eputs(buf);
            GPIOB_ODR &= ~BIT3;  // Turn off green led                        
                    
        }
    }    
    
}
