 .MODEL SMALL
.DATA
    PORTA  = 00H ;PORTA address                                      
    PORTB  = 02H ;PORTB address                                       
    PORTC  = 04H ;PORTc address  
    CWR    = 06H ;control port address                                      
    

.CODE 
.startup 
   
             
             
       MOV AL, 10000000B  ;port A=output/ mode 0, PORT B=output/ mode 0 ,port C=output
       OUT CWR, AL 
      ;--------------------------------------   
       ;CLOCK-WISE FULL DRIVE
       ;2-WING ON   
       
         MOV CX, 30 ;counter
           
       L1: mov AL,00001100B   ;0C
           OUT PORTA,AL
           CALL DELAY         ;delay
                        
                        
           mov AL,00000110B   ;06  
           OUT PORTA,AL
           CALL DELAY 
           
           
           mov AL,00000011B   ;03
           OUT PORTA,AL
           CALL DELAY   
           
           
           mov AL,00001001B   ;09H
           OUT PORTA,AL
           CALL DELAY
                            
         loop L1  
     ;-----------------------------------------    
         
         
    ;-------------------   
     ;DELAY FUNCTION  
     DELAY PROC                               
     MOV BX, CX
     MOV CX, 06FFH
      LOOP2:loop LOOP2
     MOV CX, BX
     RET
     DELAY ENDP  
     
    ;--------------------
    ;anti-CLOCK-WISE FULL DRIVE
    ;2-WING ON  
    L1: mov AL,00001001B   ;03H
    L1: mov AL,00001001B   ;09H
       OUT PORTA,AL
       CALL DELAY
       
       
       mov AL,00000011B   ;06
       mov AL,00000011B   ;03H
       OUT PORTA,AL
       CALL DELAY
       


       mov AL,00000110B    ;0C  
       mov AL,00000110B    ;06H  
       OUT PORTA,AL
       CALL DELAY
        
        
       mov AL,00001100B   ;09
       mov AL,00001100B   ;0CH
       OUT PORTA,AL
       CALL DELAY  
         
    
     .exit 
       end 



