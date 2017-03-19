#include "stm32l432.h"
#include "serial.h"

// This program demonstrates timer driven data acquisition on
// the stm32l432 nucleo board. Data acquired via the ADC is
// simply passed back out through the DAC.
// Sampling rates of up to 4MHz are possible.
// DAC on PA4, DAC1_OUT1 (Labelled A3 on stm32l432 Nucleo board)
// ADC on PA3, ADC1_IN8  (Labelled A2 on stm32l432 Nucleo board)
// Will use Timer 2 to trigger ADC conversions and enable interrupts
// end of conversion.

void initDAC();
void initADC(unsigned SampleRate);
inline void writeDAC(int Output);
void delay();
void initClocks();
void configPins();
void displayRegisters(void);

volatile int ADCValue=0;
int main()
{
    char buf[20];
    initClocks();
    configPins();
    initUART(9600);
    initDAC();
    initADC(4000000);
    enable_interrupts();
    displayRegisters();
    while(1)
    {                       
        asm(" wfi   "); // Sleep between samples
    }    
    
}


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
void initDAC()
{
    // Configure PA4 as a DAC output
    RCC_AHB2ENR |= BIT0;     // ensure GPIOA is enabled    
    GPIOA_MODER |= BIT8 | BIT9; // Set mode to analogue (DAC) 
    RCC_APB1ENR1 |= BIT29;   // Enable the DAC
    RCC_APB1RSTR1 &= ~BIT29; // Take DAC out of reset
    DAC_CR &= ~BIT0;         // Enable = 0
    
    DAC_CR |= BIT0;          // Enable = 1
    
}
void initADC(unsigned SampleRate)
{
    // This routine enables the ADC and sets up Tim2 to trigger conversions
    // at the specified  rate of  on Channel 8
    // Configure PA3 as an ADC input
    RCC_AHB2ENR |= BIT0;     // ensure GPIOA is enabled    
    GPIOA_MODER |= BIT6 | BIT7; // Set mode to analogue (ADC) 
    // Select ADC clock source = 80MHz system clock
    RCC_CCIPR |= BIT29 | BIT28;
    RCC_AHB2ENR |= BIT13;    // Enable ADC
    RCC_AHB2RSTR &= ~BIT13;  // Take ADC out of reset
    ADC1_CR = 0;             // ensure  ADEN = 0 to allow configuration
    ADC1_CCR = BIT22;        // enable the voltage reference
    ADC1_CR = BIT28;         // Turn on the voltage reference

    // Start calibration sequence
    ADC1_CR |= BIT31;
    while(ADC1_CR & BIT31); // wait for calibration to finish
    RCC_APB1ENR1  |= BIT0;   // Enable Timer 2
    RCC_APB1RSTR1 &= ~BIT0;  // Take Timer 2 out of reset
    // Counter will be run in down-counting mode:  Counting up to TIM2_ARR and reset back to zero
    TIM2_CR1 = 0;      // Ensure CEN = 0 so other register bits can be set
    TIM2_SR = 0x00;    // Start with a clear Timer 2 status register
    TIM2_PSC = 0;      // select prescaler value of 1
    TIM2_ARR = 80000000/SampleRate;    //  (Divisor = 80MHz/SampleRate)
    TIM2_CR2 = BIT5;   // Select Master mode for Timer 2
    TIM2_EGR |= BIT0;  // Set UG bit
    TIM2_CR1 |= BIT4;  // Count down
    TIM2_CR1 |= BIT0;  // Enable timer 2
    // According to page 394 of RM0393 TIM2_TRGO event is ADC Trigger source EXT11 and
    // the bits 1011 need to be written to EXTSEL in ADC1_CFGR
    ADC1_CFGR = BIT31+BIT12+BIT10+BIT9+BIT7+BIT6; // Disable injection, enable external trigger, TIM2_TRG0 = trigger, allow overrun
    ADC1_SQR1 = 8 << 6;  // Channel 8 is the only channel in the conversion sequence.
    ADC1_IER = BIT2;     // enable interrupt when conversion is complete
    ISER0 |= BIT18;      // enable ADC interrupts in NVIC
    ADC1_CR |= BIT0;     // enable ADC
    ADC1_CR |= BIT2;     // start sampling
    
}
void ADC_ISR()
{
    // The green LED output is used to measure the execution time of the ISR
    GPIOB_ODR |= BIT3;   // Turn on green led
    ADC1_ISR = BIT3;     // clear ADC interrupt flag
    GPIOB_ODR |= BIT3;   // Toggle green led
    ADCValue = ADC1_DR;  // Read latest value from ADC conversion
    writeDAC(ADCValue);  // Write new output to DAC
    GPIOB_ODR &= ~BIT3;  // Turn off green led
}
inline void writeDAC(int Output)
{
    DAC_DHR12R1 = Output;
}
void displayRegisters()
{
    // Debugging routine to show the contents of various registers
    eputs("Ready to filter!  Diagnostics follow:\r\n");
    while(transmitting());
    eputs("\r\nADC1_ISR: ");
    printHex(ADC1_ISR);
    while(transmitting());
    eputs("\r\nADC1_IER: ");
    printHex(ADC1_IER);
    while(transmitting());
    eputs("\r\nADC1_CR: ");
    printHex(ADC1_CR);
    while(transmitting());
    eputs("\r\nADC1_CFGR: ");
    printHex(ADC1_CFGR);
    while(transmitting());
    eputs("\r\nADC1_CFGR2: ");
    printHex(ADC1_CFGR2);
    while(transmitting());
    eputs("\r\nADC1_DR: ");
    printHex(ADC1_DR);
    while(transmitting());
    eputs("\r\nADC1_SQR1: ");
    printHex(ADC1_SQR1);
    
    while(transmitting());
    eputs("\r\nTIM2_CR1: ");
    printHex(TIM2_CR1);
    
    while(transmitting());
    eputs("\r\nTIM2_CR2: ");
    printHex(TIM2_CR2);
    
    while(transmitting());
    eputs("\r\nTIM2_SMCR: ");
    printHex(TIM2_SMCR);

    while(transmitting());
    eputs("\r\nTIM2_DIER: ");
    printHex(TIM2_DIER);
        
    while(transmitting());
    eputs("\r\nTIM2_SR: ");
    printHex(TIM2_SR);

    while(transmitting());
    eputs("\r\nTIM1_EGR: ");
    printHex(TIM1_EGR);
    
    while(transmitting());
}
