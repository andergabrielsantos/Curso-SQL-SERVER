--CONSULTA BASICA


--A sintaxe básica para consultarmos (ou seja, exibirmos) dados que estão em uma tabela é:

SELECT coluna1,coluna2,coluna3,... colunaN FROM nome_tabela [WHERE condição];

--O WHERE permite que se defina um filtro para a pesquisa, com isso refinando mais o seu resultado.

-- OPERACOES DE COMPARACAO
--No WHERE podemos declarar as condições utilizando diversos operadores. As opções de operadores são:

--OPERADOR    COMPARACAO
   =          IGUAL
   <>         DIFERENTE
   >          MAIOR QUE
   <          MENOR QUE
   >=         MAIOR OU IGUAL A
   <=         MENOR OU IGUAL A

--Por exemplo, para ver se um modelo de carro é igual a Celta, pode ser utilizado o operador de igualdade:
SELECT * FROM carro WHERE modelo = 'Celta';

--Ou de diferença, se quiser obter o resultado inverso da consulta acima:
SELECT * FROM carro WHERE modelo <> 'Celta';
