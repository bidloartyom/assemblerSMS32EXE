clo
jmp start
db 0; znak stop
db 48 ; te wartosci sa hello z tablicy ascii
db 45
db 4c
db 4c
db 4F
db 0 ; stop znak
start:
mov dl,c0 ; dodajemy adres c0
mov bl, 08 ; dodajemy adres 03 

loop:

mov al, [bl] ; dodajemy al wartosc w adresie bl
cmp al, 0 ; porownojemy ze znakiem stop
pushf ; dodajemy flag na stos
call 70; skok na procedure 70
dec bl ; odejmujemy bl 1 zeby odczywal odwrotnie

popf; dostajemy flag

jnz loop; jesli nie 0 to skok w loop
jmp end_lab ; jesli 0 to skok w koniec

org 70
pushf ; dodajemy flag na stos
mov [dl],al ; wyswitlamy w adresie dl wartosc al
inc dl ; dodajemy dl 1 zeby byla nastepna komorka
popf; dostajemy flag
ret ; zwraca na inc bl

end_lab:
end