# 8086_steppermotor_assembly
## Table of contents
- Introduction
- Code Flow
- Used Devices
- Components discription
## Introduction
- in order to run the circuit you have to install at least proteus vertion 8.9 .
- run the code in the emu8086
## Used Devices
- 8086 microprocessor
- 74HC373 Latch
- 8255A I/O device
- Stepper Motor
- Battery
- BUTTON 
- ULN2003A
## Components discription
### 8086 microprocessor
 - 8086 Microprocessor is an enhanced version of 8085Microprocessor that was designed by Intel in 1976. It is a 16-bit Microprocessor having 20 address lines and16 data lines that    provides up to 1MB storage. It consists of powerful instruction set, which provides operations like multiplication and division easily
 
![MicrosoftTeams-image (1)](https://user-images.githubusercontent.com/47755059/147293758-59edf5de-e8c0-4cde-b89f-46e56a01d48e.png)
- Architecture of 8086

![architecture_of_8086](https://user-images.githubusercontent.com/47755059/147280453-c7cec44e-4730-4c84-aa02-48998d673d51.jpg)

### 74HC373 Latch
- The 74HC373 high speed octal D-type latches utilize advanced silicon-gate CMOS technology. They possess the high noise immunity and low power consumption of standard CMOS integrated circuits, as well as the ability to drive 15 LS-TTL loads. Due to the large output drive capability and the 3-STATE feature, these devices are ideally suited for interfacing with bus lines in a bus organized system.
- When the LATCH ENABLE input is HIGH, the Q outputs will follow the D inputs. When the LATCH ENABLE goes LOW, data at the D inputs will be retained at the outputs until LATCH ENABLE returns HIGH again. When a high logic level is applied to the OUTPUT CONTROL input, all outputs go to a high impedance state, regardless of what signals are present at the other inputs and the state of the storage elements. The 74HC logic family is speed, function, and pin-out compatible with the standard 74LS logic family. All inputs are protected from damage due to static discharge by internal diode clamps to VCC and ground.

![103951933-32ff0100-5148-11eb-8927-67fb7010e5b0](https://user-images.githubusercontent.com/47755059/147294329-43aad3e6-22fb-4f02-b683-bb39819c40a7.jpg)
