--ORDENA�AO - ORDER BY
/*
Em muitas ocasi�es, � necess�rio exibir os dados de uma consulta j� ordenados para o usu�rio. 
A solu��o desse problema no SQL Server � a cl�usula Order By, que permite ordenar o resultado com 
base em uma ou mais colunas.
*/
--POR EXEMPLO
SELECT nome, email FROM aluno ORDER BY nome ASC;
/*
Acima, estamos ordenando a consulta de modo crescente usando o campo nome como padr�o. Como o campo 
nome � do tipo cadeia de caracteres, o SQL o ordena alfabeticamente, se fosse num�rico ou data ele 
tamb�m ordenaria automaticamente com base no tipo.
*/
--O SQL implementa o Order By com a op��o DESC para que possamos ordenar os dados de forma decrescente.
SELECT nome, email FROM aluno ORDER BY nome DESC;
/*
Por padr�o, no SQL quando o par�metro de ordena��o (ASC ou DESC) n�o � passado, ele considera como 
ordena��o crescente. Assim, o comando abaixo:
*/
SELECT nome, email FROM aluno ORDER BY nome;
--� equivale ao abaixo:
SELECT nome, email FROM aluno ORDER BY nome ASC;
/*
Podemos usar v�rias colunas como fator de ordena��o em uma pesquisa: basta separar o nome de cada uma 
com v�rgula. Veja a sintaxe:
*/
SELECT * FROM tabela ORDER BY coluna1, coluna2 ... colunaN;
/*
Quando for informado mais de uma coluna, o SQL Server ordenar� inicialmente a primeira coluna. Se nela 
houverem dois registros com o mesmo valor, ent�o ele ordenar� esses registros com base na segunda coluna 
e assim por diante.
*/