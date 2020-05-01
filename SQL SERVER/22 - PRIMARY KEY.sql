
--CHAVES PRIMARIAS
/*
O conceito de chave primária é fundamental para entender o funcionamento de um banco de dados.

Ao definir um campo como sendo uma chave primária, informa-se ao banco de dados que não podem existir 
dois registros com o mesmo valor na chave primária, ou seja: os valores no campo que é uma chave primária 
precisam ser únicos.

Assim, esta restrição pode ser utilizada para definir que cada registro de uma tabela seja único.

Por exemplo, o campo “Número Identidade” da tabela de clientes é definido como sendo uma chave primária;
 então, é informado ao banco de dados que não podem existir dois clientes com o mesmo valor no campo “Número 
 Identidade”. Isso, na prática, significa que não podem ser cadastrados dois clientes com o mesmo número de 
 identidade.

Em outras palavras: é possível dizer que o campo que é uma chave primária identifica de maneira única cada 
registro da tabela.*/

--Veja um exemplo da definição deste campo na tabela abaixo:

CREATE TABLE curso (
  codigo int NOT NULL PRIMARY KEY,
  nome varchar(100),
  descricao varchar(max)
);

/*O campo de código foi declarado como chave primária. Ao inserir um registro, obrigatoriamente, o valor do código 
deve ser especificado e esse valor deve ser único.

Tecnicamente falando, a restrição de chave primária é uma junção das restrições NOT NULL e UNIQUE. */

--A tabela abaixo aceita os mesmos dados que a anterior:
CREATE TABLE curso (
  codigo int NOT NULL UNIQUE,
  nome varchar(100),
  descricao varchar(max)
);

/*
É possível adicionar várias restrições de unicidade em uma tabela, enquanto só é possível adicionar uma chave 
primária. Isso garante que temos um identificador único.

Um detalhe importante é que a chave primária pode ser formada pela combinação de mais de um campo. Podem existir 
casos (embora não sejam muito comuns) em que um único campo não é capaz de atuar como chave primária pelo fato de 
apresentar valores repetidos. Em casos como esse se pode definir uma combinação de dois ou mais campos para ser a 
chave primária:
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
Em uma situação onde o aluno pode cadastrar o CPF de um dos pais, este CPF não poderá ser por si só uma chave 
primária, já que se houverem irmãos na base, eles poderão ter CPF repetidos. Então, o CPF pode ser definido com 
o código como chave primária composta da tabela.

Segundo a teoria de banco de dados, todas as tabelas devem possuir chave primária. Mas, o SQL Server não utiliza 
essa regra: nele as tabelas não precisam ter, obrigatoriamente, uma chave primária (seja simples ou composta).

Dependendo do projeto, podem haver situações em que uma tabela não tenha nenhum campo (ou combinação de campos) 
definido como tipo chave primária. Só que isso deve ser planejando com cuidado, pois essa situação pode ocasionar 
degradação de performance

Por fim, um cuidado especial que se deve ter é quanto ao desempenho das consultas em tabelas que possuem chave 
primária composta por mais de um campo. Em muitas situações, o desempenho das consultas é inversamente proporcional
ao tamanho da chave primária. Com isso, quanto maior o tamanho da chave primária menor o desempenho das consultas, 
ou seja, mais demoradas se tornam as consultas.
*/