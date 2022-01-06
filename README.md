# 8086_Steppermotor_Assembly
## Table of contents
- Introduction
- circuit diagram
- Used Devices
- Components discription
- Circuit flow
- used software
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
  ULN2003 IC is one of the most commonly used Motor driver IC generally used when we need to drive high current loads using digital logic circuits like Op-maps, Timers, Gates,     Arduino, PIC, ARM etc. For example a motor that requires 12V and 350mA to run cannot be powered by an Arduino I/O hence we use this IC to source enough current and voltage for   the load. 
  ##### ULN2003 Features
 - Contains 7 high-voltage and high current Darlington pairs , Each pair is rated for 50V and 500mA.
 - Input pins can be triggered by +5V.
 - All seven Output pins can be connected to gather to drive loads up to (7×500mA) ~3.5A.
 
    This IC is commonly used to drive Relay modules, Motors, high current LEDs and even Stepper Motors. So if you have anything that anything more than 5V 80mA to work, then     this IC would be the right choice for you.
 
![Screenshot (151)](https://user-images.githubusercontent.com/47756597/148423043-1d9aa32e-02ed-4605-a301-09256091b876.png)

The connection between stepper motor and ULN2003A motor driver , If the driver take high input the output to stepper motor will be low becouse of array of 7 NPN transistors.

![Screenshot (153)](https://user-images.githubusercontent.com/47756597/148425130-40091682-1d9d-4c6f-b943-85f501bcf980.png)    

### 74HC373 Latch
- The 74HC373 high speed octal D-type latches utilize advanced silicon-gate CMOS technology. They possess the high noise immunity and low power consumption of standard CMOS integrated circuits, as well as the ability to drive 15 LS-TTL loads. Due to the large output drive capability and the 3-STATE feature, these devices are ideally suited for interfacing with bus lines in a bus organized system.
- When the LATCH ENABLE input is HIGH, the Q outputs will follow the D inputs. When the LATCH ENABLE goes LOW, data at the D inputs will be retained at the outputs until LATCH ENABLE returns HIGH again. When a high logic level is applied to the OUTPUT CONTROL input, all outputs go to a high impedance state, regardless of what signals are present at the other inputs and the state of the storage elements. The 74HC logic family is speed, function, and pin-out compatible with the standard 74LS logic family. All inputs are protected from damage due to static discharge by internal diode clamps to VCC and ground.

![103951933-32ff0100-5148-11eb-8927-67fb7010e5b0](https://user-images.githubusercontent.com/47755059/147294329-43aad3e6-22fb-4f02-b683-bb39819c40a7.jpg)
 
### 8255A I/O device
- The 8255A is a general purpose programmable I/O device designed to transfer the data from I/O to interrupt I/O under certain conditions as required. It can be used with almost any microprocessor.
- it is used to increacing i/o interfacing capability
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
 	 	 

![MicrosoftTeams-image (7)](https://user-images.githubusercontent.com/47753581/148270799-dbf341d2-07c4-4e0d-a76a-4198b4a9866b.png)

![8255ctrl](https://user-images.githubusercontent.com/47755059/147295847-5ab952a2-bdef-4dc6-b361-0a46fd87aa08.gif)
- in project we use **10000010**

## Stepper Motor
**Stepper Motor** is a brushless electromechanical device which converts the train of electric pulses applied at their excitation windings into precisely defined step-by-step mechanical shaft rotation. The shaft of the motor rotates through a fixed angle for each discrete pulse which gives a full rotation into a number of steps.
The number of input pulses(steps) given to the motor decides the **step angle** which the stepper motor shaft turns for each pulse and hence the position and direction of motor shaft are controlled by controlling the number of pulses.

![stepper motor](https://user-images.githubusercontent.com/95941849/147379304-ef29ea37-f780-46b5-a4c7-88927878e84a.png)

### Importance Of Stepper Motors
- **Positioning:** stepper motors move in precise repeatable steps.
- **Speed Control:** precise increment of movements allowed for speed rotational control. 
- **Speed Torque:** 
- stepper motor has maximum torque at low speeds so it is used for applications that require low speed with high precision.
- stepper motor has less torque at high speeds so some steppers optimized for high speed performance they need to be paired with driver to achieve this performance.
- **No Feedback:** steppers don't have integral feedback for position, great precision can be achieved running open loop.

### Working principle of Stepper Motor
**The stepper motor consists of rotor and stator:** rotor is a permanent magnet, when the current flows through the stator, the stator winding to produce a vector magnetic field.
   - The magnetic field makes the rotor to rotate by an angle so that the pair of magnetic fields of the rotor and the magnetic field direction of the stator are consistent. When the stator is rotated by an angle, the rotor also rotates with the magnetic field at an angle. Each time an electrical pulse is input, the motor rotates one degree further.
   -  The angular displacement it outputs is proportional to the number of pulses input and the speed is proportional to the pulse frequency.
   -  controlling the speed of stepper motor depends on nomber of windings that is ON.
   -  Change the order of winding power, the motor will reverse its direction. 

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
 
 ## Applications of Stepper Motors
 -  Stepper motors are used in automated production equipments and automotive gauges and industrial machines like packaging, labeling, filling and cutting etc
 -  It is widely used in security devices such as security & surveillance cameras.
 -  In medical industry, stepper motors are widely used in samples, digital dental photography, respirators, fluid pumps, blood analysis machinery and medical scanners etc.
 -  They are used in consumer electronics in image scanners, photo copier and printing machines and in digital camera for automatic zoom and focus functions and positions.
 -  Stepper motors also used in elevators, conveyor belts and lane diverters.

## 7 SEGMENT
- It Consists of seven individual colored LEDs from (a to g) character
- Every led is light to form a number on segment

**for example when we needed to diplay S we used (a,c,d,f,g) on and (b,e) off**

![Common-Cathode-7-Segment-Display-Internal-Working](https://user-images.githubusercontent.com/47755059/148405672-c07386e9-5f8c-4870-8d30-1a09d586f442.gif)


**We use common cathode seven-segments and the figures below illustrate how to turn on the wanted leds of seven-segments display**

![seven segment](https://user-images.githubusercontent.com/95941849/148268505-191f6ee6-0b93-4aee-9eda-e93ec3f7a743.png)

## Circuit flow
### project idea
 **in our project, we used stepper motor operating on :**
   1. three different mode:
       - full mode
       - wave mode
       - half mode
   2. two directions
       - clock wise
       - Anti-clock wise
   3. three speed
       - normal speed
       - high speed
       - low speed  
      
   if there is no mode from the above modes is selected the motor state is stop. 
 
 **And we used a 7-segment as an indicator to the motor direction:**
   - it displays "C" if the motor direction is clockwise. 
   - it displays "A" if the motor direction is anti clockwise.
   - it displays "S" if the motor is stopped.
   
 **we used seven switches to select a certain direction and speed of specific mode:**
  
  1. Full mode , Clock wise , Normal speed
  
      by pressing switch 3, this mode is ON 
      
![CW](https://user-images.githubusercontent.com/47756597/148283864-aa033169-fc4a-4237-9735-4dfa3e359570.gif)

  2.Full mode , Anti Clock wise , Normal speed
  
   by pressing switch 4, this mode is ON
   
![ACW](https://user-images.githubusercontent.com/47756597/148284434-7193a13d-1155-447c-b32f-e000b93296a6.gif)

  3.Half mode , Clock wise , Low Speed
  
   by pressing switch 5, this mode is ON
   
![HalfCW](https://user-images.githubusercontent.com/47756597/148285592-c6913c4b-187b-41bc-b637-47c7fedf6297.gif)

4.Half mode , Anti Clock wise , Low Speed
  
   by pressing switch 6, this mode is ON
   
   ![HalfACW](https://user-images.githubusercontent.com/47756597/148286407-4cc991fc-ebd0-4881-a5b9-3ce16b731cc9.gif)
   
 5.Wave mode , Clock wise , High Speed

   by pressing switch 1, this mode is ON
    
 ![A Video by Eman - waveCW](https://user-images.githubusercontent.com/47756597/148287994-4944afd8-5e59-4a3b-b93b-23a78b9c19ef.gif)
 
6.Wave mode , Anti-Clock wise , High Speed

   by pressing switch 2, this mode is ON
    
 ![A Video by Eman - waveacw](https://user-images.githubusercontent.com/47756597/148288431-def6a9c6-a64b-40cd-9019-20cbf0a21d7a.gif)
 
 7.Stop Switch
 
 by pressing switch 7, this switch is ON, this means that the stepper motor is OFF (Stop rotate)
 
![stop](https://user-images.githubusercontent.com/47756597/148289859-29f9dd54-d028-4c71-976f-5da8bf0e7079.gif)

# Final Circuit 
  ![Screenshot (150)](https://user-images.githubusercontent.com/47756597/148290543-d2ccde3b-e2d3-4ac1-954d-3a3f12c3fc86.png)  
  
**Click** [**here**](https://drive.google.com/drive/folders/1zhuB25fjYYZxuLIcEDZQoWOkNXGakEDJ?usp=sharing) **to show the full code & circuit**
   
## Used Software
1. Protues
2. 8086 emulator with MASM
3. GitHub
4. Git

## Collabrators
- Sabah Hussen 
- Mahetab Mahmoud 
- Eman Mostafa 
- Randa Medhat
- Amal kamel
