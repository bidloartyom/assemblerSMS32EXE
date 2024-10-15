mov al, 0 ; al = 0

test:

add al, 3 ; al + 3 = 3 ( iteracja numer 1 )
cmp al, 42 ; 66 > 63 
; 63 + 3 = 66 > 63
jnz test

end