--IDENTITY

/*Na maioria das tabelas que s�o criadas em um banco de dados a chave prim�ria � composta por um campo 
com c�digo sequencial. O SQL Server possui uma solu��o de auto incremento para esses casos, onde o pr�prio 
sistema gerencia a sequ�ncia de c�digos.*/

/*Para definir o auto incremento em uma tabela usamos a declara��o IDENTITY(valor_inicial, valor_incremento). 
Conforme abaixo:*/

CREATE TABLE contas_pagar (
  codcpg int NOT NULL IDENTITY(1,1),
  descricao varchar(100) NOT NULL,
  valor money NOT NULL CHECK(valor>0)
);

/*Criamos um auto incremento que inicia em 1 e incrementa um valor a cada registro. Assim, a sequ�ncia ir� iniciar 
em 1 e incrementar 1 a cada registro. Podemos criar o auto incremento conforme a necessidade, por exemplo, 
IDENTITY(100, 10) come�a em 100 e soma 10 a cada registro.*/