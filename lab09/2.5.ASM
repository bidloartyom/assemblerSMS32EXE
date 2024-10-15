start:

mov al, 8; 1000 w bitach
out 05 ; do motoru

mov al, 4; 0100 w bitach
out 05; do motoru

mov al, 2; 0010 w bitach
out 05; do motoru

mov al, 1; 0001 w bitach
out 05; do motoru

jmp start ; nieskonczona petla

end