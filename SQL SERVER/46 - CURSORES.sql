
/*Existem situações onde é necessário percorrer um conjunto de linhas, para que cada registro possa 
ser trabalhado individualmente. Essa situação é extremamente comum em stored procedures.

Para estas situações, o T-SQL introduziu os cursores.*/

/*Um cursor sempre é vinculado a uma consulta. A partir do resultado desta consulta, podemos utilizar 
o cursor para navegar nos registros retornados. Esta navegação pode ser realizada apenas “para frente” 
(forward-only), quando cada linha lida não pode ser acessada novamente, ou “roláveis” (scroll), que podem 
ser navegados tanto para a frente, quanto para atrás. Como os cursores scrollable necessitam realizar 
mais procedimentos, eles são mais lentos que os forward-only.*/

--Durante o acesso a cada linha, pode-se executar operações como atualizar, excluir, ou mover dados.

--A consulta definida para um cursor possui algumas restrições:

--Não pode conter a cláusula INTO para criar uma nova tabela.
--Não pode retornar vários conjuntos de linhas.

--Respeitando essas regras, os cursores podem ser de um dos tipos abaixo:

/*STATIC: os dados da consulta ficam armazenados em uma tabela do banco de dados tempdb e não podem ser 
alterados, mas esses cursores podem ser declarados como forward-only ou scroll.

 *KEYSET: apenas as colunas necessárias para identificar exclusivamente cada linha são copiadas para o banco 
 tempdb. Assim, seus dados podem ser updatable (atualizáveis) ou read-only (somente-leitura) e também scrollable 
 ou forward-only. É importante que a consulta definida neste cursor retorne identificados para cada linha. Como 
 esses identificadores ficarão no banco tempdb, se forem alterados por um usuário, o cursor ainda irá refletir o 
 identificador antigo.

 *DYNAMIC: os dados da consulta não são armazenados, então toda vez que uma linha é obtida pelo cursor, é como se a 
 consulta fosse lançada novamente. Assim, qualquer alteração nos dados, será refletida no cursor.

 *FAST_FORWARD: os dados da consulta ficam armazenados em uma tabela do banco de dados tempdb, e são acessados com 
 otimizações de desempenho. Este cursor só pode ser declarado como forward-only e read-only, e existem duas restrições 
 importantes quanto ao seu uso:

  >>Se a consulta retornar colunas do tipo text, ntext ou image e contiver a cláusula TOP, o cursor será convertido em KEYSET.
  >>Se tabelas da consulta possuírem triggers, ele será convertido para STATIC.

  Para criá-los, deve se utilizar a cláusula DECLARE CURSOR, que possui a sintaxe:*/

  DECLARE nome_cursor CURSOR [ LOCAL | GLOBAL ]
     [ FORWARD_ONLY | SCROLL ]
     [ STATIC | KEYSET | DYNAMIC | FAST_FORWARD ]
     [ READ_ONLY | SCROLL_LOCKS | OPTIMISTIC ]
     [ TYPE_WARNING ]
     FOR comando_select
     [ FOR UPDATE [ OF column_name [ ,...n ] ] ]
[;]

--Mesmo a sintaxe possuindo várias opções, geralmente os cursores são criados com base na sintaxe simplificada:
DECLARE nome_cursor CURSOR
     FOR comando_select

/*Nesta situação o tipo do cursor será definido como DYNAMIC e FAST_FORWARD, mas se a consulta não suportar atualização 
(por permissão insuficiente, consulta sem colunas de chave, etc;), o cursor será read-only.*/

--Após a declaração do cursor, para ele ser percorrido, é necessário abri-lo com a cláusula OPEN:
OPEN nome_cursor

--Ao final do seu uso, é importante fechá-lo com a cláusula CLOSE:
CLOSE nome_cursor

--E desalocá-lo com a cláusula DEALLOCATE:
DEALLOCATE nome_cursor

--Este sempre deve ser o último comando executado, pois ele irá remover o identificador do cursor do escopo.
