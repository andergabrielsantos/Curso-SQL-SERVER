
--CHAVE ESTRANGEIRA
/*A chave estrangeira é um dos principais recursos do modelo relacional. Ela permite ao banco de dados manter 
a integridade referencial entre as tabelas.*/

--Imagine a seguinte situação: em um banco de dados existe uma tabela de funcionários:

CREATE TABLE funcionario (
  codfun int NOT NULL,
  CPF char(11) UNIQUE,
  nome varchar(50) NOT NULL,
  email varchar(50),
  endereco varchar(100) NOT NULL,
  CONSTRAINT pk_func PRIMARY KEY (codfun)
);

/*
Vamos supor que se precisamos guardar os dados dos dependentes de cada funcionário. Provavelmente, 
nós criaríamos uma tabela de dependentes onde esses dados ficarão salvos:
*/

CREATE TABLE dependente (
  CPF char(11) NOT NULL PRIMARY KEY,
  nome varchar(50) NOT NULL,
  email varchar(50),
  dt_nascimento date
);

/*O problema da tabela de dependentes acima é: como vamos saber a qual funcionário um dependente pertence? 
A ideia para resolver este problema seria criar um campo na tabela dependentes onde podemos guardar o código 
do funcionário em questão:*/

CREATE TABLE dependente (
  CPF char(11) NOT NULL PRIMARY KEY,
  nome varchar(50) NOT NULL,
  email varchar(50),
  dt_nascimento date,
  codfun int NOT NULL --> codigo do dependente
);

/*
Agora temos como saber a qual funcionário o dependente pertence, porém, ainda temos um problema de integridade 
referencial... Quem garante que não será adicionado um código de funcionário que não existe na tabela de 
funcionários no campo codfun da tabela dependente? Para solucionar esse problema existe a chave estrangeira. 
Ela garante a integridade referencial, permitindo que somente sejam inseridos valores existentes na tabela de 
funcionários.
*/

--A criação da tabela dependente usando chave estrangeira ficará assim:

CREATE TABLE dependente (
  CPF char(11) NOT NULL PRIMARY KEY,
  nome varchar(50) NOT NULL,
  email varchar(50),
  dt_nascimento date,
  codfun int NOT NULL FOREIGN KEY REFERENCES funcionario(codfun) --> chave estrangeira do dependente
);

/*
Detalhes da integridade referencial:

Ao criar um novo dependente, obrigatoriamente o código inserido no campo codfun deve existir na chave primária
 do funcionário;

--Ao tentar excluir um funcionário ele não pode conter nenhum dependente associado a ele por padrão;
--Só é possível atualizar o código de um funcionário se ele não possuir nenhum dependente relacionado.

Ao criar uma chave estrangeira devemos nos atentar se a chave primária da outra tabela é simples ou composta 
e ao tipo e tamanho do(s) campo(s) da tabela referenciada, além de verificarmos se a tabela que possuirá a chave 
estrangeira possui chave primária. Se ela não possuir chave primária, também não poderemos criar uma restrição de 
chave estrangeira.*/

--Também é possível criar chave estrangeira utilizando uma restrição de tabela. Veja:

CREATE TABLE dependente (
  CPF char(11) NOT NULL PRIMARY KEY,
  nome varchar(50) NOT NULL,
  email varchar(50),
  dt_nascimento date,
  codfun int NOT NULL,
  CONSTRAINT PK_fun_dep FOREIGN KEY (codfun) REFERENCES funcionario(codfun)
);
