
--ALIAS

/*
O SQL permite que seja definido um apelido para determinada coluna dentro de uma consulta. 
Isso pode ser �til para apresentar uma consulta mais leg�vel. Para definir um apelido para 
uma coluna, basta adicionar a palavra-chave AS ap�s o nome da coluna, seguida do apelido. Por exemplo:
*/
SELECT nome AS 'Nome do aluno', email AS 'Endere�o de e-mail' FROM aluno;

/*
Na consulta acima, os resultados das colunas nome e email ser�o exibidos respectivamente, com os cabe�alhos
 �Nome do aluno� e �Endere�o de e-mail�.*/