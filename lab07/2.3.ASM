mov al, 0 ; al = 0 

test:

cmp al, 47 ; hex 47 = dec 71 
jz end_label ; al = 47 to jump do end_label

add al,1 ; al + 1 

jmp test

end_label:

end