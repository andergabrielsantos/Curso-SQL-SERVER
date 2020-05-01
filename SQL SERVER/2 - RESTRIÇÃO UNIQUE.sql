/*Existem situações onde é necessário que os valores de uma coluna sejam diferentes para cada registro.
Vamos pensar em uma tabela que armazena alunos... Cada aluno só pode ser cadastrado uma única vez, 
logo, a coluna CPF não pode conter valores repetidos para mais de um registro por exemplo.*/

/*Pensando na solução do problema acima, o SQL implementa a restrição UNIQUE. Ao inserir ou atualizar
um valor em uma coluna que contenha essa restrição, o SQL Server analisa todos os outros valores 
existentes nessa coluna e, se já existir alguma tupla cuja coluna possua esse valor, um erro acaba 
ocorrendo.*/

--Veja como fica a criação da tabela de alunos descrita com essa restrição:

CREATE TABLE aluno (
  codigo int,
  nome varchar(100),
  CPF char(11) UNIQUE,
  email varchar(50),
  telefone varchar(11),
  dt_nascimento date
);

/*No caso acima, a restrição é escrita em forma de restrição de coluna... Note que ela é declarada 
junto com a coluna. A restrição UNIQUE também pode ser escrita como restrição de tabela:*/

CREATE TABLE aluno (
  codigo int,
  nome varchar(100),
  CPF char(11),
  email varchar(50),
  telefone varchar(11),
  dt_nascimento date,
  CONSTRAINT cpf_unique UNIQUE(CPF)
);

--A sintaxe para a criação da restrição UNIQUE como restrição de tabela é:

CONSTRAINT nome_restricao UNIQUE(coluna)


/*É possível definir a restrição de unicidade para um conjunto de colunas. Nesse caso, é analisado se 
o conjunto de valores é único. Veja o exemplo da tabela abaixo*/

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