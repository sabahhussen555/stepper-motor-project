# 8086_Steppermotor_Assembly
## Table of contents
- Introduction
- circuit diagram
- Used Devices
- Components discription
- used software
-  Code Flow
-  Collabrators
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
- 7 segment

## Components discription
### 8086 microprocessor
 - 8086 Microprocessor is an enhanced version of 8085Microprocessor that was designed by Intel in 1976. It is a 16-bit Microprocessor having 20 address lines and16 data lines that provides up to 1MB storage. It consists of powerful instruction set, which provides operations like multiplication and division easily

![MicrosoftTeams-image (1)](https://user-images.githubusercontent.com/47755059/147293758-59edf5de-e8c0-4cde-b89f-46e56a01d48e.png)

- Architecture of 8086

![architecture_of_8086](https://user-images.githubusercontent.com/47755059/147280453-c7cec44e-4730-4c84-aa02-48998d673d51.jpg)

### ULN2003A Motor driver
 The ULN2003A is an array of seven NPN Darlington transistors capable of 500 mA, 50 V output. It features common-cathode flyback diodes for switching inductive loads

 ![103940688-6e90cf80-5136-11eb-93fb-060149a6cfc3](https://user-images.githubusercontent.com/47755059/147296913-93db5664-0946-4257-8978-efae7d9d7727.jpeg)


 **The connection between stepper motor and ULN2003A motor driver:**
  If the driver take high inpit the output to stepper motor will be low becouse of NPN transistors, 
  then the coil in stepper motor will be energized because 2,5 of motor connected to supply.



.
![103941080-04c4f580-5137-11eb-8321-8c2f3d31264e](https://user-images.githubusercontent.com/47755059/147296966-64339009-3122-46e9-9774-695d0097a020.jpeg)

### 74HC373 Latch
- The 74HC373 high speed octal D-type latches utilize advanced silicon-gate CMOS technology. They possess the high noise immunity and low power consumption of standard CMOS integrated circuits, as well as the ability to drive 15 LS-TTL loads. Due to the large output drive capability and the 3-STATE feature, these devices are ideally suited for interfacing with bus lines in a bus organized system.
- When the LATCH ENABLE input is HIGH, the Q outputs will follow the D inputs. When the LATCH ENABLE goes LOW, data at the D inputs will be retained at the outputs until LATCH ENABLE returns HIGH again. When a high logic level is applied to the OUTPUT CONTROL input, all outputs go to a high impedance state, regardless of what signals are present at the other inputs and the state of the storage elements. The 74HC logic family is speed, function, and pin-out compatible with the standard 74LS logic family. All inputs are protected from damage due to static discharge by internal diode clamps to VCC and ground.

![103951933-32ff0100-5148-11eb-8927-67fb7010e5b0](https://user-images.githubusercontent.com/47755059/147294329-43aad3e6-22fb-4f02-b683-bb39819c40a7.jpg)
 
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

![stepper motor](https://user-images.githubusercontent.com/95941849/147379304-ef29ea37-f780-46b5-a4c7-88927878e84a.png)

### Importance Of Stepper Motors
- **Positioning:** stepper motors move in precise repeatable steps.
- **Speed Control:** precise increment of movements allowed for speed rotational control. 
- **Speed Torque:** 
- stepper motor has maximum torque at low speeds so it is used for applications that require low speed with high precision.
- stepper motor has less torque at high speeds so some steppers optimized for high speed performance they need to be paired with driver to achieve this performance.
- **No Feedback:** steppers don't have integral feedback for position, great precision can be achieved running open loop.

### Working principle Stepper Motor
The stepper motor rotor is a permanent magnet, when the current flows through the stator winding, the stator winding to produce a vector magnetic field. The magnetic field drives the rotor to rotate by an angle so that the pair of magnetic fields of the rotor and the magnetic field direction of the stator are consistent. When the stator's vector magnetic field is rotated by an angle, the rotor also rotates with the magnetic field at an angle. Each time an electrical pulse is input, the motor rotates one degree further. The angular displacement it outputs is proportional to the number of pulses input and the speed is proportional to the pulse frequency. Change the order of winding power, the motor will reverse. Therefore, it can control the rotation of the stepping motor by controlling the number of pulses, the frequency and the electrical sequence of each phase winding of the motor.

### Stepping Modes of a Stepper Motor
A typical stepping action causes the motor to step through a sequence of equilibrium positions in response to current pulses given to it. It is possible to vary the stepping action in different ways simply by changing the sequence through which stator windings are energized. The following are the most common operating or driving modes of stepper motors.
- Wave Step
- Full Step
- Half Step
#### Wave Step Mode
Wave step mode is the simplest of all other modes in which only one winding is energized at any given time. Each coil of the phase is connected to the supply alternatively. The table below shows the order through which coils are energized in a 4-phase stepper motor.
In this mode motor gives maximum step angle compared to all other modes. It is the simplest and most commonly used mode for stepping; however the torque produced is less as it uses some part of the total winding at a given time.

![wave step](https://user-images.githubusercontent.com/95941849/148268455-38d7239b-6c44-415a-b753-894287a390cc.png)
 

#### Full Step Mode
- For each 360° rotation of the motor shaft, the rotor proceeds through 200 distinct steps per revolution, each exactly 1.8° (step angle). During full step operation, two of the phases on the stator are always energized **(two-winding ON)**. This provides maximum torque, but angular resolution is limited by the number of teeth on the rotor.
- A one step in this is equal to the single pulse of the motor.
- In this mode, motor consumes double the power than single coil excitation mode, so this requires the least amount of power from the drive power supply of any of the excitation modes.

  ![full mode](https://user-images.githubusercontent.com/95941849/148268029-2cad480a-23b7-4a52-8233-265b9849710e.png)

#### Half Step Mode
- For each 360° rotation of the motor shaft, the rotor proceeds through 400 distinct steps per revolution, each exactly 0.9°. During half step operation, there is an alternation between having one or two phases on the stator energized **(one-winding ON, two-winding ON, and so on)**. This provides twice the level of angular resolution for increased positioning accuracy but comes at the expense of torque.
- When the motor is rotated in this mode, it rotates very smoothly because the step angle of the motor decreases to half.
- It also controls speed (RPM) of the motor.

![half mode](https://user-images.githubusercontent.com/95941849/148268421-3458a349-ee50-4b42-98e8-a43e323f9ecb.png)

### Applications of Stepper Motors
- Stepper motors are used in automated production equipments and automotive gauges and industrial machines like packaging, labeling, filling and cutting etc.
- It is widely used in security devices such as security & surveillance cameras.
- In medical industry, stepper motors are widely used in samples, digital dental photography, respirators, fluid pumps, blood analysis machinery and medical scanners etc.
- They are used in consumer electronics in image scanners, photo copier and printing machines and in digital camera for automatic zoom and focus functions and positions.
- Stepper motors also used in elevators, conveyor belts and lane diverters.

## 7 SEGMENT
- It Consists of seven individual colored LEDs from (a to g) character
- Every led is light to form a number on segment

**for example when we needed to diplay S we used (a,c,d,f,g) on and (b,e) off**

![image](https://user-images.githubusercontent.com/47755059/147423408-02fdabaf-9d30-4e06-8d9c-675b5264fb31.png)

**We use common cathode seven-segments and the figures below illustrate how to turn on the wanted leds of seven-segments display**


## Used Software
1. Protues
2. 8086 emulator with MASM
3. GitHub
4. Git

## Collabrators
- Sabah Hussen 
- Mahetab Mahmoud 
- Eman Mostafa 
- Amal Kamel
- Randa Medhat
