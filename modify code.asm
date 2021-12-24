.MODEL SMALL
.DATA

       PORTA  = 00H                                         ;Address of Port A
       PORTB  = 02H                                         ;Address of Port B
       PORTC  = 04H                                         ;Address of Port C
       CWR  = 06H                                         ;Address of control word
       
 
		
	;START_FLAG DB  00000000B				;Initializing START_FLAG
	

.CODE
.STARTUP

MOV AL,10000010B     ;PORT A & PORT C OUTPUT , PORT B INPUT , MODE 0
OUT CWR,AL
;---------------------------
 MAIN:
 ;CMP START_FLAG,0
 ;JZ STOP		
 STOP:   
 CALL TEST_SWITCHES                
 JMP MAIN		;loop for ever 

;-------------------------


          
;----------------------------
DELAY PROC			;Delay specific time depends on DELAY_TIME variable					
	 MOV BX, CX
	 MOV CX,06FFH
      delay1:
	 loop delay1
	 MOV CX, BX
	 RET
DELAY ENDP
;----------------------------

ROTATECLK PROC   
      ;full-mode clock-wise high speed 
     loop1:  mov AL,00001100B    ;09H
       OUT PORTA,AL
       CALL DELAY
       
       
       mov AL,00000110B    ;03H
       OUT PORTA,AL
       CALL DELAY
       


       mov AL,00000011B  ;06H  
       OUT PORTA,AL
       CALL DELAY
        
        
       mov AL,00001001B   ;0CH
       OUT PORTA,AL
       CALL DELAY  
        
      STOP1:   
      CALL TEST_SWITCHES                
      JMP loop1		;loop for ever   
              
          RET
 ROTATECLK ENDP   

;------------------------------------

;-----------------------------------
ROTATEANTI PROC  
      
     ;full-mode antiClock-wise high speed                       
   loop2: mov AL,00001001B   ;09H
       OUT PORTA,AL
       CALL DELAY
       
       
       mov AL,00000011B   ;03H
       OUT PORTA,AL
       CALL DELAY
       


       mov AL,00000110B    ;06H  
       OUT PORTA,AL
       CALL DELAY
        
        
       mov AL,00001100B   ;0CH
       OUT PORTA,AL
       CALL DELAY 
       
       STOP2:   
      CALL TEST_SWITCHES                
      JMP loop2		;loop for ever  
       
          RET
 ROTATEANTI ENDP   

;------------------------------------------     

;---------------------------
                                              
    STOPING PROC			;Defining STOPING Function
	loop3:  
	  STOP3:   
      CALL TEST_SWITCHES                
      JMP loop3		;loop for ever
	 RET
     STOPING ENDP
                 
;----------------------------                                              
                                              
;------------------------------------------
TEST_SWITCHES PROC    	      ;check the input switches
IN AL,PORTB

test AL,00000001B 		      ;check if the CLK full-mode  switch has been pressed 
JNZ L1 	                      ;jump to lable LL
CALL ROTATECLK 

L1:
test AL,00000010B		      ;check if the ANTICLK switch has been pressed 
JNZ L2                        ;jump to lable LLL
CALL ROTATEANTI

L2:
test AL,00000100B		     ;check if the stop switch has been pressed 
JNZ L3                     ;jump to lable LLLL
CALL STOPING


L3:
RET
TEST_SWITCHES ENDP 
;-----------------------------------------

.exit 
END
