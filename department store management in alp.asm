.MODEL LARGE
.STACK 1000H
.DATA  
TOT DW 0 
n dw 0
filename db 'abc.txt',0
string dw ?
handle dw 0 
;SPA DW 13,10
SPA1 DW 0dh
SPA2 DW 0ah
tb dw 9h
st db ?,?,?,?,?
da db ?,?,?,?,?,?,?,?,?
OUSE1 DB 'SANDYS$'
                OUSE2 DB 'LEKHAS$'
                OPASS1 DB 'SANDYS$'
                OPASS2 DB 'LEKHAS$' 
                MSG  DB 13,10, ' ENTER THE USERNAME :  $'
                MSG2 DB 13,10, ' ENTER THE PASSWORD  :  $'
                USE DB  255 DUP('$')
                ULEN db 5H
                PASS DB  255 DUP('$')
                PLEN db 5H 
                neq db 'INCORRECT USERNAME OR PASSWORD.. ENTER A VALID ONE..$'
                eq db 'LOGGED IN SUCCESSFULLY.. $',10,10
M1 DB 10,13,10,13,'                 SANCHI DEPARTMENTAL STORES..$',10,13  
mainmenu db 10,13,'                         WELCOME.. $',10,13,'        1.Buy Products $',10,13,'       2.View Purchase history$',10,13,'       3.Exit$',10,13,'    Enter your choice : $'
M2 DB 10,13,10,13,'Enter your Choice: $'
M3 DB 10,13,'                 1.Stationary              $' 
M4 DB 10,13,'                 2.Vegetables              $'
MS5 DB 10,13,'                 3.Provisions              $'
M5 DB 10,13,'                 4.Chocolates              $'
M6 DB 10,13,'                 5.Cosmetics               $'
M7 DB 10,13,'                 6.Drinks                  $'  
M8 DB 10,13,10,13,' $'
M9 DB 10,13,'           1.Pen                     10/-                      $'
M10 DB 10,13,'           2.Pencil                  10/-                      $'
M11 DB 10,13,'           3.A4 Sheet                10/-                      $'
M12 DB 10,13,'           4.Stapler                 10/-                      $'
M13 DB 10,13,'           5.Note 80 pages           20/-                      $'
M14 DB 10,13,'           6.Rubber band             20/-                      $'
M15 DB 10,13,'           7.Stick file              10/-                      $'
M16 DB 10,13,'           8.Exam pad                20/-                      $'
M17 DB 10,13,'           9.Note 120 pages          60/-                      $' 
M25 DB 10,13,'  1.Onion  					            90/-                $' 
M26 DB 10,13,'  2.Tomato					             90/-                $' 
M27 DB 10,13,'  3.Carrot	                             30/-                $' 
M28 DB 10,13,'  4.Beans								  90/-                $'
M29 DB 10,13,'  5.Cabbage							    90/-                $'
M30 DB 10,13,'  6.Brinjal	                            10/-                $'
M31 DB 10,13,'  7.Cauliflower                            30/-                $'
M32 DB 10,13,'  8.Drumstick		                      30/-                $'
M33 DB 10,13,'  9.Coconut                                30/-                $'
M18 DB 10,13,'  1.Green Gram              60/-                               $'
M19 DB 10,13,'  2.Black Gram			  80/-                               $'
M20 DB 10,13,'  3.Bengal Gram			 80/-                               $' 
M21 DB 10,13,'  4.Chick peas		      40/-                               $'
M22 DB 10,13,'  5.Red Chilli powder       50/-                               $'
M23 DB 10,13,'  6.Turmeric powder         70/-                               $'
M34 DB 10,13,'  7.Corriander powder       60/-                               $'
M35 DB 10,13,'  8.Ragi	                60/-                               $'
M36 DB 10,13,'  9.Wheat			       60/-                               $'
M41 DB 10,13,'  1.Snickers	     8/-                  $'
M42 DB 10,13,'  2.Dairy milk silk  80/-                 $'
M43 DB 10,13,'  3.5-star           5/-                  $'
M44 DB 10,13,'  4.Kit-kat          5/-                  $'
M45 DB 10,13,'  1.Soap       50/-                       $' 
M46 DB 10,13,'  2.Bodylotion 50/-                       $'
M47 DB 10,13,'  3.Shampoo    50/-                       $'
M48 DB 10,13,'  4.FaceWash   50/-                       $'
M49 DB 10,13,'  1.Soft Drinks 8/-                       $'
M50 DB 10,13,'  2.Laschi       6/-                      $'
M51 DB 10,13,'  3.Borhani      9/-                      $'
M52 DB 10,13,'  4.Labang       9/-                      $'
M53 DB 10,13,'  5.Coffee       7/-                      $'
M54 DB 10,13,'  6.Tea          5/-                      $'
M55 DB 10,13,10,13,'***  Wrong option Entered...***$'
M56 DB 10,13,'      *** Please try again..  ***$'
M57 DB 10,13,10,13,'Enter your order: $'
M58 DB 10,13,'Quantity: $'
M59 DB 10,13,'Total Price: $' 
M62 DB 10,13,'Total bill amount is : $'
DRINK DB ?
QUANTITY DB ?
M60 DB 10,13,10,13,'1.Main Menu$'
M61 DB 10,13,'2.Exit$'
MR1 DB 10,13,' $'
MR2 DB 10,13,' $'
MR3 DB 10,13,' $'
MR4 DB 10,13,' $'
MR5 DB 10,13,' $'
MR6 DB 10,13,' $'
MR7 DB 10,13,' $'
SEJ DB 10,13,10,13,' $'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    mov es, ax
reenter:

          LEA DX,MSG
          MOV AH,09H
          INT 21H

          LEA SI,USE
          MOV AH,01H

READ proc
          INT 21H
          MOV [SI],AL
          INC SI
          CMP AL,13;;;;;;;;;;;cariage return = 0dh
          JNE READ
      READ  endp

         LEA DX,MSG2
          MOV AH,09H
          INT 21H

          LEA SI,PASS
          MOV AH,01H
          
READ1 proc
          INT 21H
          MOV [SI],AL
          INC SI
          CMP AL,13;;;;;;;;;;;cariage return = 0dh
          JNE READ1
      READ1  endp

        lea si,ouse1   
    lea di, use
    mov cx, 5
    mov al, 6
    mov bl, 6
    cmp al, bl
    jne Not_Equal

    repe cmpsb
    jne Not_Equal
    jmp Equal

    Not_Equal:
       jmp next
    
    Equal:
          lea si,opass1   
    lea di, pass
    mov cx, 5
    mov al, 6
    mov bl, 6
    cmp al, bl
    jne Not_Equal1

    repe cmpsb
    jne Not_Equal1
    jmp Equal1

    Not_Equal1: 
        mov ah, 09h
       lea dx, neq
       int 21h 
       jmp reenter
    
    Equal1:
         mov ah, 09h
       lea dx, eq
       int 21h
       jmp top
    next:
        lea si, ouse2   
    lea di, use
    mov cx, 5
    mov al, 6
    mov bl, 6
    cmp al, bl
    jne Not_Equal2

    repe cmpsb
    jne Not_Equal2
    jmp Equal2

    Not_Equal2:
       mov ah, 09h
       lea dx, neq
       int 21h 
       jmp reenter 
    
    Equal2:
          lea si, opass2   
    lea di, pass
    mov cx, 5
    mov al, 6
    mov bl, 6
    cmp al, bl
    jne Not_Equal3

    repe cmpsb
    jne Not_Equal3
    jmp Equal3

    Not_Equal3: 
        mov ah, 09h
       lea dx, neq
       int 21h 
       jmp reenter
    
    Equal3:
         mov ah, 09h
       lea dx, eq
       int 21h
       ;jmp top

    
    
  TOP: 
  
  
  mov	ax,3d02h
lea	dx,filename
int	21h
jc	error
mov	handle,ax

mov bx, ax
mov ah, 42h  ; "lseek"
mov al, 2    ; position relative to end of file
mov cx, 0    ; offset MSW
mov dx, 0    ; offset LSW
int 21h


			; write string to file
mov	ah,40h
mov	bx,handle
mov	cx,2
lea	dx,spa1
int	21h
jc	error
 
 
 
mov bx, ax
mov ah, 42h  ; "lseek"
mov al, 2    ; position relative to end of file
mov cx, 0    ; offset MSW
mov dx, 0    ; offset LSW
int 21h


			; write string to file
mov	ah,40h
mov	bx,handle
mov	cx,2
lea	dx,spa2
int	21h
jc	error

mov bx, ax
mov ah, 42h  ; "lseek"
mov al, 2    ; position relative to end of file
mov cx, 0    ; offset MSW
mov dx, 0    ; offset LSW
int 21h


			; write string to file
mov	ah,40h
mov	bx,handle
mov	cx,5
lea	dx,USE
int	21h
jc	error
          
mov bx, ax
mov ah, 42h  ; "lseek"
mov al, 2    ; position relative to end of file
mov cx, 0    ; offset MSW
mov dx, 0    ; offset LSW
int 21h


			; write string to file
mov	ah,40h
mov	bx,handle
mov	cx,1
lea	dx,tb
int	21h
jc	error          
			; close file
mov	ah,3eh
mov	bx,handle
int	21h

error:

  
  
    LEA DX,M1
    MOV AH,9
    INT 21H
    LEA DX,SEJ
    MOV AH,9
    INT 21H
    LEA DX,MR2
    MOV AH,9
    INT 21H
    LEA DX,MR2
    MOV AH,9
    INT 21H
    LEA DX,MR3
    MOV AH,9
    INT 21H   
    LEA DX,M3
    MOV AH,9
    INT 21H
    LEA DX,M4
    MOV AH,9
    INT 21H
    LEA DX,MS5
    MOV AH,9
    INT 21H
    LEA DX,M5
    MOV AH,9
    INT 21H
    LEA DX,M6
    MOV AH,9
    INT 21H
    LEA DX,M7
    MOV AH,9
    INT 21H
    LEA DX,MR1
    MOV AH,9
    INT 21H
    LEA DX,MR2
    MOV AH,9
    INT 21H
    LEA DX,MR2
    MOV AH,9
    INT 21H
    LEA DX,M2
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    MOV BH,AL
    SUB BH,48
    CMP BH,1
    JE Stationary
    CMP BH,2
    JE LD   
    CMP BH,3
    JE Provisions 
    CMP BH,4
    JE Chocolates
    CMP BH,5
    JE Cosmetics
    CMP BH,6
    JE DRINKS
    JMP INVALID
   Stationary:
    LEA DX,M8
    MOV AH,9
    INT 21H
    LEA DX,SEJ
    MOV AH,9
    INT 21H
    LEA DX,MR5
    MOV AH,9
    INT 21H
    LEA DX,MR5
    MOV AH,9
    INT 21H
    LEA DX,MR4
    MOV AH,9
    INT 21H
    LEA DX,M9
    MOV AH,9
    INT 21H 
    LEA DX,M10
    MOV AH,9
    INT 21H
    LEA DX,M11
    MOV AH,9
    INT 21H 
    LEA DX,M12
    MOV AH,9
    INT 21H
    LEA DX,M13
    MOV AH,9
    INT 21H
    LEA DX,M14
    MOV AH,9
    INT 21H
    LEA DX,M15
    MOV AH,9  
    INT 21H
    LEA DX,M16
    MOV AH,9
    INT 21H 
    LEA DX,M17
    MOV AH,9
    INT 21H
    LEA DX,MR4
    MOV AH,9
    INT 21H
    LEA DX,MR5
    MOV AH,9
    INT 21H
    LEA DX,MR5
    MOV AH,9
    INT 21H
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    CMP BL,1
    JE TEN
    CMP BL,2
    JE TEN
    CMP BL,3
    JE TEN 
    CMP BL,4
    JE TEN
    CMP BL,5
    JE TWENTY
    CMP BL,6
    JE TWENTY
    CMP BL,7
    JE TEN
    CMP BL,8
    JE TWENTY 
    CMP BL,9
    JE SIXTY
    JMP INVALID 
   FOURTY:
    MOV BL,4
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL 
	ADD TOT,AX
    AAM 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,'0'
    INT 21H
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H
    LEA DX,M2
    MOV AH,9
    INT 21H            
    MOV AH,1
    INT 21H
    SUB AL,48
    CMP AL,1
    JE TOP
    JMP EXIT
   FIFTY:
    MOV BL,4
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL 
	ADD TOT,AX
    AAM 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,'0'
    INT 21H 
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H
    LEA DX,M2
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48   
    CMP AL,1
    JE TOP
    JMP EXIT
   SEVENTY:
    MOV BL,7
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL 
	ADD TOT,AX
    AAM 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,'0'
    INT 21H 
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H
    LEA DX,M2
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    CMP AL,1
    JE TOP
    JMP EXIT
    EIGHTY:
    MOV BL,8
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL
    ADD TOT,AX	
    AAM 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,'0'
    INT 21H
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H
    LEA DX,M2
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    CMP AL,1
    JE TOP
    JMP EXIT         
    JMP EXIT
    LD:
    LEA DX,M8
    MOV AH,9
    INT 21H
    LEA DX,SEJ
    MOV AH,9
    INT 21H
    LEA DX,MR5
    MOV AH,9
    INT 21H
    LEA DX,MR5
    MOV AH,9
    INT 21H
    LEA DX,MR4
    MOV AH,9
    INT 21H
    LEA DX,M25
    MOV AH,9
    INT 21H 
    LEA DX,M26
    MOV AH,9
    INT 21H
    LEA DX,M27
    MOV AH,9
    INT 21H  
    LEA DX,M28
    MOV AH,9
    INT 21H 
    LEA DX,M29
    MOV AH,9
    INT 21H                        
    LEA DX,M30
    MOV AH,9
    INT 21H 
    LEA DX,M31
    MOV AH,9
    INT 21H 
    LEA DX,M32
    MOV AH,9
    INT 21H  
    LEA DX,M33
    MOV AH,9
    INT 21H
    LEA DX,MR4
    MOV AH,9
    INT 21H
    LEA DX,MR5
    MOV AH,9
    INT 21H
    LEA DX,MR5
    MOV AH,9
    INT 21H 
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    CMP BL,1
    JE NINETY
    CMP BL,2
    JE NINETY
    CMP BL,3
    JE THIRTY
    CMP BL,4
    JE NINETY
    CMP BL,5
    JE NINETY
    CMP BL,6
    JE TEN
    CMP BL,7
    JE THIRTY
    CMP BL,8
    JE THIRTY 
    CMP BL,9
    JE THIRTY
    JMP INVALID
   TEN:
    MOV BL,1
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL 
	ADD TOT,AX
    AAM 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,'0'
    INT 21H  
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H
    LEA DX,M2
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H          
    SUB AL,48
    CMP AL,1
    JE TOP
    JMP EXIT
   TWENTY:
    MOV BL,2
    LEA DX,M58              
    MOV AH,9
    INT 21H 
 MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL 
	ADD TOT,AX
    AAM 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,'0'
    INT 21H
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H
    LEA DX,M2
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    CMP AL,1
    JE TOP
    JMP EXIT 
   THIRTY:
    MOV BL,3
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL 
	ADD TOT,AX
    AAM 
	MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,'0'
    INT 21H  
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H
    LEA DX,M2
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    CMP AL,1
    JE TOP
    JMP EXIT
    SIXTY: 
   MOV BL,6
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL
	ADD TOT,AX
    AAM 
  MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,'0'
    INT 21H 
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H   
    LEA DX,M2
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    CMP AL,1
    JE TOP
    JMP EXIT
   NINETY:
    MOV BL,9
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL 
	ADD TOT,AX
    AAM 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,'0'
    INT 21H
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H 
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H
    LEA DX,M2
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    CMP AL,1
    JE TOP
    JMP EXIT 
    JMP EXIT 
  Provisions:
    LEA DX,M8
    MOV AH,9  
    INT 21H
    LEA DX,SEJ
    MOV AH,9
    INT 21H
    LEA DX,MR5
    MOV AH,9
    INT 21H
    LEA DX,MR5
    MOV AH,9
    INT 21H  
    LEA DX,MR4
    MOV AH,9
    INT 21H
    LEA DX,M18         
    MOV AH,9
    INT 21H 
    LEA DX,M19
    MOV AH,9           
    INT 21H
    LEA DX,M20         
    MOV AH,9
    INT 21H
    LEA DX,M21
    MOV AH,9           
    INT 21H  
    LEA DX,M22         
    MOV AH,9
    INT 21H 
    LEA DX,M23            
    MOV AH,9
    INT 21H
    LEA DX,M34            
    MOV AH,9
    INT 21H
    LEA DX,M35            
    MOV AH,9
    INT 21H 
    LEA DX,M36            
    MOV AH,9
    INT 21H
    LEA DX,MR4
    MOV AH,9
    INT 21H
    LEA DX,MR5  
    MOV AH,9
    INT 21H
    LEA DX,MR5
    MOV AH,9
    INT 21H   
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    CMP BL,1
    JE SIXTY
    CMP BL,2
    JE EIGHTY
    CMP BL,3
    JE EIGHTY 
    CMP BL,4
    JE FOURTY
    CMP BL,5
    JE FIFTY
    CMP BL,6
    JE SEVENTY
    CMP BL,7
    JE SIXTY
    CMP BL,8
    JE SIXTY 
    CMP BL,9
    JE SIXTY
   FOURTY1:
    MOV BL,4
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL
	ADD TOT,AX
    AAM 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,'0'
    INT 21H
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H
    LEA DX,M2
    MOV AH,9
    INT 21H     
    MOV AH,1
    INT 21H
    SUB AL,48
    CMP AL,1
    JE TOP
    JMP EXIT
  FIFTY1:
    MOV BL,4
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL
	ADD TOT,AX
    AAM 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,'0'
    INT 21H 
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H
    LEA DX,M2
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48   
    CMP AL,1
    JE TOP
    JMP EXIT
   SIXTY1: 
    MOV BL,6
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL
	ADD TOT,AX
    AAM 
   MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,'0'
    INT 21H 
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H     
    LEA DX,M2
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    CMP AL,1
    JE TOP
    JMP EXIT 
   SEVENTY1:
    MOV BL,7
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL
	ADD TOT,AX
    AAM 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,'0'
    INT 21H 
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H
    LEA DX,M2
    MOV AH,9
    INT 21H  
    MOV AH,1
    INT 21H
    SUB AL,48
    CMP AL,1
    JE TOP
    JMP EXIT
   EIGHTY1:
    MOV BL,8
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL
	ADD TOT,AX
    AAM 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,'0'
    INT 21H
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H
    LEA DX,M2   
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    CMP AL,1
    JE TOP
    JMP EXIT
    JMP EXIT
  Chocolates:
    LEA DX,M8
    MOV AH,9    
    INT 21H
    LEA DX,SEJ 
    MOV AH,9
    INT 21H
    LEA DX,MR7
    MOV AH,9
    INT 21H
    LEA DX,MR7
    MOV AH,9
    INT 21H
    LEA DX,MR6
    MOV AH,9
    INT 21H
    LEA DX,M41 
    MOV AH,9
    INT 21H
    LEA DX,M42 
    MOV AH,9
    INT 21H
    LEA DX,M43 
    MOV AH,9
    INT 21H
    LEA DX,M44 
    MOV AH,9
    INT 21H
    LEA DX,MR6
    MOV AH,9
    INT 21H
    LEA DX,MR7
    MOV AH,9
    INT 21H 
    LEA DX,MR7
    MOV AH,9
    INT 21H 
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48
    CMP BL,1
    JE L1
    CMP BL,2
    JE L2
    CMP BL,3
    JE L3
    CMP BL,4
    JE L3
    JMP INVALID
   L1: 
    MOV BL,8
    JMP L4
   L2:
    MOV BL,8
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL
	ADD TOT,AX
    AAM 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,'0'
    INT 21H
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H
    LEA DX,M2
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    CMP AL,1
    JE TOP
    JMP EXIT
   L3:
   MOV BL,5
   JMP L4 
   L4:
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL
	ADD TOT,AX
    AAM 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H
    LEA DX,M2
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    CMP AL,1
    JE TOP
    JMP EXIT
  Cosmetics:
    LEA DX,M8
    MOV AH,9   
    INT 21H
    LEA DX,SEJ 
    MOV AH,9
    INT 21H
    LEA DX,MR7
    MOV AH,9
    INT 21H
    LEA DX,MR7
    MOV AH,9
    INT 21H
    LEA DX,MR6
    MOV AH,9
    INT 21H
    LEA DX,M45            
    MOV AH,9
    INT 21H
    LEA DX,M46            
    MOV AH,9
    INT 21H
    LEA DX,M47            
    MOV AH,9
    INT 21H
    LEA DX,M48            
    MOV AH,9
    INT 21H
    LEA DX,MR6
    MOV AH,9
    INT 21H
    LEA DX,MR7
    MOV AH,9
    INT 21H
    LEA DX,MR7
    MOV AH,9
    INT 21H
    LEA DX,M57              
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48
    CMP BL,4
    JG INVALID
    LEA DX,M58              
    MOV AH,9
    INT 21H 
    XOR BL,BL
    MOV BL,5
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL
	ADD TOT,AX
    AAM 
    MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,'0'
    INT 21H
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H
    LEA DX,M2
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,48
    CMP AL,1
    JE TOP
    JMP EXIT
   DRINKS:  
    LEA DX,M8
    MOV AH,9           
    INT 21H
    LEA DX,SEJ
    MOV AH,9
    INT 21H
    LEA DX,MR7
    MOV AH,9
    INT 21H
    LEA DX,MR7
    MOV AH,9
    INT 21H
    LEA DX,MR6
    MOV AH,9
    INT 21H
    LEA DX,M49          
    MOV AH,9
    INT 21H
    LEA DX,M50          
    MOV AH,9
    INT 21H
    LEA DX,M51          
    MOV AH,9
    INT 21H
    LEA DX,M52          
    MOV AH,9
    INT 21H
    LEA DX,M53          
    MOV AH,9
    INT 21H
    LEA DX,M54          
    MOV AH,9
    INT 21H
    LEA DX,MR6
    MOV AH,9
    INT 21H
    LEA DX,MR7
    MOV AH,9
    INT 21H
    LEA DX,MR7
    MOV AH,9
    INT 21H
    LEA DX,M57              
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48 
    CMP BL,1
    JE SOFTDRINK
    CMP BL,2
    JE LASCHI
    CMP BL,3
    JE BORHANI
    CMP BL,4
    JE LABANG
    CMP BL,5
    JE COFFEE
    CMP BL,6
    JE TEA 
    JMP INVALID
   SOFTDRINK:
    MOV BL,8
    JMP COMMON
   LASCHI:
    MOV BL,6
    JMP COMMON
   BORHANI:
    MOV BL,9
    JMP COMMON
   LABANG:
    MOV BL,9
    JMP COMMON
   COFFEE:
    MOV BL,7
    JMP COMMON
   TEA:
    MOV BL,5
    JMP COMMON
   COMMON: 
    LEA DX,M58              
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,48
    MUL BL 
	ADD TOT,AX
    AAM 
	MOV CX,AX 
    ADD CH,48
    ADD CL,48
    LEA DX,M59              
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H 
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    LEA DX,M60
    MOV AH,9
    INT 21H
    LEA DX,M61
    MOV AH,9
    INT 21H
    LEA DX,M2
    MOV AH,9
    INT 21H 
    MOV AH,1
    INT 21H
    SUB AL,48
    CMP AL,1
    JE TOP
    JMP EXIT:
   INVALID:
    LEA DX,M55
    MOV AH,9
    INT 21H 
    LEA DX,M56 
    MOV AH,9
    INT 21H 
    JMP top 
     EXIT:
	LEA DX,M62              
    MOV AH,9
    INT 21H
    lea si,st
    MOV AX,TOT
    mov cx,0 
    mov dx,0 
    LABEL1: 
        CMP AX,0 
        JE PRINT1       
        MOV BX,10         
        DIV BX                   
        PUSH DX               
        INC CX               
        XOR DX,DX 
        JMP LABEL1 
    PRINT1: 
        CMP CX,0 
        JE EXIT1
        POP DX 
        ADD DX,48
        mov [si],dx
        inc si
        inc n 
        MOV AH,02H 
        INT 21H 
        DEC CX 
        JMP PRINT1 
EXIT1: 
    MOV DL,'0'
    INT 21H
    MOV DL,47
    INT 21H
    MOV DL,45
    INT 21H
    









    mov [si],'0'
    inc si
    add n,1
    
    MOV [SI],09H
    INC SI
    ADD N,1
     
   ; MOV AH,4CH
    ;INT 21H 
    
    




lea si,st
mov cx,4
l1x:


mov	ax,3d02h
lea	dx,filename
int	21h
;jc	error
mov	handle,ax



mov bx, ax
mov ah, 42h  ; "lseek"
mov al, 2    ; position relative to end of file
mov cx, 0    ; offset MSW
mov dx, 0    ; offset LSW
int 21h

mov	ah,40h   ; write string to file
mov	bx,handle
mov	cx,N
lea	dx,[si]
int	21h
;jc	error
           

           
mov	ah,3eh
mov	bx,handle
int	21h


inc si
dec cx 
cmp cx,0
jc l1x


mov AH,2Ah
INT 21h 
lea si,da
;add dl,30h
;mov [si],09h
;inc si
mov [si],31h 
inc si     
mov [si],34h
inc si
mov [si],2fh
inc si     
add dh,30h
mov [si],dh
inc si
mov [si],2fh
inc si
MOV AX,cx
   mov cx,0 
    mov dx,0 
    LABELA1: 
        CMP AX,0 
        JE PRINTA1       
        MOV BX,10         
        DIV BX                   
        PUSH DX               
        INC CX               
      XOR DX,DX 
       JMP LABELA1 
      printA1:    
        CMP CX,0 
        JE EXITA1
        POP DX
         ADD DX,48
         mov [si],dx
      ;   inc n,1
       ; MOV AH,02H 
        ;INT 21H 
        DEC CX
        inc si 
        JMP printA1 
EXITA1:
MOV [SI],09H
INC SI
    
lea si,da
mov cx,9
lA1:


mov	ax,3d02h
lea	dx,filename
int	21h
;jc	error
mov	handle,ax



mov bx, ax
mov ah, 42h  ; "lseek"
mov al, 2    ; position relative to end of file
mov cx, 0    ; offset MSW
mov dx, 0    ; offset LSW
int 21h

mov	ah,40h   ; write string to file
mov	bx,handle
mov	cx,9
lea	dx,[si]
int	21h
;jc	error
           

           
mov	ah,3eh
mov	bx,handle
int	21h


inc si
dec cx 
cmp cx,0
jc lA1


    
 .exit
; MAIN ENDP
END MAIN 
