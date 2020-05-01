/*Durante os passos lógicos de uma função, pode ser necessário o uso de um recurso 
que armazene informações na memória temporária do computador. Esse recurso é chamado
 variável e pode ser declarado facilmente em uma função através da cláusula DECLARE:
*/
DECLARE @nome_variavel tipo_dado

--Note que a variável sempre é nomeada iniciando com o arroba (@), e o seu tipo de dado é o mesmo que vimos para as colunas.
--Para atribuir um valor para a variável, pode se utilizar a cláusula SET:
SET @nome_variavel = valor