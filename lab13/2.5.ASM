mov al, 5
mov bl, 4

petla:
push bl ; ������ � ���� ��
and bl, 1 ; ���� �� = 1 �� 1, ���� �� �� 1, �� 0
pop bl; ������� �� ���� ��
jnz koniec ; ���� �� �� 1 �� �����
add cl,al ; ��+��
shr al ; ���������� ���� ������ 
shr bl ; ���������� ���� ������ 

cmp bl,0 ; ���������� 
jnz petla ; ���� �� �� 0 �� � ����� ������

koniec:
end