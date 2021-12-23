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

### 8255A I/O device
- The 8255A is a general purpose programmable I/O device designed to transfer the data from I/O to interrupt I/O under certain conditions as required. It can be used with almost any microprocessor.
 
- It consists of three 8-bit bidirectional I/O ports (24I/O lines) which can be configured as per the requirement.
#### Ports of 8255A
 **8255A has three ports, i.e., PORT A, PORT B, and PORT C.**
 
 - Port A contains one 8-bit output latch/buffer and one 8-bit input buffer.
 
- Port B is similar to PORT A.
 
- Port C can be split into two parts, i.e. PORT C lower (PC0-PC3) and PORT C upper (PC7-PC4) by the control word.

![103838041-b95a0b00-5094-11eb-9662-3358d5a6b94b](https://user-images.githubusercontent.com/47755059/147295644-4176c60b-fe3e-4aa7-9d2f-57087510d317.png)
- PA0 – PA7 – Pins of port A
 - PB0 – PB7 – Pins of port B
 - PC0 – PC7 – Pins of port C
- D0 – D7 – Data pins for the transfer of data
- RESET – Reset input
- RD’ – Read input
- WR’ – Write input
- CS’ – Chip select
- A1 and A0 – Address pins


**Depending upon the value if CS’, A1 and A0 we can select different ports in different modes as input-output function or BSR. This is done by writing a suitable word in control register (control word D0-D7).**

![103838495-dfcc7600-5095-11eb-9521-2b9796aadb39](https://user-images.githubusercontent.com/47755059/147295995-9ca44c31-a599-4120-b063-5951cdf6acd4.png)

![8255ctrl](https://user-images.githubusercontent.com/47755059/147295847-5ab952a2-bdef-4dc6-b361-0a46fd87aa08.gif)

### ULN2003A Motor driver
 The ULN2003A is an array of seven NPN Darlington transistors capable of 500 mA, 50 V output. It features common-cathode flyback diodes for switching inductive loads
 
 ![103940688-6e90cf80-5136-11eb-93fb-060149a6cfc3](https://user-images.githubusercontent.com/47755059/147296913-93db5664-0946-4257-8978-efae7d9d7727.jpeg)

 
 **The connection between stepper motor and ULN2003A motor driver:**
  If the driver take high inpit the output to stepper motor will be low becouse of NPN transistors, 
  then the coil in stepper motor will be energized because 2,5 of motor connected to supply.
  
  
  
.
![103941080-04c4f580-5137-11eb-8321-8c2f3d31264e](https://user-images.githubusercontent.com/47755059/147296966-64339009-3122-46e9-9774-695d0097a020.jpeg)
