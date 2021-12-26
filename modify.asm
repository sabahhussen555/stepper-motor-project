                                        .MODEL SMALL
.DATA

       PORTA  = 00H                                         ;Address of Port A
       PORTB  = 02H                                         ;Address of Port B
       PORTC  = 04H                                         ;Address of Port C
       CWR  = 06H                                         ;Address of control word
       
 
	

.CODE
.STARTUP

MOV AL,10000010B     ;PORT A & PORT C OUTPUT , PORT B INPUT , MODE 0
OUT CWR,AL 

;---------------------------
 MAIN:
		
  
 CALL TEST_SWITCHES  
               
 JMP MAIN		;loop for ever 

;-------------------------


          
;----------------------------   

DELAYMAX PROC			;DelayMAX specific time 					
	 MOV BX, CX
	 MOV CX,06FFH
     delay1:
	 loop delay1
	 MOV CX, BX
	 RET
DELAYMAX ENDP


;----------------------------  
;FULL STEP MODE

ROTATECLKFULL PROC   
      ;full-mode clock-wise high speed
      ;2 WING-ON 
     loop1:  mov AL,00001100B    ;09H
       OUT PORTA,AL
       CALL DELAYMAX
       CALL TEST_SWITCHES 
       
       mov AL,00000110B    ;03H
       OUT PORTA,AL
       CALL DELAYMAX
       CALL TEST_SWITCHES 


       mov AL,00000011B  ;06H  
       OUT PORTA,AL
       CALL DELAYMAX
       CALL TEST_SWITCHES   
        
       mov AL,00001001B   ;0CH
       OUT PORTA,AL
       CALL DELAYMAX 
       CALL TEST_SWITCHES   
                        
                                       
      JMP loop1		;loop for ever   
              
          RET
ROTATECLKFULL ENDP   

;------------------------------------


ROTATEANTIFULL PROC  
      
     ;full-mode antiClock-wise high speed
     ;2 WING-ON 
                           
   loop2: mov AL,00001001B   ;0CH
       OUT PORTA,AL
       CALL DELAYMAX
        CALL TEST_SWITCHES 
       
       mov AL,00000011B   ;06H
       OUT PORTA,AL
       CALL DELAYMAX 
       CALL TEST_SWITCHES  


       mov AL,00000110B    ;02H  
       OUT PORTA,AL
       CALL DELAYMAX 
       CALL TEST_SWITCHES   
        
       mov AL,00001100B   ;09H
       OUT PORTA,AL
       CALL DELAYMAX  
       CALL TEST_SWITCHES 
                    
      JMP loop2		;loop for ever  
       
          RET
 ROTATEANTIFULL ENDP   

;------------------------------------------ 
;HALF STEP MODE
    ;half-mode Clock-wise low speed
    
     ROTATECLKHALF PROC        
           
       
   loop3: 
       ;1-WING ON 
       
       
       mov AL,00001001B   ;09H
       OUT PORTA,AL
       CALL DELAYMAX
       CALL TEST_SWITCHES        ;call the delay function 
       
       
       ;2-WING ON 
       
       mov AL,00000001B   ;01H
       OUT PORTA,AL
       CALL DELAYMAX
       CALL TEST_SWITCHES         
       
       ;1-WING ON  
       
       
       mov AL,00000011B   ;03H
       OUT PORTA,AL
       CALL DELAYMAX
       CALL TEST_SWITCHES              
                      
                      
       ;2-WING ON 
       
       
       mov AL,00000010B   ;02H
       OUT PORTA,AL
       CALL DELAYMAX
       CALL TEST_SWITCHES            
       
       ;1-WING ON     
       
       
       mov AL,00000110B   ;06H
       OUT PORTA,AL
       CALL DELAYMAX        
       CALL TEST_SWITCHES   
       
       ;2-WING ON 
       
       
       mov AL,00000100B    ;04H  
       OUT PORTA,AL
       CALL DELAYMAX      
       CALL TEST_SWITCHES  
       
       ;1-WING ON 
       
       mov AL,00001100B   ; 0CH
       OUT PORTA,AL
       CALL DELAYMAX         
       CALL TEST_SWITCHES  
       
       ;2-WING ON 
       
       mov AL,00001000B   ;08H
       OUT PORTA,AL
       CALL DELAYMAX          
       CALL TEST_SWITCHES  
       
          
       
      jmp loop3  
              
          RET
   ROTATECLKHALF ENDP    
     
  ;------------------------------------------   
  
                    
                    
    ROTATEANTIHALF PROC   
        
      ;HALF-mode ANTICLOCK WISE low speed 
      
     loop4:     ;1-WING ON
     
       mov AL,00001000B   ;08H
       OUT PORTA,AL
       CALL DELAYMAX
        CALL TEST_SWITCHES  
        
          ;2-WING ON
        mov AL,00001100B   ;0CH
       OUT PORTA,AL
       CALL DELAYMAX
       CALL TEST_SWITCHES     
       
           ;1-WING ON
       mov AL,00000100B   ;04H 
       OUT PORTA,AL
       CALL DELAYMAX
       CALL TEST_SWITCHES 
           
           ;2-WING ON
       mov AL,00000110B   ;06H
       OUT PORTA,AL
       CALL DELAYMAX
       CALL TEST_SWITCHES    
       
       mov AL,00000010B   ;02H
       OUT PORTA,AL
       CALL DELAYMAX
       CALL TEST_SWITCHES  
       
       mov AL,00000011B   ;03H
       OUT PORTA,AL
       CALL DELAYMAX       
       CALL TEST_SWITCHES
         
       mov AL,00000001B    ;01H  
       OUT PORTA,AL
       CALL DELAYMAX
       CALL TEST_SWITCHES  
       
       mov AL,00001001B   ;09H
       OUT PORTA,AL
       CALL DELAYMAX
       CALL TEST_SWITCHES  
           
                        
                                       
      JMP loop4		;loop for ever   
              
          RET
 ROTATEANTIHALF ENDP    
    
       
;------------------------------------------  
;WAVE STEP MODE  

ROTATEANTIWAVE PROC 
           
  
       ;ANTI CLOCK-WISE Wave step mode  (Max Speed)
       ;1-WING ON   
       
        
           
       Loop5: mov AL,00001000B   ;08H
           OUT PORTA,AL
           CALL DELAYMAX     ;HIDH SPEED 
           CALL TEST_SWITCHES
                        
                        
           mov AL,00000100B   ;04H  
           OUT PORTA,AL
           CALL DELAYMAX 
           CALL TEST_SWITCHES
           
           
           mov AL,00000010B   ;02H
           OUT PORTA,AL
           CALL DELAYMAX  
           CALL TEST_SWITCHES 
           
           
           mov AL,00000001B   ;01H
           OUT PORTA,AL
           CALL DELAYMAX
           CALL TEST_SWITCHES
                            
        jmp Loop5    ;loop for ever
           
           
           RET
ROTATEANTIWAVE ENDP    


       ;--------------
ROTATECLKWAVE PROC    
    
    
    ;anti-CLOCK-WISE Wave step mode   (MAX Speed)
    ;1-WING ON 
    
   
   
    Loop6: mov AL,00000001B   ;01H
       OUT PORTA,AL
       CALL DELAYMAX
       CALL TEST_SWITCHES
       
       
       
       mov AL,00000010B   ;02H
       OUT PORTA,AL
       CALL DELAYMAX 
       CALL TEST_SWITCHES
       


        
       mov AL,00000100B    ;04H  
       OUT PORTA,AL
       CALL DELAYMAX
       CALL TEST_SWITCHES
        
        
      
       mov AL,00001000B   ;08H
       OUT PORTA,AL
       CALL DELAYMAX
       CALL TEST_SWITCHES 
       
       
         jmp Loop6    ;loop for ever
           
           
           RET
ROTATECLKWAVE ENDP

 

;----------------------------  
;STOP SWITCH
                                              
    STOPING PROC			;Defining STOPING Function
	loop7:  
	   
      CALL TEST_SWITCHES                
      JMP loop7		;loop for ever
	 RET
     STOPING ENDP
                 
;----------------------------                                              
                                              
;------------------------------------------
TEST_SWITCHES PROC    	      ;check the input switches
IN AL,PORTB   

test AL,00000001B 		      ;check if the CLK wave mode  switch has been pressed 
JNZ L1 	                      ;jump to lable L1
CALL ROTATECLKWAVE 

L1:
test AL,00000010B		      ;check if the ANTICLK wave mode switch has been pressed 
JNZ L2                        ;jump to lable L2
CALL  ROTATEANTIWAVE
L2:

test AL,00000100B 		      ;check if the CLK full mode  switch has been pressed 
JNZ L3 	                      ;jump to lable L3
CALL  ROTATECLKFULL 

L3:
test AL,00001000B		      ;check if the ANTICLK full mode switch has been pressed 
JNZ L4                        ;jump to lable L4
CALL ROTATEANTIFULL

L4:
test AL,00010000B		     ;check if the clk half mode switch has been pressed 
JNZ L5                     ;jump to lable L5
CALL ROTATECLKHALF 


L5:
test AL,00100000B		     ;check if the ANTICLK half mode switch has been pressed 
JNZ L6                     ;jump to lable L6
CALL ROTATEANTIHALF

L6:
test AL,01000000B		     ;check if the stop switch has been pressed 
JNZ L7                     ;jump to lable L7
CALL STOPING

L7:

RET
TEST_SWITCHES ENDP 
;-----------------------------------------

.exit 
END 