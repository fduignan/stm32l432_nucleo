#include "stm32l432.h"
#include <stdint.h>
void init(void);
void Default_Handler(void);
int main(void);
void isr_usart2(void);
void ADC_ISR(void);
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
    ADC_ISR,                /* 18 ADC1 */
    Default_Handler,        /* 19 CAN_TX */
    Default_Handler,        /* 20 CAN_RX0 */
    Default_Handler,        /* 21 CAN_RX1 */
    Default_Handler,        /* 22 CAN_SCE */
    Default_Handler,        /* 23 EXTI9_5 */
    Default_Handler,        /* 24 TIM1_BRK/TIM15 */
    Default_Handler,        /* 25 TIM1_UP/TIM16 */
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
    isr_usart2,             /* 38 USART2 */
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
void init()
{
// do global/static data initialization
	uint8_t *src;
	uint8_t *dest;
	uint32_t len;
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
