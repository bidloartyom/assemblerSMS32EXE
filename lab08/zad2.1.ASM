clo ; odczyszczenie pamieci
start:

mov al,3
call 50 ; iteracja pierwsza do org 50

mov al,7; iteracja druga
call 50

org 50 ; procedura

add al,30 ; dodajemy 30 zeby z tablicy ascii bylo 33 i 37
mov [c0],al ; do komorki c0 dodajemy wartosc al 

ret; zwraca na mov al,7
end