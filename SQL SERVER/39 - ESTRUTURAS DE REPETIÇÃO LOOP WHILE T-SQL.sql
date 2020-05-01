/*Existem casos onde � necess�rio que um comando seja executado at� que uma condi��o 
seja satisfeita. Para sanar essa necessidade, o SQL Server disponibiliza a estrutura 
de repeti��o WHILE (enquanto) para criarmos loops (repeti��es).
*/
--A estrutura de repeti��o while executa um ou mais comandos enquanto a condi��o � verdadeira. A sintaxe dele �:

WHILE Teste
BEGIN
Comando1
Comando2
...
ComandoN
END

--Veja um exemplo do seu uso:

DECLARE @resultado varchar(max), @contador int
SET @contador = 0
SET @resultado = ''

WHILE @contador <= 10
BEGIN
  SET @resultado = CONCAT(@resultado, @contador, ', ')
  SET @contador = @contador + 1;
END

--EXEMPLO

DECLARE @VALOR INT
SET @VALOR = 0

WHILE @VALOR <=10
BEGIN
PRINT 'NUMERO ' + CAST((@VALOR) AS VARCHAR(2))
SET @VALOR = @VALOR + 1
END;
------------------------------------------------------------

-- USANDO O BANCO DE DADOS

DECLARE @CODIGO INT
SET @CODIGO = 100

WHILE @CODIGO < 106
BEGIN
SELECT ID_LIVRO AS ID, NOME_LIVRO AS LIVRO,
PRECO_LIVRO AS PRE�O
FROM TBL_LIVRO WHERE ID_LIVRO = @CODIGO
SET @CODIGO = @CODIGO + 1
END;
