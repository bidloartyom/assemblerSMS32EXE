mov al, 0B ; al = 11

test:

sub al,2 ; al - 2 = 9
cmp al,ff ; 9 ?= -1 ff = -1 
jz end_label

jmp test

end_label:
end
