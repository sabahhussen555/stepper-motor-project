# 8086_Steppermotor_Assembly
## Table of contents
- Introduction
- Code Flow
- Used Devices
- Components discription
- used software
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
- It consists of three 8-bit bidirectional I/O ports (24I/O lines) which can be configured as per the requirement
 
 ### Ports of 8255A
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

## Stepper Motor
**Stepper Motor** is a brushless electromechanical device which converts the train of electric pulses applied at their excitation windings into precisely defined step-by-step mechanical shaft rotation. The shaft of the motor rotates through a fixed angle for each discrete pulse. This rotation can be linear or angular.It gets one step movement for a single pulse input.
The number of input pulses given to the motor decides the **step angle** which the stepper motor shaft turns for each pulse and hence the position of motor shaft is controlled by controlling the number of pulses.

### Importance Of Stepper Motors
**Positioning:** stepper motors move in precise rpeatable steps.
**Speed Control:** precise increment of movements allowed for speed rotational control. 
**Low Speed Tourqe:** 
- stepper motor has maximum torque at low speeds so it is used for applications that require low speed with high precision.
- stepper motor has less torque at high speeds so some steppers optimized for high speed performance they need to be paired with driver to achieve this performance.
- steppers don't have integral feedback for position, great precision can be achieved running open loop.
-  
### Costruction of Stepper Motor

### Stepping Modes of a Stepper Motor
A typical stepping action causes the motor to step through a sequence of equilibrium positions in response to current pulses given to it. It is possible to vary the stepping action in different ways simply by changing the sequence through which stator windings are energized. The following are the most common operating or driving modes of stepper motors.
- Wave Step
- Full Step
- Half Step
#### Wave Step Mode
Wave step mode is the simplest of all other modes in which only one winding is energized at any given time. Each coil of the phase is connected to the supply alternatively. The table below shows the order through which coils are energized in a 4-phase stepper motor.
In this mode motor gives maximum step angle compared to all other modes. It is the simplest and most commonly used mode for stepping; however the torque produced is less as it uses some part of the total winding at a given time.

![Steping-Mode-of-Stepper-Motors-Signal-Sequence-of-Wave-Step-Drive](https://user-images.githubusercontent.com/47756597/147374323-433cc6d6-c497-43c9-8840-6500251e52b9.jpg)

## Used Software
1. Protues
2. 8086 emulator with MASM
3. GitHub
4. Git
