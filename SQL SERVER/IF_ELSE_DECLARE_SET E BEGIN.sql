
--IF, ELSE, DECLARE, SET E  BEGIN

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
END