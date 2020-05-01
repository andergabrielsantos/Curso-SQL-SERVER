
--DISTINCT
/*Caso uma consulta retorne valores repetidos, podemos utilizar a cláusula DISTINCT para eliminar 
os registros que forem repetidos.*/

--O DISTINCT deve ser informado após o SELECT, não importando quantas colunas forem definidas na consulta:
SELECT DISTINCT modelo, ano FROM carro;

/*
Um detalhe importante é que o distinct irá eliminar as linhas que estiverem repetidas. 
Se duas linhas possuem praticamente os mesmos valores, mas se diferem por uma coluna, estas linhas não 
serão consideradas registros repetidos pelo DISTINCT e nenhuma delas será eliminada com o uso deste comando.
*/
