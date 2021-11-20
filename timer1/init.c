#include <stdint.h>
#include "../include/stm32l4x2.h"

void init(void);
void Default_Handler(void);
int main(void);
void USART2_Handler(void);
void TIM1_UE_Handler(void);

// The following are 'declared' in the linker script
extern uint8_t  INIT_DATA_VALUES;
extern uint8_t  INIT_DATA_START;
extern uint8_t  INIT_DATA_END;
extern uint8_t  BSS_START;
extern uint8_t  BSS_END;
// the section "vectors" is placed at the beginning of flash 
// by the linker script
const void * Vectors[] __attribute__((section(".vectors"))) ={
    (void *)0x2000C000,     /* Top of stack at top of sram1 48k */ 
    init,                   /* Reset Handler */
    Default_Handler,        /* NMI */
    Default_Handler,        /* Hard Fault */
    Default_Handler,        /* MemManage */
    Default_Handler,        /* BusFault  */
    Default_Handler,        /* UsageFault */
    Default_Handler,        /* Reserved */ 
    Default_Handler,        /* Reserved */
    Default_Handler,        /* Reserved */
    Default_Handler,        /* Reserved */
    Default_Handler,        /* SVCall */
    Default_Handler,        /* Debug */
    Default_Handler,        /* Reserved */
    Default_Handler,        /* PendSV */
    Default_Handler,        /* SysTick */	
/* External interrupt handlers follow */
    Default_Handler,        /* 0 WWDG */
    Default_Handler,        /* 1 PVD */
    Default_Handler,        /* 2 TAMP_SAMP */
    Default_Handler,        /* 3 RTC_WKUP */
    Default_Handler,        /* 4 FLASH */
    Default_Handler,        /* 5 RCC */
    Default_Handler,        /* 6 EXTI0 */
    Default_Handler,        /* 7 EXTI1 */
    Default_Handler,        /* 8 EXTI2 */
    Default_Handler,        /* 9 EXTI3 */
    Default_Handler,        /* 10 EXTI4 */
    Default_Handler,        /* 11 DMA_CH1 */
    Default_Handler,        /* 12 DMA_CH2 */
    Default_Handler,        /* 13 DMA_CH3 */
    Default_Handler,        /* 14 DMA_CH4 */
    Default_Handler,        /* 15 DMA_CH5 */
    Default_Handler,        /* 16 DMA_CH6 */
    Default_Handler,        /* 17 DMA_CH7 */
    Default_Handler,        /* 18 ADC1 */
    Default_Handler,        /* 19 CAN_TX */
    Default_Handler,        /* 20 CAN_RX0 */
    Default_Handler,        /* 21 CAN_RX1 */
    Default_Handler,        /* 22 CAN_SCE */
    Default_Handler,        /* 23 EXTI9_5 */
    Default_Handler,        /* 24 TIM1_BRK/TIM15 */
    TIM1_UE_Handler,        /* 25 TIM1_UP/TIM16 */
    Default_Handler,        /* 26 TIM1_TRG_COM */
    Default_Handler,        /* 27 TIM1_CC */
    Default_Handler,        /* 28 TIM2 */
    Default_Handler,        /* 29 Reserved */
    Default_Handler,        /* 30 Reserved */
    Default_Handler,        /* 31 I2C1_EV */
    Default_Handler,        /* 32 I2C1_ER */
    Default_Handler,        /* 33 I2C2_EV */
    Default_Handler,        /* 34 I2C2_ER */
    Default_Handler,        /* 35 SPI1 */
    Default_Handler,        /* 36 SPI2 */
    Default_Handler,        /* 37 USART1 */
    USART2_Handler,         /* 38 USART2 */
    Default_Handler,        /* 39 USART3 */
    Default_Handler,        /* 40 EXTI15_10 */
    Default_Handler,        /* 41 RTCAlarm */
    Default_Handler,        /* 42 Reserved */
    Default_Handler,        /* 43 Reserved */
    Default_Handler,        /* 44 Reserved */
    Default_Handler,        /* 45 Reserved */
    Default_Handler,        /* 46 Reserved */
    Default_Handler,        /* 47 Reserved */
    Default_Handler,        /* 48 Reserved */
    Default_Handler,        /* 49 SDMMC1 */
    Default_Handler,        /* 50 Reserved */
    Default_Handler,        /* 51 SPI3 */
    Default_Handler,        /* 52 Reserved */
    Default_Handler,        /* 53 Reserved */
    Default_Handler,        /* 54 TIM6_DACUNDER */
    Default_Handler,        /* 55 TIM7 */
    Default_Handler,        /* 56 DMA2_CH1 */
    Default_Handler,        /* 57 DMA2_CH2 */
    Default_Handler,        /* 58 DMA2_CH3 */
    Default_Handler,        /* 59 DMA2_CH4 */
    Default_Handler,        /* 60 DMA2_CH5 */
    Default_Handler,        /* 61 Reserved */
    Default_Handler,        /* 62 Reserved */
    Default_Handler,        /* 63 Reserved*/
    Default_Handler,        /* 64 COMP */
    Default_Handler,        /* 65 LPTIM1 */
    Default_Handler,        /* 66 LPTIM2 */
    Default_Handler,        /* 67 USB_FS */
    Default_Handler,        /* 68 DMA_CH6 */
    Default_Handler,        /* 69 DMA_CH7 */
    Default_Handler,        /* 70 LPUART1 */
    Default_Handler,        /* 71 QUADSPI */
    Default_Handler,        /* 72 I2C3_EV */
    Default_Handler,        /* 73 I2C3_ER */
    Default_Handler,        /* 74 SAI1 */
    Default_Handler,        /* 75 Reserved */
    Default_Handler,        /* 76 SWPMI1 */
    Default_Handler,        /* 77 TSC */
    Default_Handler,        /* 78 Reserved */
    Default_Handler,        /* 79 AES */
    Default_Handler,        /* 80 RNG */
    Default_Handler,        /* 81 FPU */
    Default_Handler         /* 82 CRS */
};

void initClocks()
{
	// Initialize the clock system to a higher speed.
	// At boot time, the clock is derived from the MSI clock 
	// which defaults to 4MHz.  Will set it to 80MHz
	// See chapter 6 of the reference manual (RM0393)
	RCC->CR &= ~BIT24; // Make sure PLL is off
	
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
	RCC->PLLCFGR = BIT25 + BIT24 + BIT22 + BIT21 + \
				  BIT17 + (80 << 8) + BIT0;	
	RCC->CR |= BIT24; // Turn PLL on
	while( (RCC->CR & BIT25)== 0); // Wait for PLL to be ready
	// configure flash for 4 wait states (required at 80MHz)
	FLASH->ACR &= ~(BIT2+BIT1+BIT0);
	FLASH->ACR |= BIT2; 
	RCC->CFGR |= BIT1+BIT0; // Select PLL as system clock
}
void init()
{
// do global/static data initialization
	uint8_t *src;
	uint8_t *dest;
	uint32_t len;
    initClocks();
	src= &INIT_DATA_VALUES;
	dest= &INIT_DATA_START;
	len= &INIT_DATA_END-&INIT_DATA_START;
	while (len--)
		*dest++ = *src++;
// zero out the uninitialized global/static variables
	dest = &BSS_START;
	len = &BSS_END - &BSS_START;
	while (len--)
		*dest++=0;
	main();
}

void Default_Handler()
{
	while(1);
}
