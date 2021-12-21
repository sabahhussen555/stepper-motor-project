.MODEL SMALL
.DATA

       PORTA  = 00H                                         ;Address of Port A
       PORTB  = 02H                                         ;Address of Port B
       PORTC  = 04H                                         ;Address of Port C
       CWR  = 06H                                         ;Address of control word
       
 
		
	START_FLAG DB  00000000B				;Initializing START_FLAG
	

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
     ;  MOV START_FLAG,1 
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
        
      STOP1:   
      CALL TEST_SWITCHES                
      JMP l1		;loop for ever   
              
          RET
 ROTATECLK ENDP   

;------------------------------------

;-----------------------------------
ROTATEANTI PROC    
        ;  MOV START_FLAG,2                      
   l2: mov AL,00001001B   ;09H
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
      JMP l2		;loop for ever  
       
          RET
 ROTATEANTI ENDP   

;------------------------------------------     

;---------------------------
                                              
    STOPING PROC			;Defining STOPING Function
	l3: ;MOV START_FLAG,0 
	  STOP3:   
      CALL TEST_SWITCHES                
      JMP l3		;loop for ever
	 RET
     STOPING ENDP
                 
;----------------------------                                              
                                              
;------------------------------------------
TEST_SWITCHES PROC    	             ;check the input switches if it is CLK , ANTICLK or stop switch
IN AL,PORTB

TEST AL,00000001B 		      ;check if the CLK speed switch has been pressed 
JNZ LL 	
CALL ROTATECLK
LL:

TEST AL,00000010B		      ;check if the ANTICLK switch has been pressed 
JNZ LLL
CALL ROTATEANTI
LLL:

TEST AL,00000100B		     ;check if the stop switch has been pressed 
JNZ LLLL
CALL STOPING
LLLL:
RET
TEST_SWITCHES ENDP 
;-----------------------------------------

.exit 
END
