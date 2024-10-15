mov al, ff ; odczysczenie snake and maze
mov bl, 1 ; 1 raz
call 90 ; skok do org

mov al,4a ; 4 znaczy do dolu 
mov bl, 10 ; 10 raz chodzi
call 90; skok

mov al, 1a ; 1 znaczy do prawej strony
mov bl, 4 ; 4 razy do prawej
call 90 ; skok 

mov al, 8f ; 8 znaczy do gory 
mov bl, 5 ; 5 raz
call 90 ; skok
; i tak dalej
mov al, 1a
mov bl, 4
call 90

mov al, 4f
mov bl, 5
call 90

mov al, 1a
mov bl, 4
call 90

mov al, 8f
mov bl, 8
call 90

mov al, 2a ; 2 znaczy do lewej strony 
mov bl, 7
call 90

mov al, 8f
mov bl, 2
call 90

mov al,1f
mov bl, 7
call 90

mov al, 4f
mov bl, 10
call 90

org 90
petla:

out 04 ; wyprowadzenie do snake and maze
dec bl ; odejmujemy bl 1 bo minus jeden krop
cmp bl, 0 ; porownujemy czyli juz nie ma kropow 
jnz petla ; jesli mamy jeszcze kropy to skok do petli
ret ; zwraca

end
