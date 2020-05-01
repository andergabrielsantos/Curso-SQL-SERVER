--OPERADOR IN

--O operador IN é usado para comparar um campo com uma lista de valores, que pode ser informada entre parênteses:
SELECT * FROM tabela WHERE campo IN (valor1, valor2 ... valor);

--Ou através de uma subconsulta:
SELECT * FROM tabela WHERE campo IN (SELECT campo FROM tabela2);

