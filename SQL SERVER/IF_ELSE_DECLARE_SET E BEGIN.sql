
--IF, ELSE, DECLARE, SET E  BEGIN

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
END