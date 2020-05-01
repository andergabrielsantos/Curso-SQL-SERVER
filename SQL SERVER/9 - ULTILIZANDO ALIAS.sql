
--ALIAS

/*
O SQL permite que seja definido um apelido para determinada coluna dentro de uma consulta. 
Isso pode ser útil para apresentar uma consulta mais legível. Para definir um apelido para 
uma coluna, basta adicionar a palavra-chave AS após o nome da coluna, seguida do apelido. Por exemplo:
*/
SELECT nome AS 'Nome do aluno', email AS 'Endereço de e-mail' FROM aluno;

/*
Na consulta acima, os resultados das colunas nome e email serão exibidos respectivamente, com os cabeçalhos
 “Nome do aluno” e “Endereço de e-mail”.*/