
--CHAVES PRIMARIAS
/*
O conceito de chave prim�ria � fundamental para entender o funcionamento de um banco de dados.

Ao definir um campo como sendo uma chave prim�ria, informa-se ao banco de dados que n�o podem existir 
dois registros com o mesmo valor na chave prim�ria, ou seja: os valores no campo que � uma chave prim�ria 
precisam ser �nicos.

Assim, esta restri��o pode ser utilizada para definir que cada registro de uma tabela seja �nico.

Por exemplo, o campo �N�mero Identidade� da tabela de clientes � definido como sendo uma chave prim�ria;
 ent�o, � informado ao banco de dados que n�o podem existir dois clientes com o mesmo valor no campo �N�mero 
 Identidade�. Isso, na pr�tica, significa que n�o podem ser cadastrados dois clientes com o mesmo n�mero de 
 identidade.

Em outras palavras: � poss�vel dizer que o campo que � uma chave prim�ria identifica de maneira �nica cada 
registro da tabela.*/

--Veja um exemplo da defini��o deste campo na tabela abaixo:

CREATE TABLE curso (
  codigo int NOT NULL PRIMARY KEY,
  nome varchar(100),
  descricao varchar(max)
);

/*O campo de c�digo foi declarado como chave prim�ria. Ao inserir um registro, obrigatoriamente, o valor do c�digo 
deve ser especificado e esse valor deve ser �nico.

Tecnicamente falando, a restri��o de chave prim�ria � uma jun��o das restri��es NOT NULL e UNIQUE. */

--A tabela abaixo aceita os mesmos dados que a anterior:
CREATE TABLE curso (
  codigo int NOT NULL UNIQUE,
  nome varchar(100),
  descricao varchar(max)
);

/*
� poss�vel adicionar v�rias restri��es de unicidade em uma tabela, enquanto s� � poss�vel adicionar uma chave 
prim�ria. Isso garante que temos um identificador �nico.

Um detalhe importante � que a chave prim�ria pode ser formada pela combina��o de mais de um campo. Podem existir 
casos (embora n�o sejam muito comuns) em que um �nico campo n�o � capaz de atuar como chave prim�ria pelo fato de 
apresentar valores repetidos. Em casos como esse se pode definir uma combina��o de dois ou mais campos para ser a 
chave prim�ria:
*/

CREATE TABLE aluno (
  codigo int,
  nome varchar(100),
  CPF char(11),
  email varchar(50),
  telefone varchar(11),
  dt_nascimento date,
  CONSTRAINT pk_codigo_cpf PRIMARY KEY(codigo, CPF)
);

/*
Em uma situa��o onde o aluno pode cadastrar o CPF de um dos pais, este CPF n�o poder� ser por si s� uma chave 
prim�ria, j� que se houverem irm�os na base, eles poder�o ter CPF repetidos. Ent�o, o CPF pode ser definido com 
o c�digo como chave prim�ria composta da tabela.

Segundo a teoria de banco de dados, todas as tabelas devem possuir chave prim�ria. Mas, o SQL Server n�o utiliza 
essa regra: nele as tabelas n�o precisam ter, obrigatoriamente, uma chave prim�ria (seja simples ou composta).

Dependendo do projeto, podem haver situa��es em que uma tabela n�o tenha nenhum campo (ou combina��o de campos) 
definido como tipo chave prim�ria. S� que isso deve ser planejando com cuidado, pois essa situa��o pode ocasionar 
degrada��o de performance

Por fim, um cuidado especial que se deve ter � quanto ao desempenho das consultas em tabelas que possuem chave 
prim�ria composta por mais de um campo. Em muitas situa��es, o desempenho das consultas � inversamente proporcional
ao tamanho da chave prim�ria. Com isso, quanto maior o tamanho da chave prim�ria menor o desempenho das consultas, 
ou seja, mais demoradas se tornam as consultas.
*/