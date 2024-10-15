;Jak dziala?
;Wpisz 1 liczbe - po zakonczeniu nacisnij ENTER
;Wpisz 2 liczbe - po zakonczeniu nacisnij ENTER
;Program obliczy odejmowanie i wyswietli je na wyswietlaczu.
;W opisie operuje caly czas na wartosciach w systemie szesnastkowym (HEX)

			;=========================================================			;Wyczyszczenie pamieci programu
MOV CL,C1		;Przypisanie C1 do CL - 2 miejsce od poczatku na wyswietlaczu
			;=========================================================
WPISZ:			;Petla WPISZ
CMP CL,CB		;Sprawdzenie czy wpisane zostalo wiecej niz 10 liczb
JZ CZERWONE		;Jezeli tak - skok do petli CZERWONE
IN 00			;Wczytanie znaku z klawiatury
CMP AL,0D		;Sprawdzenie czy nacisniety klawisz to ENTER
JZ KROK			;Jezeli tak - skok do petli KROK
MOV [CL],AL		;Wyswietlenie AL na wyswietlaczu
INC CL			;Zwiekszenie CL o 1
JMP WPISZ		;Skok do petli WPISZ		;=========================================================
KROK:		;Petla KROK
MOV CL,D1		;Przypisanie D1 do CL		;=========================================================
WPISZ2:			;Petla WPISZ2
CMP CL,DB		;Sprawdzenie czy wpisane zostalo wiecej niz 10 liczb
JZ CZERWONE	;Jezeli tak - skok do petli CZERWONE
IN 00			;Wczytanie znaku z klawiatury
CMP AL,0D		;Sprawdzenie czy nacisniety klawisz to ENTER
JZ KROK2	;Jezeli tak - skok do petli KROK2
MOV [CL],AL		;Wyswietlenie AL na wyswietlacz
SUB CL,10		;Odjecie 10 od CL
MOV BL,[CL]		;Wczytanie BL z komorki CL
CMP AL,40		;Sprawdzenie czy wczytana liczba jest mniejsza od A
JNS ODEJMIJ1		;Jezeli nie - skok do petli ODEJMIJ1
POWROT1:		;
CMP BL,40		;Sprawdzenie czy wczytana liczba jest mniejsza od A
JNS ODEJMIJ2	;Jezeli nie - skok do petli ODEJMIJ2
POWROT2:		;
SUB BL,AL		;Odjecie BL od AL
ADD CL,20		;Dodanie 20 do CL
MOV [CL],BL		;Wyswietlenie BL na wyswietlaczu
SUB CL,10		;Odjecie 10 od CL
INC CL			;Zwiekszenie CL o 1
JMP WPISZ2		;Skok do petli WPISZ2
			;=========================================================
CZERWONE:		;Petla CZERWONE
MOV AL,90		;Przypisanie 90 do AL
OUT 01			;Wyswietlenie czerwonego swiatla
JMP KONIEC		;Skok do petli KONIEC
			;=========================================================
ODEJMIJ1:		;Petla ODEJMIJ1
SUB AL,7		;Odjecie 7 od AL
JMP POWROT1		;Skok do petli POWROT1
			;=========================================================
ODEJMIJ2:		;Petla ODEJMIJ2
SUB BL,7		;Odjecie 7 od BL
JMP POWROT2		;Skok do petli POWROT2
			;=========================================================
KROK2:			;Petla KROK2
ADD CL,F		;Dodanie F do CL
WYPISZ:			;Petla WYPISZ
MOV AL,[CL]		;Przypisanie danych z komorki CL do AL
CMP AL,20		;Sprawdzenie czy AL to spacja
JZ KONIEC		;Jezeli tak - skok do petli KONIEC
CMP AL,0		;Sprawdzenie czy AL jest mniejsze od 0
JS DALEJ		;Jezeli tak - skok do petli DALEJ
CMP AL,A		;Sprawdzenie czy AL jest mniejsze od A
JS WYPISZ1		;Jezeli tak - skok do petli WYPISZ1
CMP AL,10		;Sprawdzenie czy AL jest mniejsze od 10
JS WYPISZ2		;Jezeli tak - skok do petli WYPISZ2
DALEJ:			;Petla DALEJ
ADD AL,10		;Dodanie 10 do AL
MOV [CL],AL		;Wyswietlenie AL na wyswietlaczu w adresie CL
JMP WPISZ3		;Skok do petli WYPISZ3
POWROT3:		;
JMP WYPISZ		;Skok do petli WYPISZ
			;=========================================================
WYPISZ1:		;Petla WYPISZ1
ADD AL,30		;Dodanie 30 do AL
MOV [CL],AL		;Wyswietlenie AL na wyswietlaczu w adresie CL
DEC CL			;Zmniejszenie CL o 1
JMP WYPISZ		;Skok do petli WYPISZ
			;=========================================================
WYPISZ2:		;Petla WYPISZ2
ADD AL,37		;Dodanie 37 do AL
MOV [CL],AL		;Wyswietlenie AL na wyswietlaczu w adresie CL
DEC CL			;Zmniejszenie CL o 1
JMP WYPISZ		;Skok do petli WYPISZ
			;=========================================================
WPISZ3:			;Petla WYPISZ3
DEC CL			;Zmniejszenie CL o 1
MOV BL,[CL]		;Przypisanie do BL danych z adresu CL
CMP BL,20		;Sprawdzenie czy BL to spacja
JZ CZERWONE		;Jezeli tak - skok do petli CZERWONE
DEC BL			;Zmniejszenie BL o 1
MOV [CL],BL		;Wyswietlenie BL na wyswietlaczu w adresie CL
INC CL			;Zwiekszenie CL o 1
JMP POWROT3		;Skok do petli POWROT3
			;=========================================================
KONIEC:			;
end			;Zakonczenie programu
			;=========================================================