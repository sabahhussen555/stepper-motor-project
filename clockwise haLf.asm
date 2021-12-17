 .MODEL SMALL
.DATA
    PORTA  = 00H ;PORTA address                                      
    PORTB  = 02H ;PORTB address                                       
    PORTC  = 04H ;PORTC address  
    CWR    = 06H ;control port address                                      
    

.CODE 
.startup 
   
     
       MOV AL, 10000000B  ;port A=output/ mode 0, PORT B=output/ mode 0 ,port C=output
       OUT CWR, AL      
           
           
       ;CLOCK-WISE HALF DRIVE
       ;1-WING ON 
       
       
   L1: 
     
       mov AL,00001000B   ;08H
       OUT PORTA,AL
       CALL DELAY   
       
        mov AL,00001100B   ;0CH
       OUT PORTA,AL
       CALL DELAY 
       
       mov AL,00000100B   ;04H
       OUT PORTA,AL
       CALL DELAY  
       
       mov AL,00000110B   ;06H
       OUT PORTA,AL
       CALL DELAY  
       
       mov AL,00000010B   ;02H
       OUT PORTA,AL
       CALL DELAY       
       
       mov AL,00000011B    ;03H  
       OUT PORTA,AL
       CALL DELAY 
       
       mov AL,00000001B   ;01H
       OUT PORTA,AL
       CALL DELAY   
       
        mov AL,00001001B   ;09H
       OUT PORTA,AL
       CALL DELAY
       
          
       
      jmp L1
       
    ;-------------------   
     ;DELAY FUNCTION  
     DELAY PROC                               
     MOV BX, CX
     MOV CX, 06ffH
      LOOP2:loop LOOP2
     MOV CX, BX
     RET
     DELAY ENDP  
     
    ;--------------------    
    
     .exit 
       end 