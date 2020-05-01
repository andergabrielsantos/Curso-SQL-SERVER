--INSERINDO DADOS
/*
O primeiro recurso de manipula��o de dados que veremos � o INSERT INTO que permite a inser��o 
de dados em uma tabela. Sua sintaxe b�sica �:
*/
INSERT INTO nome_tabela (coluna1,coluna2,coluna3,... colunaN)
VALUES (valor1,valor2,valor3,...valorN);

--UPDATE
--O comando usado para atualizar os registros de uma tabela no SQL � o UPDATE. A sintaxe b�sica dele �:
UPDATE nome_tabela SET nome_campo1 = valor1, nome_campo2 = valor2 ... nome_campoN = valorN

/*
Ao executar o comando update conforme acima, todos os registros da tabela ser�o atualizados podendo 
causar um desastre no seu banco de dados. Sempre que for executar o comando UPDATE � importante usar 
a cl�usula WHERE para indicar quais registros devem ser atualizados:
*/
UPDATE nome_tabela SET nome_campo1 = valor1, nome_campo2 = valor2 ... nome_campoN = valorN WHERE condicao;

--DELETE
--Para excluirmos registros, devemos passar o nome da tabela e a condi��o dos registros que deseja excluir. Veja a sintaxe:
DELETE FROM nome_tabela WHERE condi��o;

/*
Assim como o comando UPDATE, � importante que sempre que for usar o comando DELETE fique atento ao uso da 
cl�usula WHERE, para n�o excluir todos os registros de sua tabela.
*/