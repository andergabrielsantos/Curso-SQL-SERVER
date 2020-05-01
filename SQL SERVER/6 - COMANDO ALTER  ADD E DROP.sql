--ALTERANDO TABELAS

/*
Ao perceber, após a tabela ter sido criada, que foi cometido um erro ou que as necessidades da aplicação mudaram, 
é possível remover a tabela e criá-la novamente. Porém, esse procedimento não é conveniente quando existem dados 
na tabela ou se a tabela é referenciada por outros objetos do banco de dados (por exemplo, uma restrição de chave 
estrangeira). Para essa finalidade o SQL disponibiliza um conjunto de comandos que realizam modificações em tabelas
 existentes.
*/

--INCLUINDO COLUNAS

--A sintaxe para incluir uma coluna em uma tabela é a seguinte:
ALTER TABLE nome_tabela ADD nome_coluna tipo;

--Por exemplo, para adicionar uma coluna chamada RG na tabela aluno, o comando será:
ALTER TABLE aluno ADD RG char(9);

-- Outro exemplo
ALTER TABLE FUN_FUNCIONARIOS
ADD FUN_CPF CHAR(11)  NOT NULL DEFAULT '-';
------------------------------------------------------------------------------------------
--ALTERANDO COLUNAS

--Podemos alterar o tipo de dados de uma coluna:
ALTER TABLE nome_tabela
ALTER COLUMN nome_coluna tipo;

--Por exemplo, para alterar uma coluna email da tabela aluno de varchar(50) para char(30), o comando será:
ALTER TABLE aluno
ALTER COLUMN email char(30);
-----------------------------------------------------------------------------------------------

--EXCLUINDO COLUNAS

--A exclusão de coluna também é feita com o comando ALTER TABLE. Veja a sintaxe:
ALTER TABLE nome_tabela DROP COLUMN nome_coluna;

--Por exemplo, para excluir a coluna endereço da tabela aluno, o comando será:
ALTER TABLE aluno DROP COLUMN endereco;
-------------------------------------------------------------------------------------------------

--ALTERANDO O NOME DE TABELAS E COLUNAS

--No SQL Server, a alteração do nome de tabelas e colunas é feita através de um objeto especial chamado sp_rename.
--A sintaxe para alteração nome de uma tabela é:
EXEC sp_rename 'nome_antigo', 'novo_nome';

--Por exemplo, para alterar o nome da tabela contas_pagar para contas_a_pagar, o código será:
EXEC sp_rename 'contas_pagar', 'contas_a_pagar';

--O comando sp_rename também permite alterar o nome de colunas. Veja a sintaxe:
EXEC sp_rename 'tabela.nome', 'novo_nome', 'COLUMN';

--Por exemplo, para mudar o nome da coluna fabricacao da tabela carro para ano_fabricacao, o comando será:
EXEC sp_rename 'carro.fabricacao', 'ano_fabricacao', 'COLUMN';
------------------------------------------------------------------------------------------------------

--INCLUSÃO DE RESTRIÇOES

/*
Com o comando ALTER TABLE, é possível criar as restrições UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK E DEFAULT. 
Veja como fica a sintaxe de cada uma:
*/
--UNIQUE RESTRIÇÃO DE COLUNA:
ALTER TABLE tabela ADD UNIQUE (coluna1, coluna2 ... colunaN);

--UNIQUE RESTRIÇÃO DE TABELA:
ALTER TABLE tabela ADD CONSTRAINT nome_restricao UNIQUE (coluna1, coluna2 ... colunaN);

--PRIMARY KEY RESTRIÇÃO DE TABELA:
ALTER TABLE tabela ADD CONSTRAINT nome_restricao PRIMARY KEY (coluna1, coluna2 ... colunaN);

--FOREIGN KEY RESTRIÇÃO DE COLUNA:
ALTER TABLE tabela
ADD FOREIGN KEY (coluna1, coluna2 ... colunaN) REFERENCES tabela(coluna1, coluna2 ... colunaN);

--FOREIGN KEY RESTRIÇÃO DE TABELA:
ALTER TABLE tabela
ADD CONSTRAINT nome_restricao
FOREIGN KEY (coluna1, coluna2 ... colunaN) REFERENCES tabela(coluna1, coluna2 ... colunaN);

--CHECK RESTRIÇÃO DE COLUNA:
ALTER TABLE tabela ADD CHECK (condicao);

--CHECK RESTRIÇÃO DE TABELA:
ALTER TABLE tabela
ADD CONSTRAINT nome_restricao CHECK (condicao);

--DEFAULT:
ALTER TABLE tabela
ALTER CONSTRAINT nomeRestricao DEFAULT 'valor padrão' FOR nomeColuna;

--EXCLUSOES DE RESTRIÇOES

/*
A exclusão de restrições é bem mais simples que a inclusão. Todas as restrições, 
exceto a DEFAULT, são excluídas com o seguinte o comando:
*/
ALTER TABLE tabela DROP CONSTRAINT nome_restricao;

/*Para excluir a restrição, precisamos do seu nome... Por isso, sempre que possível, 
defina as restrições como restrição de tabela.*/

--EXCLUSOES DE TABELAS

/*O comando usado para excluir tabelas no SQL é o DROP TABLE. A sintaxe para excluir uma tabela ou mais 
é muito simples. Veja:*/
DROP TABLE tabela1, tabela2 ... tabelaN;

--Por exemplo, para excluir a tabela dependente, basta executar o comando abaixo:
DROP TABLE dependente;

--Também é possível excluir várias tabelas de uma única vez:
DROP TABLE dependente1, dependente2, dependente3, dependente4;