# This setup is designed for programing the CH552 using hex or the C. Here are some suggestions if you are charting the same path.

# Getting Started
> If you are new to embedded development and would like to use a simulator, there is one developed by James Rogers and it is available for free. 
## Setting up the [EDsim Simulator] (https://edsim51.com/) on a Windows machine
>* Install and run Java
>* Open a command prompt and replace the [...] with the path where your file is located:
C:\WINDOWS\system32>java -jar […]\edsim51di_version_2.1.36\edsim51di\edsim51di.jar
>* Manual and examples are available on the [website] (https://edsim51.com/)
## Setting up the toolchain
- [x] **IDE- [Visual Studio Code] (https://code.visualstudio.com/download)**
- [x] **PlatformIO**
 >an extension available in Visual Studio Code. Handles toolchain setup, libraries and depencies like SDCC. Used instead of make files.
- [x] **[Manufacturers Tool] (https://www.wch-ic.com/products/CH552.html)**
>Used to put bits on board.
- [x] **[Putty] (https://www.putty.org/)**
>Needed for uART connections.
- [x] **[JSON file] {https://www.oz4.us/2021/03/install-ch552-support-to-platformio-and.html}**
>Used to add the ch552 QT-PY specifications to PlatformIO
# Project
>In Visual Studio Code, click on the Alien Head on the left hand side and select then ‘create new project’.
>You will see a 'Project Wizard' pop-up menu.
>* Select Project Name (of your choosing)
>* Board (find the CH552 one)
>* Framework will be left blank.
>* Create your test file. You can use the test code included here. You will need to connect an LED to pin P1.7 and (through a 330 Ohm resistor) connect to the 3.3V pin. 
>HINTS (for now but hope to be one step builds in the future): 
>* You may need to create a one-time project to pull in the dependencies before the ch552 board will show up in the dropdown.
>* In terminal, find the link to your makebin.exe C:\Users\...\.platformio\packages\toolchain-sdcc\bin\makebin.exe -p .\Setup_Test_Blink_LED\.pio\ch55xduino\build\firmware.hex fireware.bin
>* Create the bin file in the terminal.  C:\...\Setup_Test_Blink_LED\fireware.bin (You will be linking this 'Download File' in the WCHISP tool from the manufacturer as 'Object File 1').

# Uploading
>This part is a little bit involved and so I recommend checking out [Adafruit's CH552 datasheet] (https://cdn-learn.adafruit.com/downloads/pdf/adafruit-ch552-qt-py.pdf) - starting on page 29.




# Assembly Files
>Will need to start with the following:

>.module MODULENAME
>.area HOME (CODE)
>.area XSEG (DATA)
>.area PSEG (DATA)

## Fixes

>SDCC requires C-style hex code ine assembly files that will not work in the EDsim simulator:
>* There must be a module name at the top
>* org 0000H becomes .org 0x0000
>* JMP becomes AJMP

