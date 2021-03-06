 -- CRIANDO UMA FUN��O ESCALAR
 CREATE FUNCTION FN_DADOS_PONTOS()
 RETURNS TABLE AS 
 RETURN SELECT DATEDIFF(SECOND, PAC_DATA_INICIAL,PAC_DATA_FINAL) AS DIFERENCA_SEGUNDOS, 
        CONVERT(DATE, PAC_DATA_INICIAL)AS DATA,
        FUN_ID
        FROM PAC_PONTOS_ACESSO 

-- CRIANDO UMA FUN��O DE TABELA
 ALTER FUNCTION FN_CALCULA_HORA(@_SEGUNDOP_QTDES INT)
 RETURNS VARCHAR(8) AS
 BEGIN
   RETURN   FORMAT(@_SEGUNDOP_QTDES/3600, '00')+':'+ 
            FORMAT((@_SEGUNDOP_QTDES %3600)/60,'00')+':'+
            FORMAT((@_SEGUNDOP_QTDES%3600)%60,'00')
 END;

SELECT DADOS_PONTOS.DATA,FUN.FUN_NOME,
DBO.FN_CALCULA_HORA(SUM(DADOS_PONTOS.DIFERENCA_SEGUNDOS)) 
FROM DBO.FN_DADOS_PONTOS() AS DADOS_PONTOS 
INNER JOIN FUN_FUNCIONARIOS AS FUN
ON DADOS_PONTOS.FUN_ID = FUN.FUN_ID
GROUP BY DADOS_PONTOS.DATA,FUN.FUN_NOME
-------------------------------------------------------------------------------------------------------------------------

CREATE FUNCTION FN_DADOS_PONTOS2 (@P_FUN_ID INT = NULL)
RETURNS @RESULTADO TABLE
(
  DIFERENCA_SEGUNDOS INT,
  DATA DATE,
  FUN_ID INT
)
 AS 
 BEGIN
      IF @P_FUN_ID IS NULL
	     BEGIN
		    INSERT INTO @RESULTADO SELECT  DATEDIFF(SECOND, PAC_DATA_INICIAL,PAC_DATA_FINAL) AS DIFERENCA_SEGUNDOS, 
            CONVERT(DATE, PAC_DATA_INICIAL)AS DATA,
             FUN_ID
             FROM PAC_PONTOS_ACESSO 
		 END
		 ELSE
		 BEGIN
		     INSERT INTO @RESULTADO SELECT  DATEDIFF(SECOND, PAC_DATA_INICIAL,PAC_DATA_FINAL) AS DIFERENCA_SEGUNDOS, 
             CONVERT(DATE, PAC_DATA_INICIAL)AS DATA,
             FUN_ID
             FROM PAC_PONTOS_ACESSO WHERE FUN_ID = @P_FUN_ID
			 
		 END

		 RETURN
 END;

 SELECT DADOS_PONTOS.DATA,FUN.FUN_NOME,
DBO.FN_CALCULA_HORA(SUM(DADOS_PONTOS.DIFERENCA_SEGUNDOS)) AS HORAS_TRABALHADAS
FROM DBO.FN_DADOS_PONTOS2(1) AS DADOS_PONTOS 
INNER JOIN FUN_FUNCIONARIOS AS FUN
ON DADOS_PONTOS.FUN_ID = FUN.FUN_ID
GROUP BY DADOS_PONTOS.DATA,FUN.FUN_NOME