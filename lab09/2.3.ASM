start:
mov al, 0
check:
OUT 03
IN 03 ; Input from Port 03
cmp al, 1 ; porownujemy czy wlaczany termostat, bo ma wartosc 0000 0001 - 1

JnZ Cold ; jesli nie wlaczany termostat to skok w petle cold
jz hot ; jesli wlaczany termostat to skok w hot
 
Cold:
MOV AL,81 ; 1000 0001
OUT 03 ; wyprowadzenie w bitach
jmp check; skok w check zeby sprawdzic

hot:
mov al, 00 ; 0000 0000
out 03; wyprowadzenie w bitach
jmp check  ; skok w check zeby sprawdzic

END