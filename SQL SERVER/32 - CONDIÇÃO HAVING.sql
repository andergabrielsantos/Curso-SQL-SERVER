/*
O HAVING pode ser usado em conjunto com GROUP BY para definir condições de agrupamento. 
Ele funciona quase como o WHERE, mas não tem todos os recursos deste.

*/
--No HAVING, podemos utilizar os operadores de comparação e lógicos. Por exemplo:
SELECT codinst, COUNT(*) FROM aula GROUP BY codinst HAVING codinst > 5;

--Também podemos informar funções de agregação no HAVING:
SELECT codinst, COUNT(*) FROM aula GROUP BY codinst HAVING COUNT(*) >= 4;