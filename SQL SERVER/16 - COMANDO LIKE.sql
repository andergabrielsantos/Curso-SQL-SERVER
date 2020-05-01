--COMANDO LIKE
/*
O operador LIKE � outro operador que pode ser utilizado com o comando WHERE, mas, diferente dos 
operadores que vimos anteriormente, este s� pode ser utilizado em cadeias de caracteres(string).
*/
--Com ele � poss�vel verificar se a cadeia de caracteres (string) corresponde a um padr�o especificado. 
--Para definir este padr�o, pode ser utilizado uma s�rie de caracteres curinga, listados da tabela abaixo:
/*
CARACTERE               DESCRI��O

_(SUBLINHADO)           � v�lido para qualquer caractere nessa posi��o.

%                       Qualquer cadeia de zero ou mais caracteres 

[]                      Possibilita especificar um padr�o para um caractere �nico, exemplo [a-f], [0-9], [A-Z] 

[^]                     Caractere �nico que n�o perten�a ao padr�o especificado.                  	

*/