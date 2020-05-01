--Funções de usuário (user-defined functions)

/*
O SQL Server disponibiliza uma série de funções internas para facilitar o trabalho dos usuários do SGBD. 
Além das funções existentes por padrão, ele disponibiliza recursos para a criação de funções de usuário de 
acordo com as necessidades
*/

/*
A escrita de funções de usuário (também chamadas de user functions) evita que o usuário tenha que escrever 
um mesmo código todas as vezes que for executar um comando, seja ele uma consulta, inserção, update e etc.
*/

--A sintaxe básica para criar uma função no SQL Server é a seguinte:

CREATE FUNCTION nome_função (@parametro tipo, @parametro2 tipo2, ... @parametroN tipoN)
RETURNS tipo_retorno
BEGIN
  Comando1
  Comando2
  ComandoN
END

--Na assinatura da função, podemos informar possíveis parâmetros:
CREATE FUNCTION nome_função (@parametro tipo, @parametro2 tipo2, ... @parametroN tipoN)

--Em seguida, caso a função for retornar algo, o tipo do retorno deve ser informado:
RETURNS tipo_retorno

--E por fim, nós temos o bloco da função:
BEGIN
  Comando1
  Comando2
  ComandoN
END

/*Dentro do bloco da função, podemos definir uma série de comandos, não apenas os que já 
vimos anteriormente. Podemos definir variáveis, condicionais e estruturas de repetição.
*/