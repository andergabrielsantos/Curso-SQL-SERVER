--O que s�o Stored Procedures?

/*Os procedimentos s�o um conjunto de instru��es que ficam armazenados pr�-compilados no servidor 
e agrupados por um nome, assim como as fun��es. S� que, diferente de fun��es, as stored procedures 
n�o retornam valores.*/

--Outras diferen�as entre fun��es e procedimentos s�o:

--Fun��es n�o podem executar stored procedures. Mas procedimentos podem executar fun��es e outras stored procedures;
--Procedures podem criar tabelas, inserir, excluir ou alterar seus dados. J� fun��es n�o podem executar nenhuma dessas a��es.

--O comando usado para criar um procedure � o CREATE PROCEDURE. Veja a sintaxe b�sica dele:

CREATE PROCEDURE nome_do_stored_procedure
[
{@nome_par�metro1 tipo_de_dados_do_par�metro} [=valor_default] [OUTPUT]
]
[,..n]
AS
comando 1
comando 2
...
comando n
---------------------------------------------------------------------------------------------------------------------------

/*Dentro do bloco de comandos da procedure, podemos utilizar todos recursos que vimos para fun��es: vari�veis, condicionais 
e estruturas de repeti��o; al�m de poder executar comandos DDL e DML.*/		