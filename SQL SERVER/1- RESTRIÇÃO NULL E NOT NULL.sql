/* NOT NULL
No SQL o valor nulo (null) indica “desconhecido” ou “não aplicável”. 
Quando um registro é inserido em uma tabela, porém o valor de uma coluna 
não é especificado, por padrão temos um valor NULL para aquela coluna naquela tupla. 
O valor NULL é diferente de espaço, vazio e falso.
*/


/*Uma restrição de não-nulo especifica que uma coluna não pode ser deixada sem um valor
 especificado. 
 Geralmente, definimos esta restrição ao definir as colunas da tabela. Veja o exemplo abaixo:*/

 CREATE TABLE CUR_CURSO (
  CUR_CODIGO INTEGER NOT NULL,
  CUR_NOME TEXT NOT NULL,
  CUR_PRECO NUMERIC
);
/*Na tabela acima, ao inserirmos um curso, os campos código e nome devem ser preenchidos obrigatoriamente,
enquanto o preço não precisa ser necessariamente especificado. Ao criar uma coluna e não especificar a 
restrição NOT NULL, por padrão, ela aceitará valores nulos.*/
-----------------------------------------------------------------------------------------------------------

/*NULL
A restrição NOT NULL possui uma inversa: a restrição NULL. Isso não significa que a coluna deva ser nula, o que, 
certamente não teria utilidade. Ao invés disso é simplesmente definido o comportamento padrão dizendo que a 
coluna pode ser nula. A restrição NULL não é definida no padrão SQL e não deve ser utilizada em aplicações 
portáveis (somente foi adicionada ao SQL Server para torná-lo compatível com outros sistemas de banco de dados).
 Porém, alguns usuários gostam porque torna fácil inverter a restrição no arquivo de comandos. Por exemplo, 
 é possível começar com:
*/

CREATE TABLE CUR_CURSO (
  CUR_CODIGO INTEGER NULL,
  CUR_NOME TEXT NULL,
  CUR_PRECO NUMERIC NULL
);

/*
E depois colocar a palavra-chave NOT onde for desejado. Mas usar a restrição NULL ou não é apenas uma questão
 de opinião, pois ela não causa nenhuma alteração do resultado final. Se criarmos a tabela com o comando abaixo 
 teria o mesmo efeito:
*/

CREATE TABLE CUR_CURSO (
  CUR_CODIGO INTEGER,
  CUR_NOME TEXT,
  CUR_PRECO NUMERIC
);