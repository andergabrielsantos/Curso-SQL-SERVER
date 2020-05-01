/*
Quando uma fun��o de agrega��o � aplicada a uma consulta com mais de uma coluna,
 n�s precisaremos ter uma maneira de indicar ao SQL Server como ele poder� fazer o 
 agrupamento dos dados para a aplica��o da fun��o de agrega��o. Essa indica��o � 
 feita com a cl�usula GROUP BY.
*/
--POR EXEMPLO
SELECT codinst, COUNT(*) FROM aula

/*
O SQL acima exige o uso do GROUP BY. Este comando agrupa o resultado da consulta a partir 
de uma coluna ou conjunto de colunas, que n�o est�o fazendo uso da fun��o de agrega��o.
*/

--Nossa consulta, na verdade, deveria ser escrita da seguinte maneira:
SELECT codinst, COUNT(*) FROM aula GROUP BY codinst