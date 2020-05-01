/*
Quando uma função de agregação é aplicada a uma consulta com mais de uma coluna,
 nós precisaremos ter uma maneira de indicar ao SQL Server como ele poderá fazer o 
 agrupamento dos dados para a aplicação da função de agregação. Essa indicação é 
 feita com a cláusula GROUP BY.
*/
--POR EXEMPLO
SELECT codinst, COUNT(*) FROM aula

/*
O SQL acima exige o uso do GROUP BY. Este comando agrupa o resultado da consulta a partir 
de uma coluna ou conjunto de colunas, que não estão fazendo uso da função de agregação.
*/

--Nossa consulta, na verdade, deveria ser escrita da seguinte maneira:
SELECT codinst, COUNT(*) FROM aula GROUP BY codinst