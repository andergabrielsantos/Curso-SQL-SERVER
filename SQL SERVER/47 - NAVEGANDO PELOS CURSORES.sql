--Navegando pelos cursores
/*Após o cursor ser aberto, é possível manipular suas linhas com três comandos: FETCH, UPDATE e DELETE. 
A cláusula FETCH a mais utilizada, pois é com ela que navegamos pelas linhas da consulta definida no cursor.*/

--A sintaxe mais simples do FETCH é:
FETCH nome_cursor

/*Neste caso, será retornado à primeira linha da consulta. Com ele também é possível atribuir o resultado 
da consulta a uma variável, através da cláusula INTO:*/

FETCH nome_cursor INTO @nome_variavel_1, @nome_variavel_2, etc;

/*É importante definir em INTO variáveis para todas as colunas retornadas pelo cursor. Se estiver faltando 
variável para alguma coluna, ou uma variável possuir em um tipo diferente do dado da coluna retornada,
 o SQL Server irá acusar um erro.*/

 /*Podemos utilizar o FETCH com uma combinação de cláusulas para navegar no conteúdo do cursor, que podem ser:

>>FETCH FIRST: retorna à primeira linha do cursor.
>>FETCH NEXT: retorna a linha seguinte do cursor.
>>FETCH PRIOR: retorna a linha anterior do cursor.
>>FETCH RELATIVE n: retorna a linha na posição n em relação a linha atual (que será considerada 1).
>>FETCH ABSOLUNT n: retorna a linha na posição n em relação a primeira linha do cursor.
>>FETCH LAST: retorna a última linha do cursor.*/

/*Para acompanhar nesta navegação pelo FETCH, o T-SQL fornece duas variáveis globais: @@CURSOR_ROWS e @@FETCH_STATUS. 
Sendo que o @@CURSOR_ROWS retorna o número de linhas existentes no cursor, que pode ser:*/
/*
-m: O cursor é populado assincronamente. O valor retornado é o número de linhas no KEYSET.
-1: O cursor é dinâmico e o número de linhas não pode ser determinado.
0: Ou nenhum cursor foi aberto, ou o cursor aberto já foi totalmente lido, ou último cursor aberto foi fechado ou desalocado.
N: Número de linhas no cursor.
*/

--Já o @@FETCH_STATUS retorna informações sobre o último FETCH executado, sendo que:
/*
0: FETCH executado com sucesso.
-1: FETCH falhou.
-2: O registro obtido foi perdido.
-9: O cursor não suporta operações FETCH.
*/

--Além do FETCH, o comando UPDATE pode ser utilizado para atualizar alguma informação nos dados contidos no cursor (se ele não for read-only):
UPDATE nome_cursor SET coluna_nome = 'valor' WHERE CURRENT OF nome_cursor

--No caso acima, a coluna será alterada na linha atual do cursor.
--O mesmo pode ser feito com o comando DELETE:
DELETE nome_cursor WHERE CURRENT OF nome_cursor

--Que irá excluir a linha atual do cursor.

--Se este cursor for DYNAMIC, estas alterações irão refletir nos dados da tabela.
