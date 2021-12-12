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
       
       L1: mov AL,00001001B   ;09
           OUT PORTA,AL
           CALL DELAY 
                        
                        
           mov AL,00001100B    ;0C  
           OUT PORTA,AL
           CALL DELAY 
           
           
           mov AL,00000110B   ;06
           OUT PORTA,AL
           CALL DELAY   
           
           
           mov AL,00000011B   ;03H
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