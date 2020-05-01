
--DISTINCT
/*Caso uma consulta retorne valores repetidos, podemos utilizar a cl�usula DISTINCT para eliminar 
os registros que forem repetidos.*/

--O DISTINCT deve ser informado ap�s o SELECT, n�o importando quantas colunas forem definidas na consulta:
SELECT DISTINCT modelo, ano FROM carro;

/*
Um detalhe importante � que o distinct ir� eliminar as linhas que estiverem repetidas. 
Se duas linhas possuem praticamente os mesmos valores, mas se diferem por uma coluna, estas linhas n�o 
ser�o consideradas registros repetidos pelo DISTINCT e nenhuma delas ser� eliminada com o uso deste comando.
*/
