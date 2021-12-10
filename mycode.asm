.MODEL SMALL
.DATA
    PORTA  = 00H ;PORTA address                                      
    PORTB  = 02H ;PORTB address                                       
    PORTC  = 04H ;PORTc address  
    CWR    = 06H ;control port address                                      
    

.CODE 
.startup

     ;rotate motore in clockwise 
     
     mov AL , 80H ; initial value 10000000 
     out CWR , AL 
     mov AL , 88H ; 10001000 to start
     mov CX,1000; counter
     
   loop1: out PORTA,AL 
          ROL AL,01 ;   AL=00010001  
          DEC CX    ; decreace counter
          
       jnz loop1    
       
       
       
       
       
       
      .exit 
       end 