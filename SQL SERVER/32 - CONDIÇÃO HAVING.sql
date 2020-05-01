/*
O HAVING pode ser usado em conjunto com GROUP BY para definir condi��es de agrupamento. 
Ele funciona quase como o WHERE, mas n�o tem todos os recursos deste.

*/
--No HAVING, podemos utilizar os operadores de compara��o e l�gicos. Por exemplo:
SELECT codinst, COUNT(*) FROM aula GROUP BY codinst HAVING codinst > 5;

--Tamb�m podemos informar fun��es de agrega��o no HAVING:
SELECT codinst, COUNT(*) FROM aula GROUP BY codinst HAVING COUNT(*) >= 4;