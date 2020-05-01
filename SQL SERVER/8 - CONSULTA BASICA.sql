--CONSULTA BASICA


--A sintaxe b�sica para consultarmos (ou seja, exibirmos) dados que est�o em uma tabela �:

SELECT coluna1,coluna2,coluna3,... colunaN FROM nome_tabela [WHERE condi��o];

--O WHERE permite que se defina um filtro para a pesquisa, com isso refinando mais o seu resultado.

-- OPERACOES DE COMPARACAO
--No WHERE podemos declarar as condi��es utilizando diversos operadores. As op��es de operadores s�o:

--OPERADOR    COMPARACAO
   =          IGUAL
   <>         DIFERENTE
   >          MAIOR QUE
   <          MENOR QUE
   >=         MAIOR OU IGUAL A
   <=         MENOR OU IGUAL A

--Por exemplo, para ver se um modelo de carro � igual a Celta, pode ser utilizado o operador de igualdade:
SELECT * FROM carro WHERE modelo = 'Celta';

--Ou de diferen�a, se quiser obter o resultado inverso da consulta acima:
SELECT * FROM carro WHERE modelo <> 'Celta';
