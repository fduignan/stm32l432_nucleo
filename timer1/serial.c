#include <stdint.h>
#include "../include/stm32l4x2.h"

#include "serial.h"
// Serial comms routine for the stm32l432 nucleo board.
// Is uses USART2 as this is passed up to the host PC via
// the ST-Link's USB-UART emulator.
// Pins PA2 (tx) and PA15(rx) are used for transmission/reception.  This is AF7 
// for PA2 and AF3 for PA15
// Defines a new version of puts: e(mbedded)puts and egets
// Similar to puts and gets in standard C however egets checks the size
// of the input buffer.  This could be extended to include a timeout quite easily.
// Written by Frank Duignan
// 

// define the size of the communications buffer (adjust to suit)
#define MAXBUFFER   64
typedef struct tagComBuffer{
    unsigned char Buffer[MAXBUFFER];
    unsigned Head,Tail;
    unsigned Count;
} ComBuffer;

ComBuffer ComRXBuffer,ComTXBuffer;

int PutBuf(ComBuffer  *Buf,unsigned char Data);
unsigned char GetBuf(ComBuffer  *Buf);
unsigned GetBufCount(ComBuffer  *Buf);
int ReadCom(int Max,unsigned char *Buffer);
int WriteCom(int Count,unsigned char *Buffer);


void usart_tx (void);
void usart_rx (void);
unsigned ComOpen;
unsigned ComError;
unsigned ComBusy;


int ReadCom(int Max,unsigned char *Buffer)
{
// Read up to Max bytes from the communications buffer
// into Buffer.  Return number of bytes read
	unsigned i;
  	if (!ComOpen)
    	return (-1);
	i=0;
	while ((i < Max-1) && (GetBufCount(&ComRXBuffer)))
		Buffer[i++] = GetBuf(&ComRXBuffer);
	if (i>0)
	{
		Buffer[i]=0;
		return(i);
	}
	else {
		return(0);
	}	
};
int WriteCom(int Count,unsigned char *Buffer)
{
// Writes Count bytes from Buffer into the the communications TX buffer
// returns -1 if the port is not open (configured)
// returns -2 if the message is too big to be sent
// If the transmitter is idle it will initiate interrupts by 
// writing the first character to the hardware transmit buffer
	unsigned i,BufLen;
	if (!ComOpen)
		return (-1);
	BufLen = GetBufCount(&ComTXBuffer);
	if ( (MAXBUFFER - BufLen) < Count )
		return (-2); 
	for(i=0;i<Count;i++)
		PutBuf(&ComTXBuffer,Buffer[i]);
	
	if ( (USART2->CR1 & BIT3)==0)
	{ // transmitter was idle, turn it on and force out first character
	  USART2->CR1 |= BIT3;
	  USART2->TDR = GetBuf(&ComTXBuffer);		
	} 
	return 0;
};


void initUART2(int BaudRate) {
	int BaudRateDivisor;
	disable_interrupts();
	ComRXBuffer.Head = ComRXBuffer.Tail = ComRXBuffer.Count = 0;
	ComTXBuffer.Head = ComTXBuffer.Tail = ComTXBuffer.Count = 0;
	ComOpen = 1;
	ComError = 0;
// Turn on the clock for GPIOA (usart 2 uses it) 
	RCC->AHB2ENR  |= BIT0;
            
// Turn on the clock for the USART2 peripheral	
	RCC->APB1ENR1 |= BIT17;

	
// Configure the I/O pins.  Will use PA2 as TX and PA15 as RX so setup for alternate function
	GPIOA->MODER |= (BIT31 | BIT5);
	GPIOA->MODER &= ~BIT30;
	GPIOA->MODER &= ~BIT4;
// Turn on pull-ups to suppress noise when idle
    GPIOA->PUPDR |= (BIT30 | BIT4);
    GPIOA->PUPDR &= ~BIT31;
    GPIOA->PUPDR &= ~BIT5;
        
// The alternate function number for PA2 is AF7 and for PA15 is AF3 (see datasheet, reference manual)
	GPIOA->AFRL  |= (7 << 8); 
	GPIOA->AFRL  &= ~(8 << 8);
    
	GPIOA->AFRH  |= (3 << 28); 
	GPIOA->AFRH  &= ~(0xc << 28);	
	
	
	BaudRateDivisor = 80000000;  // assuming 80MHz clock from PLL 
	BaudRateDivisor = BaudRateDivisor / (long) BaudRate;

// De-assert reset of USART2 
	RCC->APB1RSTR1 &= ~BIT17;
// Configure the USART
// disable USART first to allow setting of other control bits
// This also disables parity checking and enables 16 times oversampling

	USART2->CR1 = 0; 
 
// Don't want anything from CR2
	USART2->CR2 = 0;

// Don't want anything from CR3
	USART2->CR3 = 0;

// Set the baud rate
	USART2->BRR = BaudRateDivisor;

// Turn on Transmitter, Receiver, Transmit and Receive interrupts.
	USART2->CR1 |= (BIT2  | BIT5 | BIT6); 
// Enable the USART
    USART2->CR1 |= BIT0;
// Enable EXTIMR
    EXTI->IMR1 |= BIT27; // enable USART2 IRQ
    EXTI->EMR1 |= BIT27; // enable USART2 Event
// Enable USART2 interrupts in NVIC     
    NVIC->ISER1 |= (1 << (38-32));
// and enable interrupts         
    enable_interrupts();

}
void USART2_Handler() 
{
// check which interrupt happened.
      if (USART2->ISR & BIT7) // is it a TXE interrupt?
		usart_tx();
	if (USART2->ISR & BIT5) // is it an RXNE interrupt?
		usart_rx();

}
void usart_rx (void)
{
// Handles serial comms reception
// simply puts the data into the buffer and sets the ComError flag
// if the buffer is fullup
	if (PutBuf(&ComRXBuffer,USART2->RDR) )
		ComError = 1; // if PutBuf returns a non-zero value then there is an error
}


void usart_tx (void)
{
// Handles serial comms transmission
// When the transmitter is idle, this is called and the next byte
// is sent (if there is one)
	if (GetBufCount(&ComTXBuffer))
		USART2->TDR=GetBuf(&ComTXBuffer);
	else
	{
	  // No more data, disable the transmitter 
	  USART2->CR1 &= ~BIT3;
	  if (USART2->ISR & BIT6)
	  // Write TCCF to USART_ICR
	    USART2->ICR |= BIT6;
	  if (USART2->ISR & BIT7)
	  // Write TXFRQ to USART_RQR
	    USART2->RQR |= BIT4;
	}
}
int PutBuf(ComBuffer *Buf,unsigned char Data)
{
	if ( (Buf->Head==Buf->Tail) && (Buf->Count!=0))
		return(1);  /* OverFlow */
	disable_interrupts();
	Buf->Buffer[Buf->Head++] = Data;
	Buf->Count++;
	if (Buf->Head==MAXBUFFER)
		Buf->Head=0;
	enable_interrupts();
	return(0);
};
unsigned char GetBuf(ComBuffer *Buf)
{
    unsigned char Data;
    if ( Buf->Count==0 )
		return (0);
    disable_interrupts();
    Data = Buf->Buffer[Buf->Tail++];
    if (Buf->Tail == MAXBUFFER)
		Buf->Tail = 0;
    Buf->Count--;
    enable_interrupts();
    return (Data);
};
unsigned int GetBufCount(ComBuffer *Buf)
{
    return Buf->Count;
};
int available()
{
    if (GetBufCount(&ComRXBuffer))
        return 1;
    else
        return 0;
}
int eputs(char *s)
{
  // only writes to the comms port at the moment
  if (!ComOpen)
    return -1;
  while (*s) 
    WriteCom(1,s++);
  return 0;
}
int egets(char *s,int Max)
{
  // read from the comms port until end of string
  // or newline is encountered.  Buffer is terminated with null
  // returns number of characters read on success
  // returns 0 or -1 if error occurs
  // Warning: This is a blocking call.
  int Len;
  char c;
  if (!ComOpen)
    return -1;
  Len=0;
  c = 0;
  while ( (Len < Max-1) && (c != NEWLINE) )
  {   
    while (!GetBufCount(&ComRXBuffer)); // wait for a character
    c = GetBuf(&ComRXBuffer);
    s[Len++] = c;
  }
  if (Len>0)
  {
    s[Len]=0;
  }	
  return Len;
}
char HexDigit(int Value)
{
  if ((Value >=0) && (Value < 10))
    return Value+'0';
  else 
    return Value-10 + 'A';
}
void printHex(unsigned int Number)
{
  // Output the number over the serial port as
  // as hexadecimal string.
  char TxString[9];
  int Index=8;
  TxString[Index]=0; // terminate the string
  Index--;
  while(Index >=0)
  {
    TxString[Index]=HexDigit(Number & 0x0f);
    Number = Number >> 4;
    Index--;
  }
  eputs(TxString);
}
int bytesAvailable(void)
{
    return GetBufCount(&ComRXBuffer);
}
