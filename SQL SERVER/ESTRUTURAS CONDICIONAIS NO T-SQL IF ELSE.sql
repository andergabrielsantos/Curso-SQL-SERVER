--ESTRUTURAS CONDICIONAIS NO T-SQL IF ELSE

--OS COMANDOS CONDICIONAIS PERMITEM TOMAR DECIS�ES A PARTIR DE RESULTADOS L�GICOS.
--O CONDICIONAL MAIS BASICO EXISTENTE � O IF(SE).
--ELE REALIZA UMA OU MAIS TAREFAS QUANDO O RESULTADO DA CONDI��O IMPOSTA � VERDADERA ,

--A SINTAXE DO IF �
---------------------------------------------------
IF Express�o booleana
 Comando caso a condi��o seja verdadeira
 -------------------------------------------------

 --CASO, O BLOCO DO IF CONTENHA MAIS DE UMA LINHA, � NECESSARIO USAR O BLOCO DE CODIGO BEGIN ....END
------------------------------------------------------
 IF Express�o booleana
BEGIN

  Comando caso a condi��o seja verdadeira

  Comando2 caso a condi��o seja verdadeira

  Comando3 caso a condi��o seja verdadeira

END
---------------------------------------------------------
-- TAMBEM � POSSIVEL EXECUTAR UM OU MAIS COMANDOS CASO A CONDI��O VERIFICADA NO IF SEJA FALSA
-- PARA ISSO DEVEMOS DECLARAR A PALAVRA RESERVADA ELSE

-------------------------------------------------------------------------
IF Express�o booleana
BEGIN

  Comando caso a condi��o seja verdadeira

  Comando2 caso a condi��o seja verdadeira

  Comando3 caso a condi��o seja verdadeira

END
ELSE
BEGIN
  Comando caso a condi��o seja falsa

  Comando2 caso a condi��o seja falsa

  Comando3 caso a condi��o seja falsa
END
-------------------------------------------------------------------------
--VEJA UM EXEMPLO DESSA CLAUSULA
DECLARE @nacionalidade varchar(50)
DECLARE @resultado varchar(50)
SET @nacionalidade = 'Brasileiro'
IF @nacionalidade = 'Brasileiro'
BEGIN
  SET @resultado = 'Voc� � brasileiro '
  SET @resultado = CONCAT('Parab�ns ', @resultado)
  SELECT @resultado AS RESULTADO
END
ELSE
BEGIN
  SET @resultado = 'Voc� n�o � brasileiro'
  SET @resultado = CONCAT('Que Pena! ', @resultado)
  SELECT @resultado AS RESULTADO
END;
------------------------------
--RESULTADO
--Parab�ns Voc� � brasileiro 
------------------------------