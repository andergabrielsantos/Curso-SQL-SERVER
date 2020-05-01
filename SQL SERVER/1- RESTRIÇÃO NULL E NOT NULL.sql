/* NOT NULL
No SQL o valor nulo (null) indica �desconhecido� ou �n�o aplic�vel�. 
Quando um registro � inserido em uma tabela, por�m o valor de uma coluna 
n�o � especificado, por padr�o temos um valor NULL para aquela coluna naquela tupla. 
O valor NULL � diferente de espa�o, vazio e falso.
*/


/*Uma restri��o de n�o-nulo especifica que uma coluna n�o pode ser deixada sem um valor
 especificado. 
 Geralmente, definimos esta restri��o ao definir as colunas da tabela. Veja o exemplo abaixo:*/

 CREATE TABLE CUR_CURSO (
  CUR_CODIGO INTEGER NOT NULL,
  CUR_NOME TEXT NOT NULL,
  CUR_PRECO NUMERIC
);
/*Na tabela acima, ao inserirmos um curso, os campos c�digo e nome devem ser preenchidos obrigatoriamente,
enquanto o pre�o n�o precisa ser necessariamente especificado. Ao criar uma coluna e n�o especificar a 
restri��o NOT NULL, por padr�o, ela aceitar� valores nulos.*/
-----------------------------------------------------------------------------------------------------------

/*NULL
A restri��o NOT NULL possui uma inversa: a restri��o NULL. Isso n�o significa que a coluna deva ser nula, o que, 
certamente n�o teria utilidade. Ao inv�s disso � simplesmente definido o comportamento padr�o dizendo que a 
coluna pode ser nula. A restri��o NULL n�o � definida no padr�o SQL e n�o deve ser utilizada em aplica��es 
port�veis (somente foi adicionada ao SQL Server para torn�-lo compat�vel com outros sistemas de banco de dados).
 Por�m, alguns usu�rios gostam porque torna f�cil inverter a restri��o no arquivo de comandos. Por exemplo, 
 � poss�vel come�ar com:
*/

CREATE TABLE CUR_CURSO (
  CUR_CODIGO INTEGER NULL,
  CUR_NOME TEXT NULL,
  CUR_PRECO NUMERIC NULL
);

/*
E depois colocar a palavra-chave NOT onde for desejado. Mas usar a restri��o NULL ou n�o � apenas uma quest�o
 de opini�o, pois ela n�o causa nenhuma altera��o do resultado final. Se criarmos a tabela com o comando abaixo 
 teria o mesmo efeito:
*/

CREATE TABLE CUR_CURSO (
  CUR_CODIGO INTEGER,
  CUR_NOME TEXT,
  CUR_PRECO NUMERIC
);