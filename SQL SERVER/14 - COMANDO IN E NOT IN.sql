--OPERADOR IN

--O operador IN � usado para comparar um campo com uma lista de valores, que pode ser informada entre par�nteses:
SELECT * FROM tabela WHERE campo IN (valor1, valor2 ... valor);

--Ou atrav�s de uma subconsulta:
SELECT * FROM tabela WHERE campo IN (SELECT campo FROM tabela2);

