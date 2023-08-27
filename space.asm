title space invaders
.model small
.stack 100H
.386
data segment use16
	cnt 	db 0
	; hero variables
	hero_x 	dw 50
	hero_y 	dw 50
	
	; shots projectile from the user
	shots	dw 100 DUP(0)
	shots_cnt dw 0
	
	;                                01234567
	ships_models	  			db 	'   xx   ';0 numero 0
								db	'   xx   ';1
								db	'  xxxx  ';2
								db	'x  xx  x';3 modelo da nave
								db	'x  xx  x';4
								db	'x xxxx x';5
								db	'xxxxxxxx';6
								db	' xxxxxx ';7
	;                    			 01234567
								db 	'   xx   ';0 numero 1
								db	'  xxxx  ';1
								db	' xxxxxx ';2
								db	'xx xx xx';3
								db	'xxxxxxxx';4
								db	'  x  x  ';5
								db	' x xx x ';6
								db	'x x  x x';7
	;                    			 01234567
								db 	'  x  x  ';0 numero 2
								db	'x  xx  x';1
								db	'x xxxx x';2
								db	'xx xx xx';3
								db	'xxxxxxxx';4
								db	' xxxxxx ';5
								db	'  x  x  ';6
								db	' x    x ';7
				;                    01234567
								db 	'   xx   ';0 numero 3
								db	' xxxxxx ';1
								db	'xx xx xx';2
								db	'xxxxxxxx';3
								db	'xxxxxxxx';4
								db	' x xx x ';5
								db	' x xx x ';6
								db	'x x  x x';7	

								DB 	'xxxxxxxx';0 numero 4
								DB	'xxxxxxxx';1
								DB	'xxxxxxxx';2
								DB	'xxxxxxxx';3
								DB	'xxxxx   ';4
								DB	'xxx     ';5
								DB	'xx      ';6
								DB	'xx      ';7
								
								DB 	'xxxxxxxx';0 numero 5
								DB	'xxxxxxxx';1
								DB	'xxxxxxxx';2
								DB	'xxxxxxxx';3
								DB	'   xxxxx';4
								DB	'     xxx';5
								DB	'      xx';6
								DB	'      xx';7
								
								DB 	'xxxxxxxx';0 numero 6
								DB	' xx x x ';1
								DB	'xx x x x';2
								DB	'x  xxx x';3
								DB	'xx x    ';4
								DB	'x x     ';5
								DB	' x      ';6
								DB	'xx      ';7
								
								DB 	'xxxxxxxx';0 numero 7
								DB	' x x xx ';1
								DB	'x x xx x';2
								DB	'xx xx  x';3
								DB	'    xxx ';4
								DB	'     x x';5
								DB	'      x ';6
								DB	'      xx';7
								
								DB 	'        ';0 numero 8
								DB	'        ';1
								DB	'  x   x ';2
								DB	' xxx xxx';3
								DB	' xxxxxxx';4
								DB	'  xxxxx ';5
								DB	'   xxx  ';6
								DB	'    x   ';7
								
						

								
	ships_models_len equ $-ships_models
	
	; 0 - isdead
	; 1 - the index of the model (1 index based)
	; 2 - x coord
	; 3 - y coord
	ships				DW 0,1,85,45 ,0,1,98,45 ,0,1,111,45 ,0,1,124,45 ,0,1,137,45 ,0,1,150,45 ,0,1,163,45 ,0,1,176,45 ,0,1,189,45 ,0,1,202,45 ,0,1,215,45
						DW 0,2,85,58 ,0,2,98,58 ,0,2,111,58 ,0,2,124,58 ,0,2,137,58 ,0,2,150,58 ,0,2,163,58 ,0,2,176,58 ,0,2,189,58 ,0,2,202,58 ,0,2,215,58
						DW 0,2,85,71 ,0,2,98,71 ,0,2,111,71 ,0,2,124,71 ,0,2,137,71 ,0,2,150,71 ,0,2,163,71 ,0,2,176,71 ,0,2,189,71 ,0,2,202,71 ,0,2,215,71
						DW 0,3,85,84 ,0,3,98,84 ,0,3,111,84 ,0,3,124,84 ,0,3,137,84 ,0,3,150,84 ,0,3,163,84 ,0,3,176,84 ,0,3,189,84 ,0,3,202,84 ,0,3,215,84
						DW 0,3,85,97 ,0,3,98,97 ,0,3,111,97 ,0,3,124,97 ,0,3,137,97 ,0,3,150,97 ,0,3,163,97 ,0,3,176,97 ,0,3,189,97 ,0,3,202,97 ,0,3,215,97
						DW 0,6,70,160,0,7,78,160	,0,6,120,160,0,7,128,160,	0,6,172,160,0,7,180,160,	0,6,222,160,0,7,230,160
					    DW 0,4,70,161,0,5,78,161	,0,4,120,161,0,5,128,161,	0,4,172,161,0,5,180,161,	0,4,222,161,0,5,230,161
						DW 0,8,260,20, 0,8,270,20, 0,8,280,20
						
	ships_cnt dw 74
	
	END_MSG1 db 01h," YOU WIN "
	END_MSG1_LEN equ $-END_MSG1
	END_MSG1_CENTER equ 20 - (END_MSG1_LEN/2)
	
	END_MSG2 db " Deseja jogar novamente "
	END_MSG2_LEN equ $-END_MSG2
	END_MSG2_CENTER equ 20 - (END_MSG2_LEN/2)
	
	START_MSG1 db 0FH," Pronto?  ",0FH
	START_MSG1_LEN equ $-START_MSG1
	START_MSG1_CENTER equ 20 - (START_MSG1_LEN/2)
	
	START_MSG1b db 0FH," Space Invaders ",0FH
	START_MSG1b_LEN equ $-START_MSG1b
	START_MSG1b_CENTER equ 20 - (START_MSG1b_LEN/2)
	
	START_MSG2 db " Click para comecar"
	START_MSG2_LEN equ $-START_MSG2
	START_MSG2_CENTER equ 20 - (START_MSG2_LEN/2)
	
	START_MSG3 db " Richard "
	START_MSG3_LEN equ $-START_MSG3
	START_MSG3_CENTER equ 20 - (START_MSG3_LEN/2)
	
data ends
code segment use16
	assume cs:code, ds:data
	
start:	
	; init ds
	mov ax, data
	mov ds, ax
	mov es, ax

	; go graphic
	;DEFINE O TAMANHO DA TELA
	MOV AH, 0
	MOV AL, 19
	INT 10H	
	
	; present welcome message :)
	
	mov ax, 1300h
	mov bx, 02h
	mov dh, 2 ;row
	mov dl, START_MSG1_CENTER ; column
	mov cx, START_MSG1_LEN
	lea bp, START_MSG1
	int 10h
	
	mov ax, 1300h
	mov bx, 04h
	mov dh, 11 ;row
	mov dl, START_MSG1b_CENTER ; column
	mov cx, START_MSG1b_LEN
	lea bp, START_MSG1b
	int 10h

	
	mov ax, 1300h
	mov bx, 0Fh
	mov dh, 13 ;row
	
	lea dx, START_MSG2
	int 21h
	
	mov ax, 1300h
	mov bx, 0Fh
	mov dh, 18 ;row
	mov dl, START_MSG3_CENTER ; column
	mov cx, START_MSG3_LEN
	lea bp, START_MSG3
	int 10h

	; press any key :)
	mov ah, 07h
	int 21h
	
	
	; process the models
	; ' ' ==> 0
	; 0 - BLACK    4 - RED	    8 - DARKGRAY    C - LIGHTRED
	; 1 - BLUE     5 - MAGENTA    9 - LIGHTBLUE   D - LIGHTMAGENTA
	; 2 - GREEN    6 - BROWN	    A - LIGHTGREEN  E - YELLOW
	; 3 - CYAN     7 - LIGHTGRAY  B - LIGHTCYAN   F - WHITE

	; init video
	mov ax, 0A000h
	mov es, ax
	xor cx, cx
	lea di, ships_models
	process_models:
		cmp BYTE PTR [di], ' '
		je pm_blank
		
		cmp cx, 64
		jb pm_hero ; first 64 bytes are for hero!
		
		mov BYTE PTR [di], 2
		jmp pm_inc
		
	pm_hero:
		mov BYTE PTR [di], 2
		jmp pm_inc
	pm_blank:
		mov BYTE PTR [di], 0

	pm_inc:
		inc di
		inc cx
		cmp cx, ships_models_len
		jb process_models
	
	
	; move hero to initial location
	mov hero_x, 160
	mov hero_y, 190
		
				main_loop:
		; wait the frame - vsync
		mov dx, 3DAh
		wait1_: 
			in al,dx
			test al,8
			jz wait1_
		wait2_:
			in al,dx
			test al,8
			jnz wait2_

		; clear the screen
		clear_scr:
			mov ecx, 32000
			xor eax, eax
			xor di, di
			rep stosd

		; ======= drawing ===========

		draw:		
			cmp ships_cnt, 0
			jne draw_non_final
		
		draw_final:
			; show final message :)
			; reset es to data
			mov ax, data
			mov es, ax
			
			mov ax, 1300h
			mov bx, 0Eh
			mov dh, 11 ;row
			mov dl, END_MSG1_CENTER ; column
			mov cx, END_MSG1_LEN
			lea bp, END_MSG1
			int 10h

			mov ax, 1300h
			mov bx, 0Fh
			mov dh, 13 ;row
			mov dl, END_MSG2_CENTER ; column
			mov cx, END_MSG2_LEN
			lea bp, END_MSG2
			int 10h

			; press any key :)
			mov ah, 07h
			int 21h
			
			jmp exit
			
		draw_non_final:
			lea si, ships_models ; index 0 is hero model
			xor cx, cx
			
		draw_hero:
			mov ax, [hero_y]		; hero y position
			mov di, ax				; duplicate position
			shl ax, 8				; multiply by 256
			shl di, 6				; multiply by 64
			add di, ax				; y*64 + y*256 = y*320
			add di, [hero_x]		; add x position
			mov cx, 8				; number of lines
			dh_next:				; here draws a new line
				movsd				; draw 4 pixels
				movsd				; draw 4 pixels
				add di,320-8		; point to next line
				loop dh_next		; continue drawing

		; draw the shot
		draw_shot:
		
			cmp shots_cnt, 0 ; any shots?
			je draw_ships
			
			xor cx, cx
			lea si, shots
			ds_loop:
				push cx
				push si
				
				mov ax, 0C04h
				mov bx, 0h
				mov cx, [si]
				mov dx, [si+2]
				int 10h
				
				; mirror vertically
				mov ax, 0C04h
				inc dx
				int 10h				
				
				; mirror horizontally
				mov ax, 0C04h
				inc cx
				int 10h
				
				mov ax, 0C04h
				dec dx
				int 10h
				
				
				pop si
				pop cx
				
				inc cx
				add si, 4 ; 2 words
				cmp cx, shots_cnt
				jb ds_loop
		
		draw_ships:
			xor cx, cx
			lea bx, ships
		draw_ships_loop:
			cmp WORD PTR [bx], 1 ; is dead?
			je ds_loop_inc
			
			push cx
			
			lea si, ships_models
			; get the model index
			mov ax, [bx+2]
			shl ax, 6 ; 
			add si, ax
			
			mov ax, [bx+6]			; ship y position
			mov di, ax				; duplicate position
			shl ax, 8				; multiply by 256
			shl di, 6				; multiply by 64
			add di, ax				; y*64 + y*256 = y*320
			add di, [bx+4]			; add x position
			mov cx, 8				; number of lines
			dsh_next:				; here draws a new line
				movsd				; draw 4 pixels
				movsd				; draw 4 pixels
				add di,320-8		; point to next line
				loop dsh_next		; continue drawing
			
			; model drawing ended
			pop cx
		ds_loop_inc:
			add bx, 8
			inc cx
			cmp cx, ships_cnt
			jb draw_ships_loop
			
		; ======= update ============
		update:

		update_shot:
			cmp shots_cnt, 0
			je update_ships
			
			lea si, shots
			xor cx, cx
			us_loop:
				
				; decrease shots's y coord
				dec WORD PTR [si+2]
				
				cmp WORD PTR [si+2], 40 ; is y outside coords
				jg us_loop_inc ; >0 => skip this
				
				; remove this shot
				dec shots_cnt
				cmp shots_cnt, 0
				je update_ships ; we have just removed the latest one!
				
				lea di, shots
				mov ax, shots_cnt
				shl ax, 2 ; shots_cnt*4
				
				add di, ax

				mov ax, [di]
				mov [si], ax
				mov ax, [di+2]
				mov [si+2], ax
				
				; clear the old value
				mov WORD PTR [di], 0
				mov WORD PTR [di+2], 0
				
				
				sub si, 4 ; let's process this one again
				dec cx
				
			us_loop_inc:
				add si, 4
				inc cx
				cmp cx, shots_cnt
				jb us_loop
		
		update_ships:
			
			xor cx, cx
			xor ax, ax ; count "undead" ships
			lea si, ships
		update_ships_loop:
			cmp WORD PTR [si], 1 ; is dead?
			je ush_loop_inc
			
			inc ax
			
			; do we have to check collisions?
			cmp shots_cnt, 0
			je ush_loop_inc
			
			; start model check
			push cx
			push ax
			
			lea di, ships_models
			; get the model index
			mov ax, [si+2]
			shl ax, 6 ; index * 64bytes (2^6 = 64)
			add di, ax
			
			xor cx, cx
			ush_model:
				cmp BYTE PTR [di], 0
				je ush_model_inc ; no collision check - blank
				
				; compute the pixel
				mov ax, cx
				mov dx, cx
				shr ax, 3
				and dx, 7 
				
				; get real location
				add dx, WORD PTR [si+4]
				add ax, WORD PTR [si+6]

				push di
				push si
				push cx
				
				xor cx, cx
				lea di, shots
				ush_model_shots:
					mov bx, WORD PTR [di]
					mov si, WORD PTR [di+2]
					
					cmp ax, si
					jne ush_model_shots1
					
					cmp dx, bx
					je ush_model_shots_disable
				
				ush_model_shots1:
					inc bx
					
					cmp ax, si
					jne ush_model_shots2
					
					cmp dx, bx
					je ush_model_shots_disable
				
				 ush_model_shots2:
					 inc si
					
					 cmp ax, si
					 jne ush_model_shots3
					
					 cmp dx, bx
					 je ush_model_shots_disable
					
				ush_model_shots3:
					 dec bx
					
					 cmp ax, si
					 jne ush_model_shots_inc
					
					 cmp dx, bx
					 je ush_model_shots_disable
					
					
					 jmp ush_model_shots_inc
				ush_model_shots_disable:
					; remove the shot, so he won't hit anothers
					dec shots_cnt
					lea si, shots
					mov ax, shots_cnt
					shl ax, 2 ; shots_cnt*4
					
					add si, ax

					mov ax, [si]
					mov [di], ax
					mov ax, [si+2]
					mov [di+2], ax
					
					; clear the old value
					mov WORD PTR [si], 0
					mov WORD PTR [si+2], 0
					
					; done checking. jump out now!
					pop cx
					pop si
					pop di
					
					pop cx ; ush_model
					
					mov WORD PTR [si], 1 ; dead!
					jmp ush_loop_inc
					
				ush_model_shots_inc:
					add di, 4 ; 2 words
					inc cx
					cmp cx, shots_cnt
					jb ush_model_shots
				
				pop cx
				pop si
				pop di
				
			ush_model_inc:
				inc di
				inc cx
				cmp cx, 64
				jb ush_model
				
			
			; model checking ended
			pop ax
			pop cx
		ush_loop_inc:
			add si, 8
			inc cx
			cmp cx, ships_cnt
			jb update_ships_loop
		
			cmp ax, 0 ; did we have at least 1 undead ship?
			jne key_handling
			; nope. then reset ships_cnt
			mov ships_cnt, 0
			
				
		key_handling:
			; check if a key is pressed
			mov ax, 0100h 
			int 16h
			jz main_loop ; no char = no zero
			
			; read now the key for real		
			mov ah, 07h
			int 21h
			
			; get extra key if we have al=0
			cmp al, 0
			jne key_left
			mov ah, 07h
			int 21h
			
			; handle keys
			key_left:
				cmp al, 97d
				jne key_right
				
				cmp hero_x, 50
				je main_loop
				
				dec hero_x
				jmp main_loop
				
			key_right:
				cmp al, 100d
				jne key_up
				
				cmp hero_x, 250
				je main_loop
				
				inc hero_x
				jmp main_loop
				
			key_up: 
				;cmp al, 48H
				;jne key_down
				;dec hero_y
				;jmp main_loop
			
			key_down:
				;cmp al, 50h
				;jne key_space
				;inc hero_y
				;jmp main_loop
			
			; shoot!
			key_space:
				cmp al, 20H
				jne key_x
				
				cmp shots_cnt, 0 ; max 1 shots
				ja key_x
				
				; copy hero's coords
				lea si, shots ; shots + shots_cnt*4
				mov ax, shots_cnt
				mov bx, 4
				mul bx
				add si, ax
				
				mov ax, hero_x
				add ax, 3 ; shift right 3 pixels
				mov [si], ax
				mov ax, hero_y
				dec ax ; shift up 1 pixel
				mov [si+2], ax
				
				inc shots_cnt
				
				jmp main_loop
				
			key_x: ;
				cmp al, 78h ; x key --> exit
				jne main_loop
			
			jmp exit
		
	exit:
		; go text
		mov ax, 0003h
		int 10h
		
		mov ax, 4c00h
		int 21h
code ends
end start