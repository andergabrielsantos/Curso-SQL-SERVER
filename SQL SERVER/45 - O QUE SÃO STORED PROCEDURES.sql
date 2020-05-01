--O que são Stored Procedures?

/*Os procedimentos são um conjunto de instruções que ficam armazenados pré-compilados no servidor 
e agrupados por um nome, assim como as funções. Só que, diferente de funções, as stored procedures 
não retornam valores.*/

--Outras diferenças entre funções e procedimentos são:

--Funções não podem executar stored procedures. Mas procedimentos podem executar funções e outras stored procedures;
--Procedures podem criar tabelas, inserir, excluir ou alterar seus dados. Já funções não podem executar nenhuma dessas ações.

--O comando usado para criar um procedure é o CREATE PROCEDURE. Veja a sintaxe básica dele:

CREATE PROCEDURE nome_do_stored_procedure
[
{@nome_parâmetro1 tipo_de_dados_do_parâmetro} [=valor_default] [OUTPUT]
]
[,..n]
AS
comando 1
comando 2
...
comando n
---------------------------------------------------------------------------------------------------------------------------

/*Dentro do bloco de comandos da procedure, podemos utilizar todos recursos que vimos para funções: variáveis, condicionais 
e estruturas de repetição; além de poder executar comandos DDL e DML.*/		