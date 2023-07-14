# STM32F103-CMSIS-Setup for Linux or Windows (Windows instructions coming soon!)
Procedure to install command line toolchain and perform a sanity check to program the STM32F103 (Blue Pill) under Linux or Windows <br>
<details>
   
<summary>Linux Installation Procedure (Click to expand)</summary>

1. Install STM32CubeProgrammer<br>
   https://www.st.com/en/development-tools/stm32cubeprog.html<br>
   Follow the registration and download instructions. Extract the zip file. Enter the new directory, double-click on the linux installer,
   **SetupSTM32CubeProgrammer-x.xx.x.linux**, and follow the installation instructions.
2. Install "libusb-1.0-0-dev" (From the command line).<br>
   ```sudo apt install libusb-1.0-0-dev```
3. Add permissions to use USB ST-Link Programmer.<br>
   ```sudo cp ~/STMicroelectronics/STM32Cube/STM32CubeProgrammer/Drivers/rules/*.* /etc/udev/rules.d```
4. Create persistent environment variable to point to the STM32_Programmer_CLI executable (to be used within Makefile). Note that if the path
   to STM32_Programmer_CLI is different from the default install location of:<br>
   **~/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin**<br>
   then the following line must be modified accordingly.<br>
   ```export STMCUBE_PROG=~/STMicroelectronics/STM32Cube/STM32CubeProgrammer/bin/STM32_Programmer_CLI```
6. Install "make".<br>
   ```sudo apt install make```
7. Install arm-none-eabi toolchain. Note that if the install of gcc-arm-none-eabi gives an error due to lack of disc space, then the command
   can be run again and may correctly install.<br>
   ```sudo apt install gcc-arm-none-eabi```
9. Navigate to where you want to keep your STM32 projects (example: ```cd ~/bench/stm32```).<br>
   Then clone the sample blinky project to your PC and move to that directory.<br>
   ```git clone https://github.com/sandynomike/STM32F103-CMSIS-Blinky && cd STM32F103-CMSIS-Blinky```
10. Connect the ST-Link programmer to a USB port and connect the ST-Link programmer to your Blue Pill. Note that if the ST-Link programmer
   was already connected during the installation process, then you should unplug it from the USB port and plug it in again so that is recognized.
11. Build and upload the code to the Blue Pill.<br>
   ```make clean && make```
12. ### The LED on the Blue Pill should be blinking!
</details>
