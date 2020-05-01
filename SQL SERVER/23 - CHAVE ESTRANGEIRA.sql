
--CHAVE ESTRANGEIRA
/*A chave estrangeira � um dos principais recursos do modelo relacional. Ela permite ao banco de dados manter 
a integridade referencial entre as tabelas.*/

--Imagine a seguinte situa��o: em um banco de dados existe uma tabela de funcion�rios:

CREATE TABLE funcionario (
  codfun int NOT NULL,
  CPF char(11) UNIQUE,
  nome varchar(50) NOT NULL,
  email varchar(50),
  endereco varchar(100) NOT NULL,
  CONSTRAINT pk_func PRIMARY KEY (codfun)
);

/*
Vamos supor que se precisamos guardar os dados dos dependentes de cada funcion�rio. Provavelmente, 
n�s criar�amos uma tabela de dependentes onde esses dados ficar�o salvos:
*/

CREATE TABLE dependente (
  CPF char(11) NOT NULL PRIMARY KEY,
  nome varchar(50) NOT NULL,
  email varchar(50),
  dt_nascimento date
);

/*O problema da tabela de dependentes acima �: como vamos saber a qual funcion�rio um dependente pertence? 
A ideia para resolver este problema seria criar um campo na tabela dependentes onde podemos guardar o c�digo 
do funcion�rio em quest�o:*/

CREATE TABLE dependente (
  CPF char(11) NOT NULL PRIMARY KEY,
  nome varchar(50) NOT NULL,
  email varchar(50),
  dt_nascimento date,
  codfun int NOT NULL --> codigo do dependente
);

/*
Agora temos como saber a qual funcion�rio o dependente pertence, por�m, ainda temos um problema de integridade 
referencial... Quem garante que n�o ser� adicionado um c�digo de funcion�rio que n�o existe na tabela de 
funcion�rios no campo codfun da tabela dependente? Para solucionar esse problema existe a chave estrangeira. 
Ela garante a integridade referencial, permitindo que somente sejam inseridos valores existentes na tabela de 
funcion�rios.
*/

--A cria��o da tabela dependente usando chave estrangeira ficar� assim:

CREATE TABLE dependente (
  CPF char(11) NOT NULL PRIMARY KEY,
  nome varchar(50) NOT NULL,
  email varchar(50),
  dt_nascimento date,
  codfun int NOT NULL FOREIGN KEY REFERENCES funcionario(codfun) --> chave estrangeira do dependente
);

/*
Detalhes da integridade referencial:

Ao criar um novo dependente, obrigatoriamente o c�digo inserido no campo codfun deve existir na chave prim�ria
 do funcion�rio;

--Ao tentar excluir um funcion�rio ele n�o pode conter nenhum dependente associado a ele por padr�o;
--S� � poss�vel atualizar o c�digo de um funcion�rio se ele n�o possuir nenhum dependente relacionado.

Ao criar uma chave estrangeira devemos nos atentar se a chave prim�ria da outra tabela � simples ou composta 
e ao tipo e tamanho do(s) campo(s) da tabela referenciada, al�m de verificarmos se a tabela que possuir� a chave 
estrangeira possui chave prim�ria. Se ela n�o possuir chave prim�ria, tamb�m n�o poderemos criar uma restri��o de 
chave estrangeira.*/

--Tamb�m � poss�vel criar chave estrangeira utilizando uma restri��o de tabela. Veja:

CREATE TABLE dependente (
  CPF char(11) NOT NULL PRIMARY KEY,
  nome varchar(50) NOT NULL,
  email varchar(50),
  dt_nascimento date,
  codfun int NOT NULL,
  CONSTRAINT PK_fun_dep FOREIGN KEY (codfun) REFERENCES funcionario(codfun)
);
