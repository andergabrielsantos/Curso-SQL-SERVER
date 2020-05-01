--VIEW
/*
Como já vimos durante o curso, o SQL permite a criação de consultas utilizando diversos recursos, 
o que nos permite realizar consultas com vários níveis de complexidade. Quanto mais complexo for uma
consulta, mais trabalhoso será melhorar a sua performance, e na maioria dos casos essas pesquisas serão 
executadas novamente no futuro.*/
/*
Para evitar que a consulta sempre precise ser refeita, quando for necessário realizá-la novamente, 
o T-SQL introduziu o conceito de views.*/
/*
As views funcionam como tabelas virtuais relacionadas a um SELECT. Assim, em vez de sempre criar 
a consulta, ela pode ser armazena como uma VIEW. Esta, todas as vezes que for executada, retorna os 
dados da consulta dinamicamente.*/

--O uso de VIEW nos traz várias vantagens, como:
--*Permite reutilizar códigos de consultas complexas ao invés de ter que escrever novamente ou guardar
-- a instrução em um arquivo de texto;

--*Ocultar complexidade – Podemos usar as views para realizar consultas complexas de forma muito simples, 
--diminuindo o trabalho de outras pessoas envolvidas que não conhecem a estrutura do banco;

--*Segurança – Com as views é possível criar uma tabela virtual apenas com os campos e registros desejados, 
--evitando assim a necessidade de liberar o acesso a uma tabela completa a um usuário.

--O comando usado para criar uma view é o CREATE VIEW. Sua sintaxe mais básica é a seguinte:
CREATE VIEW nome_view AS consulta;

--Sendo que consulta pode ser qualquer pesquisa utilizando SELECT. Por exemplo:
CREATE VIEW carros_antigos AS
SELECT * FROM carro WHERE ano_fabricacao < 2013;

--Caso queria, é possível mudar o nome das colunas retornadas pela consulta:
CREATE VIEW nome_view (novoNome1, novoNome1, novoNomeN) AS consulta;

--Neste caso, é importante que se defina o novo nome de todas as colunas retornadas pela consulta.

--Alterando views

/*O processo para alterar uma view é muito parecido com o processo de criação, pois todas as partes do comando 
de criação devem ser reescritas. No final, aproveitamos somente o nome:*/
ALTER VIEW nome_view AS consulta;

--Excluindo views
--O comando usado para excluir uma view é muito simples também. Veja sua sintaxe abaixo:	
DROP VIEW nome_view;

--Views atualizáveis
/*
O T-SQL permite alterar dados de uma tabela a partir de uma view com o comando de manipulação 
de dados que já conhecemos. Porém, a view deve obedecer algumas regras:*/

--As colunas devem ser de apenas uma tabela base;
/*As colunas devem referenciar diretamente o campo original da tabela sem usar as funções (AVG, COUNT, SUM, MIN, 
MAX), que aprenderemos mais à frente no curso;*/	
--As colunas modificadas não são afetadas pelas cláusulas GROUP BY, HAVING ou DISTINCT.

--Exemplo de View no banco

CREATE VIEW VW_DADOS_PONTOS AS
SELECT DADOS_PONTOS.DATA,FUN.FUN_NOME,
DBO.FN_CALCULA_HORA(SUM(DADOS_PONTOS.DIFERENCA_SEGUNDOS)) AS HORAS_TRABALHADA 
FROM DBO.FN_DADOS_PONTOS() AS DADOS_PONTOS 
INNER JOIN FUN_FUNCIONARIOS AS FUN
ON DADOS_PONTOS.FUN_ID = FUN.FUN_ID
GROUP BY DADOS_PONTOS.DATA,FUN.FUN_NOME

SELECT * FROM VW_DADOS_PONTOS

--RESULTADO
DATA	    FUN_NOME	HORAS_TRABALHADA
2017-02-01	JOÃO	    09:05:00
2017-02-02	JOÃO	    05:17:00
2017-01-02	MARIA	    04:54:00