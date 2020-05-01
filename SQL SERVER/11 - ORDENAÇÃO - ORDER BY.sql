--ORDENAÇAO - ORDER BY
/*
Em muitas ocasiões, é necessário exibir os dados de uma consulta já ordenados para o usuário. 
A solução desse problema no SQL Server é a cláusula Order By, que permite ordenar o resultado com 
base em uma ou mais colunas.
*/
--POR EXEMPLO
SELECT nome, email FROM aluno ORDER BY nome ASC;
/*
Acima, estamos ordenando a consulta de modo crescente usando o campo nome como padrão. Como o campo 
nome é do tipo cadeia de caracteres, o SQL o ordena alfabeticamente, se fosse numérico ou data ele 
também ordenaria automaticamente com base no tipo.
*/
--O SQL implementa o Order By com a opção DESC para que possamos ordenar os dados de forma decrescente.
SELECT nome, email FROM aluno ORDER BY nome DESC;
/*
Por padrão, no SQL quando o parâmetro de ordenação (ASC ou DESC) não é passado, ele considera como 
ordenação crescente. Assim, o comando abaixo:
*/
SELECT nome, email FROM aluno ORDER BY nome;
--É equivale ao abaixo:
SELECT nome, email FROM aluno ORDER BY nome ASC;
/*
Podemos usar várias colunas como fator de ordenação em uma pesquisa: basta separar o nome de cada uma 
com vírgula. Veja a sintaxe:
*/
SELECT * FROM tabela ORDER BY coluna1, coluna2 ... colunaN;
/*
Quando for informado mais de uma coluna, o SQL Server ordenará inicialmente a primeira coluna. Se nela 
houverem dois registros com o mesmo valor, então ele ordenará esses registros com base na segunda coluna 
e assim por diante.
*/