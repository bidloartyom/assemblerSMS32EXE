; ===== Poczatek programu =====

Start:
call 06			; Wywolanie obslugi wejscia klawiatury
call 1D			; Wywolanie funkcji znajdujacej spacje w tekscie
jmp Start		; Powrot do poczatku programu

; =============================

; ===== Funkcja obslugi wejscia klawiatury =====

Org 06

mov bl, 90		; Inicjalizacja indeksu tablicy na 90
Keyboard_Input:
IN 00			
mov [bl], al  		
cmp al, 0D   		; Sprawdzenie, czy wprowadzony znak to Enter
jz End_Of_Getting  	; Jesli tak, zakoncz pobieranie danych
inc bl
cmp bl, BC   		; Sprawdzenie, czy tablica jest pelna
jz End_Of_Program  	; Jesli tak, zakoncz program
jmp Keyboard_Input  	
End_Of_Getting:

ret

; ===============================================

; ===== Funkcja znajdujaca spacje i informujaca o tym =====

org 1D

clo
Finding_Space:
call 3D  		; Wywolanie funkcji odczytujacej ostatni znak z tablicy
cmp bl, 90 		
jz Unsuccessful  	
cmp al, 20  		
jnz Finding_Space  	
mov al, 24  		
out 01     		
jmp Successful
Unsuccessful:  		; Obsluga bladu (czerwony)
mov al, 90   		
out 01      		
ret

Successful:   		; Obsluga poprawnego znalezienia spacji (zielony)
mov cl, C0   		
call 43      		; Wywolanie funkcji odwracajacej tekst

ret

; ==========================================================

; ===== Funkcja odczytujaca ostatni znak z tablicy =====

org 3D

mov al, [bl]  		
dec bl       		
ret

; ======================================================

; ===== Funkcja odwracajaca kolejnosc wyrazow =====

org 43

Flip_Text:

add bl, 2  		
Show_Last_Word:
mov dl, [bl]  		
cmp dl, 0D    		
jz Move_To_Previous_Word  
cmp dl, FF    		
jz Move_To_Previous_Word  
mov [cl], dl  		; Zapisanie znaku do tablicy wynikowej
mov al, FF    		; Wyczyszczenie aktualnego znaku w tablicy oryginalnej
mov [bl], al
inc cl
inc bl
jmp Show_Last_Word  	
Move_To_Previous_Word:  ; Przejscie do poprzedniego wyrazu
call 3D  		; Wywolanie funkcji odczytujacej ostatni znak z tablicy oryginalnej
cmp al, 20  		
jz Skip  		
cmp bl, 90  		
jz Show_Last_Word  	
cmp bl, 90  		
jns Move_To_Previous_Word  

ret

Skip:
dec cl  		
mov al, [cl]  		
inc cl  		
cmp al, 20  		; Sprawdzenie, ostatni znak to spacja
jz Flip_Text  		; Jesli tak, wroc do odwracania tekstu
inc bl  		; Przesuniecie indeksu na nastepny znak w tablicy oryginalnej
jmp Show_Last_Word  	; Powrot do odczytu nastepnego znaku

ret

; ===================================================

End_Of_Program:
end