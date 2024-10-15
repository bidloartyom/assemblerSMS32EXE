Start:
MOV AL,84; 1000 0100
OUT 01 ; wyprowadzenie w bitach na traffic lights
mov al, 48; 0100 1000
out 01 ; wyprowadzenie w bitach na traffic lights
mov al, 30; 0011 0000
out 1 ; wyprowadzenie w bitach na traffic lights
jmp start ; repeat

END
