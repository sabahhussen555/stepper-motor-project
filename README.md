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

### 8255A I/O device
- The 8255A is a general purpose programmable I/O device designed to transfer the data from I/O to interrupt I/O under certain conditions as required. It can be used with almost any microprocessor.
- It consists of three 8-bit bidirectional I/O ports (24I/O lines) which can be configured as per the requirement.
 	 	#### Ports of 8255A
**8255A has three ports, i.e., PORT A, PORT B, and PORT C**
 	 	 
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
 	 	 
**Depending upon the value if CS’, A1 and A0 we can select different ports in different modes as input-output function or BSR. This is done by writing a suitable word in control register (control word D0-D7)**
 	 	 
![103838495-dfcc7600-5095-11eb-9521-2b9796aadb39](https://user-images.githubusercontent.com/47755059/147295995-9ca44c31-a599-4120-b063-5951cdf6acd4.png)
 	 	 
![8255ctrl](https://user-images.githubusercontent.com/47755059/147295847-5ab952a2-bdef-4dc6-b361-0a46fd87aa08.gif)
