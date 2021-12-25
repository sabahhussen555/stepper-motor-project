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

ROTATEANTI PROC   
      ;HALF-mode ANTIclock-wise high speed 
     loop1:     ;1-WING ON
       mov AL,00001000B   ;08H
       OUT PORTA,AL
       CALL DELAY 
        CALL TEST_SWITCHES  
          ;2-WING ON
        mov AL,00001100B   ;0CH
       OUT PORTA,AL
       CALL DELAY
       CALL TEST_SWITCHES   
           ;1-WING ON
       mov AL,00000100B   ;04H 
       OUT PORTA,AL
       CALL DELAY 
           
           ;2-WING ON
       mov AL,00000110B   ;06H
       OUT PORTA,AL
       CALL DELAY  
       CALL TEST_SWITCHES  
       mov AL,00000010B   ;02H
       OUT PORTA,AL
       CALL DELAY  
       CALL TEST_SWITCHES  
       mov AL,00000011B   ;03H
       OUT PORTA,AL
       CALL DELAY       
       CALL TEST_SWITCHES  
       mov AL,00000001B    ;01H  
       OUT PORTA,AL
       CALL DELAY 
       CALL TEST_SWITCHES  
       mov AL,00001001B   ;09H
       OUT PORTA,AL
       CALL DELAY   
       CALL TEST_SWITCHES  
           
                        
                                       
      JMP loop1		;loop for ever   
              
          RET
 ROTATEANTI ENDP   

;------------------------------------

;-----------------------------------


;------------------------------------------     

;---------------------------
                                              
   
                 
;----------------------------                                              
                                              
;------------------------------------------
TEST_SWITCHES PROC    	      ;check the input switches
IN AL,PORTB

test AL,00000001B 		      ;check if the CLK HALF-mode  switch has been pressed 
JNZ L1 	                      ;jump to lable L1
CALL ROTATEANTI

L1:
RET
TEST_SWITCHES ENDP 
;-----------------------------------------

.exit 
END
