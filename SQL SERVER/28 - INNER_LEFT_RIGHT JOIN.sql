
--CONSULTA DE 2 TABELAS COM INNER JOIN
SELECT CONCAT(FUN.FUN_SOBRENOME, ',',FUN.FUN_NOME) AS NOME_FUNCIONARIO,
FUN.FUN_DATA_NASCIMENTO,
PAC_DATA_INICIAL,
PAC_DATA_FINAL,
CONVERT(TIME(0), PAC.PAC_DATA_FINAL - PAC.PAC_DATA_INICIAL) AS HORAS_TRABALHADAS
FROM FUN_FUNCIONARIOS AS FUN INNER JOIN PAC_PONTOS_ACESSO AS PAC 
ON FUN.FUN_ID = PAC.PAC_ID;
--NOME_FUNCIONARIO	FUN_DATA_NASCIMENTO   PAC_DATA_INICIAL	          PAC_DATA_FINAL	        HORAS_TRABALHADAS
--GABRIEL,ANDERSON	1983-07-20	          2017-02-01 07:00:00.000	  2017-02-01 12:00:00.000	05:00:00
--DE SOUSA,MARIA	1990-07-03	          2017-01-02 07:03:00.000	  2017-01-02 11:57:00.000	04:54:00

-- CONSULTA DE 2 TABELAS COM LEFT JOIN
SELECT CONCAT(FUN.FUN_SOBRENOME, ',',FUN.FUN_NOME) AS NOME_FUNCIONARIO,
FUN.FUN_DATA_NASCIMENTO,
PAC_DATA_INICIAL,
PAC_DATA_FINAL,
CONVERT(TIME(0), PAC.PAC_DATA_FINAL - PAC.PAC_DATA_INICIAL) AS HORAS_TRABALHADAS
FROM FUN_FUNCIONARIOS AS FUN LEFT JOIN PAC_PONTOS_ACESSO AS PAC 
ON FUN.FUN_ID = PAC.PAC_ID;
--NOME_FUNCIONARIO	 FUN_DATA_NASCIMENTO	PAC_DATA_INICIAL	      PAC_DATA_FINAL	        HORAS_TRABALHADAS
--GABRIEL,ANDERSON	 1983-07-20	            2017-02-01 07:00:00.000	  2017-02-01 12:00:00.000	05:00:00
--DE SOUSA,MARIA	 1990-07-03	            2017-01-02 07:03:00.000	  2017-01-02 11:57:00.000	04:54:00
--ALENCAR,JO�O	     1968-12-05	            NULL	                  NULL	                    NULL


--CONSULTA DE 2 TABELA 
SELECT CONCAT(FUN.FUN_SOBRENOME, ',',FUN.FUN_NOME) AS NOME_FUNCIONARIO,
FUN.FUN_DATA_NASCIMENTO,
PAC_DATA_INICIAL,
PAC_DATA_FINAL,
CONVERT(TIME(0), PAC.PAC_DATA_FINAL - PAC.PAC_DATA_INICIAL) AS HORAS_TRABALHADAS
FROM FUN_FUNCIONARIOS AS FUN RIGHT JOIN PAC_PONTOS_ACESSO AS PAC 
ON FUN.FUN_ID = PAC.PAC_ID;
--NOME_FUNCIONARIO	FUN_DATA_NASCIMENTO   PAC_DATA_INICIAL	          PAC_DATA_FINAL	        HORAS_TRABALHADAS
--GABRIEL,ANDERSON	1983-07-20	          2017-02-01 07:00:00.000	  2017-02-01 12:00:00.000	05:00:00
--DE SOUSA,MARIA	1990-07-03	          2017-01-02 07:03:00.000	  2017-01-02 11:57:00.000	04:54:00