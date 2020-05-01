/*Existem situa��es onde � necess�rio que os valores de uma coluna sejam diferentes para cada registro.
Vamos pensar em uma tabela que armazena alunos... Cada aluno s� pode ser cadastrado uma �nica vez, 
logo, a coluna CPF n�o pode conter valores repetidos para mais de um registro por exemplo.*/

/*Pensando na solu��o do problema acima, o SQL implementa a restri��o UNIQUE. Ao inserir ou atualizar
um valor em uma coluna que contenha essa restri��o, o SQL Server analisa todos os outros valores 
existentes nessa coluna e, se j� existir alguma tupla cuja coluna possua esse valor, um erro acaba 
ocorrendo.*/

--Veja como fica a cria��o da tabela de alunos descrita com essa restri��o:

CREATE TABLE aluno (
  codigo int,
  nome varchar(100),
  CPF char(11) UNIQUE,
  email varchar(50),
  telefone varchar(11),
  dt_nascimento date
);

/*No caso acima, a restri��o � escrita em forma de restri��o de coluna... Note que ela � declarada 
junto com a coluna. A restri��o UNIQUE tamb�m pode ser escrita como restri��o de tabela:*/

CREATE TABLE aluno (
  codigo int,
  nome varchar(100),
  CPF char(11),
  email varchar(50),
  telefone varchar(11),
  dt_nascimento date,
  CONSTRAINT cpf_unique UNIQUE(CPF)
);

--A sintaxe para a cria��o da restri��o UNIQUE como restri��o de tabela �:

CONSTRAINT nome_restricao UNIQUE(coluna)


/*� poss�vel definir a restri��o de unicidade para um conjunto de colunas. Nesse caso, � analisado se 
o conjunto de valores � �nico. Veja o exemplo da tabela abaixo*/

CREATE TABLE aluno (
  codigo int,
  nome varchar(100),
  CPF char(11),
  RG char(10),
  orgaoEmissor char(15),
  email varchar(50),
  telefone varchar(11),
  dt_nascimento date,
  CONSTRAINT cpf3_unique UNIQUE(CPF),
  CONSTRAINT rg_unique UNIQUE(RG, orgaoEmissor)
);