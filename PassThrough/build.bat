arm-none-eabi-gcc *.c -mcpu=cortex-m4 -mthumb -O3  -g -lgcc -T linker_script.ld -Xlinker --cref -Xlinker -Map -Xlinker main.map -nostartfiles -o main.elf
# convert binary elf file to hex to help the stm32flash utility
arm-none-eabi-objcopy -O ihex main.elf main.hex
# convert binary elf file to bin for use with mbed virtual disk interface
arm-none-eabi-objcopy -O binary main.elf main.bin
