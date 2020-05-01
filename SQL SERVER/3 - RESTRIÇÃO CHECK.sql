
/*A restri��o CHECK permite testar um valor antes que ele seja gravado em um campo do banco de dados. 
Ela ajuda a manter os valores de um campo dentro do esperado para o dom�nio do banco de dados.*/

--Uma tabela de produtos pode definir que o campo que corresponda ao pre�o aceite apenas valores positivos

CREATE TABLE produto (
  codpro int NOT NULL,
  descricao varchar(100) NOT NULL,
  preco money NOT NULL CHECK (preco>0),
);

--Note que definimos a condi��o da restri��o CHECK:

CHECK (preco>0)

--Tamb�m � poss�vel criar check como restri��o de tabela:

CREATE TABLE produto (
  codpro int NOT NULL,
  descricao varchar(100) NOT NULL,
  preco money NOT NULL,
  CONSTRAINT ch_preco CHECK (preco>0)
);

/*Agora, caso for inserido um valor negativo em "preco", o SQL Server ir� gerar um erro 
origin�rio da restri��o CHECK.*/

--Veja mais exemplos

ALTER TABLE PAC_PONTOS_ACESSO
ADD CONSTRAINT CK_PONTOS_ACESSO__DATA_INICIAL__DATA_FINAL
CHECK
(
--OBS: N�O � RECOMENDADO USAR A FUN��O (DATEPART), PORQUE N�O � UMA FUN��O DETERMINISTICA 
--E N�O GARANTE O MESMO DADO QUE FOI INSERIDO NA TABELA 
    PAC_DATA_INICIAL < PAC_DATA_FINAL AND 
	DATEPART(DAY, PAC_DATA_INICIAL) = DATEPART(DAY, PAC_DATA_FINAL) AND
	DATEPART(MONTH, PAC_DATA_INICIAL) = DATEPART(MONTH, PAC_DATA_FINAL)AND
	DATEPART(YEAR, PAC_DATA_INICIAL) = DATEPART(YEAR, PAC_DATA_FINAL)
);

ALTER TABLE PAC_PONTOS_ACESSO DROP CONSTRAINT CK_PONTOS_ACESSO__DATA_INICIAL__DATA_FINAL;

ALTER TABLE PAC_PONTOS_ACESSO
ADD CONSTRAINT CK_PONTOS_ACESSO__DATA_INICIAL__DATA_FINAL
CHECK
(
    PAC_DATA_INICIAL < PAC_DATA_FINAL AND 
	DAY(PAC_DATA_INICIAL) = DAY (PAC_DATA_FINAL) AND
	MONTH(PAC_DATA_INICIAL) = MONTH(PAC_DATA_FINAL)AND
	YEAR(PAC_DATA_INICIAL) = YEAR(PAC_DATA_FINAL)
);
SELECT * FROM PAC_PONTOS_ACESSO;
--PAC_ID	PAC_DATA_INICIAL	       PAC_DATA_FINAL	FUN_ID
--1	        2017-01-02 07:00:00.000	   NULL	            1

UPDATE PAC_PONTOS_ACESSO SET PAC_DATA_FINAL = '2017-01-02 12:00:00';