
--OPERADORES LOGICOS AND OR
--Os operadores l�gicos testam a express�es e retornam um valor verdadeiro ou falso.

--Operador AND
/*
O operador l�gico AND (E) retorna verdadeiro se as duas express�es passadas para ele 
forem verdadeiras. A sua tabela verdade �:
*/
A           B            A AND B
FALSO       FALSO        FALSO
FALSO       VERDADEIRO   FALSO
VERDADEIRO  FALSO        FALSO
VERDADEIRO  VERDADEIRO   VERDADEIRO
--Note que apenas quando A e B s�o verdadeiros o resultado � verdadeiro.

--Assim, em um exemplo como o abaixo:
SELECT * FROM aula WHERE codinst = 1 AND placa = 'asd0989';
--A consulta s� retornar� dados se o campo codinst for igual a 1 e se o campo placa for igual a �asd0989�.

--OPERADOR OR
/*
O operador OR (OU) retorna verdadeiro quando uma ou as duas express�es s�o verdadeiras. 
Veja a tabela verdade do OR:
*/
A            B           A OR B
FALSO        FALSO       FALSO
FALSO        VERDADEIRO  VERDADEIRO
VERDADEIRO   FALSO       VERDADEIRO
VERDADEIRO   VERDADEIRO  VERDADEIRO
--Note que o operador OR s� retorna falso se ambas as express�es forem Falsas.
--Por exemplo, na consulta abaixo:
SELECT * FROM aluno WHERE nome = 'wagner' OR codalu = 5;
--Ser� retornado os registros cujo nome � �Wagner� OU o codaul � igual a 5

--OPERADOR NOT
--O operador NOT inverte o resultado da express�o. Veja a tabela verdade dele:

A           NOT A
VERDADEIRO  FALSO
FALSO       VERDADEIRO
--Se um valor for verdadeiro vira falso e se for falso vira verdadeiro. Por exemplo:
SELECT * FROM instrutor WHERE NOT codinst = 2;
--A consulta acima, ir� retornar os registros onde codint n�o for 2.












                    
