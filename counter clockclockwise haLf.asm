                                      
    

.CODE 
.startup 
   
     
       MOV AL, 10000000B  ;port A=output/ mode 0, PORT B=output/ mode 0 ,port C=output
       OUT CWR, AL      
           
           
       ;anti-CLOCK-WISE HALF DRIVE
       ;2-WING ON
   L1: mov AL,00001001 B   ;09H
       OUT PORTA,AL
       CALL DELAY
       
        ;1-WING ON
       mov AL,00000001 B   ;01H
       OUT PORTA,AL
       CALL DELAY
       

        ;2-WING ON
       mov AL,00000011 B    ;03H  
       OUT PORTA,AL
       CALL DELAY
        
        ;1-WING ON
       mov AL,00000010 B   ;02H
       OUT PORTA,AL
       CALL DELAY   
        
        ;2-WING ON 
       mov AL,00000110 B   ;06H
       OUT PORTA,AL
       CALL DELAY  
         
         ;1-WING ON
       mov AL,00000100 B   ;04H
       OUT PORTA,AL
       CALL DELAY     
         
         ;2-WING ON
        mov AL,00001100 B   ;0C H
       OUT PORTA,AL
       CALL DELAY      
         
         ;1-WING ON
        mov AL,00001000 B   ;08H
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