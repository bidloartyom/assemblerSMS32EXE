clo
jmp start
db 1 ; w komorkie 03 mamy wartosc 1
db 4 ; w komorkie 04 mamy wartosc 4
db 7 ; w komorkie 05 mamy wartosc 7
db FF ; wartosc-"stop" w komorkie 06 mamy -1
start:

mov bl, 3 ; dodajemy bl 3 bo to adres do komorki 03

loop:

mov al, [bl] ; al = wartosci w adresie bl
cmp al,FF ; porownujemy al z -1 bo to jest wartosc-stop
pushf ; dodajemy tego flaga na stos 
call 70 ; skok do org 70
mov [d0], al ; na wyswitlacz VDU wartosc al
inc bl ; dodajemy bl 1 zeby mielismy wartosc 4

popf ; dostajemy flag

jnz loop ; jesli nie rowno -1 to skok w loop
jmp end_lab ; jesli rowno -1 to koniec programu

org 70
pushf ; dodajemy flag na stos 
add al, 30 ; dodajemy 30 zeby z tablicy ascii wyswietlic cyfre
popf ; dostajemy flag
ret ; zwraca na mov [d0], al 

end_lab:
end