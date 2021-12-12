.MODEL SMALL
.DATA
    PORTA  = 00H ;PORTA address                                      
    PORTB  = 02H ;PORTB address                                       
    PORTC  = 04H ;PORTc address  
    CWR    = 06H ;control port address                                      
    

.CODE 
.startup

     ;rotate motore in clockwise 
     
     mov AL , 80H ; initial value 10000000 
     out CWR , AL   
     mov AL , 88H ; 10001000 to start
     mov CX,400; counter
     
   loop1: out PORTA,AL
          call DELAY 
          ROL AL,01 ;   AL=00010001  
          DEC CX    ; decreace counter
          
       jnz loop1 
       
       
       MOV AH, 88H    ; initial value 10001000 
       mov cx,1000     ; counter
   loop2: out PORTA,AL
          call DELAY
          ROR AL,01       ;AL= 01000100 rotate right
          DEC CX
          jnz loop2    
       
      
     ;-------------------   
     ;DELAY FUNCTION  
     DELAY PROC                               
     MOV BX, CX
     MOV CX, 06ffH
      LOOP3:loop LOOP3
     MOV CX, BX
     RET
     DELAY ENDP  
     
    ;--------------------     
       
       
       
       
      .exit 
       end 