/*Durante os passos l�gicos de uma fun��o, pode ser necess�rio o uso de um recurso 
que armazene informa��es na mem�ria tempor�ria do computador. Esse recurso � chamado
 vari�vel e pode ser declarado facilmente em uma fun��o atrav�s da cl�usula DECLARE:
*/
DECLARE @nome_variavel tipo_dado

--Note que a vari�vel sempre � nomeada iniciando com o arroba (@), e o seu tipo de dado � o mesmo que vimos para as colunas.
--Para atribuir um valor para a vari�vel, pode se utilizar a cl�usula SET:
SET @nome_variavel = valor