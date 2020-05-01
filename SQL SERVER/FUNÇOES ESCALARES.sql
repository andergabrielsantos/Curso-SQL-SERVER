-- FUNÇÕES ESCALARES

--FUNÇÃO "CONCAT" - A FUNÇÃO CONCAT AGRUPA DUAS OU MAIS CADEIA DE CARACTERE. 

SELECT CONCAT('MEU NOME É:  ', FUN_NOME,' ',FUN_SOBRENOME) AS SEU_NOME FROM FUN_FUNCIONARIOS;
--SEU_NOME
--MEU NOME É:  ANDERSON GABRIEL
--MEU NOME É:  MARIA DE SOUSA
--MEU NOME É:  JOÃO ALENCAR
-------------------------------------------------------------------------------------------------
--FUNÇÃO "LOWER" - CONVERTE TODOS OS CARACTERES PARA MINUSCULO
SELECT LOWER(FUN_NOME) AS SEU_NOME FROM FUN_FUNCIONARIOS;
--SEU_NOME
--anderson
--maria
--João
--------------------------------------------------------------------------------------------------
--FUNÇÃO "UPPER" - CONVERTE TODOS OS CARACTERES PARA MAIUSCULO
SELECT UPPER(FUN_NOME) AS SEU_NOME FROM FUN_FUNCIONARIOS;
--SEU_NOME
--ANDERSON
--MARIA
--JOÃO
----------------------------------------------------------------------------------------------------
--FUNÇÃO "REPLACE"  Substitui todas as ocorrências de um valor de seqüência de caracteres especificado com outro
--valor de seqüência de caracteres.
--O exemplo a seguir substitui a corda cdeno abcdefghicom xxx.
SELECT REPLACE('ABCDEFGHICDE','CDE','XXX') AS EXEMPLO; 
--EXEMPLO
--ABXXXFGHIXXX 
---------------------------------------------------------------------------------------------------
--FUNÇÕA "SUBSTRING" - RETORNA PARTE DE UMA CADEIA DE CARACTERES DEFINIDA.
--EXEMPLO
--SUBSTRING('string_original', 'posicao', 'tamanho');
SELECT FUN_NOME, SUBSTRING(FUN_NOME, 3,6) AS NOME FROM FUN_FUNCIONARIOS WHERE FUN_ID= 1;
---------------------------------------------------------------------------------------------------
-- FUNÇÇÃO "ASCII" - Retorna o valor do código ASCII do caractere mais à esquerda de uma expressão de caractere.
SELECT ASCII('A') AS A, ASCII('B') AS B,   
ASCII('C') AS C, ASCII('D') AS D,  
ASCII('a') AS a, ASCII('b') AS b, 
ASCII('c') AS c, ASCII('d') AS d, 
ASCII(1) AS [1], ASCII(2) AS [2];
--A	    B	C	D	a	b	c	d	1	2
--65	66	67	68	97	98	99	100	49	50
-----------------------------------------------------------------------------------------------------

--Retorna um valor formatado com o formato especificado e a cultura opcional no SQL Server 2017.
--Use a função FORMAT para formatação de data / hora e valores de número compatíveis com a região 
--como strings. Para conversões de tipo de dados gerais, use CAST ou CONVERT.

DECLARE @d DATETIME = '10/01/2011';  
SELECT FORMAT ( @d, 'd', 'en-US' ) AS 'US English Result';  
      ,FORMAT ( @d, 'd', 'en-gb' ) AS 'Great Britain English Result'  
      ,FORMAT ( @d, 'd', 'de-de' ) AS 'German Result'  
      ,FORMAT ( @d, 'd', 'zh-cn' ) AS 'Simplified Chinese (PRC) Result'; 

--US English Result	Great Britain English Result	German Result	Simplified Chinese (PRC) Result
--1/10/2011	        10/01/2011	                    10.01.2011	     2011/1/10
	    

SELECT FORMAT ( @d, 'D', 'en-US' ) AS 'US English Result'  
      ,FORMAT ( @d, 'D', 'en-gb' ) AS 'Great Britain English Result'  
      ,FORMAT ( @d, 'D', 'de-de' ) AS 'German Result'  
      ,FORMAT ( @d, 'D', 'zh-cn' ) AS 'Chinese (Simplified PRC) Result';

--US English Result	         Great Britain English Result	German Result	          Chinese (Simplified PRC) Result
--Monday, January 10, 2011	 10 January 2011              	Montag, 10. Januar 2011   2011年1月10日
---------------------------------------------------------------------------------------------------------------------------

--Uma função matemática que retorna o valor absoluto (positivo) da expressão numérica especificada. 
SELECT ABS(-1.0) as Numero1, ABS(0.0) as numero2, ABS(1.0) as numero3;
--Numero1	numero2	 numero3
--1.0	     0.0	  1.0

--------------------------------------------------------------------------------------------------------------------------

-- Função "PI" rretorna o valor de PI

SELECT PI() AS 'VALOR DE PI';
------------------------------------------------------------------------------ 
--Retorna um valor datetime2 (7) que contém a data e a hora do computador no qual a instância do SQL Server está sendo executada.

  SELECT SYSDATETIME();
  --2017-07-21 20:10:15.2286741
  -------------------------------------------------------------------------------------------------------------------------

  --Tipos e funções de dados de data e hora 
 SELECT SYSDATETIME() AS SYSDATETIME --RETORNA DATA E HORA NO FORMATO DATETIME2(7) DO COMPUTADOR ONDE O BANCO DE DADOS ESTA INSTALADOS  
    ,SYSDATETIMEOFFSET() AS SYSDATETIMEOFFSET -- Retorna um valor datetimeoffset (7) que contém a data e a hora do computador no qual a instância do SQL Server está sendo executada. 
    ,SYSUTCDATETIME() AS SYSUTCDATETIME  --Retorna um valor datetime2 (7) que contém a data e a hora do computador no qual a instância do SQL Server está sendo executada.
    ,CURRENT_TIMESTAMP  AS 'CURRENT_TIMESTAMP' -- RETORNA O TIMESTEMP DO COMPUTADOR ONDE O BANCO DE DADOS ESTA INSTALADO
    ,GETDATE() AS GETDATE --Retorna um datetime valor que contém a data e hora do computador no qual a instância do SQL Server está em execução.  
    ,GETUTCDATE() AS GETUTCDATE --Retorna um datetime valor que contém a data e hora do computador no qual a instância do SQL Server está em execução. 
	,DATEFROMPARTS ( 2017, 07, 20 ) AS 'DATEFROMPARTS';--RETORNA UMA DADTA APARTIR DOS PARAMETROS PASSADOS.

-- DATEDIFF: Retorna a diferença entre duas datas. Veja sua sintaxe:
--A UNIDADE DE RETORNO PODE SER:

--"YEAR" - ANOS
--"QUATER" - TRIMESTRES
--"MONTH" - MESES
--"DAYOFYEAR" - DIAS DO ANO
--"DAY" - DIAS
--"WEEK" - SEMANAS
--"HOUR" - HORAS
--"MINUTE" - MINUTOS 
--"SECOND" - SEGUNDOS
--"MILLISECOND" - MILISEGUNDOS

SELECT DATEDIFF(YEAR, '2000-12-31 23:59:59.9999999'
, '2006-01-01 00:00:00.0000000') AS 'DIFERENÇA DE ANOS';
--DIFERENÇA DE ANOS
--6

SELECT DATEDIFF(QUARTER, '2000-12-31 23:59:59.9999999'
, '2006-01-01 00:00:00.0000000')AS 'DIFERENÇA DE TRIMESTRE';
--DIFERENÇA DE TRIMESTRE
--21

SELECT DATEDIFF(MONTH, '2000-12-31 23:59:59.9999999'
, '2006-01-01 00:00:00.0000000') AS 'DIFERENÇA DE MESES';
--DIFERENÇA DE MESES
--61

SELECT DATEDIFF(DAYOFYEAR, '2000-12-31 23:59:59.9999999'
, '2006-01-01 00:00:00.0000000') AS 'DIFERENÇA DE DIAS DO ANO';
--DIFERENÇA DE DIAS DO ANO
--1827

SELECT DATEDIFF(DAY, '2000-12-31 23:59:59.9999999'
, '2006-01-01 00:00:00.0000000') AS 'DIFERENÇA DE DIAS';
--DIFERENÇA DE DIAS
--1827

SELECT DATEDIFF(WEEK, '2000-12-31 23:59:59.9999999'
, '2006-01-01 00:00:00.0000000')AS 'DIFERENÇA DE SEMANAS';
--DIFERENÇA DE SEMANAS
--261

SELECT DATEDIFF(HOUR, '2000-12-31 23:59:59.9999999'
, '2006-01-01 00:00:00.0000000') AS 'DIFERENÇA DE HORAS';
--43825

SELECT DATEDIFF(MINUTE, '2000-12-31 23:59:59.9999999'
, '2006-01-01 00:00:00.0000000') AS 'DIFERENÇA DE MINUUTOS';
--DIFERENÇA DE MINUUTOS
--2629441

SELECT DATEDIFF(SECOND, '2000-12-31 23:59:59.9999999'
, '2006-01-01 00:00:00.0000000') AS 'DIFERENÇA DE SEGUNDOS';
--DIFERENÇA DE SEGUNDOS
--157766401

SELECT DATEDIFF(MILLISECOND, '2005-12-31 01:59:59.9999999'
, '2006-01-01 00:00:00.0000000') AS 'DIFERENÇA DE MILESIMO DE SEGUNDO';
--DIFERENÇA DE MILESIMO DE SEGUNDO
--79200001

--FUNÇOES DE USO DIVERSO

SELECT HOST_NAME(); -- RETORNA O NOME DA ESTAÇÃO CONECTADO AGORA 

SELECT DB_NAME(); -- RETORNA O BANCO DE DADOS QUE ESTA CONECTADO AGORA


-- "SYSTEM_USER" - RETORNA O USUÁRIO CONECTADO
DECLARE @sys_usr char(30);
SET @sys_usr = SYSTEM_USER;
SELECT @sys_usr AS 'O USUARIO CONECTADO É';


SELECT FUN_ID, COUNT(*) FROM FUN_FUNCIONARIOS GROUP BY FUN_ID HAVING COUNT(*) >=  2;



