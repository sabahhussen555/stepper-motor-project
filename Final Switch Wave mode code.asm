.MODEL SMALL
.DATA
    PORTA  = 00H ;PORTA address                                      
    PORTB  = 02H ;PORTB address                                       
    PORTC  = 04H ;PORTc address  
    CWR    = 06H ;control port address                                      
    

.CODE 
.startup 
   
             
             
       MOV AL, 10000010B  ;PORT A & PORT C OUTPUT , PORT B INPUT , MODE 0
       OUT CWR, AL 
      ;-------------------------------------- 
      
   MAIN:
		
  
   CALL TEST_SWITCHES  
               
   JMP MAIN		;loop for ever 
      ;---------------------------------------

     ;------------------------------
ROTATECLK PROC 
           
  
       ;CLOCK-WISE Wave step mode  (Meduim Speed)
       ;1-WING ON   
       
        
           
       Loop1: mov AL,00001000B   ;08H
           OUT PORTA,AL
           CALL DELAY         ;delay 
           CALL TEST_SWITCHES
                        
                        
           mov AL,00000100B   ;04H  
           OUT PORTA,AL
           CALL DELAY  
           CALL TEST_SWITCHES
           
           
           mov AL,00000010B   ;02H
           OUT PORTA,AL
           CALL DELAY  
           CALL TEST_SWITCHES 
           
           
           mov AL,00000001B   ;01H
           OUT PORTA,AL
           CALL DELAY   
           CALL TEST_SWITCHES
                            
        jmp Loop1    ;loop for ever
           
           
           RET
ROTATECLK ENDP           
     ;-----------------------------------------    
         
         
    ;------------------------------------------------
ROTATEANTI PROC    
    
    
    ;anti-CLOCK-WISE Wave step mode   (Meduim Speed)
    ;1-WING ON 
    
   
   
    Loop2: mov AL,00000001B   ;01H
       OUT PORTA,AL
       CALL DELAY
       CALL TEST_SWITCHES
       
       
       
       mov AL,00000010B   ;02H
       OUT PORTA,AL
       CALL DELAY 
       CALL TEST_SWITCHES
       


        
       mov AL,00000100B    ;04H  
       OUT PORTA,AL
       CALL DELAY 
       CALL TEST_SWITCHES
        
        
      
       mov AL,00001000B   ;08H
       OUT PORTA,AL
       CALL DELAY
       CALL TEST_SWITCHES 
       
       
         jmp Loop2    ;loop for ever
           
           
           RET
ROTATEANTI ENDP 
       
     ;-------------------------------------------
     
TEST_SWITCHES PROC    	      ;check the input switches
IN AL,PORTB

test AL,00000001B 		      ;check if the CLK full-mode  switch has been pressed 
JNZ L1 	                      ;jump to lable L1
CALL ROTATECLK 

L1:
test AL,00000010B		      ;check if the ANTICLK switch has been pressed 
JNZ L2                        ;jump to lable L2
CALL ROTATEANTI

L2:

             RET
TEST_SWITCHES ENDP
      
     ;------------------- 

  ;----------------------------------------------------
  
  
  
     ;DELAY FUNCTION  
     DELAY PROC                               
     MOV BX, CX
     MOV CX, 06FFH
      delay2:
      loop delay2
     MOV CX, BX
     RET
     DELAY ENDP  
     
     ;--------------------
        
         
    
     .exit 
       end 