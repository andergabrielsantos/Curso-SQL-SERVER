
--SELECIONAR TODOS OS CAMPOS COM A SIGLA (*)
SELECT * FROM FUN_FUNCIONARIOS;
--FUN_ID	FUN_NOME	   FUN_SOBRENOME	FUN_DATA_NASCIMENTO	FUN_OBSERVACOES
--1	        ANDERSON	    GABRIEL	        1983-07-20	OBSERVA��O DO FUNCIONARIO
--2	        MARIA	        DE SOUSA	    1990-07-03	NULL
--3	        JO�O	        ALENCAR	        1968-12-05	NULL

-- CONCATENA��O 
SELECT FUN_NOME + ' ' + FUN_SOBRENOME, FUN_DATA_NASCIMENTO FROM FUN_FUNCIONARIOS;
--(Nenhum nome de coluna)	FUN_DATA_NASCIMENTO
--ANDERSON GABRIEL	        1983-07-20
--MARIA DE SOUSA	        1990-07-03
--JO�O ALENCAR	            1968-12-05

--CONCATENA��O COM ALIAS 
SELECT FUN_NOME + ' ' + FUN_SOBRENOME AS NOME_FUNCIONARIO, FUN_DATA_NASCIMENTO FROM FUN_FUNCIONARIOS;
--NOME_FUNCIONARIO	FUN_DATA_NASCIMENTO
--ANDERSON GABRIEL	 1983-07-20
--MARIA DE SOUSA	 1990-07-03
--JO�O ALENCAR	     1968-12-05

--CONCATENA��O COM ALIAS E CONVERTENDO TIPO DE DADO TEXT POR VARCHAR COM A FUN��O (CAST)
SELECT FUN_NOME + ' ' + FUN_SOBRENOME + ', ' + CAST(FUN_OBSERVACOES AS VARCHAR) AS NOME_COMPLETO, FUN_DATA_NASCIMENTO
FROM FUN_FUNCIONARIOS;
--NOME_COMPLETO	                                  FUN_DATA_NASCIMENTO
--ANDERSON GABRIEL, OBSERVA��O DO FUNCIONARIO	  1983-07-20
--NULL	                                          1990-07-03
--NULL	                                          1968-12-05

--CONCATENA��O COM ALIAS E CONVERTENDO TIPO DE DADO TEXT POR VARCHAR COM A FUN��O (AST)
--OBS: A FUN��O (ISNULL) ANULA OS CAMPOS NULL, DANDO A PRIORIDADE OS TIPOS DE DADOS CONCATENADOS 
SELECT FUN_NOME + ' ' + FUN_SOBRENOME + ', ' + CAST( ISNULL(FUN_OBSERVACOES, '') AS VARCHAR) AS NOME_COMPLETO, FUN_DATA_NASCIMENTO
FROM FUN_FUNCIONARIOS;
--NOME_COMPLETO	                                  FUN_DATA_NASCIMENTO
--ANDERSON GABRIEL, OBSERVA��O DO FUNCIONARIO	  1983-07-20
--MARIA DE SOUSA, 	                              1990-07-03
--JO�O ALENCAR, 	                              1968-12-05

--CONCATENA��O COM A FUN��O (CONCAT)
SELECT CONCAT(FUN_NOME , ' ' , FUN_SOBRENOME) AS NOME_FUNCIONARIO, FUN_DATA_NASCIMENTO FROM FUN_FUNCIONARIOS;
--NOME_FUNCIONARIO	FUN_DATA_NASCIMENTO
--ANDERSON GABRIEL	1983-07-20
--MARIA DE SOUSA	1990-07-03
--JO�O ALENCAR	    1968-12-05

--CONCATENA��O COM A FUN��O (CONCAT)
--OBS: A FUN��O (CONCAT) J� FAZ A CONVER��O E ELIMINA AS LINHAS COM NULL
SELECT CONCAT(FUN_NOME , ' ' , FUN_SOBRENOME, ',', FUN_OBSERVACOES) AS NOME_FUNCIONARIO, FUN_DATA_NASCIMENTO 
FROM FUN_FUNCIONARIOS;
--NOME_FUNCIONARIO	FUN_DATA_NASCIMENTO
--ANDERSON GABRIEL	1983-07-20
--MARIA DE SOUSA	1990-07-03
--JO�O ALENCAR	    1968-12-05

--A FUN��O TSQL (SQL_VARIANT_PROPERTY) ANALIZA OS DADOS PASSADO EM ARGUMENTO E PERMITE EXTRAIR INFORMA��ES DOS DADOS 
--COMO POR EXEMPLO O TIPO DE DAOD 'BaseType'
SELECT SQL_VARIANT_PROPERTY (FUN_NOME + ' ' + FUN_SOBRENOME + ', ' + CAST( ISNULL(FUN_OBSERVACOES, '') AS VARCHAR),'BaseType') 
AS NOME_COMPLETO, FUN_DATA_NASCIMENTO
FROM FUN_FUNCIONARIOS;
--NOME_COMPLETO	    FUN_DATA_NASCIMENTO
--varchar	        1983-07-20
--varchar	        1990-07-03
--varchar	        1968-12-05