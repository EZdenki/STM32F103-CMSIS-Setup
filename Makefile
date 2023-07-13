################################################################################
# Makefile for STM32 CMSIS directory structure extracated from STM32CubeIDE
# project.
#
# Mike Shegedin, 2023
################################################################################

TARGET    = CMSIS-PWM-Blinky
SOURCE    = main
STARTUP   = startup_stm32f103c8tx
FLASHER   = STM32_Programmer_CLI.exe
FLASHPORT = "SWD"

CC = arm-none-eabi-gcc

CFLAGS = -mcpu=cortex-m3 -g3 --specs=nano.specs -mthumb -mfloat-abi=soft

INCLUDE1 = Drivers/CMSIS/DEVICE
INCLUDE2 = Drivers/CMSIS/Include


$(TARGET).elf: $(SOURCE).o $(STARTUP).o STM32F103C8TX_FLASH.ld
	$(CC) -o $@ $(SOURCE).o $(STARTUP).o -mcpu=cortex-m3 --specs=nosys.specs -T"STM32F103C8TX_FLASH.ld" \
	-Wl,-Map=$(TARGET).map -Wl,--gc-sections -static --specs=nano.specs -mfloat-abi=soft -mthumb \
	-Wl,--start-group -lc -lm -Wl,--end-group

	$(CC) -o $(TARGET).hex $(SOURCE).o $(STARTUP).o -mcpu=cortex-m3 --specs=nosys.specs -T"STM32F103C8TX_FLASH.ld" \
	-Wl,-Map=$(TARGET).map -Wl,--gc-sections -static --specs=nano.specs -mfloat-abi=soft -mthumb \
	-Wl,--start-group -lc -lm -Wl,--end-group

	arm-none-eabi-size $(TARGET).elf

	$(FLASHER) -c port=$(FLASHPORT) -w $(TARGET).elf --start


$(STARTUP).o: $(STARTUP).s
	$(CC) $(CFLAGS) -DDEBUG -c -x assembler-with-cpp -o $@ $<


$(SOURCE).o: $(SOURCE).c
	$(CC) $< $(CFLAGS) -I$(INCLUDE1) -I$(INCLUDE2) -std=gnu11 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xB \
	-c -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -o $@


clean:
	rm -rf ./*.o ./*.elf ./*.map ./*.su


