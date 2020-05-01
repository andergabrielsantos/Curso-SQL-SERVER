--COMANDO LIKE
/*
O operador LIKE é outro operador que pode ser utilizado com o comando WHERE, mas, diferente dos 
operadores que vimos anteriormente, este só pode ser utilizado em cadeias de caracteres(string).
*/
--Com ele é possível verificar se a cadeia de caracteres (string) corresponde a um padrão especificado. 
--Para definir este padrão, pode ser utilizado uma série de caracteres curinga, listados da tabela abaixo:
/*
CARACTERE               DESCRIÇÃO

_(SUBLINHADO)           É válido para qualquer caractere nessa posição.

%                       Qualquer cadeia de zero ou mais caracteres 

[]                      Possibilita especificar um padrão para um caractere único, exemplo [a-f], [0-9], [A-Z] 

[^]                     Caractere único que não pertença ao padrão especificado.                  	

*/