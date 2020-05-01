--Estruturas condicionais no T-SQL

/*
Os comandos condicionais permitem tomar decis�es a partir de resultados l�gicos. 
O condicional mais b�sico existente � o IF (se). Ele realiza uma ou mais tarefas 
quando o resultado da condi��o imposta � verdadeiro.
*/
--A sintaxe do IF �:
IF Express�o booleana
  Comando caso a condi��o seja verdadeira

-- Caso, o bloco do IF contenha mais de uma linha, � necess�rio usar o bloco de c�digo Begin ... End:

IF Express�o booleana
BEGIN

  Comando caso a condi��o seja verdadeira

  Comando2 caso a condi��o seja verdadeira

  Comando3 caso a condi��o seja verdadeira

END


--Tamb�m � poss�vel executar um ou mais comandos caso a condi��o verificada no IF seja falsa. 
--Para isso devemos declarar a palavra reservada ELSE:

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

--Veja um exemplo desta cl�usula:

DECLARE @nacionalidade varchar(50))
DECLARE @resultado varchar(50)
SET @nacionalidade = 'Brasileiro'
IF @nacionalidade = 'Brasileiro'
BEGIN
  SET @resultado = 'Voc� � brasileiro '
  SET @resultado = CONCAT('Parab�ns ', @resultado)
END
ELSE
BEGIN
  SET @resultado = 'Voc� n�o � brasileiro'
  SET @resultado = CONCAT('Que Pena! ', @resultado)
END

