--Estruturas condicionais no T-SQL

/*
Os comandos condicionais permitem tomar decisões a partir de resultados lógicos. 
O condicional mais básico existente é o IF (se). Ele realiza uma ou mais tarefas 
quando o resultado da condição imposta é verdadeiro.
*/
--A sintaxe do IF é:
IF Expressão booleana
  Comando caso a condição seja verdadeira

-- Caso, o bloco do IF contenha mais de uma linha, é necessário usar o bloco de código Begin ... End:

IF Expressão booleana
BEGIN

  Comando caso a condição seja verdadeira

  Comando2 caso a condição seja verdadeira

  Comando3 caso a condição seja verdadeira

END


--Também é possível executar um ou mais comandos caso a condição verificada no IF seja falsa. 
--Para isso devemos declarar a palavra reservada ELSE:

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

--Veja um exemplo desta cláusula:

DECLARE @nacionalidade varchar(50))
DECLARE @resultado varchar(50)
SET @nacionalidade = 'Brasileiro'
IF @nacionalidade = 'Brasileiro'
BEGIN
  SET @resultado = 'Você é brasileiro '
  SET @resultado = CONCAT('Parabéns ', @resultado)
END
ELSE
BEGIN
  SET @resultado = 'Você não é brasileiro'
  SET @resultado = CONCAT('Que Pena! ', @resultado)
END

