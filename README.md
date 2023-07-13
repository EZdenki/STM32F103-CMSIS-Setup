# STM32F103-CMSIS-Setup
Procedure to install command line toolchain and perform a sanity check to program the STM32F103 (Blue Pill) under Linux or Windows <br>
 **(Under Construction. Files for step 7 not yet ready!)**
## Linux Installation Procedure
1. Install STM32CubeProgrammer<br>
   https://www.st.com/en/development-tools/stm32cubeprog.html<br>
   Follow the registration and download instructions. Unzip the zip file. Double-click on linux installer and follow the installation instructions.
2. Install libusb-1.0-0-dev<br>
   ```sudo apt install libusb-1.0-0-dev```
3. Add permissions to use USB ST-Link Programmer<br>
   ```sudo cp ~/STMicroelectronics/STM32Cube/STM32CubeProgrammer/Drivers/rules/*.* /etc/udev/rules.d```
4. Create persistant environment variable to point to the STM32_Programmer_CLI executable (to be used within Makefile). Note that if the path
   to STM32_Programmer_CLI is different, then the following line must be modified accordingly.<br>
   ```export STMCUBE_PROG = "~/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32_Programmer_CLI"```
5. Install make<br>
   ```sudo apt install make```
6. Install arm-none-eabi toolchain<br>
   ```sudo apt install gcc-arm-none-eabi```
7. Download sample blinky file and move to that directory<br>
   ```git clone https://github.com/sandynomike/STM32F103-CMSIS-Blinky && cd STM32F103-CMSIS-Blinky```
8. Connect the ST-Link programmer to a USB port and connect the ST-Link programmer to your Blue Pill
9. Build and upload the code to the Blue Pill<br>
   ```make clean && make```
### The LED on the Blue Pill should be blinking!  
