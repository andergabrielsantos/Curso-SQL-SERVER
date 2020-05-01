--OPERADOR BETWEEN
/*
O operador BETWEEN é usado para comparar um intervalo de valores. Geralmente, 
ele é utilizado para comparar um intervalo de datas, mas pode ser utilizado com 
qualquer tipo de dado.
*/
--A sua sintaxe é:
SELECT * FROM tabela WHERE campo BETWEEN valor_inicial AND valor_final;
/*
Por exemplo, selecionar registros com agendamentos entre 01/10/2014 a 14/10/2014, 
pode ser realizada a consulta abaixo:
*/
SELECT * FROM aula WHERE agendamento BETWEEN '01/10/2014' AND '14/10/2014';
	