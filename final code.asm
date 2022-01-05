
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
     mov AX , 01101101B   ;display s for stop
     out PORTC,AX	
  
 CALL TEST_SWITCHES  
               
 JMP MAIN		;loop forever 

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

DELAYMID PROC			;DelayMID specific time 				
	 MOV BX, CX
	 MOV CX,3*06FFH
      delay2:
	 loop delay2
	 MOV CX, BX
	 RET
DELAYMID ENDP   

DELAYMIN PROC			;DelayMIN specific time 				
   	 MOV BX, CX
	 MOV CX,4*06FFH
      delay3:
	 loop delay3
	 MOV CX, BX
	 RET
DELAYMIN ENDP  


;----------------------------  
;FULL STEP MODE

ROTATEANTIFULL PROC   
      ;full-mode ANTI clock-wise normal(mid) speed
      ;2 WING-ON 
     loop1: 
       mov AX , 01110111B   ;display A for anti-clockwise
       out PORTC,AX
       CALL DELAYMID
       CALL TEST_SWITCHES
   
       
       mov AL,00001100B    ;09H
       OUT PORTA,AL
       CALL DELAYMID
       CALL TEST_SWITCHES 
       
       mov AL,00000110B    ;03H
       OUT PORTA,AL
       CALL DELAYMID
       CALL TEST_SWITCHES 


       mov AL,00000011B  ;06H  
       OUT PORTA,AL
       CALL DELAYMID
       CALL TEST_SWITCHES   
        
       mov AL,00001001B   ;0CH
       OUT PORTA,AL
       CALL DELAYMID 
       CALL TEST_SWITCHES   
                        
                                       
      JMP loop1		;loop forever   
              
          RET
ROTATEANTIFULL ENDP   

;------------------------------------


ROTATECLKFULL PROC  
      
     ;full-mode Clock-wise normal(mid) speed
     ;2 WING-ON 
                           
   loop2:
    
       mov AX , 00111001B   ;display c for clockwise
       out PORTC,AX
       CALL DELAYMID
       CALL TEST_SWITCHES
   
       mov AL,00001001B   ;0CH
       OUT PORTA,AL
       CALL DELAYMID
        CALL TEST_SWITCHES 
       
       mov AL,00000011B   ;06H
       OUT PORTA,AL
       CALL DELAYMID 
       CALL TEST_SWITCHES  


       mov AL,00000110B    ;02H  
       OUT PORTA,AL
       CALL DELAYMID 
       CALL TEST_SWITCHES   
        
       mov AL,00001100B   ;09H
       OUT PORTA,AL
       CALL DELAYMID  
       CALL TEST_SWITCHES 
                    
      JMP loop2		;loop forever  
       
          RET
 ROTATECLKFULL ENDP   

;------------------------------------------ 
;HALF STEP MODE
    ;half-mode Clock-wise low speed
    
     ROTATECLKHALF PROC        
           
       
   loop3:
   
       mov AX , 00111001B   ;display c for clockwise
       out PORTC,AX
       CALL DELAYMIN
       CALL TEST_SWITCHES        ;call the delay function  
       
       ;1-WING ON 
       
       mov AL,00001001B   ;09H
       OUT PORTA,AL
       CALL DELAYMIN
       CALL TEST_SWITCHES        ;call the delay function 
       
       
       ;2-WING ON 
       
       mov AL,00000001B   ;01H
       OUT PORTA,AL
       CALL DELAYMIN
       CALL TEST_SWITCHES         
       
       ;1-WING ON  
       
       
       mov AL,00000011B   ;03H
       OUT PORTA,AL
       CALL DELAYMIN
       CALL TEST_SWITCHES              
                      
                      
       ;2-WING ON 
       
       
       mov AL,00000010B   ;02H
       OUT PORTA,AL
       CALL DELAYMIN
       CALL TEST_SWITCHES            
       
       ;1-WING ON     
       
       
       mov AL,00000110B   ;06H
       OUT PORTA,AL
       CALL DELAYMIN        
       CALL TEST_SWITCHES   
       
       ;2-WING ON 
       
       
       mov AL,00000100B    ;04H  
       OUT PORTA,AL
       CALL DELAYMIN      
       CALL TEST_SWITCHES  
       
       ;1-WING ON 
       
       mov AL,00001100B   ; 0CH
       OUT PORTA,AL
       CALL DELAYMIN         
       CALL TEST_SWITCHES  
       
       ;2-WING ON 
       
       mov AL,00001000B   ;08H
       OUT PORTA,AL
       CALL DELAYMIN         
       CALL TEST_SWITCHES  
       
          
       
      jmp loop3      ;loop forever
              
          RET
   ROTATECLKHALF ENDP    
     
  ;------------------------------------------   
  
                    
                    
    ROTATEANTIHALF PROC   
        
      ;HALF-mode ANTICLOCK WISE low speed 
      
     loop4:  
     
       mov AX , 01110111B   ;display A for anti-clockwise
       out PORTC,AX
       CALL DELAYMIN
       CALL TEST_SWITCHES        ;call the delay function  
     
        ;1-WING ON
     
       mov AL,00001000B   ;08H
       OUT PORTA,AL
       CALL DELAYMIN
        CALL TEST_SWITCHES  
        
          ;2-WING ON
        mov AL,00001100B   ;0CH
       OUT PORTA,AL
       CALL DELAYMIN
       CALL TEST_SWITCHES     
       
           ;1-WING ON
       mov AL,00000100B   ;04H 
       OUT PORTA,AL
       CALL DELAYMIN
       CALL TEST_SWITCHES 
           
           ;2-WING ON
       mov AL,00000110B   ;06H
       OUT PORTA,AL
       CALL DELAYMIN
       CALL TEST_SWITCHES    
       
       mov AL,00000010B   ;02H
       OUT PORTA,AL
       CALL DELAYMIN
       CALL TEST_SWITCHES  
       
       mov AL,00000011B   ;03H
       OUT PORTA,AL
       CALL DELAYMIN       
       CALL TEST_SWITCHES
         
       mov AL,00000001B    ;01H  
       OUT PORTA,AL
       CALL DELAYMIN
       CALL TEST_SWITCHES  
       
       mov AL,00001001B   ;09H
       OUT PORTA,AL
       CALL DELAYMIN
       CALL TEST_SWITCHES  
           
                        
                                       
      JMP loop4		;loop forever   
              
          RET
 ROTATEANTIHALF ENDP    
    
       
;------------------------------------------  
;WAVE STEP MODE  

ROTATEANTIWAVE PROC 
           
  
       ;ANTI CLOCK-WISE Wave step mode  (Max Speed)
       ;1-WING ON   
       
        
           
       Loop5: 
        mov AX , 01110111B   ;display A for anti-clockwise
        out PORTC,AX 
        CALL DELAYMAX
        CALL TEST_SWITCHES
       
           mov AL,00001000B   ;08H
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
                            
        jmp Loop5    ;loop forever
           
           
           RET
ROTATEANTIWAVE ENDP    


       ;--------------
ROTATECLKWAVE PROC    
    
    
    ;CLOCK-WISE Wave step mode   (MAX Speed)
    ;1-WING ON 
    
   
   
    Loop6: 
        mov AX , 00111001B   ;display c for clockwise
        out PORTC,AX 
        CALL DELAYMAX
        CALL TEST_SWITCHES
        
       mov AL,00000001B   ;01H
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
       
       
         jmp Loop6    ;loop forever
           
           
           RET
ROTATECLKWAVE ENDP

 

;----------------------------  
;STOP SWITCH
                                              
    STOPING PROC			;Defining STOPING Function
	loop7:  
	   mov AX , 01101101B   ;display s for stop
        out PORTC,AX  
        
      CALL TEST_SWITCHES                
      JMP loop7		;loop forever
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