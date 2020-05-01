-- EXISTEM CASOS ONDE É NECESSARIO QUE UM COMANDO SEJA EXECUTADOO ATÉ QUE UMA CONDIÇÃO SEJA SASTIFEITA.
--PARA SANAR ESSA NECESSIDADE, O SQL SERVER DISPONIBILIZA A ESTRUTURA DE REPETIÇÃO WHILE (ENQUANTO) PARA 
--CRIARMOS LOOPS(REPETIÇÃO).

-- A ESTRUTURA DE REPETIÇÃO WHILE EXECUTA UM OU MAIS COMANDOS ENQUNTO A CONDIÇÃO É VERDADEIRA 
--A SINTAXE DELE É 
------------------------
WHILE Teste
BEGIN
Comando1
Comando2
...
ComandoN
END
----------------------

--EXEMPLO
DECLARE @resultado varchar(max), @contador int
SET @contador = 0
SET @resultado = ''

WHILE @contador <= 10
BEGIN
  SET @resultado = CONCAT(@resultado, @contador, ', ')
  SELECT @resultado AS RESULTADO
  SET @contador = @contador + 1;
END
------------------------------
--RESULTADO
--0, 
------------------------------
--RESULTADO
--0, 1, 
------------------------------
--RESULTADO
--0, 1, 2, 
------------------------------
--RESULTADO
--0, 1, 2, 3, 
----------------------------------
--RESULTADO
--0, 1, 2, 3, 4, 
-----------------------------------
--RESULTADO
--0, 1, 2, 3, 4, 5, 
-----------------------------------
--RESULTADO
--0, 1, 2, 3, 4, 5, 6, 
-----------------------------------
--RESULTADO
--0, 1, 2, 3, 4, 5, 6, 7, 
-----------------------------------
--RESULTADO
--0, 1, 2, 3, 4, 5, 6, 7, 8, 
-----------------------------------
--RESULTADO
--0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
-----------------------------------
--RESULTADO
--0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 
------------------------------------



