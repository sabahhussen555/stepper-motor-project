.MODEL SMALL
.DATA

       PORTA  = 00H                                         ;Address of Port A
       PORTB  = 02H                                         ;Address of Port B
       PORTC  = 04H                                         ;Address of Port C
       CWR  = 06H                                         ;Address of control word
       
     ROTATION DB   00001100B
                DB    00000110B   
                DB  00000011B 
                DB 00001001B 
                DB 00001001B  
         	     DB    00000011B 
         	       DB  00000110B 
         	       DB  00001100B
		
	START_FLAG DB  00000000B				;Initializing START_FLAG
	;

.CODE
.STARTUP

MOV AL,10000010B     ;PORT A & PORT C OUTPUT , PORT B INPUT , MODE 0
OUT CWR,AL
MOV SI,0
mov cx,06FFH
MAIN:
CMP START_FLAG,0	;check the stop condition
JZ STOP			
CALL ROTATE		; rotate one step
CALL DELAY 
STOP:   
CALL TEST_SWITCHES	;check the input switches
JMP MAIN		;loop for ever

FULL_SPEED PROC			;Defining Motor FULL_SPEED Function
	 MOV START_FLAG,2
	 MOV BX,03FFH
	 MOV cx,BX
	 RET
FULL_SPEED ENDP

STOPING PROC			;Defining STOPING Function
	 MOV START_FLAG,0
	 RET
STOPING ENDP
                 
           

DELAY PROC			;Delay specific time depends on DELAY_TIME variable					
	 MOV BX, CX
	 MOV CX,06FFH
      delay1:
	 loop delay1
	 MOV CX, BX
	 RET
DELAY ENDP

ROTATE PROC                          ;ROTATE PROCEDURE make the rotation action by switching between steps in steps matrix
          MOV AL,ROTATION[SI]
          INC SI 
          CMP SI,8
          JNZ FINISH                 ;if we reach the final step go the first one again	
          MOV SI,0
      FINISH:
          OUT PORTA,AL               ;output the selected setp to port 'A' to rotate the motor 
          RET
 ROTATE ENDP 

TEST_SWITCHES PROC    	             ;check the input switches if it is h full speed or stop switch
IN AL,PORTB
TEST AL,00000010B		      ;check if the full speed switch has been pressed 
JNZ LF
CALL FULL_SPEED
LF:

TEST AL,00000100B		     ;check if the stop switch has been pressed 
JNZ LS
CALL STOPING
LS:
RET
TEST_SWITCHES ENDP 
.exit 
END
