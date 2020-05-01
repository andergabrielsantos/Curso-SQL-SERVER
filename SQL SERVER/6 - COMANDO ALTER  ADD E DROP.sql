--ALTERANDO TABELAS

/*
Ao perceber, ap�s a tabela ter sido criada, que foi cometido um erro ou que as necessidades da aplica��o mudaram, 
� poss�vel remover a tabela e cri�-la novamente. Por�m, esse procedimento n�o � conveniente quando existem dados 
na tabela ou se a tabela � referenciada por outros objetos do banco de dados (por exemplo, uma restri��o de chave 
estrangeira). Para essa finalidade o SQL disponibiliza um conjunto de comandos que realizam modifica��es em tabelas
 existentes.
*/

--INCLUINDO COLUNAS

--A sintaxe para incluir uma coluna em uma tabela � a seguinte:
ALTER TABLE nome_tabela ADD nome_coluna tipo;

--Por exemplo, para adicionar uma coluna chamada RG na tabela aluno, o comando ser�:
ALTER TABLE aluno ADD RG char(9);

-- Outro exemplo
ALTER TABLE FUN_FUNCIONARIOS
ADD FUN_CPF CHAR(11)  NOT NULL DEFAULT '-';
------------------------------------------------------------------------------------------
--ALTERANDO COLUNAS

--Podemos alterar o tipo de dados de uma coluna:
ALTER TABLE nome_tabela
ALTER COLUMN nome_coluna tipo;

--Por exemplo, para alterar uma coluna email da tabela aluno de varchar(50) para char(30), o comando ser�:
ALTER TABLE aluno
ALTER COLUMN email char(30);
-----------------------------------------------------------------------------------------------

--EXCLUINDO COLUNAS

--A exclus�o de coluna tamb�m � feita com o comando ALTER TABLE. Veja a sintaxe:
ALTER TABLE nome_tabela DROP COLUMN nome_coluna;

--Por exemplo, para excluir a coluna endere�o da tabela aluno, o comando ser�:
ALTER TABLE aluno DROP COLUMN endereco;
-------------------------------------------------------------------------------------------------

--ALTERANDO O NOME DE TABELAS E COLUNAS

--No SQL Server, a altera��o do nome de tabelas e colunas � feita atrav�s de um objeto especial chamado sp_rename.
--A sintaxe para altera��o nome de uma tabela �:
EXEC sp_rename 'nome_antigo', 'novo_nome';

--Por exemplo, para alterar o nome da tabela contas_pagar para contas_a_pagar, o c�digo ser�:
EXEC sp_rename 'contas_pagar', 'contas_a_pagar';

--O comando sp_rename tamb�m permite alterar o nome de colunas. Veja a sintaxe:
EXEC sp_rename 'tabela.nome', 'novo_nome', 'COLUMN';

--Por exemplo, para mudar o nome da coluna fabricacao da tabela carro para ano_fabricacao, o comando ser�:
EXEC sp_rename 'carro.fabricacao', 'ano_fabricacao', 'COLUMN';
------------------------------------------------------------------------------------------------------

--INCLUS�O DE RESTRI�OES

/*
Com o comando ALTER TABLE, � poss�vel criar as restri��es UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK E DEFAULT. 
Veja como fica a sintaxe de cada uma:
*/
--UNIQUE RESTRI��O DE COLUNA:
ALTER TABLE tabela ADD UNIQUE (coluna1, coluna2 ... colunaN);

--UNIQUE RESTRI��O DE TABELA:
ALTER TABLE tabela ADD CONSTRAINT nome_restricao UNIQUE (coluna1, coluna2 ... colunaN);

--PRIMARY KEY RESTRI��O DE TABELA:
ALTER TABLE tabela ADD CONSTRAINT nome_restricao PRIMARY KEY (coluna1, coluna2 ... colunaN);

--FOREIGN KEY RESTRI��O DE COLUNA:
ALTER TABLE tabela
ADD FOREIGN KEY (coluna1, coluna2 ... colunaN) REFERENCES tabela(coluna1, coluna2 ... colunaN);

--FOREIGN KEY RESTRI��O DE TABELA:
ALTER TABLE tabela
ADD CONSTRAINT nome_restricao
FOREIGN KEY (coluna1, coluna2 ... colunaN) REFERENCES tabela(coluna1, coluna2 ... colunaN);

--CHECK RESTRI��O DE COLUNA:
ALTER TABLE tabela ADD CHECK (condicao);

--CHECK RESTRI��O DE TABELA:
ALTER TABLE tabela
ADD CONSTRAINT nome_restricao CHECK (condicao);

--DEFAULT:
ALTER TABLE tabela
ALTER CONSTRAINT nomeRestricao DEFAULT 'valor padr�o' FOR nomeColuna;

--EXCLUSOES DE RESTRI�OES

/*
A exclus�o de restri��es � bem mais simples que a inclus�o. Todas as restri��es, 
exceto a DEFAULT, s�o exclu�das com o seguinte o comando:
*/
ALTER TABLE tabela DROP CONSTRAINT nome_restricao;

/*Para excluir a restri��o, precisamos do seu nome... Por isso, sempre que poss�vel, 
defina as restri��es como restri��o de tabela.*/

--EXCLUSOES DE TABELAS

/*O comando usado para excluir tabelas no SQL � o DROP TABLE. A sintaxe para excluir uma tabela ou mais 
� muito simples. Veja:*/
DROP TABLE tabela1, tabela2 ... tabelaN;

--Por exemplo, para excluir a tabela dependente, basta executar o comando abaixo:
DROP TABLE dependente;

--Tamb�m � poss�vel excluir v�rias tabelas de uma �nica vez:
DROP TABLE dependente1, dependente2, dependente3, dependente4;