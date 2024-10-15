mov al, 5
mov bl, 4

petla:
push bl ; вносим в стос бл
and bl, 1 ; если бл = 1 то 1, если бл не 1, то 0
pop bl; достаем из стос бл
jnz koniec ; если бл не 1 то конец
add cl,al ; цл+ал
shr al ; отправляем биты вправо 
shr bl ; отправляем биты вправо 

cmp bl,0 ; сравниваем 
jnz petla ; если бл не 0 то в петлю прыжок

koniec:
end