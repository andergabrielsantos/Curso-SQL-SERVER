--Fun��es de usu�rio (user-defined functions)

/*
O SQL Server disponibiliza uma s�rie de fun��es internas para facilitar o trabalho dos usu�rios do SGBD. 
Al�m das fun��es existentes por padr�o, ele disponibiliza recursos para a cria��o de fun��es de usu�rio de 
acordo com as necessidades
*/

/*
A escrita de fun��es de usu�rio (tamb�m chamadas de user functions) evita que o usu�rio tenha que escrever 
um mesmo c�digo todas as vezes que for executar um comando, seja ele uma consulta, inser��o, update e etc.
*/

--A sintaxe b�sica para criar uma fun��o no SQL Server � a seguinte:

CREATE FUNCTION nome_fun��o (@parametro tipo, @parametro2 tipo2, ... @parametroN tipoN)
RETURNS tipo_retorno
BEGIN
  Comando1
  Comando2
  ComandoN
END

--Na assinatura da fun��o, podemos informar poss�veis par�metros:
CREATE FUNCTION nome_fun��o (@parametro tipo, @parametro2 tipo2, ... @parametroN tipoN)

--Em seguida, caso a fun��o for retornar algo, o tipo do retorno deve ser informado:
RETURNS tipo_retorno

--E por fim, n�s temos o bloco da fun��o:
BEGIN
  Comando1
  Comando2
  ComandoN
END

/*Dentro do bloco da fun��o, podemos definir uma s�rie de comandos, n�o apenas os que j� 
vimos anteriormente. Podemos definir vari�veis, condicionais e estruturas de repeti��o.
*/