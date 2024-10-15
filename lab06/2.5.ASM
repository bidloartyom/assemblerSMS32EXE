mov al, 4
mov bl, 4

; 4*4*4 = 64
mul al,bl ; 4*4 = 16 rezultat z mnozenia jest w al
; 
mul al,bl ; 16*4 = 64

end