--ESTRUTURAS CONDICIONAIS NO T-SQL IF ELSE

--OS COMANDOS CONDICIONAIS PERMITEM TOMAR DECISÕES A PARTIR DE RESULTADOS LÓGICOS.
--O CONDICIONAL MAIS BASICO EXISTENTE É O IF(SE).
--ELE REALIZA UMA OU MAIS TAREFAS QUANDO O RESULTADO DA CONDIÇÃO IMPOSTA É VERDADERA ,

--A SINTAXE DO IF É
---------------------------------------------------
IF Expressão booleana
 Comando caso a condição seja verdadeira
 -------------------------------------------------

 --CASO, O BLOCO DO IF CONTENHA MAIS DE UMA LINHA, É NECESSARIO USAR O BLOCO DE CODIGO BEGIN ....END
------------------------------------------------------
 IF Expressão booleana
BEGIN

  Comando caso a condição seja verdadeira

  Comando2 caso a condição seja verdadeira

  Comando3 caso a condição seja verdadeira

END
---------------------------------------------------------
-- TAMBEM É POSSIVEL EXECUTAR UM OU MAIS COMANDOS CASO A CONDIÇÃO VERIFICADA NO IF SEJA FALSA
-- PARA ISSO DEVEMOS DECLARAR A PALAVRA RESERVADA ELSE

-------------------------------------------------------------------------
IF Expressão booleana
BEGIN

  Comando caso a condição seja verdadeira

  Comando2 caso a condição seja verdadeira

  Comando3 caso a condição seja verdadeira

END
ELSE
BEGIN
  Comando caso a condição seja falsa

  Comando2 caso a condição seja falsa

  Comando3 caso a condição seja falsa
END
-------------------------------------------------------------------------
--VEJA UM EXEMPLO DESSA CLAUSULA
DECLARE @nacionalidade varchar(50)
DECLARE @resultado varchar(50)
SET @nacionalidade = 'Brasileiro'
IF @nacionalidade = 'Brasileiro'
BEGIN
  SET @resultado = 'Você é brasileiro '
  SET @resultado = CONCAT('Parabéns ', @resultado)
  SELECT @resultado AS RESULTADO
END
ELSE
BEGIN
  SET @resultado = 'Você não é brasileiro'
  SET @resultado = CONCAT('Que Pena! ', @resultado)
  SELECT @resultado AS RESULTADO
END;
------------------------------
--RESULTADO
--Parabéns Você é brasileiro 
------------------------------