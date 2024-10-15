mov al, 0
mov bl, 1
; al = 0,1,1,2,3,5,8,13...
start:

push al ; wartosc al w stos

add al, bl; al(0)+bl(1) = al(1) 
 
pop bl ; ze stosa dostajemy wartosc al i przypisujemy go do bl

cmp al, 90
jz end_label

jmp start 

end_label:
end
