--Operadores IS NULL e IS NOT NULL

--Como o NULL � um tipo de dado especial, ele n�o pode ser utilizado em uma compara��o. Ou seja, 
--para obter os registros com valores nulos, n�o � poss�vel realizar a consulta abaixo:
SELECT * FROM aluno WHERE RG = NULL;

--Assim, o SQL tamb�m introduziu o operador IS NULL. Com ele � poss�vel verificar se o campo possui valores NULL.
 --Veja o exemplo:
 SELECT * FROM aluno WHERE RG IS NULL;
--A consulta acima, ir� retornar todos os registros cujo o campo RG possua o valor NULL.

--O operador IS NOT NULL realiza o filtro contr�rio, trazendo apenas os registros que N�O s�o NULL. 
--Por exemplo:
SELECT * FROM aluno WHERE RG IS NOT NULL;

