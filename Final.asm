.MODEL SMALL
.DATA

       PORTA  = 00H                                         ;Address of Port A
       PORTB  = 02H                                         ;Address of Port B
       PORTC  = 04H                                         ;Address of Port C
       CWR  = 06H                                         ;Address of control word
       
 
		
	START_FLAG DB  00000000B				;Initializing START_FLAG
	;

.CODE
.STARTUP

MOV AL,10000010B     ;PORT A & PORT C OUTPUT , PORT B INPUT , MODE 0
OUT CWR,AL
;---------------------------
MAIN:
CMP START_FLAG,0
JZ STOP		
STOP:   
CALL TEST_SWITCHES                
JMP MAIN		;loop for ever 

;-------------------------


          
;----------------------------
DELAY PROC			;Delay function					
	 MOV BX, CX
	 MOV CX,06FFH
      delay1:
	 loop delay1
	 MOV CX, BX
	 RET
DELAY ENDP
;----------------------------

ROTATECLK PROC  
    ;full-mode cloke-wise high speed 
    
     l1:  mov AL,00001100B    ;09H
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
      STOP2:   
      CALL TEST_SWITCHES                
      JMP l1		;loop for ever    

          RET
 ROTATECLK ENDP   

;------------------------------------

                                          
                                              
;------------------------------------------
TEST_SWITCHES PROC  ;check the input switches
    
     	              
IN AL,PORTB  ;check if the CLK full-mode  switch has been pressed
TEST AL,00000001B 		       
JNZ LL 	
CALL ROTATECLK  



LL:
RET
TEST_SWITCHES ENDP 
;-----------------------------------------

.exit 
END
