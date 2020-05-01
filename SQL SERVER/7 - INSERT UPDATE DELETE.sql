--INSERINDO DADOS
/*
O primeiro recurso de manipulação de dados que veremos é o INSERT INTO que permite a inserção 
de dados em uma tabela. Sua sintaxe básica é:
*/
INSERT INTO nome_tabela (coluna1,coluna2,coluna3,... colunaN)
VALUES (valor1,valor2,valor3,...valorN);

--UPDATE
--O comando usado para atualizar os registros de uma tabela no SQL é o UPDATE. A sintaxe básica dele é:
UPDATE nome_tabela SET nome_campo1 = valor1, nome_campo2 = valor2 ... nome_campoN = valorN

/*
Ao executar o comando update conforme acima, todos os registros da tabela serão atualizados podendo 
causar um desastre no seu banco de dados. Sempre que for executar o comando UPDATE é importante usar 
a cláusula WHERE para indicar quais registros devem ser atualizados:
*/
UPDATE nome_tabela SET nome_campo1 = valor1, nome_campo2 = valor2 ... nome_campoN = valorN WHERE condicao;

--DELETE
--Para excluirmos registros, devemos passar o nome da tabela e a condição dos registros que deseja excluir. Veja a sintaxe:
DELETE FROM nome_tabela WHERE condição;

/*
Assim como o comando UPDATE, é importante que sempre que for usar o comando DELETE fique atento ao uso da 
cláusula WHERE, para não excluir todos os registros de sua tabela.
*/