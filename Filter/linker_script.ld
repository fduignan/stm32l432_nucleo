/* Linker script for STM32L432KC*/
MEMORY
{
    flash : org = 0x08000000, len = 256k
    sram1 : org = 0x20000000, len = 48k
    sram2 : org = 0x10000000, len = 16k
}
  
SECTIONS
{
        
	. = ORIGIN(flash);
        .text : {
		  *(.vectors); /* The interrupt vectors */
		  *(.text);
        } >flash
	. = ORIGIN(sram1);
        .data : {
	  INIT_DATA_VALUES = LOADADDR(.data);
	  INIT_DATA_START = .;
	    *(.data);
	  INIT_DATA_END = .;
        } >sram1 AT>flash
	BSS_START = .;
	.bss : {
	  
	    *(.bss);
	  
	} > sram1
	BSS_END = .;
}
