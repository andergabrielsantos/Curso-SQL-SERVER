--Navegando pelos cursores
/*Ap�s o cursor ser aberto, � poss�vel manipular suas linhas com tr�s comandos: FETCH, UPDATE e DELETE. 
A cl�usula FETCH a mais utilizada, pois � com ela que navegamos pelas linhas da consulta definida no cursor.*/

--A sintaxe mais simples do FETCH �:
FETCH nome_cursor

/*Neste caso, ser� retornado � primeira linha da consulta. Com ele tamb�m � poss�vel atribuir o resultado 
da consulta a uma vari�vel, atrav�s da cl�usula INTO:*/

FETCH nome_cursor INTO @nome_variavel_1, @nome_variavel_2, etc;

/*� importante definir em INTO vari�veis para todas as colunas retornadas pelo cursor. Se estiver faltando 
vari�vel para alguma coluna, ou uma vari�vel possuir em um tipo diferente do dado da coluna retornada,
 o SQL Server ir� acusar um erro.*/

 /*Podemos utilizar o FETCH com uma combina��o de cl�usulas para navegar no conte�do do cursor, que podem ser:

>>FETCH FIRST: retorna � primeira linha do cursor.
>>FETCH NEXT: retorna a linha seguinte do cursor.
>>FETCH PRIOR: retorna a linha anterior do cursor.
>>FETCH RELATIVE n: retorna a linha na posi��o n em rela��o a linha atual (que ser� considerada 1).
>>FETCH ABSOLUNT n: retorna a linha na posi��o n em rela��o a primeira linha do cursor.
>>FETCH LAST: retorna a �ltima linha do cursor.*/

/*Para acompanhar nesta navega��o pelo FETCH, o T-SQL fornece duas vari�veis globais: @@CURSOR_ROWS e @@FETCH_STATUS. 
Sendo que o @@CURSOR_ROWS retorna o n�mero de linhas existentes no cursor, que pode ser:*/
/*
-m: O cursor � populado assincronamente. O valor retornado � o n�mero de linhas no KEYSET.
-1: O cursor � din�mico e o n�mero de linhas n�o pode ser determinado.
0: Ou nenhum cursor foi aberto, ou o cursor aberto j� foi totalmente lido, ou �ltimo cursor aberto foi fechado ou desalocado.
N: N�mero de linhas no cursor.
*/

--J� o @@FETCH_STATUS retorna informa��es sobre o �ltimo FETCH executado, sendo que:
/*
0: FETCH executado com sucesso.
-1: FETCH falhou.
-2: O registro obtido foi perdido.
-9: O cursor n�o suporta opera��es FETCH.
*/

--Al�m do FETCH, o comando UPDATE pode ser utilizado para atualizar alguma informa��o nos dados contidos no cursor (se ele n�o for read-only):
UPDATE nome_cursor SET coluna_nome = 'valor' WHERE CURRENT OF nome_cursor

--No caso acima, a coluna ser� alterada na linha atual do cursor.
--O mesmo pode ser feito com o comando DELETE:
DELETE nome_cursor WHERE CURRENT OF nome_cursor

--Que ir� excluir a linha atual do cursor.

--Se este cursor for DYNAMIC, estas altera��es ir�o refletir nos dados da tabela.
