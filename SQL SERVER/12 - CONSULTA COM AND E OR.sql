
--OPERADORES LOGICOS AND OR
--Os operadores lógicos testam a expressões e retornam um valor verdadeiro ou falso.

--Operador AND
/*
O operador lógico AND (E) retorna verdadeiro se as duas expressões passadas para ele 
forem verdadeiras. A sua tabela verdade é:
*/
A           B            A AND B
FALSO       FALSO        FALSO
FALSO       VERDADEIRO   FALSO
VERDADEIRO  FALSO        FALSO
VERDADEIRO  VERDADEIRO   VERDADEIRO
--Note que apenas quando A e B são verdadeiros o resultado é verdadeiro.

--Assim, em um exemplo como o abaixo:
SELECT * FROM aula WHERE codinst = 1 AND placa = 'asd0989';
--A consulta só retornará dados se o campo codinst for igual a 1 e se o campo placa for igual a “asd0989”.

--OPERADOR OR
/*
O operador OR (OU) retorna verdadeiro quando uma ou as duas expressões são verdadeiras. 
Veja a tabela verdade do OR:
*/
A            B           A OR B
FALSO        FALSO       FALSO
FALSO        VERDADEIRO  VERDADEIRO
VERDADEIRO   FALSO       VERDADEIRO
VERDADEIRO   VERDADEIRO  VERDADEIRO
--Note que o operador OR só retorna falso se ambas as expressões forem Falsas.
--Por exemplo, na consulta abaixo:
SELECT * FROM aluno WHERE nome = 'wagner' OR codalu = 5;
--Será retornado os registros cujo nome é “Wagner” OU o codaul é igual a 5

--OPERADOR NOT
--O operador NOT inverte o resultado da expressão. Veja a tabela verdade dele:

A           NOT A
VERDADEIRO  FALSO
FALSO       VERDADEIRO
--Se um valor for verdadeiro vira falso e se for falso vira verdadeiro. Por exemplo:
SELECT * FROM instrutor WHERE NOT codinst = 2;
--A consulta acima, irá retornar os registros onde codint não for 2.












                    
