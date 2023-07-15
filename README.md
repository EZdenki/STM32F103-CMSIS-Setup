# STM32F103-CMSIS-Setup for Linux or Windows<br>(Windows instructions under construction...)
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
5. Install "make".<br>
   ```sudo apt install make```
6. Install arm-none-eabi toolchain. Note that if the install of gcc-arm-none-eabi gives an error due to lack of disc space, then the command
   can be run again and may correctly install.<br>
   ```sudo apt install gcc-arm-none-eabi```
7. Download and build a simple Blinky project as a sanity check.<br>
   Navigate to where you want to keep your STM32 projects (example: ```cd ~/bench/stm32```).<br>
   Then clone the sample blinky project to your PC and move to that directory.<br>
   ```git clone https://github.com/sandynomike/STM32F103-CMSIS-Blinky && cd STM32F103-CMSIS-Blinky```
8. Connect the ST-Link programmer to a USB port and connect the ST-Link programmer to your Blue Pill. Note that if the ST-Link programmer
   was already connected during the installation process, then you should unplug it from the USB port and plug it in again so that is recognized.
9. Build and upload the code to the Blue Pill.<br>
   ```make clean && make```
10. ### The LED on the Blue Pill should be blinking!
</details>
<details>

   <summary>Windows Installation Procedure (Click to expand)</summary>
   
1. Install Git for Windows<br>
   https://gitforwindows.org/<br>
   Download and install. Accept default settings, except:<br>
   Under the option for **Adjusting the name of the initial branch in new repositories**,
   select the option to **Override the default branch name for new repositories** and specify the branch name as **main**.
2. Install STM32CubeProgrammer<br>
   https://www.st.com/en/development-tools/stm32cubeprog.html<br>
   Click **Get Software** and then **Get latest** for **STM32CubePrg-W64**<br>
   Accept license agreement and enter your name and email address and click **Download**. Close this page and open the email
   from STMicroelectronics.
   Click the **Download now** button in the confirmation email to start the download. (This will open another download webpage,
   but **don't** click on Get Software again.)<br>
   Open the zip file and double-click on the **SetupSTM32CubeProgrammer_win64** program to install.<br>
   Follow the installation instructions, including installing the **device software**
4. Add a Path variable to point to the STM32CubeProgrammer_CLI.exe file<br>
   Click the Windows Key and type "environment variables" and select **Edit the system environment variables**<br>
   Click on **Environment Variables...**<br>
   Under **User variables...**, click **New...**<br>
   Under **Variable name:**, type **STMCUBE_PROG**<br>
   Click **Browse File...**, and navigate to:<br>
   **C:\Program Files\STMicroelectronics\STM32Cube\STM32CubeProgrammer\bin\STM32_Programmer_CLI** application, and click
   **Open**, and then click **OK**.<br>
   Click **OK** twice more to exit the dialog boxes.
5. Install GNU Make for Windows<br>
   https://gnuwin32.sourceforge.net/downlinks/make.php<br>
   Run the downloaded make-3.81.exe file. Accept the default installation options.<br>
6. Add a Path ennvironment variable to point to Make.<br>
   Click the Windows Key and type "environment variables" and select **Edit the system environment variables**<br>
   Click on **Environment Variables...**<br>
   Under the **User variables...** section click on the **Path** line and then click **Edit..**<br>
   Then click **New** and then **Browse...** Browse to This PC -> Local Disk (C:) -> Program Files (x86) -> GnuWin32 -> bin,
   then click **OK**.<br>
   Click **OK** 3 times to exit the dialog boxes.
7. Install GNU Arm Embedded Toolchain<br>
   https://developer.arm.com/downloads/-/gnu-rm<br>
   **Do not** click on the Arm GNU Toolchain at the top of the page. Scroll down to link for:<br>
   **gcc-arm-none-eabi-10.3-2021.10-win32.exe**. Click on the link to download. Open the downloaded file. Follow the default
   settings, except, under **Completing the GNU Arm Embedded Toolchain 10.3-2021.10 Setup Wizard**, check the box that says
   **Add path to environment variable**
   before clicking **Finish**. Close the **readme** document and close the command-line terminal that pops up.<br>
9. Download and build a simple Blinky project as a sanity check.<br>
   Open a command-line terminal (by touching the **Windows-Key**, then type ```command prompt```). From the command prompt:<br>
   Navigate to where you want to keep your STM32 projects (example, after creating the desired directory,
   ```cd ~/bench/stm32```).<br>
   Then clone the sample blinky project to your PC and move to that directory.<br>
   ```git clone https://github.com/sandynomike/STM32F103-CMSIS-Blinky && cd STM32F103-CMSIS-Blinky```
11. Connect the ST-Link programmer to a USB port and connect the ST-Link programmer to your Blue Pill.<br>
   Note that if the ST-Link programmer was already connected during the installation process, then you should unplug it from
   the USB port and
   plug it in again so that is recognized.
13. Build and upload the code to the Blue Pill.<br>
   ```make clean && make```
14. ### The LED on the Blue Pill should be blinking!
   **End of Procedure**
</details>
