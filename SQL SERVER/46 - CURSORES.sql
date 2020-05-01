
/*Existem situa��es onde � necess�rio percorrer um conjunto de linhas, para que cada registro possa 
ser trabalhado individualmente. Essa situa��o � extremamente comum em stored procedures.

Para estas situa��es, o T-SQL introduziu os cursores.*/

/*Um cursor sempre � vinculado a uma consulta. A partir do resultado desta consulta, podemos utilizar 
o cursor para navegar nos registros retornados. Esta navega��o pode ser realizada apenas �para frente� 
(forward-only), quando cada linha lida n�o pode ser acessada novamente, ou �rol�veis� (scroll), que podem 
ser navegados tanto para a frente, quanto para atr�s. Como os cursores scrollable necessitam realizar 
mais procedimentos, eles s�o mais lentos que os forward-only.*/

--Durante o acesso a cada linha, pode-se executar opera��es como atualizar, excluir, ou mover dados.

--A consulta definida para um cursor possui algumas restri��es:

--N�o pode conter a cl�usula INTO para criar uma nova tabela.
--N�o pode retornar v�rios conjuntos de linhas.

--Respeitando essas regras, os cursores podem ser de um dos tipos abaixo:

/*STATIC: os dados da consulta ficam armazenados em uma tabela do banco de dados tempdb e n�o podem ser 
alterados, mas esses cursores podem ser declarados como forward-only ou scroll.

 *KEYSET: apenas as colunas necess�rias para identificar exclusivamente cada linha s�o copiadas para o banco 
 tempdb. Assim, seus dados podem ser updatable (atualiz�veis) ou read-only (somente-leitura) e tamb�m scrollable 
 ou forward-only. � importante que a consulta definida neste cursor retorne identificados para cada linha. Como 
 esses identificadores ficar�o no banco tempdb, se forem alterados por um usu�rio, o cursor ainda ir� refletir o 
 identificador antigo.

 *DYNAMIC: os dados da consulta n�o s�o armazenados, ent�o toda vez que uma linha � obtida pelo cursor, � como se a 
 consulta fosse lan�ada novamente. Assim, qualquer altera��o nos dados, ser� refletida no cursor.

 *FAST_FORWARD: os dados da consulta ficam armazenados em uma tabela do banco de dados tempdb, e s�o acessados com 
 otimiza��es de desempenho. Este cursor s� pode ser declarado como forward-only e read-only, e existem duas restri��es 
 importantes quanto ao seu uso:

  >>Se a consulta retornar colunas do tipo text, ntext ou image e contiver a cl�usula TOP, o cursor ser� convertido em KEYSET.
  >>Se tabelas da consulta possu�rem triggers, ele ser� convertido para STATIC.

  Para cri�-los, deve se utilizar a cl�usula DECLARE CURSOR, que possui a sintaxe:*/

  DECLARE nome_cursor CURSOR [ LOCAL | GLOBAL ]
     [ FORWARD_ONLY | SCROLL ]
     [ STATIC | KEYSET | DYNAMIC | FAST_FORWARD ]
     [ READ_ONLY | SCROLL_LOCKS | OPTIMISTIC ]
     [ TYPE_WARNING ]
     FOR comando_select
     [ FOR UPDATE [ OF column_name [ ,...n ] ] ]
[;]

--Mesmo a sintaxe possuindo v�rias op��es, geralmente os cursores s�o criados com base na sintaxe simplificada:
DECLARE nome_cursor CURSOR
     FOR comando_select

/*Nesta situa��o o tipo do cursor ser� definido como DYNAMIC e FAST_FORWARD, mas se a consulta n�o suportar atualiza��o 
(por permiss�o insuficiente, consulta sem colunas de chave, etc;), o cursor ser� read-only.*/

--Ap�s a declara��o do cursor, para ele ser percorrido, � necess�rio abri-lo com a cl�usula OPEN:
OPEN nome_cursor

--Ao final do seu uso, � importante fech�-lo com a cl�usula CLOSE:
CLOSE nome_cursor

--E desaloc�-lo com a cl�usula DEALLOCATE:
DEALLOCATE nome_cursor

--Este sempre deve ser o �ltimo comando executado, pois ele ir� remover o identificador do cursor do escopo.
