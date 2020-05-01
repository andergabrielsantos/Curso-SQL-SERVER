--Operadores IS NULL e IS NOT NULL

--Como o NULL é um tipo de dado especial, ele não pode ser utilizado em uma comparação. Ou seja, 
--para obter os registros com valores nulos, não é possível realizar a consulta abaixo:
SELECT * FROM aluno WHERE RG = NULL;

--Assim, o SQL também introduziu o operador IS NULL. Com ele é possível verificar se o campo possui valores NULL.
 --Veja o exemplo:
 SELECT * FROM aluno WHERE RG IS NULL;
--A consulta acima, irá retornar todos os registros cujo o campo RG possua o valor NULL.

--O operador IS NOT NULL realiza o filtro contrário, trazendo apenas os registros que NÃO são NULL. 
--Por exemplo:
SELECT * FROM aluno WHERE RG IS NOT NULL;

