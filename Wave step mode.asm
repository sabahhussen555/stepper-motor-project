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
       ;CLOCK-WISE Wave step mode
       ;1-WING ON   
       
         MOV CX, 30 ;counter
           
       L1: mov AL,00001000B   ;08H
           OUT PORTA,AL
           CALL DELAY         ;delay
                        
                        
           mov AL,00000100B   ;04H  
           OUT PORTA,AL
           CALL DELAY 
           
           
           mov AL,00000010B   ;02H
           OUT PORTA,AL
           CALL DELAY   
           
           
           mov AL,00000001B   ;01H
           OUT PORTA,AL
           CALL DELAY
                            
         loop L1  
     ;-----------------------------------------    
         
         
    ;------------------------------------------------
    ;anti-CLOCK-WISE Wave step mode
    ;1-WING ON 
    
    MOV CX, 30 ;counter 
   
    L2: mov AL,00000001B   ;01H
       OUT PORTA,AL
       CALL DELAY
       
       
       
       mov AL,00000010B   ;02H
       OUT PORTA,AL
       CALL DELAY
       


        
       mov AL,00000100B    ;04H  
       OUT PORTA,AL
       CALL DELAY
        
        
      
       mov AL,00001000B   ;08H
       OUT PORTA,AL
       CALL DELAY 
       loop L2 
       
     ;-------------------------------------------
     
     
      
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
        
         
    
     .exit 
       end 